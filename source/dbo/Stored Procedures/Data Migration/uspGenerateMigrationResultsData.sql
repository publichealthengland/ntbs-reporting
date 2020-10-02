﻿CREATE PROCEDURE [dbo].[uspGenerateMigrationResultsData]
	
AS
	--fetch all the data from Hangfire.Set with a job code later than the last job code already processed

	--this will be assumed to all relate to the first record in MigrationRun where the ImportedDate is NULL


	TRUNCATE TABLE [dbo].[MigrationRawData];

	DECLARE @MigrationRunID INT = NULL
	SET @MigrationRunID = (SELECT TOP(1) MigrationRunId from MigrationRun WHERE ImportedDate IS NULL)

	INSERT INTO [dbo].[MigrationRawData](MigrationRunId, JobNumber, JobCode, Score, ExpireAt, RowDetails)
	SELECT @MigrationRunID, Q1.JobNumber, Q1.JobCode, Q1.Score, Q1.ExpireAt, Q1.RowDetails
	FROM
	(SELECT CONVERT(INT, SUBSTRING([Key], 20, 6)) AS JobNumber
		  , [Key] AS JobCode
		  ,[Score]
		  ,[Value] AS RowDetails
		  ,[ExpireAt]
	  FROM [$(NTBS)].[HangFire].[Set]) AS Q1
	--TODO: replace with proper logic
	WHERE Q1.JobNumber BETWEEN 805 AND 1253


	--now remove the rows we don't care about
    DELETE FROM [dbo].[MigrationRawData] 
	WHERE
	[RowDetailS] LIKE '%Validating notification with Id=%'
	OR [RowDetails]  LIKE '%Request to import by Id%'
	OR [RowDetails] LIKE '%valid notifications%'
	OR [RowDetails] LIKE '%No validation errors found%'
	OR [RowDetails] LIKE '%Finished importing%'
	OR [RowDetails] LIKE '%Imported notifications have following Ids:%'
	OR [RowDetails] LIKE '%notifications found to import for%'


	--and remove the content that we don't want.
	--TODO should make it more efficient to remove the #ff type data but this will do for now
	UPDATE [dbo].[MigrationRawData] SET [RowDetails] = RIGHT([RowDetails], LEN([RowDetails])-CHARINDEX('-', [RowDetails], CHARINDEX('-', [RowDetails])+1)-1)
	UPDATE [dbo].[MigrationRawData] SET [RowDetails] = REPLACE([RowDetails], '"}', '')
	UPDATE [dbo].[MigrationRawData] SET [RowDetails] = REPLACE([RowDetails], '","c":"#00ff00', '')
	UPDATE [dbo].[MigrationRawData] SET [RowDetails] = REPLACE([RowDetails], '","c":"#ffff00', '')
	UPDATE [dbo].[MigrationRawData] SET [RowDetails] = REPLACE([RowDetails], '","c":"#ff0000', '')

	--now we need to parse out the rows that say 'Fetching data for legacy notifications' as this will give us the list of notification Ids
	--and insert these rows into [MigrationRunResults]

	
	INSERT INTO [dbo].[MigrationRunResults](MigrationRunId, MigrationNotificationId)
	(
	SELECT DISTINCT @MigrationRunID, TRIM(value) NotificationId
	FROM 
		(SELECT SUBSTRING(RowDetails, 40, 40) AS NotificationIds FROM MigrationRawData
		WHERE RowDetails like 'Fetching data for legacy notifications%' ) AS Q1
    CROSS APPLY STRING_SPLIT(NotificationIds, ',')
	)



	
	--and then delete those rows from MigrationRawData
	DELETE FROM [dbo].[MigrationRawData] 
	WHERE [RowDetails] LIKE 'Fetching data for legacy notifications%'

	--now we can try to parse the Notification Id out on the rows that have them
	--the substrings here need to be update to cater for shorter IDs and LTBR Ids which could be longer

	UPDATE [dbo].[MigrationRawData] SET [NotificationId] = 
		CASE 
			WHEN RowDetails LIKE 'Notification [0-9]%' THEN [dbo].[ufnGetMigrationNotificationId] (SUBSTRING(RowDetails, CHARINDEX(' ', RowDetails), 10))
			WHEN RowDetails LIKE '%validation errors found for notification with Id=%' OR RowDetails LIKE 'Notification with Id=%' 
				THEN [dbo].[ufnGetMigrationNotificationId] (SUBSTRING(RowDetails, CHARINDEX('=', RowDetails), 10))
		END
	WHERE NotificationId IS NULL


	UPDATE [dbo].[MigrationRawData] SET [Category] = 
		CASE 
			WHEN RowDetails LIKE '%will be imported without%' THEN 'Data Loss'
			ELSE 'Error'
		END
	WHERE Category IS NULL

	--now we have to 'fill down' to get the notification Ids for the error records which don't have them

	UPDATE [dbo].[MigrationRawData] SET [ChangeIndicator] = 
		CASE WHEN NotificationId IS NULL THEN 0 ELSE 1 END
	WHERE ChangeIndicator IS NULL;

	--now fill down a row group
	
	WITH RowGroupData AS
	(SELECT JobNumber, Score, SUM(ChangeIndicator) OVER (ORDER BY JobNumber, Score) AS RowGroup
		FROM [dbo].[MigrationRawData])

	UPDATE mrd SET [RowGroup] = 
		rgd.RowGroup 
		FROM RowGroupData rgd
		INNER JOIN [dbo].[MigrationRawData] mrd ON mrd.JobNumber = rgd.JobNumber AND mrd.Score = rgd.Score;

	--so that now we can fill down the missing notification Ids

	WITH NotifcationIdForRowGroup AS
	(SELECT DISTINCT RowGroup, 
		CASE WHEN NotificationId IS NOT NULL THEN NotificationId
		ELSE FIRST_VALUE(NotificationId) OVER (PARTITION BY RowGroup ORDER BY JobNumber, Score)
		END AS 'NotificationId'
	FROM [dbo].[MigrationRawData])

	UPDATE mrd SET NotificationId = 
		nrg.NotificationId
		FROM NotifcationIdForRowGroup nrg INNER JOIN [dbo].[MigrationRawData] mrd on mrd.RowGroup = nrg.RowGroup
	WHERE mrd.NotificationId IS NULL


	--now we can delete the rows where it says 'Terminating' and 'validation errors found'
	--as we have copied the NotificationId from them to where we need it

	 DELETE FROM [dbo].[MigrationRawData] 
	 WHERE
	 [RowDetails]  like '%validation errors found for notification with%'
	 OR [RowDetails]  LIKE '%Terminating importing notifications for%'

	 --and remove content of ChangeIndicator and RowGroup as neither will now make sense

	 UPDATE [dbo].[MigrationRawData] SET ChangeIndicator = NULL, RowGroup = NULL

	 UPDATE [dbo].[MigrationRawData] SET Reason =
		CASE
			WHEN CHARINDEX([NotificationId], RowDetails) = 0 THEN RowDetails
			ELSE [dbo].[ufnGetMigrationDataLossReason] (SUBSTRING(RowDetails, CHARINDEX([NotificationId], RowDetails)+LEN([NotificationId])+1, 40))
		END
	 WHERE Reason IS NULL

	 --now we can populate data for each notification which the application attempted to migrate

	 --we can use MergedNotifications as the source of info about the legacy Notification, as we have used the primary notification ID to create each row in MigrationRunResults
	 --unfortunately, not all the error data will be quite so straight forward.

	 UPDATE mrr
		SET LegacyETSId = mn.EtsId,
		LegacyRegion = p.PHEC_Name,
		LegacyLtbrNo = mn.LtbrId,
		LegacyHospitalId = mn.OldHospitalId,
		LegacyHospitalName = mn.OldHospitalName,
		NotificationDate = mn.NotificationDate,
		SourceSystem = mn.PrimarySource,
		GroupId = mn.GroupId,
		NTBSNotificationId = ntbs.NotificationId,
		NTBSHospitalName = hos.[Name],
		TBServiceName = tbs.[Name],
		NTBSRegion = region.[Name]
	FROM  [dbo].[MigrationRunResults] mrr
	INNER JOIN [$(migration)].[dbo].[MergedNotifications] mn ON mn.PrimaryNotificationId = mrr.MigrationNotificationId
	LEFT OUTER JOIN  [$(NTBS_R1_Geography_Staging)].[dbo].[TB_Service_to_Hospital] tbh ON tbh.HospitalID = mn.OldHospitalId
	LEFT OUTER JOIN  [$(NTBS_R1_Geography_Staging)].[dbo].[TB_Service_to_PHEC] tbsp ON tbsp.TB_Service_Code = tbh.TB_Service_Code
	LEFT OUTER JOIN  [$(NTBS_R1_Geography_Staging)].[dbo].[PHEC] p ON p.PHEC_Code = tbsp.PHEC_Code
	LEFT OUTER JOIN  [$(NTBS)].[dbo].[Notification] ntbs ON ntbs.ETSID = mn.EtsId
	LEFT OUTER JOIN  [$(NTBS)].[dbo].[HospitalDetails] h ON h.NotificationId = ntbs.NotificationId
	LEFT OUTER JOIN  [$(NTBS)].[ReferenceData].[Hospital] hos ON hos.HospitalId = h.HospitalId
	LEFT OUTER JOIN  [$(NTBS)].[ReferenceData].[TbService] tbs ON tbs.Code = hos.TBServiceCode
	LEFT OUTER JOIN  [$(NTBS)].[ReferenceData].[PHEC] region ON region.Code = tbs.PHECCode
	WHERE mrr.MigrationRunId = @MigrationRunID


	--now match to errors logged in MigrationRawData.  There may be multiple rows per notification so these are grouped together
	--unfortunately some are logged using the LTBR ID even if ETS is primary


	UPDATE mrr
		SET mrr.MigrationResult = Q2.Result,
		mrr.MigrationNotes = Q2.Reason
	FROM  [dbo].[MigrationRunResults] mrr
		INNER JOIN 
			(SELECT 
			NotificationId, 
			CASE 
				WHEN MIN(Score) = 1 THEN 'Error'
				ELSE 'Data Loss'
			END AS Result,  
			STRING_AGG(Reason, ', ') AS Reason FROM
					(SELECT DISTINCT 
						NotificationId, 
						CASE 
							WHEN Category = 'Error' THEN 1 
							ELSE 2 
						END AS Score, 
						--Category, 
						Reason FROM MigrationRawData) AS Q1 
			GROUP BY NotificationId) AS Q2
		ON Q2.NotificationId = mrr.LegacyETSId
	WHERE mrr.MigrationRunId = @MigrationRunID
		--repeat this but matching on LTBR Id

	UPDATE mrr
		SET mrr.MigrationResult = Q2.Result,
		mrr.MigrationNotes = Q2.Reason
	FROM  [dbo].[MigrationRunResults] mrr
		INNER JOIN 
			(SELECT 
			NotificationId, 
			CASE 
				WHEN MIN(Score) = 1 THEN 'Error'
				ELSE 'Data Loss'
			END AS Result,  
			STRING_AGG(Reason, ', ') AS Reason FROM
					(SELECT DISTINCT 
						NotificationId, 
						CASE 
							WHEN Category = 'Error' THEN 1 
							ELSE 2 
						END AS Score, 
						--Category, 
						Reason FROM MigrationRawData) AS Q1 
			GROUP BY NotificationId) AS Q2
		ON Q2.NotificationId = mrr.LegacyLtbrNo
	WHERE mrr.MigrationRunId = @MigrationRunID

	--then do an update for success cases

	UPDATE [dbo].[MigrationRunResults] SET MigrationResult = 'Success'
		WHERE MigrationResult IS NULL
		AND NTBSNotificationId IS NOT NULL
		AND MigrationRunId = @MigrationRunID
		

	--now we can mark the migration runs as imported
	UPDATE [dbo].[MigrationRun]
		SET ImportedDate = GETUTCDATE()
		WHERE MigrationRunId = @MigrationRunID

	--TODO: record the highest job number currently in Hangfire, so the next migration can start from the job after

	--refactor the MigrationRun table and remove the MigrationRunRegion table. The Run table can have a column for Region (added by user) and needs a start and end job number.
	--need a new SP to allow the user to create a run record. This will set the start job number to the first one after the previous run's end job number 
	--that includes the text 'NOTIFICATION IMPORT'

	--after that the previous two reports need to be refactored, mainly to be based around MergedMigrations.
	--the one that creates a migration file must:
		--only include one record for each group, otherwise the application will attempt to import the group twice
		--use the LTBR ID, in the 'xxx-1' format if LTBR is primary, to avoid importing the very old ETS one with the overlapping ID
		--exclude any record in the requested region already in NTBS
	--the confirmation one needs to be based entirely from MergedMigrations. I don't think Migration Master List needs to exist.

RETURN 0