﻿CREATE PROCEDURE uspGenerateSGSSMTBCPatients as
select * from SGSS_MTBC_Patients
/*
select * from (select CALENDAR_YEAR, WEEK_OF_YEAR, Total from SGSS_MTBC_Patients) a
PIVOT (
	SUM(Total) for 
		Calendar_Year in ([2019], [2020])
		) AS PivotTable

		*/
GO