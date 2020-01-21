﻿CREATE FUNCTION [dbo].[ufnGetKPIforService]
(
	--comma-separated list to be split using select value from STRING_SPLIT(@Service, ',')
	@Service VARCHAR(1000)		=	NULL
)
RETURNS TABLE
AS
RETURN 

	SELECT 
		TB_Service_Code AS Code,
		[%Positive] AS 'PercentPositive',
		[%Resistant] AS 'PercentResistant',
		[%HIVOffered] AS 'PercentHIVOffered',
		[%TreatmentDelay] AS 'PercentTreatmentDelay'
	
	FROM [dbo].[vwServiceKPI]
	WHERE TB_Service_Code IN  
			(SELECT TRIM(VALUE) FROM STRING_SPLIT(@Service, ','))

