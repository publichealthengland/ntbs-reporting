﻿CREATE PROCEDURE [dbo].[uspMigrationDubiousSpecimenMatches]

AS
BEGIN TRY
SET NOCOUNT ON

TRUNCATE TABLE MigrationDubiousSpecimenMatches
------------------------------------------------------------------------------------------------------------
--where one specimen has been matched to two different notifications.
select distinct e.* into #SpecimenMultipleNotificationMatchFlag from [$(NTBS_Specimen_Matching)].dbo.EtsSpecimenMatch e
INNER JOIN (

--Find multimatches
SELECT ReferenceLaboratoryNumber,COUNT(*) as Total
  FROM  [$(NTBS_Specimen_Matching)].dbo.[EtsSpecimenMatch]

  where year([EarliestMatchDate]) > (year(GETDATE())-3)

  or year([SpecimenDate]) > (year(GETDATE())-3)
  group by ReferenceLaboratoryNumber
  having COUNT(*) >1)  AS Q1 on Q1.ReferenceLaboratoryNumber = e.ReferenceLaboratoryNumber
 order by e.ReferenceLaboratoryNumber

INSERT INTO MigrationDubiousSpecimenMatches(EtsId,ReferenceLaboratoryNumber, SpecimenMultipleNotificationMatchFlag)
SELECT DISTINCT LegacyId,ReferenceLaboratoryNumber,1 FROM #SpecimenMultipleNotificationMatchFlag
------------------------------------------------------------------------------------------------------------
/*specimen date is more than a year before the notification date

<MAYBE> specimen date is outside the allowable date range for the notification (i.e. too long after as well as too long before)
*/
   select e.* into #SpecimenDateRangeFlag from [$(NTBS_Specimen_Matching)].dbo.EtsSpecimenMatch e
  inner join LegacyExtract l on l.EtsId = e.LegacyId
  where ABS(DATEDIFF(day,CaseReportDate,[SpecimenDate])) >365
  and
 ( year([EarliestMatchDate]) > (year(GETDATE())-3))

 --needs fixing for date range

UPDATE M
SET SpecimenDateRangeFlag = 1
FROM MigrationDubiousSpecimenMatches M
INNER JOIN #SpecimenMultipleNotificationMatchFlag S ON M.EtsId = S.LegacyId AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber

INSERT INTO MigrationDubiousSpecimenMatches(EtsId,ReferenceLaboratoryNumber, SpecimenDateRangeFlag)
SELECT DISTINCT S.LegacyId, S.ReferenceLaboratoryNumber, 1 FROM #SpecimenDateRangeFlag S
LEFT JOIN MigrationDubiousSpecimenMatches M ON M.EtsId = S.LegacyId AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber
WHERE M.EtsId IS NULL

 ------------------------------------------------------------------------------------------------------------
 --different NHS numbers
    select e.*,le.NHSNumber,ls.PatientNhsNumber into #DifferentNHS from [$(NTBS_Specimen_Matching)].dbo.EtsSpecimenMatch e
  inner join LegacyExtract le on le.EtsId = e.LegacyId
  inner join [$(NTBS_Specimen_Matching)].dbo.LabSpecimen ls on ls.ReferenceLaboratoryNumber = e.ReferenceLaboratoryNumber
  where Replace(NHSNumber,' ','') <> Replace(PatientNhsNumber,' ','')
  and NHSNumber not in ('','0000000000') and PatientNhsNumber not in ('','.') and PatientNhsNumber not like '%[A-Z]%'
  and (year([EarliestMatchDate]) > (year(GETDATE())-3)

  or year(e.[SpecimenDate]) > (year(GETDATE())-3))

  UPDATE M
SET NHSNumberDifferentFlag = 1
FROM MigrationDubiousSpecimenMatches M
INNER JOIN #DifferentNHS S ON M.EtsId = S.LegacyId AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber

INSERT INTO MigrationDubiousSpecimenMatches(EtsId,ReferenceLaboratoryNumber, NHSNumberDifferentFlag)
SELECT DISTINCT S.LegacyId, S.ReferenceLaboratoryNumber, 1 FROM #DifferentNHS S
LEFT JOIN MigrationDubiousSpecimenMatches M ON M.EtsId = S.LegacyId AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber
WHERE M.EtsId IS NULL
   ------------------------------------------------------------------------------------------------------------
 --matched to a denotified case
      select e.* into #DenotifiedMatchFlag from [$(NTBS_Specimen_Matching)].dbo.EtsSpecimenMatch e
  inner join LegacyExtract l on l.EtsId = e.LegacyId
  where l.Denotified = 'Yes'

    UPDATE M
SET DenotifiedMatchFlag = 1
FROM MigrationDubiousSpecimenMatches M
INNER JOIN #DenotifiedMatchFlag S ON M.EtsId = S.LegacyId AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber

INSERT INTO MigrationDubiousSpecimenMatches(EtsId,ReferenceLaboratoryNumber, DenotifiedMatchFlag)
SELECT DISTINCT S.LegacyId, S.ReferenceLaboratoryNumber, 1 FROM #DenotifiedMatchFlag S
LEFT JOIN MigrationDubiousSpecimenMatches M ON M.EtsId = S.LegacyId AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber
WHERE M.EtsId IS NULL
  ------------------------------------------------------------------------------------------------------------
 --matched to a deleted draft
select n.LegacyId as ets_id,a.ReferenceLaboratoryNumber,n.AuditDelete,n.NotificationDate, SpecimenDate,n.Submitted,lr.OpieId,lr.AuditCreate,lr.AutoMatched,
p.Forename, p.Surname, p.DateOfBirth, p.NhsNumber, a.PatientForename, a.PatientSurname, a.PatientBirthDate, a.PatientNhsNumber, su.Email as CaseOwnerEmail
INTO #DeletedDraftFlag
FROM [$(ETS)].dbo.[Notification]  n
inner join [$(ETS)].dbo.LaboratoryResult lr on lr.NotificationId = n.Id
inner join [$(Labbase2)].dbo.Anonymised a on a.OpieId = lr.OpieId
inner join [$(Labbase2)].dbo.SpecimenResult sr on sr.LabDataID = a.LabDataID
left join [$(ETS)].dbo.Patient p on p.Id = n.PatientId
left join [$(ETS)].dbo.SystemUser su on su.Id = n.OwnerUserId

where (n.AuditDelete is not null ) and lr.AuditDelete is null and lr.OpieId is not null
and (year(lr.AuditCreate) > (year(GETDATE())-3)
    or year([SpecimenDate]) > (year(GETDATE())-3))

UPDATE M
SET DeletedDraftFlag = 1
FROM MigrationDubiousSpecimenMatches M
INNER JOIN #DeletedDraftFlag S ON M.EtsId = S.ets_id AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber

INSERT INTO MigrationDubiousSpecimenMatches(EtsId,ReferenceLaboratoryNumber, DeletedDraftFlag)
SELECT DISTINCT S.ets_id, S.ReferenceLaboratoryNumber, 1 FROM #DeletedDraftFlag S
LEFT JOIN MigrationDubiousSpecimenMatches M ON M.EtsId = S.ets_id AND M.ReferenceLaboratoryNumber = S.ReferenceLaboratoryNumber
WHERE M.EtsId IS NULL


Drop table #DeletedDraftFlag
Drop table #DenotifiedMatchFlag
Drop table #DifferentNHS
Drop table #SpecimenDateRangeFlag
Drop table #SpecimenMultipleNotificationMatchFlag
 ------------------------------------------------------------------------------------------------------------

 UPDATE MigrationDubiousSpecimenMatches
 Set MigrationNotes = ReferenceLaboratoryNumber + ' (' +
CONCAT_WS(', ',REPLACE(cast([SpecimenDateRangeFlag] as varchar),'1','Specimen Date Range')
,REPLACE(cast([NHSNumberDifferentFlag] as varchar),'1','NHS Number Difference')
,REPLACE(cast([SpecimenMultipleNotificationMatchFlag] as varchar),'1','Specimen Multiple Notification Match')
,REPLACE(cast(DenotifiedMatchFlag as varchar),'1','Denotified Match')
,REPLACE(cast(DeletedDraftFlag as varchar),'1','Deleted Draft Match')) + ')'


 --Update Comments in MigrationRunResults field MigrationNotes
 --Review specimen match(es) to Isolate(s) [ReferenceLaboratoryNumber] (),[ReferenceLaboratoryNumber2]()
 	END TRY
	BEGIN CATCH
		THROW
	END CATCH
