﻿CREATE VIEW [dbo].[vwPhecKPI]

AS
	SELECT p.PHEC_Code, p.PHEC_Name,
		COALESCE (Q1.NumberofNotifications, 0) As NumberOfNotifications,
		COALESCE (Q1.HIVDenominator, 0) As HIVDenominator,
		COALESCE (CAST((Q1.CPCount * 100.0) / NULLIF(Q1.NumberOfNotifications,0) AS DECIMAL(10, 1)), 0.0) AS '%Positive',
		COALESCE (CAST((Q1.ResistantCount * 100.0) / NULLIF(Q1.CPCount,0) AS DECIMAL(10, 1)), 0.0) As '%Resistant',
		COALESCE (CAST((Q1.HIVOffered * 100.0) / NULLIF(Q1.HIVDenominator,0) AS DECIMAL(10, 1)), 0.0) As '%HIVOffered',
		COALESCE (CAST((Q1.TreatmentDelays * 100.0) / NULLIF(Q1.NumberOfPulmonaryNotifications, 0) AS DECIMAL(10, 1)), 0.0) As '%TreatmentDelay'

		FROM [$(NTBS_R1_Geography_Staging)].[dbo].[PHEC] p
		LEFT OUTER JOIN
			(SELECT rn.TreatmentPhecCode,
					SUM(CASE WHEN CulturePositive='Yes' THEN 1 ELSE 0 END) AS CPCount,
					SUM(CASE WHEN CulturePositive='No' THEN 1 ELSE 0 END) AS CNCount,
					SUM(CASE WHEN DrugResistanceProfile IN ('RR/MDR/XDR', 'INH Resistant') THEN 1 ELSE 0 END) AS ResistantCount,
					SUM(CASE WHEN HivTestOffered IN ('Offered and done', 'Offered but not done', 'Offered but refused') THEN 1
							ELSE 0
						END) AS HIVOffered,
					SUM(CASE WHEN HivTestOffered IN ('Offered and done', 'Offered but not done', 'Offered but refused', 'Not offered') THEN 1
							ELSE 0
						END) AS HIVDenominator,
					SUM(CASE WHEN OnsetToTreatmentDays > 120 and SiteOfDisease = 'Pulmonary' THEN 1 ELSE 0 END) AS TreatmentDelays,
					SUM(CASE WHEN SiteOfDisease = 'Pulmonary' THEN 1 ELSE 0 END) AS NumberOfPulmonaryNotifications,
					COUNT(rn.ReusableNotificationId) as 'NumberOfNotifications'
				FROM  [dbo].ReusableNotification rn
				WHERE rn.NotificationDate between getDate()-395 and getDate()-30
				GROUP BY rn.TreatmentPhecCode) AS Q1
		ON Q1.TreatmentPhecCode = p.PHEC_Code
