﻿Create PROCEDURE [dbo].[uspUpdateReusableNotificationPostcode] AS
	SET NOCOUNT ON

	BEGIN TRY
		

		if object_id('tempdb.dbo.#NotificationPostcodes','U') is not null 
		begin	
			drop table #NotificationPostcodes
		end

		SELECT distinct ReusableNotificationId, postcode,REPLACE(postcode, ' ', '') as CleanedPostcode into #NotificationPostcodes
		  FROM [NTBS_R1_Reporting_Staging].[dbo].[ReusableNotification] 
  
		  delete from #NotificationPostcodes 
		  where len(CleanedPostcode)<5 or len(CleanedPostcode)>7 or CleanedPostcode not like '%[^0-9]%'


		  update #NotificationPostcodes
		  set CleanedPostcode = substring(CleanedPostcode,1,len(CleanedPostcode)-3) + ' ' + right(CleanedPostcode,3)
  
		  update r
		  set Postcode = n.CleanedPostcode
		   from ReusableNotification r
		  inner join #NotificationPostcodes n on n.ReusableNotificationId = r.ReusableNotificationId

  	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO

