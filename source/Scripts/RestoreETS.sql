﻿/*IF EXISTS (SELECT * 
			FROM master.dbo.sysdatabases 
			WHERE name = 'ETS')
ALTER DATABASE ETS
SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

RESTORE DATABASE [ETS] 
FROM DISK = N'ADD PATH TO BACKUP FILE HERE'
WITH REPLACE,
NOUNLOAD, STATS = 10
GO*/
