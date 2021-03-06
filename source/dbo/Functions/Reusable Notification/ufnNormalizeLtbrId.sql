﻿/***************************************************************************************************
Desc:    This strips a few specified amount of characters from the LTBR ID


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnNormalizeLtbrId] (
	@UnNormalizedLtbrId NVARCHAR(50)
)
	RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(50)

		IF (LEN(@UnNormalizedLtbrId) = 0 OR LEN(@UnNormalizedLtbrId) = 14)
		BEGIN
			-- Strip the first 8 characters from the LTBR ID (YYYY:200)
			SET @ReturnValue = RIGHT(@UnNormalizedLtbrId, LEN(@UnNormalizedLtbrId) - 8)

			-- Strip the last 1 character from the LTBR ID
			SET @ReturnValue = LEFT(@ReturnValue, LEN(@ReturnValue) - 1)
		END
		ELSE
		BEGIN
			-- Return value as is
			SET @ReturnValue = @UnNormalizedLtbrId

		END

		RETURN @ReturnValue
	END
