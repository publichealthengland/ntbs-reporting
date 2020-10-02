﻿CREATE TABLE [dbo].[MigrationRunResults]
(
	[MigrationRunResultsId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[MigrationRunId] [int] NOT NULL,
	[MigrationNotificationId] [NVARCHAR](30) NOT NULL,
	[LegacyRegion] [varchar](50) NULL,
	[LegacyETSId] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[LegacyLtbrNo] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[NotificationDate] [datetime] NULL,
	[GroupId] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[SourceSystem] [nvarchar](10) COLLATE Latin1_General_CI_AS NULL,
	[LegacyHospitalId] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[LegacyHospitalName] [nvarchar](255) COLLATE Latin1_General_CI_AS NULL,
	[NTBSNotificationId] [int] NULL,
	[NTBSHospitalName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[TBServiceName] [nvarchar](200) COLLATE Latin1_General_CI_AS NULL,
	[NTBSRegion] [nvarchar](50) COLLATE Latin1_General_CI_AS NULL,
	[MigrationResult] [nvarchar](20) COLLATE Latin1_General_CI_AS NULL,
	[MigrationNotes] [nvarchar](4000) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
