﻿CREATE TABLE [dbo].[UserLookup]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ACCOUNTNAME]  NVARCHAR(100) NULL,
	[TYPE]  CHAR(8) NULL,
	[PRIVILEGE]  CHAR(9) NULL,
	[MAPPEDLOGINNAME] NVARCHAR(50) NULL,
	SYSNAME NVARCHAR(50) NULL,
	[PERMISSIONPATH] NVARCHAR(300) NULL

)