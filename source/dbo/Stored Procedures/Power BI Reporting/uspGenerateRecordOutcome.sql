﻿/*This will calculate 12, 24, 36 month outcomes for NTBS notifications
and then update Record_CaseData with the appropriate values for each*/


CREATE PROCEDURE [dbo].[uspGenerateRecordOutcome]
	
AS
BEGIN TRY
--SET UP STEPS
	--clear down the companion tables
	TRUNCATE TABLE [dbo].[Outcome]
	TRUNCATE TABLE [dbo].[PeriodicOutcome]

	--populate with base records where source system is NTBS
	INSERT INTO [dbo].[Outcome] (NotificationId)
		SELECT NotificationId FROM RecordRegister WHERE SourceSystem = 'NTBS'


	--now calculate the treatment start date. Where this is populated in NTBS, use this. If not, use the notification date as a proxy
	--there should be a "starting" event in the TreatmentEvent table which has the right value, with type either 'TreatmentStart' or 'DiagnosisMade'

	UPDATE o
	SET 
		TreatmentStartDate = COALESCE(te.EventDate, n.NotificationDate)
	FROM
		[dbo].[Outcome] o
		INNER JOIN [$(NTBS)].[dbo].[Notification] n ON n.NotificationId = o.NotificationId
		INNER JOIN [$(NTBS)].[dbo].[TreatmentEvent] te ON te.NotificationId = o.NotificationId
	WHERE te.TreatmentEventType = 'TreatmentStart' OR te.TreatmentEventType = 'DiagnosisMade'
		
	--Call the stored proc for each outcome period: 1, 2 and 3 (12 month, 24 month, 36 month)
	EXEC [dbo].[uspGenerateReusableOutcomePeriodic] 1
	EXEC [dbo].[uspGenerateReusableOutcomePeriodic] 2
	EXEC [dbo].[uspGenerateReusableOutcomePeriodic] 3


--WRAP-UP STEPS

	--update the main table with the values for each outcome
	--if it can be found in the Periodic Outcome table, use this
	--if not, set it to an empty string
		

	UPDATE cd
	SET
		TreatmentOutcome12months = po1.OutcomeValue, 
		TreatmentOutcome24months = po2.OutcomeValue, 
		TreatmentOutcome36months = po3.OutcomeValue
	FROM [dbo].[Record_CaseData] cd
		INNER JOIN [dbo].[Outcome] o ON o.NotificationId = cd.NotificationId
		INNER JOIN [dbo].[RecordRegister] rr ON rr.NotificationId = o.NotificationId
		LEFT OUTER JOIN [dbo].[PeriodicOutcome] po1 ON po1.NotificationId = o.NotificationId AND po1.TimePeriod = 1
		LEFT OUTER JOIN [dbo].[PeriodicOutcome] po2 ON po2.NotificationId = o.NotificationId AND po2.TimePeriod = 2
		LEFT OUTER JOIN [dbo].[PeriodicOutcome] po3 ON po3.NotificationId = o.NotificationId AND po3.TimePeriod = 3
	WHERE rr.SourceSystem = 'NTBS'


	--finally delete this table. TODO: Leave commented out for now for debugging
	--DELETE FROM [dbo].[Outcome]
	--DELETE FROM [dbo].[PeriodicOutcome]
END TRY
BEGIN CATCH
	THROW
END CATCH

