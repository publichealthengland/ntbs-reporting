﻿CREATE TABLE [dbo].[Record_LegacyExtract]
(
	[LegacyExtractId] [int] IDENTITY(1,1) NOT NULL ,
	-- Global NotificationId
	[NotificationId] [int] NOT NULL,
	[LocalPatientId] [nvarchar](255) NULL,
	[ReportYear] [nvarchar](4) NULL,
	[DenotificationDate] [date] NULL,
	[DenotificationComments] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[Town] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[PCT] [nvarchar] (60) NULL,
	[HPU] [nvarchar] (60) NULL,
	[SitePulmonary] [varchar](5) NULL,
	[SiteBoneSpine] [varchar](5) NULL,
	[SiteBoneOther] [varchar](5) NULL,
	[SiteCNSMeningitis] [varchar](5) NULL,
	[SiteCNSOther] [varchar](5) NULL,
	[SiteCryptic] [varchar](5) NULL,
	[SiteGI] [varchar](5) NULL,
	[SiteGU] [varchar](5) NULL,
	[SiteITLymphNodes] [varchar](5) NULL,
	[SiteLymphNode] [varchar](5) NULL,
	[SiteLaryngeal] [varchar](5) NULL,
	[SiteMiliary] [varchar](5) NULL,
	[SitePleural] [varchar](5) NULL,
	[SiteNonPulmonaryOther] [varchar](5) NULL,
	[SiteNonPulmonaryUnknown] [varchar](5) NULL,
	[OtherExtraPulmonarySite] [nvarchar](max) NULL,
	[SiteUnknown] [varchar](5) NULL,
	
	[MDRTreatment] [nvarchar](10) NULL,
	[BcgVaccinationDate] [varchar](20) NULL,
	[ShortCourse] [nvarchar](10) NULL,
	[InPatient] [nvarchar](10) NULL,
	[Comments] [nvarchar](max) NULL,
	[ImmunosuppressionComments] [nvarchar](50) NULL,
	[PrisonAbroadLast5Years] [nvarchar](10) NULL,
	[PrisonAbroadMoreThan5YearsAgo] [nvarchar](10) NULL,
	[TOMTreatmentInterruptedReason] [varchar](150) NULL,
	[TOMTreatmentChangedReason] [varchar](150) NULL,
	[TOMCompleteCourse] [varchar](255) NULL,
	[TOMIncompleteReason] [varchar](255) NULL,
	[TOMSubmittedDate] [nvarchar](10) NULL,
	[TOMFollowUpResult] [varchar](150) NULL,
	[TOMDeathDate] [nvarchar](10) NULL,
	[TOMDeathRelationship] [nvarchar](255) NULL,
	[TOMEndOfTreatmentDate] [nvarchar](10) NULL,
	[TOMTreatmentRegimen] [varchar](150) NULL,
	[TOMNonTuberculousMycobacteria] [varchar](500) NULL,
	[TOMConversion] [varchar](24) NULL,
	[TOMComment] [nvarchar](500) NULL,
	[TOMReasonExceeds12mths] [nvarchar](50) NULL,
	[TOMReported12mth] [nvarchar](10) NULL,
	[TOMTreatmentInterruptedReason24mth] [nvarchar](150) NULL,
	[TOMTreatmentChangedReason24mth] [nvarchar](150) NULL,
	[TOMCompleteCourse24mth] [nvarchar](150) NULL,
	[TOMIncompleteReason24mth] [nvarchar](255) NULL,
	[TOMSubmittedDate24mth] [nvarchar](10) NULL,
	[TOMFollowUpResult24mth] [nvarchar](255) NULL,
	[TOMDeathDate24mth] [nvarchar](10) NULL,
	[TOMDeathRelationship24mth] [nvarchar](255) NULL,
	[TOMEndOfTreatmentDate24mth] [nvarchar](10) NULL,
	[TOMTreatmentRegimen24mth] [nvarchar](150) NULL,
	[TOMNonTuberculousMycobacteria24mth] [nvarchar](500) NULL,
	[TOMConversion24mth] [nvarchar](24) NULL,
	[TOMComment24mth] [nvarchar](500) NULL,
	[TOMReported24mth] [nvarchar](10) NULL,
	
	[TreatmentHPU] [nvarchar](255) NULL,
	
	[HospitalPCT] [nvarchar](255) NULL,
	[HospitalLocalAuthority] [nvarchar](255) NULL,
	[ResolvedResidenceHPU] [nvarchar](100) NULL,
	[ResolvedResidenceRegion] [nvarchar](100) NULL,
	[ResolvedResidenceLA] [nvarchar](100) NULL,
	
	--[HIVTestOffered] [nvarchar](255) NULL,
	[NoSampleTaken] [bit] NULL,
	
	
	[TOMTreatmentInterruptedReason36mth] [nvarchar](150) NULL,
	[TOMTreatmentChangedReason36mth] [nvarchar](150) NULL,
	[TOMCompleteCourse36mth] [nvarchar](150) NULL,
	[TOMIncompleteReason36mth] [nvarchar](255) NULL,
	[TOMSubmittedDate36mth] [nvarchar](10) NULL,
	[TOMFollowUpResult36mth] [nvarchar](255) NULL,
	[TOMDeathDate36mth] [nvarchar](10) NULL,
	[TOMDeathRelationship36mth] [nvarchar](255) NULL,
	[TOMEndOfTreatmentDate36mth] [nvarchar](10) NULL,
	[TOMTreatmentRegimen36mth] [nvarchar](150) NULL,
	[TOMNonTuberculousMycobacteria36mth] [nvarchar](500) NULL,
	[TOMConversion36mth] [nvarchar](36) NULL,
	[TOMComment36mth] [nvarchar](500) NULL,
	[TOMReported36mth] [nvarchar](10) NULL,
	[TOMReasonExceeds24mths] [nvarchar](50) NULL,
	[WorldRegionName] [nvarchar](50) NULL, 
    CONSTRAINT [PK_Case_LegacyExtract] PRIMARY KEY ([LegacyExtractId]) 
    
)  
