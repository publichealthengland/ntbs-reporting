﻿
/***************************************************************************************************
Desc:    This seeds or re-seeds the look-up-data. It gets called from uspGenerate(),
         so is run straight after every code deployment. If in doubt, you can also 
		 run this proc stand-alone at any time, and it will re-seed the look-up data.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspSeed] AS
	BEGIN TRY
		-- If any errors, then roll back
		BEGIN TRANSACTION

		-- Disable all foreign keys to make the inserts below succeedC:\Users\ntbsadmin\Desktop\phe-ntbs-summaries\visual-studio\dbo\uspDeploy.sql
		DECLARE @SqlNocheck NVARCHAR(MAX) = ''
		;WITH x AS 
		(
			SELECT DISTINCT obj = 
				QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.' +
				QUOTENAME(OBJECT_NAME(parent_object_id)) 
			FROM sys.foreign_keys
		)
		SELECT @SqlNocheck += N'ALTER TABLE ' + obj + ' NOCHECK CONSTRAINT ALL;' FROM x;
		EXEC sp_executesql @SqlNocheck;

		-- Permission inserts
		DELETE FROM dbo.Phec
		SET IDENTITY_INSERT [dbo].[Phec] ON 
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (1, N'E45000001', N'London', 3)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (2, N'E45000010', N'Yorkshire and Humber', 9)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (3, N'E45000016', N'East Midlands', 1)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (4, N'E45000005', N'West Midlands', 8)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (5, N'E45000019', N'South East', 6)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (6, N'E45000020', N'South West', 7)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (7, N'E45000017', N'East of England', 2)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (8, N'E45000009', N'North East', 4)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (9, N'E45000018', N'North West', 5)
		INSERT dbo.Phec (PhecId, PhecCode, PhecName, SortOrder) VALUES (10, N'Unknown', N'Unknown', 10)
		SET IDENTITY_INSERT [dbo].[Phec] OFF

		DELETE FROM dbo.AdGroup
		SET IDENTITY_INSERT [dbo].[AdGroup] ON 
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (1, N'Global.NIS.NTBS.LON', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (2, N'Global.NIS.NTBS.YHR', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (3, N'Global.NIS.NTBS.EMS', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (4, N'Global.NIS.NTBS.WMS', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (5, N'Global.NIS.NTBS.SoE', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (6, N'Global.NIS.NTBS.SoW', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (7, N'Global.NIS.NTBS.EoE', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (8, N'Global.NIS.NTBS.NoE', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (9, N'Global.NIS.NTBS.NoW', 0,'R')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (10, N'Global.NIS.NTBS.NTS', 1,'N')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (11, N'Global.NIS.NTBS.TestGroup1', 0,'S')
		INSERT [dbo].[AdGroup] ([AdGroupId], [AdGroupName], [IsNationalTeam],[ADGroupType]) VALUES (12, N'Global.NIS.NTBS.TestGroup2', 0,'S')
		SET IDENTITY_INSERT [dbo].[AdGroup] OFF

		DELETE FROM dbo.PhecAdGroup
		SET IDENTITY_INSERT [dbo].[PhecAdGroup] ON 
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (1, 1, 1)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (2, 2, 2)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (3, 3, 3)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (4, 4, 4)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (5, 5, 5)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (6, 6, 6)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (7, 7, 7)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (8, 8, 8)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (9, 9, 9)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (10, 1, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (11, 2, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (12, 3, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (13, 4, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (14, 5, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (15, 6, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (16, 7, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (17, 8, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (18, 9, 10)
		INSERT [dbo].[PhecAdGroup] ([PhecAdGroupId], [PhecId], [AdGroupId]) VALUES (19, 10, 10)
		SET IDENTITY_INSERT [dbo].[PhecAdGroup] OFF

		-- Other inserts
		DELETE FROM dbo.Organism
		SET IDENTITY_INSERT [dbo].[Organism] ON
		INSERT [dbo].[Organism] ([OrganismId], [Organism_CD], [OrganismName], [SortOrder]) VALUES (1, N'A1000', N'M. bovis', 2)
		INSERT [dbo].[Organism] ([OrganismId], [Organism_CD], [OrganismName], [SortOrder]) VALUES (2, N'A2000', N'M. africanum', 3)
		INSERT [dbo].[Organism] ([OrganismId], [Organism_CD], [OrganismName], [SortOrder]) VALUES (3, N'A3000', N'M. microti', 4)
		INSERT [dbo].[Organism] ([OrganismId], [Organism_CD], [OrganismName], [SortOrder]) VALUES (4, N'A4000', N'M. tuberculosis', 1)
		INSERT [dbo].[Organism] ([OrganismId], [Organism_CD], [OrganismName], [SortOrder]) VALUES (5, N'A5000', N'M. tuberculosis complex', 5)
		SET IDENTITY_INSERT [dbo].[Organism] OFF

		DELETE FROM dbo.OrganismNameMapping
		SET IDENTITY_INSERT [dbo].[OrganismNameMapping] ON
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (6, N'AFRICANUM', 2)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (7, N'AFRICANUM TYPE I', 2)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (18, N'BOVIS', 1)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (86, N'M. MICROTI', 3)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (110, N'MAFR', 2)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (121, N'MBOV', 1)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (136, N'MICROTI', 3)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (152, N'MMIC', 3)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (169, N'MTBC', 5)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (173, N'MTUB', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (174, N'MTUBC', 5)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (180, N'MYCAFR', 2)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (182, N'MYCBOV', 1)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (217, N'MYCOBACTERIUM AFRICANUM', 2)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (231, N'MYCOBACTERIUM BOVIS', 1)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (300, N'MYCOBACTERIUM MICROTI', 3)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (346, N'MYCOBACTERIUM TUBERCULOSIS', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (347, N'MYCOBACTERIUM TUBERCULOSIS COMPLEX', 5)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (348, N'MYCOBACTERIUM TUBERCULOSIS(IDENTIFIED BY WHOLE GEN', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (349, N'MYCOBACTERIUM TUBERCULOSIS(IDENTIFIED BY WHOLE GENOME SEQUENCING', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (361, N'MYCTUB', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (447, N'TBCD', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (448, N'TBPCR3', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (453, N'TUBERCULOSIS', 4)
		INSERT [dbo].[OrganismNameMapping] ([OrganismNameMappingId], [OrganismName], [OrganismId]) VALUES (454, N'TUBERCULOSIS COMPLEX', 5)
		SET IDENTITY_INSERT [dbo].[OrganismNameMapping] OFF

		DELETE FROM dbo.TemplateText
		INSERT INTO TemplateText VALUES('Footer text to be displayed in each SSRS report', '1. The source ETS data presented are correct as at {ETS_LAST_REFRESHED} and the data presented in this report was generated at {REPORTING_LAST_REFRESHED}. 2. The data presented are provisional and are subject to change. 3. Source: Reporting Service, Enhanced Tuberculosis Surveillance system (ETS). Use of data is covered by ETS Data Access and Provision Policy');

		DELETE FROM dbo.TreatmentOutcomeTimePeriod
		SET IDENTITY_INSERT [dbo].[TreatmentOutcomeTimePeriod] ON 
		INSERT [dbo].[TreatmentOutcomeTimePeriod] ([TreatmentOutcomeTimePeriodId], [TreatmentOutcomeTimePeriod]) VALUES (1, 'Last recorded')
		INSERT [dbo].[TreatmentOutcomeTimePeriod] ([TreatmentOutcomeTimePeriodId], [TreatmentOutcomeTimePeriod]) VALUES (2, '12 months')
		INSERT [dbo].[TreatmentOutcomeTimePeriod] ([TreatmentOutcomeTimePeriodId], [TreatmentOutcomeTimePeriod]) VALUES (3, '24 months')
		INSERT [dbo].[TreatmentOutcomeTimePeriod] ([TreatmentOutcomeTimePeriodId], [TreatmentOutcomeTimePeriod]) VALUES (4, '36 months')
		SET IDENTITY_INSERT [dbo].[TreatmentOutcomeTimePeriod] OFF

		DELETE FROM dbo.DrugResistanceProfile
		DELETE FROM dbo.Resistant
		SET IDENTITY_INSERT [dbo].[Resistant] ON 
		INSERT [dbo].[Resistant] ([ResistantId], [ResistantDesc]) VALUES (1, 'All')
		INSERT [dbo].[Resistant] ([ResistantId], [ResistantDesc]) VALUES (2, 'Not resistant')
		INSERT [dbo].[Resistant] ([ResistantId], [ResistantDesc]) VALUES (3, 'Resistant')
		SET IDENTITY_INSERT [dbo].[Resistant] OFF
		SET IDENTITY_INSERT [dbo].[DrugResistanceProfile] ON 
		INSERT [dbo].[DrugResistanceProfile] ([DrugResistanceProfileId], [ResistantId], [DrugResistanceProfile]) VALUES (1, 1, 'All')
		INSERT [dbo].[DrugResistanceProfile] ([DrugResistanceProfileId], [ResistantId], [DrugResistanceProfile]) VALUES (2, 2, 'Sensitive to first line')
		INSERT [dbo].[DrugResistanceProfile] ([DrugResistanceProfileId], [ResistantId], [DrugResistanceProfile]) VALUES (3, 2, 'INH+RIF sensitive')
		INSERT [dbo].[DrugResistanceProfile] ([DrugResistanceProfileId], [ResistantId], [DrugResistanceProfile]) VALUES (4, 3, 'INH resistant')
		INSERT [dbo].[DrugResistanceProfile] ([DrugResistanceProfileId], [ResistantId], [DrugResistanceProfile]) VALUES (5, 3, 'RR/MDR/XDR')
		INSERT [dbo].[DrugResistanceProfile] ([DrugResistanceProfileId], [ResistantId], [DrugResistanceProfile]) VALUES (6, 2, 'No result')
		SET IDENTITY_INSERT [dbo].[DrugResistanceProfile] OFF

		DELETE FROM dbo.ClinicalRiskFactors
		SET IDENTITY_INSERT [dbo].[ClinicalRiskFactors] ON 
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (1, N'All cases')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (2, N'No co-morbidities')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (3, N'Chronic liver disease')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (4, N'Chronic renal disease')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (5, N'Diabetes')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (6, N'Hepatitis B')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (7, N'Hepatitis C')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (10, N'Immunosuppression')
		INSERT [dbo].[ClinicalRiskFactors] ([ClinicalRiskFactorId], [ClinicalRiskFactor]) VALUES (11, N'Smoking')
		SET IDENTITY_INSERT [dbo].[ClinicalRiskFactors] OFF

		DELETE FROM dbo.SocialRiskFactors
		SET IDENTITY_INSERT [dbo].[SocialRiskFactors] ON 
		INSERT [dbo].[SocialRiskFactors] ([SocialRiskFactorId], [SocialRiskFactor]) VALUES (1, N'All cases')
		INSERT [dbo].[SocialRiskFactors] ([SocialRiskFactorId], [SocialRiskFactor]) VALUES (2, N'No social risk factors')
		INSERT [dbo].[SocialRiskFactors] ([SocialRiskFactorId], [SocialRiskFactor]) VALUES (3, N'At least one social risk factor')
		INSERT [dbo].[SocialRiskFactors] ([SocialRiskFactorId], [SocialRiskFactor]) VALUES (4, N'Alcohol misuse')
		INSERT [dbo].[SocialRiskFactors] ([SocialRiskFactorId], [SocialRiskFactor]) VALUES (5, N'Drug misuse')
		INSERT [dbo].[SocialRiskFactors] ([SocialRiskFactorId], [SocialRiskFactor]) VALUES (6, N'Homelessness')
		INSERT [dbo].[SocialRiskFactors] ([SocialRiskFactorId], [SocialRiskFactor]) VALUES (7, N'Imprisonment')
		SET IDENTITY_INSERT [dbo].[SocialRiskFactors] OFF

		DELETE FROM dbo.SiteOfDisease
		SET IDENTITY_INSERT [dbo].[SiteOfDisease] ON 
		INSERT [dbo].[SiteOfDisease] ([SiteOfDiseaseId], [SiteOfDisease]) VALUES (1, 'All')
		INSERT [dbo].[SiteOfDisease] ([SiteOfDiseaseId], [SiteOfDisease]) VALUES (2, 'Pulmonary')
		INSERT [dbo].[SiteOfDisease] ([SiteOfDiseaseId], [SiteOfDisease]) VALUES (3, 'Extra-pulmonary')
		SET IDENTITY_INSERT [dbo].[SiteOfDisease] OFF

		DELETE FROM dbo.TreatmentOrResidence
		SET IDENTITY_INSERT [dbo].[TreatmentOrResidence] ON 
		INSERT [dbo].[TreatmentOrResidence] ([TreatmentOrResidenceId], [TreatmentOrResidence]) VALUES (1, 'Either residence or treatment')
		INSERT [dbo].[TreatmentOrResidence] ([TreatmentOrResidenceId], [TreatmentOrResidence]) VALUES (2, 'Treatment')
		INSERT [dbo].[TreatmentOrResidence] ([TreatmentOrResidenceId], [TreatmentOrResidence]) VALUES (3, 'Residence')
		SET IDENTITY_INSERT [dbo].[TreatmentOrResidence] OFF

		DELETE FROM dbo.UkBorn
		SET IDENTITY_INSERT [dbo].[UkBorn] ON 
		INSERT [dbo].[UkBorn] ([UkBornId], [UkBorn]) VALUES (1, 'All')
		INSERT [dbo].[UkBorn] ([UkBornId], [UkBorn]) VALUES (2, 'Yes')
		INSERT [dbo].[UkBorn] ([UkBornId], [UkBorn]) VALUES (3, 'No')
		SET IDENTITY_INSERT [dbo].[UkBorn] OFF

		DELETE FROM dbo.MonthYear
		INSERT dbo.MonthYear (MonthYearId, MonthYear) VALUES ('MONTH', 'Month')
		INSERT dbo.MonthYear (MonthYearId, MonthYear) VALUES ('YEAR', 'Year')

		EXEC dbo.uspAntibioticMapping

		EXEC dbo.uspSampleMapping

		EXEC dbo.uspResultMapping

		DELETE FROM [dbo].[OutcomeLookup]
		INSERT [dbo].[OutcomeLookup] (OutcomeCode, OutcomeDescription) VALUES ('Completed', 'Completed')
		INSERT [dbo].[OutcomeLookup] (OutcomeCode, OutcomeDescription) VALUES ('Cured', 'Cured')
		INSERT [dbo].[OutcomeLookup] (OutcomeCode, OutcomeDescription) VALUES ('Died', 'Died')
		INSERT [dbo].[OutcomeLookup] (OutcomeCode, OutcomeDescription) VALUES ('Lost', 'Lost to follow-up')
		INSERT [dbo].[OutcomeLookup] (OutcomeCode, OutcomeDescription) VALUES ('NotEvaluated', 'Not evaluated')
		INSERT [dbo].[OutcomeLookup] (OutcomeCode, OutcomeDescription) VALUES ('TreatmentStopped', 'Treatment stopped')
		INSERT [dbo].[OutcomeLookup] (OutcomeCode, OutcomeDescription) VALUES ('Failed', 'Failed')
		
       

		-- Enable all foreign keys again
		DECLARE @SqlCheck NVARCHAR(MAX) = '';
		;WITH x AS 
		(
			SELECT DISTINCT obj = 
				QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.' +
				QUOTENAME(OBJECT_NAME(parent_object_id)) 
			FROM sys.foreign_keys
		)
		SELECT @SqlCheck += N'ALTER TABLE ' + obj + ' WITH CHECK CHECK CONSTRAINT ALL;' FROM x;
		EXEC sp_executesql @SqlCheck;

		COMMIT
	END TRY
	BEGIN CATCH
		-- A "Generate" proc has errored
		ROLLBACK		

		-- Show error on screen
		EXEC dbo.uspHandleException
	END CATCH