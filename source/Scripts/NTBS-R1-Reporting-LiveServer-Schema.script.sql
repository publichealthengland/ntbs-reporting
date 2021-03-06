USE [master]
GO
/****** Object:  Database [NTBS_Reporting_Staging]    Script Date: 09/04/2021 15:21:23 ******/
CREATE DATABASE [NTBS_Reporting_Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NTBS_R1_Reporting_Staging', FILENAME = N'E:\NTBS_R1_Reporting_Staging\NTBS_R1_Reporting_Staging.mdf' , SIZE = 674048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NTBS_R1_Reporting_Staging_log', FILENAME = N'E:\NTBS_R1_Reporting_Staging\NTBS_R1_Reporting_Staging_log.ldf' , SIZE = 5461120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NTBS_Reporting_Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET ANSI_NULLS ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET ANSI_PADDING ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET ARITHABORT ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET  MULTI_USER 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NTBS_Reporting_Staging', N'ON'
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET QUERY_STORE = OFF
GO
USE [NTBS_Reporting_Staging]
GO
/****** Object:  UserDefinedTableType [dbo].[LoginInfoType]    Script Date: 09/04/2021 15:21:23 ******/
CREATE TYPE [dbo].[LoginInfoType] AS TABLE(
	[accountname] [nvarchar](128) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[privilege] [varchar](50) NOT NULL,
	[mappedloginname] [varchar](100) NOT NULL,
	[permissionpath] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ReusableNotificationType]    Script Date: 09/04/2021 15:21:23 ******/
CREATE TYPE [dbo].[ReusableNotificationType] AS TABLE(
	[NotificationId] [int] NOT NULL,
	[EtsId] [bigint] NULL DEFAULT (NULL),
	[LtbrId] [nvarchar](50) NULL DEFAULT (NULL),
	[NotificationDate] [date] NULL DEFAULT (NULL),
	[CaseManager] [nvarchar](101) NULL DEFAULT (NULL),
	[Consultant] [nvarchar](255) NULL DEFAULT (NULL),
	[Hospital] [nvarchar](255) NULL DEFAULT (NULL),
	[Service] [nvarchar](150) NULL DEFAULT (NULL),
	[NhsNumber] [nvarchar](50) NULL DEFAULT (NULL),
	[Forename] [nvarchar](50) NULL DEFAULT (NULL),
	[Surname] [nvarchar](50) NULL DEFAULT (NULL),
	[DateOfBirth] [date] NULL DEFAULT (NULL),
	[Age] [tinyint] NULL DEFAULT (NULL),
	[Sex] [varchar](30) NULL DEFAULT (NULL),
	[UkBorn] [varchar](30) NULL DEFAULT (NULL),
	[EthnicGroup] [varchar](255) NULL DEFAULT (NULL),
	[BirthCountry] [varchar](255) NULL DEFAULT (NULL),
	[UkEntryYear] [int] NULL DEFAULT (NULL),
	[Postcode] [nvarchar](10) NULL DEFAULT (NULL),
	[NoFixedAbode] [nvarchar](30) NULL DEFAULT (NULL),
	[LocalAuthority] [nvarchar](50) NULL DEFAULT (NULL),
	[LocalAuthorityCode] [nvarchar](50) NULL DEFAULT (NULL),
	[ResidencePhec] [nvarchar](50) NULL DEFAULT (NULL),
	[TreatmentPhec] [nvarchar](50) NULL DEFAULT (NULL),
	[SymptomOnsetDate] [date] NULL DEFAULT (NULL),
	[PresentedDate] [date] NULL DEFAULT (NULL),
	[OnsetToPresentationDays] [smallint] NULL DEFAULT (NULL),
	[DiagnosisDate] [date] NULL DEFAULT (NULL),
	[PresentationToDiagnosisDays] [smallint] NULL,
	[StartOfTreatmentDate] [date] NULL DEFAULT (NULL),
	[DiagnosisToTreatmentDays] [smallint] NULL DEFAULT (NULL),
	[OnsetToTreatmentDays] [smallint] NULL DEFAULT (NULL),
	[HivTestOffered] [nvarchar](255) NULL DEFAULT (NULL),
	[SiteOfDisease] [nvarchar](50) NULL DEFAULT (NULL),
	[AdultContactsIdentified] [int] NULL DEFAULT (NULL),
	[ChildContactsIdentified] [int] NULL DEFAULT (NULL),
	[TotalContactsIdentified] [int] NULL DEFAULT (NULL),
	[AdultContactsAssessed] [int] NULL DEFAULT (NULL),
	[ChildContactsAssessed] [int] NULL DEFAULT (NULL),
	[TotalContactsAssessed] [int] NULL DEFAULT (NULL),
	[AdultContactsActiveTB] [int] NULL DEFAULT (NULL),
	[ChildContactsActiveTB] [int] NULL DEFAULT (NULL),
	[TotalContactsActiveTB] [int] NULL DEFAULT (NULL),
	[AdultContactsLTBI] [int] NULL DEFAULT (NULL),
	[ChildContactsLTBI] [int] NULL DEFAULT (NULL),
	[TotalContactsLTBI] [int] NULL DEFAULT (NULL),
	[AdultContactsLTBITreat] [int] NULL DEFAULT (NULL),
	[ChildContactsLTBITreat] [int] NULL DEFAULT (NULL),
	[TotalContactsLTBITreat] [int] NULL DEFAULT (NULL),
	[AdultContactsLTBITreatComplete] [int] NULL DEFAULT (NULL),
	[ChildContactsLTBITreatComplete] [int] NULL DEFAULT (NULL),
	[TotalContactsLTBITreatComplete] [int] NULL DEFAULT (NULL),
	[PreviouslyDiagnosed] [varchar](30) NULL DEFAULT (NULL),
	[YearsSinceDiagnosis] [tinyint] NULL DEFAULT (NULL),
	[PreviouslyTreated] [varchar](30) NULL DEFAULT (NULL),
	[TreatmentInUk] [varchar](30) NULL DEFAULT (NULL),
	[PreviousId] [nvarchar](50) NULL DEFAULT (NULL),
	[BcgVaccinated] [varchar](30) NULL DEFAULT (NULL),
	[AnySocialRiskFactor] [varchar](40) NULL DEFAULT (NULL),
	[AlcoholMisuse] [varchar](30) NULL DEFAULT (NULL),
	[DrugMisuse] [varchar](30) NULL DEFAULT (NULL),
	[CurrentDrugMisuse] [varchar](30) NULL DEFAULT (NULL),
	[DrugMisuseInLast5Years] [varchar](30) NULL DEFAULT (NULL),
	[DrugMisuseMoreThan5YearsAgo] [varchar](30) NULL DEFAULT (NULL),
	[Homeless] [varchar](30) NULL DEFAULT (NULL),
	[CurrentlyHomeless] [varchar](30) NULL DEFAULT (NULL),
	[HomelessInLast5Years] [varchar](30) NULL DEFAULT (NULL),
	[HomelessMoreThan5YearsAgo] [varchar](30) NULL DEFAULT (NULL),
	[Prison] [varchar](30) NULL DEFAULT (NULL),
	[CurrentlyInPrisonOrInPrisonWhenFirstSeen] [varchar](30) NULL DEFAULT (NULL),
	[InPrisonInLast5Years] [varchar](30) NULL DEFAULT (NULL),
	[InPrisonMoreThan5YearsAgo] [varchar](30) NULL DEFAULT (NULL),
	[TravelledOutsideUk] [varchar](30) NULL DEFAULT (NULL),
	[ToHowManyCountries] [nvarchar](5) NULL DEFAULT (NULL),
	[TravelCountry1] [nvarchar](255) NULL DEFAULT (NULL),
	[MonthsTravelled1] [int] NULL DEFAULT (NULL),
	[TravelCountry2] [nvarchar](255) NULL DEFAULT (NULL),
	[MonthsTravelled2] [int] NULL DEFAULT (NULL),
	[TravelCountry3] [nvarchar](255) NULL DEFAULT (NULL),
	[MonthsTravelled3] [int] NULL DEFAULT (NULL),
	[ReceivedVisitors] [varchar](30) NULL DEFAULT (NULL),
	[FromHowManyCountries] [nvarchar](5) NULL DEFAULT (NULL),
	[VisitorCountry1] [nvarchar](255) NULL DEFAULT (NULL),
	[DaysVisitorsStayed1] [nvarchar](50) NULL DEFAULT (NULL),
	[VisitorCountry2] [nvarchar](255) NULL DEFAULT (NULL),
	[DaysVisitorsStayed2] [nvarchar](50) NULL DEFAULT (NULL),
	[VisitorCountry3] [nvarchar](255) NULL DEFAULT (NULL),
	[DaysVisitorsStayed3] [nvarchar](50) NULL DEFAULT (NULL),
	[Diabetes] [varchar](30) NULL DEFAULT (NULL),
	[HepatitisB] [varchar](30) NULL DEFAULT (NULL),
	[HepatitisC] [varchar](30) NULL DEFAULT (NULL),
	[ChronicLiverDisease] [varchar](30) NULL DEFAULT (NULL),
	[ChronicRenalDisease] [varchar](30) NULL DEFAULT (NULL),
	[ImmunoSuppression] [varchar](30) NULL DEFAULT (NULL),
	[BiologicalTherapy] [varchar](100) NULL DEFAULT (NULL),
	[Transplantation] [varchar](30) NULL DEFAULT (NULL),
	[OtherImmunoSuppression] [varchar](30) NULL DEFAULT (NULL),
	[CurrentSmoker] [varchar](30) NULL DEFAULT (NULL),
	[PostMortemDiagnosis] [varchar](30) NULL DEFAULT (NULL),
	[DidNotStartTreatment] [varchar](30) NULL DEFAULT (NULL),
	[ShortCourse] [varchar](30) NULL DEFAULT (NULL),
	[MdrTreatment] [varchar](30) NULL DEFAULT (NULL),
	[MdrTreatmentDate] [date] NULL DEFAULT (NULL),
	[TreatmentOutcome12months] [varchar](30) NULL DEFAULT (NULL),
	[TreatmentOutcome24months] [varchar](30) NULL DEFAULT (NULL),
	[TreatmentOutcome36months] [varchar](30) NULL DEFAULT (NULL),
	[LastRecordedTreatmentOutcome] [varchar](30) NULL DEFAULT (NULL),
	[DateOfDeath] [date] NULL DEFAULT (NULL),
	[TreatmentEndDate] [date] NULL DEFAULT (NULL),
	[NoSampleTaken] [varchar](30) NULL DEFAULT (NULL),
	[CulturePositive] [varchar](30) NULL DEFAULT (NULL),
	[Species] [varchar](50) NULL DEFAULT (NULL),
	[EarliestSpecimenDate] [date] NULL DEFAULT (NULL),
	[DrugResistanceProfile] [varchar](30) NULL DEFAULT (NULL),
	[INH] [varchar](30) NULL DEFAULT (NULL),
	[RIF] [varchar](30) NULL DEFAULT (NULL),
	[EMB] [varchar](30) NULL DEFAULT (NULL),
	[PZA] [varchar](30) NULL DEFAULT (NULL),
	[MDR] [varchar](30) NULL DEFAULT (NULL),
	[XDR] [varchar](30) NULL DEFAULT (NULL),
	PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedFunction [dbo].[ufnCalculatePercentage]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This takes a @Part figure and returns the percentage of it from the @Total supplied


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnCalculatePercentage] (
	@Part FLOAT,
	@Total FLOAT
)
	RETURNS DECIMAL(4, 1)
AS
	BEGIN
		-- Default to -1 (in case calculation is unsuccessful)
		DECLARE @ReturnValue AS DECIMAL(4, 1) = -1.0

		IF (@Total > 0.0)
			SET @ReturnValue = 100 / @Total * @Part
		ELSE
			SET @ReturnValue = 0.0

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnEmptyOrIntValue]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This function has been copied over from the ETS database that we report on.
         It receives a value from an ETS data point that consists of a fixed list of possible
		 values and transposes that list with a fixed list of other values (else returns the 
		 input value itself).


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnEmptyOrIntValue](@value int) RETURNS int AS
BEGIN 
DECLARE @display int
SET @display = case @value when '' then null when 0 then null else convert(int, @value) end
RETURN @display
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnFormatDateConsistently]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This is to be applied on all (!) the dates that get returned from end-user procs. The date
         format is what PHE have specified to be their consistent way of dis;laying dates to the 
		 end-user, e.g. 14-Feb-2019.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnFormatDateConsistently] (
	@IncomingDate DATE
)
	RETURNS VARCHAR(11)
AS
	BEGIN
		DECLARE @ReturnValue AS VARCHAR(11) = NULL

		SET @ReturnValue = FORMAT(@IncomingDate, 'dd-MMM-yyyy')

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetAgefrom]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This function returns the age given the birth date and a reference date

**************************************************************************************************/

Create FUNCTION [dbo].[ufnGetAgefrom] (
       @BirthDate DATETIME,
       @CurrentDate DATETIME
)
       RETURNS VARCHAR(11)
AS
       BEGIN
              DECLARE @ReturnValue AS int = NULL
              set @ReturnValue =  DATEDIFF(YY, @BirthDate, @CurrentDate) - CASE WHEN( (MONTH(@BirthDate)*100 + DAY(@BirthDate)) > (MONTH(@CurrentDate)*100 + DAY(@CurrentDate)) ) THEN 1 ELSE 0 END
              RETURN @ReturnValue
       END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetAnySocialRiskFactor]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.AnySocialRiskFactor
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetAnySocialRiskFactor] (
	@MisUse TINYINT,
	@ProblemUse TINYINT,
	@Homeless TINYINT,
	@PrisonAtDiagnosis TINYINT
)
	RETURNS VARCHAR(30)
AS
	BEGIN
		DECLARE @ReturnValue AS VARCHAR(30) = NULL

		-- 1. One or more of the fields which indicate a social risk factor (see list below) has the value 1
		IF (@ReturnValue IS NULL)
			IF (@MisUse = 1 OR @ProblemUse = 1 OR @Homeless = 1 OR @PrisonAtDiagnosis = 1)
				SET @ReturnValue = 'Yes'

		-- 2. All fields which indicate a social risk factor (see list below) have the value 0
		IF (@ReturnValue IS NULL)
			IF (@MisUse = 0 AND @ProblemUse = 0 AND @Homeless = 0 AND @PrisonAtDiagnosis = 0)
				SET @ReturnValue = 'No'

		-- 3. All fields which indicate a social risk factor (see list below) have the value 2
		IF (@ReturnValue IS NULL)
			IF (@MisUse = 2 AND @ProblemUse = 2 AND @Homeless = 2 AND @PrisonAtDiagnosis = 2)
				SET @ReturnValue = 'Unknown'

		-- 4. Fields are a mixture of 0, 2 and NULL
		IF (@ReturnValue IS NULL)
			IF ((@MisUse = 0 OR @MisUse = 2 OR @MisUse IS NULL) AND (@ProblemUse = 0 OR @ProblemUse = 2 OR @ProblemUse IS NULL) AND (@Homeless = 0 OR @Homeless = 2 OR @Homeless IS NULL) AND (@PrisonAtDiagnosis = 0 OR @PrisonAtDiagnosis = 2 OR @PrisonAtDiagnosis IS NULL))
				SET @ReturnValue = ''

		-- 5. An error has occurred
		IF (@ReturnValue IS NULL)
			SET @ReturnValue = 'Error: Invalid value'

		RETURN @ReturnValue;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetCountryName]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.TravelCountry1,
		 and a few other ReusableNotification data points for each notification record (every night when 
		 the uspGenerate schedule runs). The inline comments no 1, 2, 3 ... below have been copied 
		 across from the NTBS R1 specification in Confluence, and are to be kept in sync with that 
		 specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetCountryName] (
	@CountryId int
)
	RETURNS nvarchar(255)
AS
	BEGIN
		DECLARE @CountryName as nvarchar(255) = NULL
	
		IF (@CountryId IS NOT NULL)
		BEGIN
			SET @CountryName = (SELECT Name FROM [NTBS_Empty].ReferenceData.Country WHERE CountryId = @CountryId)

			-- Country name not found =  An error has occurred
			IF (@CountryName IS NULL)
				SET @CountryName = 'Error: Invalid value "' + CONVERT(VARCHAR(10), @CountryId) + '"'
		END

		RETURN @CountryName
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetDataQualityMsg]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This is to return (or mask) a notification record value for the "Data Quality Line List".
         Depending on whether there is a data quality problem, the valaue is getting returned, else
		 empty string


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetDataQualityMsg](@value int,@DataQualityMsg varchar(50)) RETURNS nvarchar(50)AS
BEGIN 
DECLARE @display nvarchar(30)
SET @display = case  when @value = 1 then @DataQualityMsg when @value = 0 then ''  else 'Error: Invalid Data Quality Value "' + convert(VARCHAR(10), @value) + '"' end
RETURN @display
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetDateOfDeath]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.DateOfDeath
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetDateOfDeath] (
	@NotificationId int
)
	RETURNS DATE
AS
	BEGIN
		DECLARE @ReturnValue AS DATE = NULL


		SET @ReturnValue = 
			(SELECT MAX(te.EventDate) FROM [NTBS_Empty].[dbo].[TreatmentEvent] te
			INNER JOIN [NTBS_Empty].[ReferenceData].[TreatmentOutcome] tout ON tout.TreatmentOutcomeId = te.TreatmentOutcomeId
			WHERE tout.TreatmentOutcomeType = 'Died'
			AND te.NotificationId = @NotificationId)

		-- WARNING: Can not set to 'Error: Invalid value', cos this is a DATE column!

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetDateOfDeath_ETS]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.DateOfDeath
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetDateOfDeath_ETS] (
	@TuberculosisEpisodeDeathDate DATETIME,
	@TreatmentOutcome12DeathDate DATETIME,
	@TreatmentOutcome24DeathDate DATETIME,
	@TreatmentOutcome36DeathDate DATETIME
)
	RETURNS DATE
AS
	BEGIN
		DECLARE @ReturnValue AS DATE = NULL

		-- 2. Date of death recorded more than once, and dates differ -- TODO: This complicated check needed ??? 

		-- 3. Set field to date of death
		SET @ReturnValue = CONVERT(DATE, (SELECT COALESCE(@TreatmentOutcome36DeathDate,
														@TreatmentOutcome24DeathDate,
														@TreatmentOutcome12DeathDate,
														@TuberculosisEpisodeDeathDate)))

		-- WARNING: Can not set to 'Error: Invalid value', cos this is a DATE column!

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetDrugUseStatus]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.CurrentDrugMisuse,
		 and a few other ReusableNotification data points for each notification record (every night when 
		 the uspGenerate schedule runs). The inline comments no 1, 2, 3 ... below have been copied 
		 across from the NTBS R1 specification in Confluence, and are to be kept in sync with that 
		 specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetDrugUseStatus] (
	@DrugUseStatusId INT,
	@ProblemUse TINYINT,
	@TuberculosisHistoryId UNIQUEIDENTIFIER
)
	RETURNS NVARCHAR(255)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(255) = NULL

		-- 1. The set of records contains a record which corresponds to the Drug Use Status of 1 (Current drug use)
		IF (@ProblemUse = 1)
			SET @ReturnValue = (SELECT 'Yes'
								FROM [ETS].dbo.RiskFactorDrugUseStatus r
									INNER JOIN [ETS].dbo.TuberculosisHistoryDrugUseStatus th ON th.DrugUseStatusId = r.Id
								WHERE th.TuberculosisHistoryId = @TuberculosisHistoryId
									AND r.LegacyId = @DrugUseStatusId)

		-- 2. Else no drug misuse
		IF (@ReturnValue IS NULL)
			SET @ReturnValue = ''

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetEarliestSpecimenDate]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.EarliestSpecimenDate
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetEarliestSpecimenDate] (
	@NotificationId nvarchar(50)
)
	RETURNS DATE
AS
	BEGIN
		DECLARE @ReturnValue AS DATE = NULL

		-- 1. Set field to the earliest SpecimenDate from the SpecimenResult records for the given notification
		SET @ReturnValue = (SELECT TOP 1 CONVERT(DATE, s.SpecimenDate)
							FROM [LabBase2].dbo.SpecimenResult s
								INNER JOIN [LabBase2].dbo.Anonymised a ON a.LabDataID = s.LabDataID
								INNER JOIN [dbo].StandardisedETSLaboratoryResult l ON l.OpieId = a.OpieId
							WHERE l.NotificationId = @NotificationId
							ORDER BY s.SpecimenDate) -- Order ascending, so the earliest date appears at the top

		-- WARNING: Can not set to 'Error: Invalid value', cos this is a DATE column!

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetETSCountryName]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.TravelCountry1,
		 and a few other ReusableNotification data points for each notification record (every night when 
		 the uspGenerate schedule runs). The inline comments no 1, 2, 3 ... below have been copied 
		 across from the NTBS R1 specification in Confluence, and are to be kept in sync with that 
		 specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetETSCountryName] (
	@CountryId uniqueidentifier
)
	RETURNS nvarchar(255)
AS
	BEGIN
		DECLARE @CountryName as nvarchar(255) = NULL
	
		IF (@CountryId IS NOT NULL)
		BEGIN
			SET @CountryName = (SELECT Name FROM [ETS].dbo.Country WHERE Id = @CountryId)

			-- Country name not found =  An error has occurred
			IF (@CountryName IS NULL)
				SET @CountryName = 'Error: Invalid value "' + CONVERT(VARCHAR(10), @CountryId) + '"'
		END

		RETURN @CountryName
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetETSSiteOfDisease]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.SiteOfDisease
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetETSSiteOfDisease] (
	@TuberculosisEpisodeId UNIQUEIDENTIFIER
)
	RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(50) = NULL

		-- 3. Sites of disease include Pulmonary (LegacyId=1), Laryngeal (LegacyID=11), Miliary (LegacyID=12), set field to 'Pulmonary'
		-- 4. Sites of disease do not include Pulmonary (LegacyId=1), Laryngeal (LegacyID=11), Miliary (LegacyID=12), set field to 'Extra-pulmonary'
		SET @ReturnValue = (SELECT TOP 1
								(CASE
									WHEN d.LegacyId = 1 THEN 'Pulmonary' -- Set to Pulmonary
									WHEN d.LegacyId = 11 THEN 'Pulmonary'
									WHEN d.LegacyId = 12 THEN 'Pulmonary'
									ELSE 'Extra-pulmonary' -- All records that are not "Pulmonary" or "Unknown" are set to be "Extra-pulmonary"
								END) AS SiteOfDisease
							FROM [ETS].dbo.TuberculosisEpisodeDiseaseSite t
								INNER JOIN [ETS].dbo.DiseaseSite d ON d.Id = t.DiseaseSiteId
							WHERE t.AuditDelete IS NULL
								AND d.LegacyId != 16 -- Set to Unknown in all other cases (see below)
								AND t.TuberculosisEpisodeId = @TuberculosisEpisodeId
							ORDER BY SiteOfDisease DESC) -- Pulmonary record(s) to come out on top

		-- 1. Patient has no site of disease records
		-- 2. All sites of disease are 'Unknown' (LegacyId=16)
		IF (@ReturnValue IS NULL)
			SET @ReturnValue = 'Unknown'

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetFormattedSiteDiseaseDurationStatusForForest]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- This function is used in PopulateForestExtract procedure only
-- Value for site disease duration status for Forest is either Yes or Empty String (when the status is No, Unknown or Null)
CREATE FUNCTION [dbo].[ufnGetFormattedSiteDiseaseDurationStatusForForest]
	(
		@durationStatus varchar(100)
	)
	RETURNS varchar(10) 
	AS
	BEGIN
		RETURN
		CASE @durationStatus WHEN 'Yes' THEN 'Yes' ELSE '' 
	END
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetHivTestOffered]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.HivTestOffered
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetHivTestOffered] (
	@HivTestOffered NVARCHAR(255)
)
	RETURNS NVARCHAR(255)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(255) = NULL

		-- 1. HIVTestOffered is 'HIV status already known'
		IF (@HivTestOffered = 'HIVStatusKnown')
			SET @ReturnValue = 'Status already known'

		-- 2. HIVTestOffered is 'Not offered'
		IF (@HivTestOffered = 'NotOffered')
			SET @ReturnValue = 'Not offered'

		-- 3. HIVTestOffered is one of 'Offered and done', 'Offered but not done', 'Offered but refused'
		IF (@HivTestOffered = 'Offered' OR @HivTestOffered = 'OfferedButNotDone' OR @HivTestOffered = 'OfferedButRefused')
			SET @ReturnValue = 'Offered'

		-- 4. HIVTestOffered is NULL
		IF (@HivTestOffered IS NULL)
			SET @ReturnValue = ''

		-- 5. An error has occurred
		IF (@ReturnValue IS NULL)
		BEGIN
			SET @ReturnValue = 'Error: Invalid value'

		END

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetHivTestOffered_ETS]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.HivTestOffered
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetHivTestOffered_ETS] (
	@NotificationId VARCHAR(36),
	@HivTestOffered NVARCHAR(255)
)
	RETURNS NVARCHAR(255)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(255) = NULL

		-- 1. HIVTestOffered is 'HIV status already known'
		IF (@HivTestOffered = 'HIV status already known')
			SET @ReturnValue = 'Status already known'

		-- 2. HIVTestOffered is 'Not offered'
		IF (@HivTestOffered = 'Not offered')
			SET @ReturnValue = 'Not offered'

		-- 3. HIVTestOffered is one of 'Offered and done', 'Offered but not done', 'Offered but refused'
		IF (@HivTestOffered = 'Offered and done' OR @HivTestOffered = 'Offered but not done' OR @HivTestOffered = 'Offered but refused')
			SET @ReturnValue = 'Offered'

		-- 4. HIVTestOffered is NULL
		IF (@HivTestOffered IS NULL)
			SET @ReturnValue = ''

		-- 5. An error has occurred
		IF (@ReturnValue IS NULL)
		BEGIN
			SET @ReturnValue = 'Error: Invalid value'

		END

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetHomelessStatus]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.CurrentlyHomeless,
		 and a few other ReusableNotification data points for each notification record (every night when 
		 the uspGenerate schedule runs). The inline comments no 1, 2, 3 ... below have been copied 
		 across from the NTBS R1 specification in Confluence, and are to be kept in sync with that 
		 specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetHomelessStatus] (
	@HomelessStatusId INT,
	@Homeless TINYINT,
	@TuberculosisHistoryId UNIQUEIDENTIFIER
)
	RETURNS NVARCHAR(255)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(255) = NULL

		IF (@Homeless = 1)
			SET @ReturnValue = (SELECT 'Yes'
								FROM [ETS].dbo.RiskFactorHomelessStatus r
									INNER JOIN [ETS].dbo.TuberculosisHistoryHomelessStatus th ON th.HomelessStatusId = r.Id
								WHERE th.TuberculosisHistoryId = @TuberculosisHistoryId
									AND r.LegacyId = @HomelessStatusId)

		IF (@ReturnValue IS NULL)
			SET @ReturnValue = ''

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetPrisonStatus]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.CurrentlyInPrisonOrInPrisonWhenFirstSeen,
		 and a few other ReusableNotification data points for each notification record (every night when 
		 the uspGenerate schedule runs). The inline comments no 1, 2, 3 ... below have been copied 
		 across from the NTBS R1 specification in Confluence, and are to be kept in sync with that 
		 specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetPrisonStatus] (
	@PrisonHistoryStatusId INT,
	@PrisonAtDiagnosis TINYINT,
	@TuberculosisHistoryId UNIQUEIDENTIFIER
)
	RETURNS NVARCHAR(255)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(255) = NULL

		IF (@PrisonAtDiagnosis = 1)
			SET @ReturnValue = (SELECT 'Yes'
								FROM [ETS].dbo.RiskFactorPrisonHistoryStatus r
									INNER JOIN [ETS].dbo.TuberculosisHistoryPrisonHistoryStatus th ON th.PrisonHistoryStatusId = r.Id
								WHERE th.TuberculosisHistoryId = @TuberculosisHistoryId
									AND r.LegacyId = @PrisonHistoryStatusId)

		IF (@ReturnValue IS NULL)
			SET @ReturnValue = ''

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetSiteOfDisease]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.SiteOfDisease
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetSiteOfDisease] (
	@NotificationId INT
)
	RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(50) = NULL

		-- 3. Sites of disease include Pulmonary (LegacyId=1), Laryngeal (LegacyID=11), Miliary (LegacyID=12), set field to 'Pulmonary'
		-- 4. Sites of disease do not include Pulmonary (LegacyId=1), Laryngeal (LegacyID=11), Miliary (LegacyID=12), set field to 'Extra-pulmonary'
		SET @ReturnValue = (SELECT TOP 1
								(CASE
									WHEN s.SiteId  in (1,12,13)  THEN 'Pulmonary' -- Set to Pulmonary where Pulmonary, Laryngeal or Miliary 
									ELSE 'Extra-pulmonary' -- All records that are not "Pulmonary"  are set to be "Extra-pulmonary"
								END) AS SiteOfDisease

							FROM [NTBS_Empty].dbo.NotificationSite ns
								INNER JOIN [NTBS_Empty].ReferenceData.Site s ON s.SiteId = ns.SiteId
							WHERE
								ns.NotificationId = @NotificationId
							ORDER BY SiteOfDisease DESC) -- Pulmonary record(s) to come out on top

		-- 1. Patient has no site of disease records
		-- 2. All sites of disease are 'Unknown' 
		IF (@ReturnValue IS NULL)
			SET @ReturnValue = 'Unknown'

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetSpecies]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.Species
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetSpecies] (
	@NotificationId int
)
	RETURNS VARCHAR(50)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(50) = NULL

		-- 1. The notification has no Anonymised records
		IF (@ReturnValue IS NULL)
		BEGIN
			IF NOT EXISTS (SELECT TOP 1 ''
							FROM dbo.StandardisedETSLaboratoryResult l
								INNER JOIN [LabBase2].dbo.Anonymised a ON a.OpieId = l.OpieId
							WHERE l.NotificationId = @NotificationId)
			SET @ReturnValue = ''
		END

		-- 2. The notification has one Anonymised record
		-- 3. The notification has more than one Anonymised record
		IF (@ReturnValue IS NULL)
		BEGIN
			SET @ReturnValue = (SELECT TOP 1 o.OrganismName
								FROM Organism o
									INNER JOIN OrganismNameMapping om ON om.OrganismId = o.OrganismId
									INNER JOIN [LabBase2].dbo.Anonymised a ON RTRIM(a.OrganismName) = om.OrganismName
									INNER JOIN [dbo].[StandardisedETSLaboratoryResult] l ON l.OpieId = a.OpieId
								WHERE l.NotificationId = @NotificationId
								ORDER BY o.OrganismId) -- Order by ID means: Order by organism severity
		END

		-- 4. An error has occurred
		IF (@ReturnValue IS NULL)
		BEGIN
			SET @ReturnValue = 'Error: Invalid value'
		END

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetSpecimenInfo]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Returns consolidated information about a lab specimen, summarising data from 
local copies of LabBase data
*/

CREATE FUNCTION [dbo].[ufnGetSpecimenInfo](@RefLabNumber NVARCHAR(50))
RETURNS @specimenInfo TABLE 
(
    -- Columns returned by the function
    RefLabNumber NVARCHAR(50) PRIMARY KEY NOT NULL, 
    SpecimenTypeCode NVARCHAR(255) NULL, 
    IdentityColumn INT NULL, 
    SpecimenDate DATE NULL, 
    Species NVARCHAR(50) NULL
)
AS
BEGIN

  DECLARE 
	@SpecimenTypeCode nvarchar(255) = NULL, 
	@IdentityColumn INT = 0, 
	@SpecimenDate DATE, 
	@Species NVARCHAR(50) = NULL;

	SELECT TOP(1) @SpecimenTypeCode = SampleName 
	FROM [dbo].[LabSpecimen] ls
		INNER JOIN [dbo].[StandardisedLabbaseSpecimen] lbs on ls.ReferenceLaboratoryNumber = lbs.ReferenceLaboratoryNumber
		LEFT OUTER JOIN [dbo].SampleMapping sm ON lbs.SpecimenTypeCode = sm.SampleName
	WHERE ls.ReferenceLaboratoryNumber = @RefLabNumber
	ORDER BY sm.SampleRank 


	SELECT @IdentityColumn = MAX(lbs.[IdentityColumn]), @SpecimenDate = MIN(lbs.SpecimenDate) 
	FROM [dbo].[LabSpecimen] ls
		INNER JOIN [dbo].[StandardisedLabbaseSpecimen] lbs on ls.ReferenceLaboratoryNumber = lbs.ReferenceLaboratoryNumber
	WHERE ls.ReferenceLaboratoryNumber = @RefLabNumber

	SELECT TOP(1) @Species = o.OrganismName FROM [dbo].[LabSpecimen] ls
		INNER JOIN [dbo].[StandardisedLabbaseSpecimen] lbs on ls.ReferenceLaboratoryNumber = lbs.ReferenceLaboratoryNumber
		INNER JOIN [LabBase2].[dbo].[Anonymised] a on a.LabDataID = lbs.LabDataID
		INNER JOIN [dbo].OrganismNameMapping om on om.OrganismName = a.OrganismName
		INNER JOIN [dbo].Organism o ON o.OrganismId = om.OrganismId
	WHERE ls.ReferenceLaboratoryNumber = @RefLabNumber
	ORDER BY o.SortOrder

	INSERT INTO @specimenInfo
		SELECT @RefLabNumber, @SpecimenTypeCode, @IdentityColumn, @SpecimenDate, @Species
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetTreatmentEndDate]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.DateOfDeath
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetTreatmentEndDate] (
	@NotificationId int
)
	RETURNS DATE
AS
	BEGIN
		DECLARE @ReturnValue AS DATE = NULL


		SET @ReturnValue = 
			(SELECT MAX(te.EventDate) FROM [NTBS_Empty].[dbo].[TreatmentEvent] te
			INNER JOIN [NTBS_Empty].[ReferenceData].[TreatmentOutcome] tout ON tout.TreatmentOutcomeId = te.TreatmentOutcomeId
			WHERE tout.TreatmentOutcomeType IN ('Completed', 'Cured')
			AND te.NotificationId = @NotificationId)

		-- WARNING: Can not set to 'Error: Invalid value', cos this is a DATE column!

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetTreatmentEndDate_ETS]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.TreatmentEndDate
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetTreatmentEndDate_ETS] (
	@EndOfTreatmentDate12 DATETIME,
	@EndOfTreatmentDate24 DATETIME,
	@EndOfTreatmentDate36 DATETIME
)
	RETURNS DATE
AS
	BEGIN
		DECLARE @ReturnValue AS DATE = NULL

		-- 1. No treatment outcome records for notification
		IF (@EndOfTreatmentDate12 IS NULL AND @EndOfTreatmentDate24 IS NULL AND @EndOfTreatmentDate36 IS NULL)
		-- Leave NULL, cos DATE column can not be ''

		-- 2. All treatment end dates are null
		-- Same SQL condition as in no 1, so nothing to do here!

		-- 3. TreatmentOutcome36Month.EndOfTreatmentDate is not null
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@EndOfTreatmentDate36 IS NOT NULL)
				SET @ReturnValue = CONVERT(DATE, @EndOfTreatmentDate36)
		END

		-- 4. TreatmentOutcomeTwentyFourMonth.EndOfTreatmentDate is not null
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@EndOfTreatmentDate24 IS NOT NULL)
				SET @ReturnValue = CONVERT(DATE, @EndOfTreatmentDate24)
		END

		-- 5. TreatmentOutcome.EndOfTreatmentDate is not null
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@EndOfTreatmentDate12 IS NOT NULL)
				SET @ReturnValue = CONVERT(DATE, @EndOfTreatmentDate12)
		END

		-- WARNING: Can not set to 'Error: Invalid value', cos this is a DATE column!

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetTreatmentOutcome]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.TreatmentOutcome12months,
		 and a few other ReusableNotification data points for each notification record (every night when 
		 the uspGenerate schedule runs). The inline comments no 1, 2, 3 ... below have been copied 
		 across from the NTBS R1 specification in Confluence, and are to be kept in sync with that 
		 specification.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetTreatmentOutcome] (
	@Month VARCHAR(2),
	@AnswerToCompleteQuestion VARCHAR(150),
	@AnswerToIncompleteReason1 VARCHAR(150),
	@AnswerToIncompleteReason2 VARCHAR(150)
)
	RETURNS VARCHAR(30)
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(30) = NULL

		-- 1. This gets evaluated before this function gets invoked!
		-- Nothing to do here!

		-- 2. The treatment outcome is recorded in AnswerToCompleteQuestion as 'Yes, the patient completed a full course of therapy'
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion LIKE 'Yes, the patient completed a full course of therapy')
				SET @ReturnValue = 'Completed'
		END

		-- 3. The treatment outcome is recorded in any one of the three relevant fields (see below) as 'The patient was lost to follow-up before the end of treatment'
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion = 'The patient was lost to follow-up before the end of treatment')
				SET @ReturnValue = 'Lost to follow-up'
			ELSE IF (@AnswerToIncompleteReason1 = 'The patient was lost to follow-up before the end of treatment')
				SET @ReturnValue = 'Lost to follow-up'
			ELSE IF (@AnswerToIncompleteReason2 = 'The patient was lost to follow-up before the end of treatment')
				SET @ReturnValue = 'Lost to follow-up'
		END

		-- 4. The treatment outcome is recorded in any one of the the three relevant fields (see below) as 'Patient died before or while on treatment'
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion = 'Patient died before or while on treatment')
				SET @ReturnValue = 'Died'
			ELSE IF (@AnswerToIncompleteReason1 = 'Patient died before or while on treatment')
				SET @ReturnValue = 'Died'
			ELSE IF (@AnswerToIncompleteReason2 = 'Patient died before or while on treatment')
				SET @ReturnValue = 'Died'
		END

		-- 5. The treatment outcome is recorded in AnswerToCompleteQuestion as 'No, the patient did not complete a full course within 12 months' and the reason given in AnswerToIncompleteReason2 is one of the 'still on treatment' options listed below
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion = 'No, the patient did not complete a full course within ' + @Month + ' months' AND (@AnswerToIncompleteReason2 = 'Planned course of treatment changed' OR @AnswerToIncompleteReason2 = 'Planned course of treatment exceeds ' + @Month + ' months' OR @AnswerToIncompleteReason2 = 'Planned course of treatment interrupted'))
				SET @ReturnValue = 'Still on treatment'
		END

		-- 6. The treatment outcome is recorded in any one of the the three relevant fields (see below) as 'Treatment stopped - but patient had TB'
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion = 'Treatment stopped - but patient had TB')
				SET @ReturnValue = 'Treatment stopped'
			ELSE IF (@AnswerToInCompleteReason1 = 'Treatment stopped - but patient had TB')
				SET @ReturnValue = 'Treatment stopped'
			ELSE IF (@AnswerToInCompleteReason2 = 'Treatment stopped - but patient had TB')
				SET @ReturnValue = 'Treatment stopped'
		END

		-- 7. The treatment outcome is recorded in any one of the three relevant fields (see below) as one of the 'Unknown' options listed below
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion = 'Unknown (treatment details are unavailable for this patient)' OR @AnswerToCompleteQuestion = 'The patient''s care was transferred to another clinic' OR @AnswerToCompleteQuestion = 'No treatment details available')
				SET @ReturnValue = 'Unknown'
			ELSE IF (@AnswerToInCompleteReason1 = 'Unknown (treatment details are unavailable for this patient)' OR @AnswerToInCompleteReason1 = 'The patient''s care was transferred to another clinic' OR @AnswerToInCompleteReason1 = 'No treatment details available')
				SET @ReturnValue = 'Unknown'
			ELSE IF (@AnswerToInCompleteReason2 = 'Unknown (treatment details are unavailable for this patient)' OR @AnswerToInCompleteReason2 = 'The patient''s care was transferred to another clinic' OR @AnswerToInCompleteReason2 = 'No treatment details available')
				SET @ReturnValue = 'Unknown'
		END

		-- 8. The treatment outcome is recorded in any one of the three relevant fields (see below) as 'Treatment stopped - Patient subsequently found not to have TB (including atypical mycobacterial infection)'
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion = 'Treatment stopped - Patient subsequently found not to have TB (including atypical mycobacterial infection)')
				SET @ReturnValue = 'Patient did not have TB'
			ELSE IF (@AnswerToInCompleteReason1 = 'Treatment stopped - Patient subsequently found not to have TB (including atypical mycobacterial infection)')
				SET @ReturnValue = 'Patient did not have TB'
			ELSE IF (@AnswerToInCompleteReason2 = 'Treatment stopped - Patient subsequently found not to have TB (including atypical mycobacterial infection)')
				SET @ReturnValue = 'Patient did not have TB'
		END


		--RP-1297: The treatment outcome is recorded in AnswerToCompleteQuestion as 'No, the patient did not complete a full course within X months' and no reason has been provided
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion = 'No, the patient did not complete a full course within ' + @Month + ' months' AND (@AnswerToIncompleteReason1 IS NULL OR @AnswerToIncompleteReason2 IS NULL))
				SET @ReturnValue = 'Lost to follow-up'
		END
			
		-- 9. The values in the relevant fields are all set to NULL
		IF (@ReturnValue IS NULL)
		BEGIN
			IF (@AnswerToCompleteQuestion IS NULL AND @AnswerToIncompleteReason2 IS NULL AND @AnswerToIncompleteReason2 IS NULL)
				SET @ReturnValue = 'Not evaluated'
		END

		-- 8. An error has occurred
		IF (@ReturnValue IS NULL)
		BEGIN
			SET @ReturnValue = 'Error: Invalid value'
		END

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnIsNationalTeam]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This can be used to restrict specific sections of SQL code, so that they only get executed 
         for when the user is part of the National Team.

**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnIsNationalTeam] (
	@LoginGroups VARCHAR(500)
)
	RETURNS TINYINT
AS
	BEGIN
		DECLARE @ReturnValue AS TINYINT = 0

		SET @ReturnValue = (SELECT IsNationalTeam
							FROM dbo.AdGroup
							WHERE CHARINDEX('###' + AdGroupName + '###', @LoginGroups) != 0)

		RETURN @ReturnValue
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnLog]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This logs a specified piece of text that has been passed. Currently this simply logs to 
         the Windows Event Viewer, but it can easily be adjusted to log to any other log instead.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnLog] (
	@LogText VARCHAR(500)
)
	RETURNS TINYINT
AS
	BEGIN
		SET @LogText = CHAR(13) + CHAR(13) +
						'Log: ' + @LogText + CHAR(13) +
						'Username: ' + SUSER_SNAME()

		--DECLARE @LogStatus AS TINYINT = 0
		EXEC [master].sys.xp_logevent 60000, @LogText

		RETURN 0
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnMaskField]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This can be used to mask single data points within a notification record basedon permisions
         (instead of not returning the whole notification record).
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnMaskField](
	@AdGroupName VARCHAR(200),  -- The AD group in our authentication reference table
	@LoginGroups VARCHAR(100),  -- The user's AD login group as determined at run/login time
	@FieldValue NVARCHAR(255)   -- The field value to be masked (or returned as is)
) 
	RETURNS NVARCHAR(255) 
AS
	BEGIN
		DECLARE @ReturnValue AS NVARCHAR(255)

		IF (@AdGroupName IS NULL OR @AdGroupName = '') -- Code defensively
			SET @ReturnValue = NULL;
		ELSE IF (CHARINDEX('###' + @AdGroupName + '###', @LoginGroups) != 0)
			SET @ReturnValue = @FieldValue;
		ELSE
			SET @ReturnValue = NULL; -- Mask value, cos notification belongs to other AD Group

		RETURN @ReturnValue;
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnNormalizeLtbrId]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
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
GO
/****** Object:  UserDefinedFunction [dbo].[ufnSex]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This function has been copied over from the ETS database that we report on.
         It receives a value from an ETS data point that consists of a fixed list of possible
		 values and transposes that list with a fixed list of other values.

		 AireLogic have added to this function that it now also checks for an ELSE condition. 
		 This catch-all condition will return the string "Error: Invalid value" as a safeguard, 
		 so that no possibilities are unaccounted for.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnSex](@value int) RETURNS nvarchar(30)AS
BEGIN 
DECLARE @display nvarchar(30)
SET @display = case @value when 0 then 'Female' when 1 then 'Male' when 2 then 'Unknown' else 'Error: Invalid value' end
RETURN @display
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnYesNo]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This function has been copied over from the ETS database that we report on.
         It receives a value from an ETS data point that consists of a fixed list of possible
		 values and transposes that list with a fixed list of other values.

		 AireLogic have added to this function that it now also checks for an ELSE condition. 
		 This catch-all condition will return the string "Error: Invalid value" as a safeguard, 
		 so that no possibilities are unaccounted for.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnYesNo](@value int) RETURNS nvarchar(30)AS
BEGIN 
DECLARE @display nvarchar(30)
SET @display = case @value when 0 then 'No' when 1 then 'Yes' when null then '' else 'Error: Invalid value "' + convert(VARCHAR(10), @value) + '"' end
RETURN @display
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnYesNoNotknown]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This function has been copied over from the ETS database that we report on.
         It receives a value from an ETS data point that consists of a fixed list of possible
		 values and transposes that list with a fixed list of other values.

		 AireLogic have added to this function that it now also checks for an ELSE condition. 
		 This catch-all condition will return the string "Error: Invalid value" as a safeguard, 
		 so that no possibilities are unaccounted for.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnYesNoNotknown](@value int) RETURNS nvarchar(30)AS
BEGIN 
DECLARE @display nvarchar(30)
SET @display = case @value when 1 then 'Yes' when 2 then 'No' when 3 then 'Not known' when NULL then '' else 'Error: Invalid value "' + convert(VARCHAR(10), @value) + '"' end
RETURN @display
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufnYesNoUnknown]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This function has been copied over from the ETS database that we report on.
         It receives a value from an ETS data point that consists of a fixed list of possible
		 values and transposes that list with a fixed list of other values.

		 AireLogic have added to this function that it now also checks for an ELSE condition. 
		 This catch-all condition will return the string "Error: Invalid value" as a safeguard, 
		 so that no possibilities are unaccounted for.


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnYesNoUnknown](@value int) RETURNS nvarchar(30)AS
BEGIN 
DECLARE @display nvarchar(30)
SET @display = case  when @value = 0 then 'No' when @value =1 then 'Yes' when @value = 2 then 'Unknown' when @value is NULL then '' else 'Error: Invalid value "' + convert(VARCHAR(10), @value) + '"' end
RETURN @display
END
GO
/****** Object:  Table [dbo].[MIReportData]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIReportData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionDateTime] [datetime] NOT NULL,
	[UserName] [nvarchar](260) NOT NULL,
	[UserAdGroup] [nvarchar](300) NULL,
	[WeekNumber] [nvarchar](7) NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[DateRetrieved] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportLookup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportLookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ReportName] [nvarchar](75) NOT NULL,
	[ReportGroup] [nvarchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[DateValue] [date] NOT NULL,
	[MonthValue] [int] NULL,
	[PaddedMonthValue] [nvarchar](100) NULL,
	[YearValue] [int] NULL,
	[YearMonthValue] [nvarchar](100) NULL,
	[QuarterValue] [int] NULL,
	[TertileValue] [int] NULL,
	[FirstOfMonthValue] [date] NULL,
	[LastOfMonthValue] [date] NULL,
	[LastOfYearValue] [date] NULL,
	[DayOfYearValue] [int] NULL,
	[ISOWeek] [int] NULL,
	[PaddedISOWeek] [nvarchar](100) NULL,
	[ISOYear] [int] NULL,
	[ISOYearWeek] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [PK_DateValue]    Script Date: 09/04/2021 15:21:24 ******/
CREATE UNIQUE CLUSTERED INDEX [PK_DateValue] ON [dbo].[Calendar]
(
	[DateValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwMIReportSummary]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwMIReportSummary]
	AS 
		--get the list of report groups
		WITH cteReportGroup(ReportGroup) AS
		(SELECT distinct rl.ReportGroup FROM ReportLookup rl
		WHERE ReportGroup is not null),

		--get the list of week numbers
		 cteWeekNumber(WeekNumber) AS
		(SELECT TOP(10) ISOYearWeek FROM
			--use today's date-7 as there's no point including the current week; the MI data
			--is pulled in on a Monday morning for the previous week
		(SELECT DISTINCT ISOYearWeek from [dbo].[Calendar] WHERE DateValue <= GETUTCDATE()-7) AS Q1
		ORDER BY ISOYearWeek DESC),

		--then a count of reports per week
		 cteCount (ReportGroup, WeekNumber, NumberofReports) AS
		 (select rl.ReportGroup, mr.WeekNumber, COUNT(ReportID) AS 'NumberofReports' from MIReportData mr, ReportLookup rl
			where mr.ReportID = rl.ItemId
			and rl.ReportGroup is not null
			GROUP BY rl.ReportGroup, mr.WeekNumber)
		
		--then cross-join so there is one row per week and report, inserting a 0 if no runs of that report in that week
		SELECT w.WeekNumber, r.ReportGroup, COALESCE (c.NumberofReports, 0) as NumberofReports
		FROM cteWeekNumber w CROSS JOIN cteReportGroup r
			LEFT OUTER JOIN cteCount as c
			ON c.ReportGroup = r.ReportGroup
			AND c.WeekNumber = w.WeekNumber
GO
/****** Object:  Table [dbo].[LabSpecimen]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabSpecimen](
	[LabSpecimenId] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceLaboratoryNumber] [nvarchar](50) NOT NULL,
	[SpecimenDate] [datetime] NULL,
	[SpecimenTypeCode] [nvarchar](255) NULL,
	[LaboratoryName] [nvarchar](65) NULL,
	[ReferenceLaboratory] [nvarchar](65) NULL,
	[Species] [varchar](50) NULL,
	[INH] [nvarchar](25) NULL,
	[RIF] [nvarchar](25) NULL,
	[PZA] [nvarchar](25) NULL,
	[EMB] [nvarchar](25) NULL,
	[MDR] [nvarchar](10) NULL,
	[AMINO] [nvarchar](25) NULL,
	[QUIN] [nvarchar](25) NULL,
	[XDR] [nvarchar](10) NULL,
	[PatientNhsNumber] [nvarchar](12) NULL,
	[PatientBirthDate] [datetime] NULL,
	[PatientName] [nvarchar](150) NULL,
	[PatientGivenName] [nvarchar](75) NULL,
	[PatientFamilyName] [nvarchar](75) NULL,
	[PatientSex] [nvarchar](1) NULL,
	[PatientAddress] [nvarchar](255) NULL,
	[PatientPostcode] [nvarchar](10) NULL,
 CONSTRAINT [PK_LabSpecimenId] PRIMARY KEY CLUSTERED 
(
	[LabSpecimenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwConfirmedMatch]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwConfirmedMatch]
	AS 
		SELECT nms.NotificationID
              ,ls.[LabSpecimenId]
              ,ls.[ReferenceLaboratoryNumber]
              ,ls.[SpecimenDate]
              ,ls.[SpecimenTypeCode]
              ,ls.[LaboratoryName]
              ,ls.[ReferenceLaboratory]
              ,ls.[Species]
              ,ls.[INH]
              ,ls.[RIF]
              ,ls.[PZA]
              ,ls.[EMB]
              ,ls.[MDR]
              ,ls.[AMINO]
              ,ls.[QUIN]
              ,ls.[XDR]
              ,ls.[PatientNhsNumber]
              ,ls.[PatientBirthDate]
              ,ls.[PatientName]
              ,ls.[PatientGivenName]
              ,ls.[PatientFamilyName]
              ,ls.[PatientSex]
              ,ls.[PatientAddress]
            ,ls.[PatientPostcode] 
        FROM [NTBS_Specimen_Matching].[dbo].NotificationSpecimenMatch nms
		    INNER JOIN dbo.LabSpecimen ls ON ls.ReferenceLaboratoryNumber = nms.ReferenceLaboratoryNumber
		WHERE nms.MatchType = 'Confirmed'
GO
/****** Object:  Table [dbo].[ResultMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultMapping](
	[Result] [nvarchar](50) NOT NULL,
	[ResultOutputName] [nvarchar](50) NOT NULL,
	[Rank] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwResultMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwResultMapping]
	AS SELECT DISTINCT rm.ResultOutputName, rm.[Rank]  FROM [dbo].ResultMapping rm
GO
/****** Object:  Table [dbo].[AntibioticMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AntibioticMapping](
	[AntibioticCode] [nvarchar](50) NOT NULL,
	[IsWGS] [bit] NOT NULL,
	[AntibioticOutputName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwSpecimen]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************************************************************
Desc:    This returns a list of specimens with a standardised RefLabNumber column and excludes
		 any specimen which only has atypical organisms (i.e. non-TB mycobacteria)


**************************************************************************************************/

CREATE VIEW [dbo].[vwSpecimen] AS
		SELECT
				CASE
					WHEN a.ReferenceLaboratoryNumber = '' THEN CONCAT('TBSURV', a.IdentityColumn)
					WHEN a.ReferenceLaboratoryNumber is not null THEN TRIM(a.ReferenceLaboratoryNumber)
					ELSE CONCAT('TBSURV', a.IdentityColumn)
				END AS 'ReferenceLaboratoryNumber'
				,sr.SpecimenDate
				,sr.LabDataID
				,a.OpieId
				,a.IdentityColumn
				,sr.SpecimenTypeCode
				,a.AuditCreate
				,a.OrganismName
			FROM [Labbase2].[dbo].[Anonymised] a 
				--inner join because we only want TB specimens and isAtypical flag lives in Anonymised
				INNER JOIN [Labbase2].[dbo].[SpecimenResult] sr ON sr.LabDataID = a.LabDataID
				AND a.IsAtypicalOrganismRecord = 0
				AND a.MergedRecord = 0
GO
/****** Object:  View [dbo].[vwSusceptibilityResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*This creates a consolidated view of all susceptibility results that are associated with the in-scope (i.e. TB)
specimens.  It calculates standard drug codes and results, and exposes an 'isWGS' flag*/

CREATE VIEW [dbo].[vwSusceptibilityResult]
	AS 
	
		SELECT DISTINCT 
			vs.ReferenceLaboratoryNumber, 
			am.AntibioticOutputName, 
			am.IsWGS, 
			rm.ResultOutputName, 
			rm.[Rank] 
		FROM vwSpecimen vs
			INNER JOIN LabSpecimen ls ON ls.ReferenceLaboratoryNumber = vs.ReferenceLaboratoryNumber
			INNER JOIN [LabBase2].dbo.Susceptibility su ON su.LabDataID = vs.LabDataID
			LEFT OUTER JOIN [dbo].[AntibioticMapping] am  ON am.AntibioticCode = su.AntibioticCode
			LEFT OUTER JOIN [dbo].[ResultMapping] rm  ON rm.Result = su.SusceptibilityResult
		WHERE ResultOutputName NOT IN ('New', 'Awaiting', 'No result')
GO
/****** Object:  Table [dbo].[StandardisedLabbaseSpecimen]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandardisedLabbaseSpecimen](
	[ReferenceLaboratoryNumber] [nvarchar](50) NULL,
	[SpecimenDate] [datetime] NULL,
	[LabDataID] [uniqueidentifier] NULL,
	[OpieId] [nvarchar](36) NULL,
	[IdentityColumn] [int] NULL,
	[SpecimenTypeCode] [nvarchar](255) NULL,
	[AuditCreate] [datetime] NULL,
	[OrganismName] [nvarchar](65) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwSusceptibilityResultDetail]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*This creates a consolidated view of all susceptibility results that are associated with the in-scope (i.e. TB)
specimens.  It calculates standard drug codes and results, and exposes an 'isWGS' flag*.
For use in reporting, it also calculates a 'received date', which is based on either the received date or the create date
in Anonymised, if the former is not populated*/

CREATE VIEW [dbo].[vwSusceptibilityResultDetail]
	AS 
	
		SELECT DISTINCT 
			vs.ReferenceLaboratoryNumber,
			CASE
				WHEN a.ReceivedDate IS NULL THEN a.AuditCreate
				ELSE a.ReceivedDate
			END as 'ReceivedDate',
			am.AntibioticOutputName, 
			am.IsWGS, 
			rm.ResultOutputName, 
			rm.[Rank] 
		FROM dbo.[StandardisedLabbaseSpecimen] vs
			INNER JOIN LabSpecimen ls ON ls.ReferenceLaboratoryNumber = vs.ReferenceLaboratoryNumber
			INNER JOIN [LabBase2].dbo.Anonymised a on vs.IdentityColumn = a.IdentityColumn
			INNER JOIN [LabBase2].dbo.Susceptibility su ON su.LabDataID = vs.LabDataID
			LEFT OUTER JOIN [dbo].[AntibioticMapping] am  ON am.AntibioticCode = su.AntibioticCode
			LEFT OUTER JOIN [dbo].[ResultMapping] rm  ON rm.Result = su.SusceptibilityResult
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetMatchedSpecimen]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetMatchedSpecimen]
(
	@NTBSId int
)

RETURNS TABLE
AS

RETURN
SELECT 
	vcm.NotificationID
	,vcm.ReferenceLaboratoryNumber
	,vcm.SpecimenDate
	,vcm.SpecimenTypeCode
	,vcm.LaboratoryName
	,vcm.ReferenceLaboratory
	,vcm.Species

	,vcm.PatientNhsNumber AS 'LabNhsNumber'
	,vcm.PatientBirthDate AS 'LabBirthDate'
	,vcm.PatientName AS 'LabName'
	,vcm.PatientSex AS 'LabSex'
	,vcm.PatientAddress AS 'LabAddress'
	,vcm.PatientPostcode AS 'LabPostcode'

	,vcm.INH AS 'Isoniazid'
	,vcm.RIF AS 'Rifampicin'
	,vcm.PZA AS 'Pyrazinamide'
	,vcm.EMB AS 'Ethambutol'
	,vcm.AMINO AS 'Aminoglycoside'
	,vcm.QUIN AS 'Quinolone'
	,vcm.MDR
	,vcm.XDR
  
FROM [dbo].[vwConfirmedMatch] vcm
WHERE vcm.NotificationID = @NTBSId
GO
/****** Object:  Table [dbo].[ReusableNotification]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReusableNotification](
	[ReusableNotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[NtbsId] [int] NULL,
	[EtsId] [bigint] NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LtbrId] [nvarchar](50) NULL,
	[NotificationDate] [date] NOT NULL,
	[CaseManager] [nvarchar](101) NULL,
	[Consultant] [nvarchar](255) NULL,
	[HospitalId] [nvarchar](36) NULL,
	[Hospital] [nvarchar](255) NULL,
	[TBServiceCode] [nvarchar](50) NULL,
	[Service] [nvarchar](150) NULL,
	[NhsNumber] [nvarchar](50) NULL,
	[Forename] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Age] [tinyint] NULL,
	[Sex] [varchar](30) NULL,
	[UkBorn] [varchar](30) NULL,
	[EthnicGroup] [varchar](255) NULL,
	[BirthCountry] [varchar](255) NULL,
	[UkEntryYear] [int] NULL,
	[Postcode] [nvarchar](20) NULL,
	[NoFixedAbode] [nvarchar](30) NULL,
	[LocalAuthority] [nvarchar](50) NULL,
	[LocalAuthorityCode] [nvarchar](50) NULL,
	[ResidencePhecCode] [nvarchar](50) NULL,
	[ResidencePhec] [nvarchar](50) NULL,
	[TreatmentPhecCode] [nvarchar](50) NULL,
	[TreatmentPhec] [nvarchar](50) NULL,
	[SymptomOnsetDate] [date] NULL,
	[PresentedDate] [date] NULL,
	[OnsetToPresentationDays] [int] NULL,
	[DiagnosisDate] [date] NULL,
	[PresentationToDiagnosisDays] [int] NULL,
	[StartOfTreatmentDate] [date] NULL,
	[DiagnosisToTreatmentDays] [int] NULL,
	[OnsetToTreatmentDays] [int] NULL,
	[HivTestOffered] [nvarchar](255) NULL,
	[SiteOfDisease] [nvarchar](50) NULL,
	[AdultContactsIdentified] [int] NULL,
	[ChildContactsIdentified] [int] NULL,
	[TotalContactsIdentified] [int] NULL,
	[AdultContactsAssessed] [int] NULL,
	[ChildContactsAssessed] [int] NULL,
	[TotalContactsAssessed] [int] NULL,
	[AdultContactsActiveTB] [int] NULL,
	[ChildContactsActiveTB] [int] NULL,
	[TotalContactsActiveTB] [int] NULL,
	[AdultContactsLTBI] [int] NULL,
	[ChildContactsLTBI] [int] NULL,
	[TotalContactsLTBI] [int] NULL,
	[AdultContactsLTBITreat] [int] NULL,
	[ChildContactsLTBITreat] [int] NULL,
	[TotalContactsLTBITreat] [int] NULL,
	[AdultContactsLTBITreatComplete] [int] NULL,
	[ChildContactsLTBITreatComplete] [int] NULL,
	[TotalContactsLTBITreatComplete] [int] NULL,
	[PreviouslyDiagnosed] [varchar](30) NULL,
	[YearsSinceDiagnosis] [int] NULL,
	[PreviouslyTreated] [varchar](30) NULL,
	[TreatmentInUk] [varchar](30) NULL,
	[PreviousId] [nvarchar](50) NULL,
	[BcgVaccinated] [varchar](30) NULL,
	[AnySocialRiskFactor] [varchar](40) NULL,
	[AlcoholMisuse] [varchar](30) NULL,
	[DrugMisuse] [varchar](30) NULL,
	[CurrentDrugMisuse] [varchar](30) NULL,
	[DrugMisuseInLast5Years] [varchar](30) NULL,
	[DrugMisuseMoreThan5YearsAgo] [varchar](30) NULL,
	[Homeless] [varchar](30) NULL,
	[CurrentlyHomeless] [varchar](30) NULL,
	[HomelessInLast5Years] [varchar](30) NULL,
	[HomelessMoreThan5YearsAgo] [varchar](30) NULL,
	[Prison] [varchar](30) NULL,
	[CurrentlyInPrisonOrInPrisonWhenFirstSeen] [varchar](30) NULL,
	[InPrisonInLast5Years] [varchar](30) NULL,
	[InPrisonMoreThan5YearsAgo] [varchar](30) NULL,
	[TravelledOutsideUk] [varchar](30) NULL,
	[ToHowManyCountries] [nvarchar](5) NULL,
	[TravelCountry1] [nvarchar](255) NULL,
	[MonthsTravelled1] [int] NULL,
	[TravelCountry2] [nvarchar](255) NULL,
	[MonthsTravelled2] [int] NULL,
	[TravelCountry3] [nvarchar](255) NULL,
	[MonthsTravelled3] [int] NULL,
	[ReceivedVisitors] [varchar](30) NULL,
	[FromHowManyCountries] [nvarchar](5) NULL,
	[VisitorCountry1] [nvarchar](255) NULL,
	[DaysVisitorsStayed1] [nvarchar](50) NULL,
	[VisitorCountry2] [nvarchar](255) NULL,
	[DaysVisitorsStayed2] [nvarchar](50) NULL,
	[VisitorCountry3] [nvarchar](255) NULL,
	[DaysVisitorsStayed3] [nvarchar](50) NULL,
	[Diabetes] [varchar](30) NULL,
	[HepatitisB] [varchar](30) NULL,
	[HepatitisC] [varchar](30) NULL,
	[ChronicLiverDisease] [varchar](30) NULL,
	[ChronicRenalDisease] [varchar](30) NULL,
	[ImmunoSuppression] [varchar](30) NULL,
	[BiologicalTherapy] [varchar](100) NULL,
	[Transplantation] [varchar](30) NULL,
	[OtherImmunoSuppression] [varchar](30) NULL,
	[CurrentSmoker] [varchar](30) NULL,
	[PostMortemDiagnosis] [varchar](30) NULL,
	[DidNotStartTreatment] [varchar](30) NULL,
	[ShortCourse] [varchar](30) NULL,
	[MdrTreatment] [varchar](30) NULL,
	[MdrTreatmentDate] [date] NULL,
	[TreatmentOutcome12months] [varchar](30) NULL,
	[TreatmentOutcome24months] [varchar](30) NULL,
	[TreatmentOutcome36months] [varchar](30) NULL,
	[LastRecordedTreatmentOutcome] [varchar](30) NULL,
	[DateOfDeath] [date] NULL,
	[TreatmentEndDate] [date] NULL,
	[NoSampleTaken] [varchar](30) NULL,
	[CulturePositive] [varchar](30) NULL,
	[Species] [varchar](50) NULL,
	[EarliestSpecimenDate] [date] NULL,
	[DrugResistanceProfile] [varchar](30) NULL,
	[INH] [varchar](30) NULL,
	[RIF] [varchar](30) NULL,
	[EMB] [varchar](30) NULL,
	[PZA] [varchar](30) NULL,
	[AMINO] [varchar](30) NULL,
	[QUIN] [varchar](30) NULL,
	[MDR] [varchar](30) NULL,
	[XDR] [varchar](30) NULL,
	[DataRefreshedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ReusableNotification] PRIMARY KEY CLUSTERED 
(
	[ReusableNotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPhecKPI]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPhecKPI]
	
AS
	SELECT p.PHEC_Code, p.PHEC_Name,
		COALESCE (Q1.NumberofNotifications, 0) As NumberOfNotifications,
		COALESCE (Q1.HIVDenominator, 0) As HIVDenominator,
		COALESCE (CAST((Q1.CPCount * 100.0) / NULLIF(Q1.NumberOfNotifications,0) AS DECIMAL(10, 1)), 0.0) AS '%Positive', 
		COALESCE (CAST((Q1.ResistantCount * 100.0) / NULLIF(Q1.NumberOfNotifications,0) AS DECIMAL(10, 1)), 0.0) As '%Resistant',
		--this should be on Q1.HIVDenominator but it causes a divide by zero error?  Maybe use a NULLIF?
		COALESCE (CAST((Q1.HIVOffered * 100.0) / NULLIF(Q1.hivdenominator,0) AS DECIMAL(10, 1)), 0.0) As '%HIVOffered',
		COALESCE (CAST((Q1.TreatmentDelays * 100.0) / NULLIF(Q1.NumberOfPulmonaryNotifications, 0) AS DECIMAL(10, 1)), 0.0) As '%TreatmentDelay'
		
		FROM [NTBS_R1_Geography_Staging].[dbo].[PHEC] p
		LEFT OUTER JOIN 
			(SELECT rn.TreatmentPhecCode, 
					SUM(CASE WHEN CulturePositive='Yes' THEN 1 ELSE 0 END) AS CPCount,
					SUM(CASE WHEN CulturePositive='No' THEN 1 ELSE 0 END) AS CNCount,
					SUM(CASE WHEN DrugResistanceProfile IN ('RR/MDR/XDR', 'INH Resistant') THEN 1 ELSE 0 END) AS ResistantCount, 
					SUM(CASE WHEN HivTestOffered = 'Offered' THEN 1 ELSE 0 END) AS HIVOffered,
					SUM(CASE WHEN HivTestOffered IN ('Offered', 'Not offered') THEN 1 ELSE 0 END) AS HIVDenominator,
					SUM(CASE WHEN OnsetToTreatmentDays > 120 and SiteOfDisease = 'Pulmonary' THEN 1 ELSE 0 END) AS TreatmentDelays,
					SUM(CASE WHEN SiteOfDisease = 'Pulmonary' THEN 1 ELSE 0 END) AS NumberOfPulmonaryNotifications,
					COUNT(rn.ReusableNotificationId) as 'NumberOfNotifications'
				from  [dbo].ReusableNotification rn 
				WHERE rn.NotificationDate between getDate()-395 and getDate()-30
				GROUP BY rn.TreatmentPhecCode) AS Q1
		ON Q1.TreatmentPhecCode = p.PHEC_Code
GO
/****** Object:  View [dbo].[vwPossibleMatch]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPossibleMatch]
	AS 
	SELECT 
		nsm.ReferenceLaboratoryNumber
		,ls.SpecimenDate
		,ls.SpecimenTypeCode
		,ls.LaboratoryName
		,ls.ReferenceLaboratory
		,ls.Species

		,ls.PatientNhsNumber AS 'LabNhsNumber'
		,ls.PatientBirthDate AS 'LabBirthDate'
		,ls.PatientName AS 'LabName'
		,ls.PatientSex AS 'LabSex'
		,ls.PatientAddress AS 'LabAddress'
		,ls.PatientPostcode AS 'LabPostcode'
		,tbs.PHECCode
		,tbs.Code
		,tbs.[Name] AS 'TbServiceName'
		,nsm.NotificationID
		,n.NotificationDate
		,
		(CASE p.NhsNumberNotKnown 
			WHEN 1 THEN 'Not known'
			ELSE p.NhsNumber
		END) AS 'NtbsNhsNumber'
		,CONCAT(UPPER(p.FamilyName), ', ', p.GivenName) AS 'NtbsName'
		,s.Label AS 'NtbsSex'
		,p.Dob AS 'NtbsBirthDate'
		,p.[Address] AS 'NtbsAddress'
		,p.Postcode AS 'NtbsPostcode'
		,nsm.ConfidenceLevel

	FROM [NTBS_Specimen_Matching].[dbo].NotificationSpecimenMatch nsm
		INNER JOIN [dbo].[LabSpecimen] ls ON ls.ReferenceLaboratoryNumber = nsm.ReferenceLaboratoryNumber
		INNER JOIN [NTBS_Empty].[dbo].[Notification] n ON n.NotificationId = nsm.NotificationID
		INNER JOIN [NTBS_Empty].[dbo].[HospitalDetails] e ON e.NotificationId = nsm.NotificationID
		INNER JOIN [NTBS_Empty].[dbo].[Patients] p ON p.NotificationId = n.NotificationId
		LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[TbService] tbs ON e.TBServiceCode = tbs.Code
		LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[Sex] s ON s.SexId = p.SexId
	WHERE nsm.MatchType = 'Possible'
GO
/****** Object:  View [dbo].[vwServiceKPI]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwServiceKPI]
	
AS
	SELECT tbs.TB_Service_Code, tbs.TB_Service_Name,
		COALESCE (Q1.NumberofNotifications, 0) As NumberOfNotifications,
		COALESCE (Q1.HIVDenominator, 0) As HIVDenominator,
		COALESCE (CAST((Q1.CPCount * 100.0) / NULLIF(Q1.NumberOfNotifications,0) AS DECIMAL(10, 1)), 0.0) AS '%Positive', 
		COALESCE (CAST((Q1.ResistantCount * 100.0) / NULLIF(Q1.NumberOfNotifications,0) AS DECIMAL(10, 1)), 0.0) As '%Resistant',
		--this should be on Q1.HIVDenominator but it causes a divide by zero error?  Maybe use a NULLIF?
		COALESCE (CAST((Q1.HIVOffered * 100.0) / NULLIF(Q1.HIVDenominator,0) AS DECIMAL(10, 1)), 0.0) As '%HIVOffered',
		COALESCE (CAST((Q1.TreatmentDelays * 100.0) / NULLIF(Q1.NumberOfPulmonaryNotifications, 0) AS DECIMAL(10, 1)), 0.0) As '%TreatmentDelay'
		
		FROM [NTBS_R1_Geography_Staging].[dbo].[TB_Service] tbs
		LEFT OUTER JOIN 
			(SELECT rn.TBServiceCode, 
					SUM(CASE WHEN CulturePositive='Yes' THEN 1 ELSE 0 END) AS CPCount,
					SUM(CASE WHEN CulturePositive='No' THEN 1 ELSE 0 END) AS CNCount,
					SUM(CASE WHEN DrugResistanceProfile IN ('RR/MDR/XDR', 'INH Resistant') THEN 1 ELSE 0 END) AS ResistantCount, 
					SUM(CASE WHEN HivTestOffered = 'Offered' THEN 1 ELSE 0 END) AS HIVOffered,
					SUM(CASE WHEN HivTestOffered IN ('Offered', 'Not offered') THEN 1 ELSE 0 END) AS HIVDenominator,
					SUM(CASE WHEN OnsetToTreatmentDays > 120 and SiteOfDisease = 'Pulmonary' THEN 1 ELSE 0 END) AS TreatmentDelays,
					SUM(CASE WHEN SiteOfDisease = 'Pulmonary' THEN 1 ELSE 0 END) AS NumberOfPulmonaryNotifications,
					COUNT(rn.ReusableNotificationId) as 'NumberOfNotifications'
				from  [dbo].ReusableNotification rn 
				WHERE rn.NotificationDate between getDate()-395 and getDate()-30
				GROUP BY rn.TBServiceCode) AS Q1
		ON Q1.TBServiceCode = tbs.TB_Service_Code
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetAllUnmatchedSpecimens]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetAllUnmatchedSpecimens] 
(	
	
)

RETURNS TABLE 
AS

RETURN 
	
SELECT 
	vpm.ReferenceLaboratoryNumber
	,vpm.SpecimenDate
	,vpm.SpecimenTypeCode
	,vpm.LaboratoryName
	,vpm.ReferenceLaboratory
	,vpm.Species
	,vpm.LabNhsNumber
	,vpm.LabBirthDate
	,vpm.LabName
	,vpm.LabSex
	,vpm.LabAddress
	,vpm.LabPostcode
	,vpm.TbServiceName
	,vpm.NotificationID
	,vpm.NotificationDate
	,vpm.NtbsNhsNumber
	,vpm.NtbsName
	,vpm.NtbsSex
	,vpm.NtbsBirthDate
	,vpm.NtbsAddress
	,vpm.NtbsPostcode
	,vpm.ConfidenceLevel
FROM [dbo].vwPossibleMatch vpm
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetKPIforPhec]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetKPIforPhec]
(
	--comma-separated list to be split using select value from STRING_SPLIT
	@Phec VARCHAR(200)		=	NULL
)
RETURNS TABLE
AS
RETURN 

	SELECT 
		PHEC_Code AS Code,
		PHEC_Name AS 'Name',
		[%Positive] AS 'PercentPositive',
		[%Resistant] AS 'PercentResistant',
		[%HIVOffered] AS 'PercentHIVOffered',
		[%TreatmentDelay] AS 'PercentTreatmentDelay'
	
	FROM [dbo].[vwPhecKPI]
	WHERE PHEC_Code IN (SELECT TRIM(VALUE) FROM STRING_SPLIT(@Phec, ','))
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetKPIforService]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetKPIforService]
(
	--comma-separated list to be split using select value from STRING_SPLIT(@Service, ',')
	@Service VARCHAR(5000)		=	NULL
)
RETURNS TABLE
AS
RETURN 

	SELECT 
		TB_Service_Code AS Code,
		TB_Service_Name AS 'Name',
		[%Positive] AS 'PercentPositive',
		[%Resistant] AS 'PercentResistant',
		[%HIVOffered] AS 'PercentHIVOffered',
		[%TreatmentDelay] AS 'PercentTreatmentDelay'
	
	FROM [dbo].[vwServiceKPI]
	WHERE TB_Service_Code IN  
			(SELECT TRIM(VALUE) FROM STRING_SPLIT(@Service, ','))
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetNotificationCultureAndResistanceSummary]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetNotificationCultureAndResistanceSummary]
(
	@NTBSId int
)

RETURNS TABLE
AS

RETURN
SELECT	cars.NotificationId
		,cars.CulturePositive
		,cars.Species
		,cars.EarliestSpecimenDate
		,cars.DrugResistanceProfile
		,cars.INH AS 'Isoniazid'
		,cars.RIF AS 'Rifampicin'
		,cars.PZA AS 'Pyrazinamide'
		,cars.EMB AS 'Ethambutol'
		,cars.AMINO AS 'Aminoglycoside'
		,cars.QUIN AS 'Quinolone'
		,cars.MDR
		,cars.XDR
      
  FROM [dbo].ReusableNotification cars
  WHERE cars.NotificationId = @NTBSId
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetUnmatchedSpecimensByPhec]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetUnmatchedSpecimensByPhec] 
(	
	--comma-separated list to be split using select value from STRING_SPLIT
	@Phec VARCHAR(200)		=	NULL
)

RETURNS TABLE 
AS

RETURN 
	--we want to return all specimens with a possible match in the PHECs supplied
	--however, for each of these specimens, we want to return all possible matches for them, including with notifications NOT
	--in the PHECs supplied. This means the user will see all possible matches for specimens where at least one of the matches
	--is a notification in their own PHEC/group of PHEC, to prevent people from just selecting the one match that relates to
	--their own PHEC

SELECT 
	vpm.ReferenceLaboratoryNumber
	,vpm.SpecimenDate
	,vpm.SpecimenTypeCode
	,vpm.LaboratoryName
	,vpm.ReferenceLaboratory
	,vpm.Species
	,vpm.LabNhsNumber
	,vpm.LabBirthDate
	,vpm.LabName
	,vpm.LabSex
	,vpm.LabAddress
	,vpm.LabPostcode
	,vpm.TbServiceName
	,vpm.NotificationID
	,vpm.NotificationDate
	,vpm.NtbsNhsNumber
	,vpm.NtbsName
	,vpm.NtbsSex
	,vpm.NtbsBirthDate
	,vpm.NtbsAddress
	,vpm.NtbsPostcode
	,vpm.ConfidenceLevel
FROM [dbo].vwPossibleMatch vpm
	WHERE vpm.ReferenceLaboratoryNumber IN 
		(SELECT DISTINCT ReferenceLaboratoryNumber FROM [dbo].vwPossibleMatch WHERE [PHECCode] IN 
			(SELECT TRIM(VALUE) FROM STRING_SPLIT(@Phec, ',')))
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetUnmatchedSpecimensByService]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGetUnmatchedSpecimensByService] 
(	
	--comma-separated list to be split using select value from STRING_SPLIT(@Service, ',')
	@Service VARCHAR(5000)		=	NULL
)

RETURNS TABLE 
AS

RETURN 
	--we want to return all specimens with a possible match in the services supplied
	--however, for each of these specimens, we want to return all possible matches for them, including with notifications NOT
	--in the services supplied. This means the user will see all possible matches for specimens where at least one of the matches
	--is a notification in their own service/group of services, to prevent people from just selecting the one match that relates to
	--their own service

SELECT 
	vpm.ReferenceLaboratoryNumber
	,vpm.SpecimenDate
	,vpm.SpecimenTypeCode
	,vpm.LaboratoryName
	,vpm.ReferenceLaboratory
	,vpm.Species
	,vpm.LabNhsNumber
	,vpm.LabBirthDate
	,vpm.LabName
	,vpm.LabSex
	,vpm.LabAddress
	,vpm.LabPostcode
	,vpm.TbServiceName
	,vpm.NotificationID
	,vpm.NotificationDate
	,vpm.NtbsNhsNumber
	,vpm.NtbsName
	,vpm.NtbsSex
	,vpm.NtbsBirthDate
	,vpm.NtbsAddress
	,vpm.NtbsPostcode
	,vpm.ConfidenceLevel
FROM [dbo].vwPossibleMatch vpm
	WHERE vpm.ReferenceLaboratoryNumber IN 
		(SELECT DISTINCT ReferenceLaboratoryNumber FROM [dbo].vwPossibleMatch WHERE [Code] IN 
			(SELECT TRIM(VALUE) FROM STRING_SPLIT(@Service, ',')))
GO
/****** Object:  View [dbo].[vwChangesToDRPSpecies]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwChangesToDRPSpecies]
	AS 

	SELECT	 drp.[NotificationId]
			,drp.[Species] as 'Current Species'
			,drp.[DrugResistanceProfileString] as 'Current DrugResistanceProfile'
			,rn.Species as 'New Species'
			,rn.DrugResistanceProfile as 'New DrugResistanceProfile'
	FROM [NTBS_Empty].[dbo].[DrugResistanceProfile] drp
			INNER JOIN [NTBS_Empty].[dbo].[Notification] n ON n.NotificationId = drp.NotificationId
			--TODO: Update this to reusable notification when NTBS-804 is implemented
			LEFT OUTER JOIN [dbo].[ReusableNotification] rn ON rn.NtbsId = drp.NotificationId
	WHERE	n.NotificationStatus NOT IN ('Draft', 'Deleted')
			AND (((drp.Species != rn.Species) OR (drp.Species IS NULL AND rn.Species IS NOT NULL))
			OR ((drp.DrugResistanceProfileString != rn.DrugResistanceProfile) OR (drp.DrugResistanceProfileString IS NULL AND rn.DrugResistanceProfile IS NOT NULL)))
GO
/****** Object:  Table [dbo].[NotificationClusterMatch]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationClusterMatch](
	[NotificationId] [int] NOT NULL,
	[ClusterId] [nvarchar](20) NULL,
 CONSTRAINT [PK_NotificationClusterMatch] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwNotificationClusterMatch]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    View for purposes of representing changes that need to be made in NTBS to reflect
		 the current state of cluster matching to NTBS records.
         
**************************************************************************************************/

CREATE VIEW [dbo].[vwNotificationClusterMatch]
	AS 
	
		/*find the records which exist in NTBS and where the value in NotificationSpecimenMatch is different*/

		SELECT 
			n1.NotificationId, ncm1.ClusterId
		FROM [dbo].[NotificationClusterMatch] ncm1
			INNER JOIN [NTBS_Empty].[dbo].[Notification] n1
			ON n1.NotificationId = ncm1.NotificationId
		WHERE 
			(ncm1.ClusterId <> n1.ClusterId OR n1.ClusterId IS NULL)

		UNION ALL

		/*
			Also include records where NTBS contains a value, but reporting
			does not have a value. Hypothetically a cluster was unmatched to
			the notification.
		*/
		SELECT 
			n2.NotificationId,
			NULL AS ClusterId
		FROM [NTBS_Empty].[dbo].[Notification] n2
		LEFT OUTER JOIN [dbo].[NotificationClusterMatch] ncm2
			ON n2.NotificationId = ncm2.NotificationId
		WHERE
			n2.ClusterId IS NOT NULL
			AND ncm2.NotificationId IS NULL
GO
/****** Object:  Table [dbo].[Organism]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organism](
	[OrganismId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Organism_CD] [varchar](50) NOT NULL,
	[OrganismName] [varchar](50) NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrganismName] PRIMARY KEY CLUSTERED 
(
	[OrganismId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwSpecies]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns the Organism/Species drop-down values, eg "M. bovies", "M. africanum" ...


         
**************************************************************************************************/

CREATE VIEW [dbo].[vwSpecies] AS
	SELECT Top 10
		OrganismName,
		SortOrder
	FROM (
			SELECT
				'All' AS OrganismName,
				0 AS SortOrder
			UNION
			SELECT
				OrganismName,
				SortOrder
			FROM Organism
		) Species
	ORDER BY SortOrder
GO
/****** Object:  Table [dbo].[Outcome]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outcome](
	[OutcomeId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[TreatmentStartDate] [datetime] NULL,
 CONSTRAINT [PK_Outcome] PRIMARY KEY CLUSTERED 
(
	[OutcomeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutcomeLookup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeLookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutcomeCode] [nvarchar](30) NULL,
	[OutcomeDescription] [nvarchar](30) NULL,
 CONSTRAINT [PK_OutcomeLookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetPeriodicOutcome]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
For a given notification and time period (1 = 12 months, 2 = 24 months, 3 = 36 months)
this function will return the most recent treatment event and determine whether it represents an 'ending' event like
a real treatment outcome
**/


CREATE FUNCTION [dbo].[ufnGetPeriodicOutcome]
(
	@TimePeriod int,
	@NotificationId int
)
RETURNS TABLE
AS
RETURN

--DECLARE @TimePeriod AS INT = 1


-- The logic of this code must stay in sync between the application and the reporting service.
-- The source of truth is documented in https://airelogic-nis.atlassian.net/wiki/spaces/R2/pages/599687169/Outcomes+logic
SELECT TOP(1) 
	@NotificationId AS 'NotificationId',
	@TimePeriod AS 'Period', 
	--ensure that if there is an ending and not-ending event (like a transfer or restart) on the last day in the period that has event data
	--(e.g. outcome and restart recorded on the same day)
	-- that we will have a consistent order, with restart taken in preference to the outcome
	(CASE
		WHEN te.TreatmentEventType = 'TreatmentStart' THEN 1
		WHEN te.TreatmentEventType = 'TransferOut' THEN 2
		WHEN te.TreatmentEventType = 'TransferIn' THEN 3
		WHEN te.TreatmentEventType = 'TreatmentRestart' THEN 4
		WHEN te.TreatmentEventType = 'TreatmentOutcome' THEN 5
		ELSE 6
		END) AS EventOrder,
	--calculate whether the event is an ending one or not
	(CASE 
		WHEN tro.TreatmentOutcomeType != 'NotEvaluated' THEN 1 
		WHEN tro.TreatmentOutcomeType = 'NotEvaluated' AND tro.TreatmentOutcomeSubType = 'TransferredAbroad' THEN 1
		ELSE 0
		END) AS EndingEvent,
	 COALESCE(ol.OutcomeDescription, 'No outcome recorded') AS 'OutcomeValue'
	FROM [NTBS_Empty].[dbo].[TreatmentEvent] te 
	LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[TreatmentOutcome] tro ON tro.TreatmentOutcomeId = te.TreatmentOutcomeId
	LEFT OUTER JOIN [dbo].[OutcomeLookup] ol ON ol.OutcomeCode = tro.TreatmentOutcomeType 
	INNER JOIN [dbo].[Outcome] o ON o.NotificationId = te.NotificationId
	--look for records which are on or after the start of the period
	WHERE te.EventDate >= DATEADD(YEAR, @TimePeriod-1, o.TreatmentStartDate)
		--and before the end of the period.  Adding a year in this way deals with the problem of leap days
		AND te.EventDate < DATEADD(YEAR, @TimePeriod, o.TreatmentStartDate)
		AND te.NotificationId = @NotificationId

	ORDER BY te.EventDate DESC, EventOrder DESC
GO
/****** Object:  View [dbo].[vwSecondLineMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwSecondLineMapping]
	AS 
		--using mappings from R1
		SELECT 'AMINO' AS GroupName, 'AMINO' AS AntibioticOutputName
		UNION
		SELECT 'AMINO' AS GroupName, 'AK' AS AntibioticOutputName
		UNION
		SELECT 'AMINO' AS GroupName, 'KAN' AS AntibioticOutputName
		UNION
		SELECT 'AMINO' AS GroupName, 'CAP' AS AntibioticOutputName
		UNION
		SELECT 'AMINO' AS GroupName, 'STR' AS AntibioticOutputName
		UNION
		SELECT 'QUIN' AS GroupName, 'QUIN' AS AntibioticOutputName
		UNION
		SELECT 'QUIN' AS GroupName, 'OFX' AS AntibioticOutputName
		UNION
		SELECT 'QUIN' AS GroupName, 'MOXI' AS AntibioticOutputName
		UNION
		SELECT 'QUIN' AS GroupName, 'CIP' AS AntibioticOutputName
GO
/****** Object:  Table [dbo].[StandardisedLabbaseSusceptibilityResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandardisedLabbaseSusceptibilityResult](
	[ReferenceLaboratoryNumber] [nvarchar](50) NULL,
	[AntibioticOutputName] [nvarchar](50) NULL,
	[IsWGS] [bit] NULL,
	[ResultOutputName] [nvarchar](50) NULL,
	[Rank] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwFirstLineAntibiotics]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwFirstLineAntibiotics]
	AS 
	SELECT 'INH' AS 'AntibioticOutputName', 1 AS 'SortOrder'
	UNION
	SELECT 'RIF' AS 'AntibioticOutputName', 2 AS 'SortOrder'
	UNION
	SELECT 'EMB' AS 'AntibioticOutputName', 3 AS 'SortOrder'
	UNION
	SELECT 'PZA' AS 'AntibioticOutputName', 4 AS 'SortOrder'
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetSpecimenSusceptibilityInfo]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Returns consolidated information about a lab specimen's drug sensitivity results, 
summarising data from local copies of LabBase data
*/

CREATE FUNCTION [dbo].[ufnGetSpecimenSusceptibilityInfo](@RefLabNumber NVARCHAR(50))

RETURNS TABLE 
AS
RETURN
	
		WITH
		/*SET UP THE LOOKUP VALUES */
			
			--then a list of all the drug names
			AllDrugNames(AntibioticOutputName) AS
			(SELECT [AntibioticOutputName]
				FROM [dbo].[vwFirstLineAntibiotics]
				UNION
				SELECT DISTINCT [GroupName]
				FROM [dbo].[vwSecondLineMapping]),

			--then a list of the result output values (e.g. 'Sensitive')
			DistinctOutputNames([Rank],[ResultOutputName]) AS
			(SELECT DISTINCT [Rank], [ResultOutputName] FROM [dbo].ResultMapping),

		/*END OF LOOKUP VALUE SET-UP*/

		--fetch the highest ranked result for each first line drug and the second line drug groups
		AvailableResults(AntibioticOutputName, [Rank]) AS
		(
			SELECT COALESCE(GroupName, lbsr.AntibioticOutputName) AS 'AntibioGroupname', MIN(lbsr.[Rank])
				FROM [dbo].[StandardisedLabbaseSusceptibilityResult] lbsr
					LEFT OUTER JOIN [dbo].[vwSecondLineMapping] slm ON slm.AntibioticOutputName = lbsr.AntibioticOutputName
				WHERE lbsr.ReferenceLaboratoryNumber = @RefLabNumber
					AND (lbsr.AntibioticOutputName IN (SELECT [AntibioticOutputName] FROM [dbo].[vwFirstLineAntibiotics]) 
					OR	slm.GroupName IS NOT NULL)
				GROUP BY ReferenceLaboratoryNumber, COALESCE(GroupName, lbsr.AntibioticOutputName)),
	

		--then format these so one row per drug, even if no result
		--along with the result output name appropriate to the highest ranked result
		
		AllResults(AntibioticOutputName, ResultOutputName) AS

		(SELECT a.AntibioticOutputName, COALESCE(dm.ResultOutputName, 'No result') As 'ResultOutputName'
		FROM AllDrugNames a
			LEFT OUTER JOIN AvailableResults ar ON ar.AntibioticOutputName = a.AntibioticOutputName
			LEFT OUTER JOIN DistinctOutputNames dm ON dm.[Rank] = ar.[Rank])

		
		--and then pivot them, so we only return one row for the given RefLabNumber

		SELECT * FROM AllResults
		AS source
		PIVOT
			(
				MAX(ResultOutputName)
				FOR [AntibioticOutputName] IN ([INH], [RIF], [EMB], [PZA], [AMINO], [QUIN])
		) AS Result
GO
/****** Object:  Table [dbo].[OutcomeSummary]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeSummary](
	[OutcomeSummaryId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[TreatmentCompletedLastOutcome] [tinyint] NOT NULL,
	[DiedLastOutcome] [tinyint] NOT NULL,
	[LostToFollowUpLastOutcome] [tinyint] NOT NULL,
	[StillOnTreatmentLastOutcome] [tinyint] NOT NULL,
	[TreatmentStoppedLastOutcome] [tinyint] NOT NULL,
	[NotEvaluatedLastOutcome] [tinyint] NOT NULL,
	[UnknownLastOutcome] [tinyint] NOT NULL,
	[TreatmentCompleted12Month] [tinyint] NOT NULL,
	[Died12Month] [tinyint] NOT NULL,
	[LostToFollowUp12Month] [tinyint] NOT NULL,
	[StillOnTreatment12Month] [tinyint] NOT NULL,
	[TreatmentStopped12Month] [tinyint] NOT NULL,
	[NotEvaluated12Month] [tinyint] NOT NULL,
	[Unknown12Month] [tinyint] NOT NULL,
	[TreatmentCompleted24Month] [tinyint] NOT NULL,
	[Died24Month] [tinyint] NOT NULL,
	[LostToFollowUp24Month] [tinyint] NOT NULL,
	[StillOnTreatment24Month] [tinyint] NOT NULL,
	[TreatmentStopped24Month] [tinyint] NOT NULL,
	[NotEvaluated24Month] [tinyint] NOT NULL,
	[Unknown24Month] [tinyint] NOT NULL,
	[TreatmentCompleted36Month] [tinyint] NOT NULL,
	[Died36Month] [tinyint] NOT NULL,
	[LostToFollowUp36Month] [tinyint] NOT NULL,
	[StillOnTreatment36Month] [tinyint] NOT NULL,
	[TreatmentStopped36Month] [tinyint] NOT NULL,
	[NotEvaluated36Month] [tinyint] NOT NULL,
	[Unknown36Month] [tinyint] NOT NULL,
 CONSTRAINT [PK_OutcomeSummary] PRIMARY KEY CLUSTERED 
(
	[OutcomeSummaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugResistanceProfile]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugResistanceProfile](
	[DrugResistanceProfileId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ResistantId] [tinyint] NOT NULL,
	[DrugResistanceProfile] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DrugResistanceProfile] PRIMARY KEY CLUSTERED 
(
	[DrugResistanceProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resistant]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resistant](
	[ResistantId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ResistantDesc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Resistant] PRIMARY KEY CLUSTERED 
(
	[ResistantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnOutcomeSummaryResidence1]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This is the SQL that delivers the "Outcome Summary" residence data for the "LastOutcome" columns


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnOutcomeSummaryResidence1] (
	@NotificationDateFrom			CHAR(10)		=	NULL,
	@NotificationDateTo				CHAR(10)		=	NULL,
	@Region							VARCHAR(50)		=	NULL,
	@ResistantId					VARCHAR(50)		=	NULL, -- TODO: This should be an INTEGER, but somehow an INTEGER does not get passed through!
	@DrugResistanceProfile			VARCHAR(50)		=	NULL
)
	RETURNS TABLE
AS
RETURN
	SELECT
		n.LocalAuthority						AS 'Local Authority',
		SUM(o.TreatmentCompletedLastOutcome)	AS 'Treatment completed',
		SUM(o.DiedLastOutcome)					AS 'Died',
		SUM(o.LostToFollowUpLastOutcome)		AS 'Lost to follow-up',
		SUM(o.StillOnTreatmentLastOutcome)		AS 'Still on treatment',
		SUM(o.TreatmentStoppedLastOutcome)		AS 'Treatment stopped',
		SUM(o.NotEvaluatedLastOutcome)			AS 'Not evaluated',
		SUM(o.UnknownLastOutcome)				AS 'Unknown'
	FROM dbo.ReusableNotification n WITH (NOLOCK)
		INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
		INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
		INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
	WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
		AND (@Region IS NULL OR n.ResidencePhec = @Region)
		AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
		AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
		AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
	GROUP BY n.LocalAuthority
GO
/****** Object:  Table [dbo].[AdGroup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdGroup](
	[AdGroupId] [tinyint] IDENTITY(1,1) NOT NULL,
	[AdGroupName] [varchar](200) NOT NULL,
	[IsNationalTeam] [tinyint] NOT NULL,
	[ADGroupType] [nvarchar](1) NULL,
 CONSTRAINT [PK_AdGroup] PRIMARY KEY CLUSTERED 
(
	[AdGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceAdGroup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceAdGroup](
	[ServiceAdGroupId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ServiceId] [tinyint] NOT NULL,
	[AdGroupId] [tinyint] NOT NULL,
 CONSTRAINT [PK_ServiceAdGroup] PRIMARY KEY CLUSTERED 
(
	[ServiceAdGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phec]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phec](
	[PhecId] [tinyint] IDENTITY(1,1) NOT NULL,
	[PhecCode] [nvarchar](50) NOT NULL,
	[PhecName] [nvarchar](50) NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_Phec] PRIMARY KEY CLUSTERED 
(
	[PhecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhecAdGroup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhecAdGroup](
	[PhecAdGroupId] [tinyint] IDENTITY(1,1) NOT NULL,
	[PhecId] [tinyint] NOT NULL,
	[AdGroupId] [tinyint] NOT NULL,
 CONSTRAINT [PK_PhecAdGroup] PRIMARY KEY CLUSTERED 
(
	[PhecAdGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Service]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_Service](
	[Serviceid] [int] IDENTITY(1,1) NOT NULL,
	[TB_Service_Code] [varchar](50) NOT NULL,
	[TB_Service_Name] [varchar](150) NOT NULL,
	[phecid] [tinyint] NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
	[PHEC_Code] [nvarchar](50) NOT NULL,
	[PhecName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Serviceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnAuthorizedReusableNotification]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This executes the permission PHEC region restrictions on the notification records that get
         queried at run-time. Every "Line List" proc is to select from this (instead directly from the 
		 ReusableNotification table. The logic is that a notification gets shown to a PHEC user, if it 
		 belongs to their treatment or to their residence PHEC. This means thst, if the treatment and 
		 residence PHEC differ, the notification gets returned for both users of both PHEC regions.
		 Any report can then apply additional filtering based on the value of the "Region" and/or the 
		 "Treatment or residence" drop-down.
		 
		 
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnAuthorizedReusableNotification] (
	@LoginGroups VARCHAR(500)
)
	RETURNS TABLE
AS
RETURN
	-- Debugging
	-- DECLARE @LoginGroups VARCHAR(255) = '###Global.NIS.NTBS.LON###'

	-- Distinct is to avoid row duplication for when a notification has a different treatment and residence PHEC
	SELECT DISTINCT
		-- Primary key
		n.NotificationId,

		-- Demographics
		n.EtsId,
		n.LtbrId,
		n.NotificationDate,
		n.CaseManager,
		n.Consultant,
		n.Hospital,
		n.[Service],
		n.NhsNumber,
		n.Forename,
		n.Surname,
		n.DateOfBirth,
		n.Age,
		n.Sex,
		n.UkBorn,
		n.EthnicGroup,
		n.BirthCountry,
		n.UkEntryYear,
		n.Postcode,
		n.NoFixedAbode,

		-- Geographies
		n.LocalAuthority,
		n.LocalAuthorityCode,
		n.ResidencePhec,
		n.TreatmentPhec,

		-- Clinical Details
		n.SymptomOnsetDate,
		n.PresentedDate,
		n.OnsetToPresentationDays,
		n.DiagnosisDate,
		n.PresentationToDiagnosisDays,
		n.StartOfTreatmentDate,
		n.DiagnosisToTreatmentDays,
		n.OnsetToTreatmentDays,
		n.HivTestOffered,
		n.SiteOfDisease,
		n.AdultContactsIdentified,
		n.ChildContactsIdentified,
		n.TotalContactsIdentified,
		n.AdultContactsAssessed,
		n.ChildContactsAssessed,
		n.TotalContactsAssessed,
		n.AdultContactsActiveTB,
		n.ChildContactsActiveTB,
		n.TotalContactsActiveTB,
		n.AdultContactsLTBI,
		n.ChildContactsLTBI,
		n.TotalContactsLTBI,
		n.AdultContactsLTBITreat,
		n.ChildContactsLTBITreat,
		n.TotalContactsLTBITreat,
		n.AdultContactsLTBITreatComplete,
		n.ChildContactsLTBITreatComplete,
		n.TotalContactsLTBITreatComplete,
		n.PreviouslyDiagnosed,
		n.YearsSinceDiagnosis,
		n.PreviouslyTreated,
		n.TreatmentInUk,
		n.PreviousId,
		n.BcgVaccinated,
		
		-- Risk Factors
		n.AnySocialRiskFactor,
		n.AlcoholMisuse,
		n.DrugMisuse,
		n.CurrentDrugMisuse,
		n.DrugMisuseInLast5Years,
		n.DrugMisuseMoreThan5YearsAgo,
		n.Homeless,
		n.CurrentlyHomeless,
		n.HomelessInLast5Years,
		n.HomelessMoreThan5YearsAgo,
		n.Prison,
		n.CurrentlyInPrisonOrInPrisonWhenFirstSeen,
		n.InPrisonInLast5Years,
		n.InPrisonMoreThan5YearsAgo,
		n.TravelledOutsideUk,
		n.ToHowManyCountries,
		n.TravelCountry1,
		n.MonthsTravelled1,
		n.TravelCountry2,
		n.MonthsTravelled2,
		n.TravelCountry3,
		n.MonthsTravelled3,
		n.ReceivedVisitors,
		n.FromHowManyCountries,
		n.VisitorCountry1,
		n.DaysVisitorsStayed1,
		n.VisitorCountry2,
		n.DaysVisitorsStayed2,
		n.VisitorCountry3,
		n.DaysVisitorsStayed3,
		n.Diabetes,
		n.HepatitisB,
		n.HepatitisC,
		n.ChronicLiverDisease,
		n.ChronicRenalDisease,
		n.ImmunoSuppression,
		n.BiologicalTherapy,
		n.Transplantation,
		n.OtherImmunoSuppression,
		n.CurrentSmoker,
		
		-- Treatment
		n.PostMortemDiagnosis,
		n.DidNotStartTreatment,
		n.ShortCourse,
		n.MdrTreatment,
		n.MdrTreatmentDate,
		n.TreatmentOutcome12months,
		n.TreatmentOutcome24months,
		n.TreatmentOutcome36months,
		n.LastRecordedTreatmentOutcome,
		n.DateOfDeath,
		n.TreatmentEndDate,
		
		-- Culture & Resistance
		n.NoSampleTaken,
		n.CulturePositive,
		n.Species,
		n.EarliestSpecimenDate,
		n.DrugResistanceProfile,
		n.INH,
		n.RIF,
		n.EMB,
		n.PZA,
		n.MDR,
		n.XDR
	FROM dbo.ReusableNotification n WITH (NOLOCK)
		INNER JOIN dbo.Phec p ON (p.PhecName = n.TreatmentPhec OR p.PhecName = n.ResidencePhec)
		left outer join  TB_Service s on s.phecid = p.PhecId and s.TB_Service_Name = n.Service
		--For Regional user
		inner JOIN dbo.PhecAdGroup pa ON pa.PhecId = p.PhecId
		inner JOIN dbo.AdGroup ag ON ag.AdGroupId = pa.AdGroupId 
		--For Service user
		left outer join dbo.ServiceAdGroup sa on sa.ServiceId = s.Serviceid 
		left outer join dbo.AdGroup sag on sag.AdGroupId = sa.AdGroupId and sag.ADGroupType = 'S' and ag.ADGroupType = 'R'


	-- Permission restriction on either treatment or residence region.
	-- Further filtering needs to happen in the main query depending on 
	-- the "Either Residence or Treatment" drop-down option selected:
	WHERE CHARINDEX('###' + ag.AdGroupName + '###', @LoginGroups) != 0 or CHARINDEX('###' + sag.AdGroupName + '###', @LoginGroups) != 0
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGetLAsByRegion]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns all of the Local Authorities of a region


         
**************************************************************************************************/

CREATE FUNCTION [dbo].[ufnGetLAsByRegion] (
	@Region				VARCHAR(50)		=	NULL
)
	RETURNS TABLE
AS
RETURN
	SELECT 
		l.LA_Name AS LocalAuthority
	FROM [NTBS_R1_Geography_Staging].dbo.Local_Authority l WITH (NOLOCK)
		INNER JOIN [NTBS_R1_Geography_Staging].dbo.LA_to_PHEC lp ON lp.LA_Code = l.LA_Code
		INNER JOIN [NTBS_R1_Geography_Staging].dbo.PHEC p ON p.PHEC_Code = lp.PHEC_Code
	WHERE p.PHEC_Name = @Region
GO
/****** Object:  View [dbo].[vwComparisonDates]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*this is a view for use in the specimen matching database, retrieving dates and DRP of interest when deciding if a specimen date falls within
the expected time period of treatment for a given notification*/
CREATE VIEW [dbo].[vwComparisonDates]
	AS

SELECT n.NotificationId, n.NotificationDate, drp.DrugResistanceProfileString AS DrugResistanceProfile, n.NotificationDate as 'OutcomeDate'
    FROM [NTBS_Empty].[dbo].[Notification] n
	INNER JOIN [NTBS_Empty].[dbo].DrugResistanceProfile drp ON drp.NotificationId = n.NotificationId
GO
/****** Object:  View [dbo].[vwETSLaboratoryResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*We need to exclude entries in the LaboratoryResult table where the AuditDelete field has a value, as these have been
logically deleted, for example, manually unmatched reference lab result*/

CREATE VIEW [dbo].[vwETSLaboratoryResult]
	AS SELECT * FROM [ETS].[dbo].[LaboratoryResult] lr
		WHERE lr.AuditDelete IS NULL
GO
/****** Object:  View [dbo].[vwNotificationMonth]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns drop-down values of the 12 months, which are used for the end-user to filter
         on the notification start/end months.


         
**************************************************************************************************/

CREATE VIEW [dbo].[vwNotificationMonth] AS
	SELECT TOP 12 
		Id,
		NotificationMonth
	FROM (
			SELECT
				1 AS Id,
				'January' AS NotificationMonth
			UNION ALL 
				SELECT
				2 AS Id,
				'February' AS NotificationMonth
			UNION ALL 
				SELECT 
				3 AS Id,
				'March' AS NotificationMonth
			UNION ALL 
				SELECT 
				4 AS Id,
				'April' AS NotificationMonth
			UNION ALL 
				SELECT
				5 AS Id,
				'May' AS NotificationMonth
			UNION ALL 
				SELECT
				6 AS Id,
				'June' AS NotificationMonth
			UNION ALL 
				SELECT
				7 AS Id,
				'July' AS NotificationMonth
			UNION ALL 
				SELECT
				8 AS Id,
				'August' AS NotificationMonth
			UNION ALL 
				SELECT
				9 AS Id,
				'September' AS NotificationMonth
			UNION ALL 
				SELECT
				10 AS Id,
				'October' AS NotificationMonth
			UNION ALL 
				SELECT
				11 AS Id,
				'November' AS NotificationMonth
			UNION ALL 
				SELECT
				12 AS Id,
				'December' AS NotificationMonth
		) NotificationMonth
	ORDER BY Id
GO
/****** Object:  View [dbo].[vwNotificationYear]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This SQL query goes 3 calendar years back, eg when in 2019 the following would only include
         notifications starting from '2016-01-01'. This DB view is used for the following 2 purposes:
		 a) This restricts the notification generation query that runs every night to the lst 3 years.
		 b) This also returns drop-down values of the 12 years, which are used for the end-user to filter
         on the notification start/end months.


         
**************************************************************************************************/

CREATE VIEW [dbo].[vwNotificationYear] AS
	SELECT TOP 5 
		Id,
		NotificationYear
	FROM (
			SELECT
				0 AS Id,
				YEAR(GETDATE()) AS NotificationYear
			UNION
			SELECT
				-1 AS Id,
				YEAR(DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()) -1, 0)) AS NotificationYear
			UNION
			SELECT
				-2 AS Id,
				YEAR(DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()) -2, 0)) AS NotificationYear
			UNION
			SELECT
				-3 AS Id,
				YEAR(DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()) -3, 0)) AS NotificationYear
			UNION
			SELECT
				-4 AS Id,
				YEAR(DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()) -4, 0)) AS NotificationYear
		) NotificationYear
	ORDER BY NotificationYear DESC
GO
/****** Object:  Table [dbo].[__MigrationLog]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationLog](
	[SqlHash] [binary](64) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NULL,
	[SqlText] [nvarchar](max) NOT NULL,
	[WasSuccessful] [bit] NOT NULL,
	[Error] [nvarchar](max) NULL,
	[Author] [nvarchar](250) NULL,
	[Build] [nvarchar](50) NULL,
 CONSTRAINT [PK_MigrationLog] PRIMARY KEY CLUSTERED 
(
	[SqlHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccessAudit]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessAudit](
	[AccessAuditId] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [varchar](50) NOT NULL,
	[AccessDate] [datetime] NOT NULL,
	[User] [nvarchar](128) NOT NULL,
	[Group] [varchar](500) NOT NULL,
	[NotificationId] [nvarchar](50) NOT NULL,
	[EtsId] [bigint] NULL,
 CONSTRAINT [PK_AccessAudit] PRIMARY KEY CLUSTERED 
(
	[AccessAuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boilerplate]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boilerplate](
	[BoilerplateId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[BoilerplateCalculationNo1] [int] NULL,
	[BoilerplateCalculationNo2] [int] NULL,
 CONSTRAINT [PK_Boilerplate] PRIMARY KEY CLUSTERED 
(
	[BoilerplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClinicalRiskFactors]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicalRiskFactors](
	[ClinicalRiskFactorId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ClinicalRiskFactor] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ClinicalRiskFactors] PRIMARY KEY CLUSTERED 
(
	[ClinicalRiskFactorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CultureAndResistanceSummary]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CultureAndResistanceSummary](
	[CARSummaryId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[CulturePositive] [nvarchar](3) NULL,
	[Species] [varchar](50) NULL,
	[DrugResistanceProfile] [nvarchar](30) NULL,
	[EarliestSpecimenDate] [datetime] NULL,
	[INH] [nvarchar](25) NULL,
	[RIF] [nvarchar](25) NULL,
	[PYR] [nvarchar](25) NULL,
	[ETHAM] [nvarchar](25) NULL,
	[MDR] [nvarchar](10) NULL,
	[AMINO] [nvarchar](25) NULL,
	[QUIN] [nvarchar](25) NULL,
	[XDR] [nvarchar](10) NULL,
 CONSTRAINT [PK_CARSummaryId] PRIMARY KEY CLUSTERED 
(
	[CARSummaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CultureResistance]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CultureResistance](
	[CultureResistanceId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[CulturePositiveCases] [tinyint] NOT NULL,
	[NonCulturePositiveCases] [tinyint] NOT NULL,
	[SensitiveToAll4FirstLineDrugs] [tinyint] NOT NULL,
	[InhRes] [tinyint] NOT NULL,
	[Other] [tinyint] NOT NULL,
	[MdrRr] [tinyint] NOT NULL,
	[Xdr] [tinyint] NOT NULL,
	[IncompleteDrugResistanceProfile] [tinyint] NOT NULL,
 CONSTRAINT [PK_CultureResistance] PRIMARY KEY CLUSTERED 
(
	[CultureResistanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataQuality]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataQuality](
	[DataQualityId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[TreatmentEndDate] [tinyint] NOT NULL,
	[TreatmentOutcome12Months] [tinyint] NOT NULL,
	[TreatmentOutcome24Months] [tinyint] NOT NULL,
	[TreatmentOutcome36Months] [tinyint] NOT NULL,
	[DateOfDeath] [tinyint] NOT NULL,
	[DateOfBirth] [tinyint] NOT NULL,
	[UKBorn] [tinyint] NOT NULL,
	[SiteOfDisease] [tinyint] NOT NULL,
	[Denotify] [tinyint] NOT NULL,
	[OnsetToPresentationDays] [tinyint] NOT NULL,
	[PresentationToDiagnosisDays] [tinyint] NOT NULL,
	[DiagnosisToTreatmentDays] [tinyint] NOT NULL,
	[OnsetToTreatmentDays] [tinyint] NOT NULL,
	[Postcode] [tinyint] NOT NULL,
 CONSTRAINT [PK_DataQuality] PRIMARY KEY CLUSTERED 
(
	[DataQualityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorDateTime] [datetime] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[ErrorNumber] [nvarchar](50) NULL,
	[ErrorMessage] [nvarchar](1000) NULL,
	[ProcName] [nvarchar](100) NULL,
	[LineNumber] [nvarchar](10) NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FooterText]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FooterText](
	[FooterTextId] [tinyint] NOT NULL,
	[FooterText] [varchar](1000) NULL,
 CONSTRAINT [PK_FooterText] PRIMARY KEY CLUSTERED 
(
	[FooterTextId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForestClusterBuild]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForestClusterBuild](
	[BuildNumber] [int] NULL,
	[LastExtractionDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForestEtsCluster]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForestEtsCluster](
	[smallest_clusterLabel] [nvarchar](50) NULL,
	[ETSCaseId_max] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForestExtract]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForestExtract](
	[NotificationId] [uniqueidentifier] NULL,
	[CaseId] [bigint] NULL,
	[OpieID] [nvarchar](50) NULL,
	[Casereportdate] [nvarchar](10) NULL,
	[Forename] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[NHSNumber] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[Town] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[Postcode] [nvarchar](255) NULL,
	[Sex] [nvarchar](10) NULL,
	[Hospital] [nvarchar](255) NULL,
	[ResidenceLocalAuthority] [nvarchar](255) NULL,
	[ResidenceHPU] [nvarchar](255) NULL,
	[HPAResidenceRegion] [nvarchar](255) NULL,
	[Occupation] [nvarchar](255) NULL,
	[OccupationCategory] [nvarchar](255) NULL,
	[EthnicGroup] [nvarchar](255) NULL,
	[UKBorn] [nvarchar](10) NULL,
	[BirthCountry] [nvarchar](255) NULL,
	[UKEntryYear] [int] NULL,
	[SymptomOnset] [nvarchar](50) NULL,
	[DatePresented] [nvarchar](50) NULL,
	[DateOfDiagnosis] [nvarchar](50) NULL,
	[StartOfTreatment] [nvarchar](50) NULL,
	[SmearSample] [nvarchar](255) NULL,
	[SmearSampleResult] [nvarchar](50) NULL,
	[DrugUse] [nvarchar](255) NULL,
	[CurrentDrugUse] [nvarchar](50) NULL,
	[AlcoholUse] [nvarchar](50) NULL,
	[Homeless] [nvarchar](50) NULL,
	[NoFixedAbode] [nvarchar](10) NULL,
	[Prison] [nvarchar](50) NULL,
	[CurrentlyInPrisonorWhenFirstSeen] [nvarchar](50) NULL,
	[ExtractDate] [date] NULL,
	[ReferenceLaboratoryNumber] [nvarchar](50) NULL,
	[VntrProfile] [nvarchar](max) NULL,
	[ClusterNumber] [nvarchar](1000) NULL,
	[Localpatientid] [nvarchar](255) NULL,
	[Age] [tinyint] NULL,
	[DiseaseSites] [nvarchar](2000) NULL,
	[DrugUseLast5Years] [nvarchar](10) NULL,
	[DrugUseMoreThan5YearsAgo] [nvarchar](10) NULL,
	[HomelessLast5Years] [nvarchar](10) NULL,
	[HomelessMoreThan5YearsAgo] [nvarchar](10) NULL,
	[PrisonLast5Years] [nvarchar](10) NULL,
	[PrisonMoreThan5YearsAgo] [nvarchar](10) NULL,
	[TreatmentRegion] [nvarchar](255) NULL,
	[OwnerUserId] [uniqueidentifier] NULL,
	[SpecimenDate] [datetime] NULL,
	[CurrentlyHomeless] [nvarchar](10) NULL,
	[CaseManager] [nvarchar](255) NULL,
	[PatientsConsultant] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabMappings]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabMappings](
	[FieldName] [nvarchar](100) NULL,
	[ETSDisplayCode] [nvarchar](100) NULL,
	[LabDisplayCode] [nvarchar](100) NULL,
	[LabName] [nvarchar](100) NULL,
	[auditcreate] [date] NULL,
	[Description] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManualLabResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManualLabResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EtsId] [bigint] NULL,
	[Microscopy] [nvarchar](9) NULL,
	[MicroscopySputum] [nvarchar](9) NULL,
	[MicroscopyNonSputum] [nvarchar](9) NULL,
	[Histology] [nvarchar](9) NULL,
	[Culture] [nvarchar](9) NULL,
	[Amplification] [nvarchar](9) NULL,
 CONSTRAINT [PK_ManualResultId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManualLabResultAll]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManualLabResultAll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EtsId] [bigint] NULL,
	[TestType] [nvarchar](30) NULL,
	[Result] [nvarchar](9) NULL,
 CONSTRAINT [PK_ManualResultAllId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManualLabResultMicroscopy]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManualLabResultMicroscopy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EtsId] [bigint] NULL,
	[Result] [nvarchar](9) NULL,
	[Sputum] [tinyint] NULL,
 CONSTRAINT [PK_ManualResultMicroscopyId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthYear]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthYear](
	[MonthYearId] [varchar](10) NOT NULL,
	[MonthYear] [varchar](10) NOT NULL,
 CONSTRAINT [PK_MonthYear] PRIMARY KEY CLUSTERED 
(
	[MonthYearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismNameMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismNameMapping](
	[OrganismNameMappingId] [smallint] IDENTITY(1,1) NOT NULL,
	[OrganismName] [varchar](100) NOT NULL,
	[OrganismId] [tinyint] NOT NULL,
 CONSTRAINT [PK_OrganismNameMapping] PRIMARY KEY CLUSTERED 
(
	[OrganismNameMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodicOutcome]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodicOutcome](
	[PeriodicOutcomeId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[TimePeriod] [smallint] NULL,
	[OutcomeValue] [nvarchar](50) NULL,
	[IsFinal] [bit] NULL,
 CONSTRAINT [PK_PeriodicOutcome] PRIMARY KEY CLUSTERED 
(
	[PeriodicOutcomeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostcodeLookup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostcodeLookup](
	[PostcodeLookupId] [uniqueidentifier] NOT NULL,
	[Pcd2] [nvarchar](20) NULL,
	[Pcd2NoSpaces] [nvarchar](20) NULL,
 CONSTRAINT [PK_PostcodeLookup] PRIMARY KEY CLUSTERED 
(
	[PostcodeLookupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportingFeatureFlags]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportingFeatureFlags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IncludeNTBS] [bit] NULL,
	[SourceUsersFromNTBS] [bit] NULL,
	[Comment] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReusableNotification_bkup20200706]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReusableNotification_bkup20200706](
	[ReusableNotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [uniqueidentifier] NOT NULL,
	[EtsId] [bigint] NULL,
	[LtbrId] [nvarchar](50) NULL,
	[NotificationDate] [date] NOT NULL,
	[CaseManager] [nvarchar](101) NULL,
	[Consultant] [nvarchar](255) NULL,
	[HospitalId] [nvarchar](36) NULL,
	[Hospital] [nvarchar](255) NULL,
	[TBServiceCode] [nvarchar](50) NULL,
	[Service] [nvarchar](150) NULL,
	[NhsNumber] [nvarchar](50) NULL,
	[Forename] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Age] [tinyint] NULL,
	[Sex] [varchar](30) NULL,
	[UkBorn] [varchar](30) NULL,
	[EthnicGroup] [varchar](255) NULL,
	[BirthCountry] [varchar](255) NULL,
	[UkEntryYear] [int] NULL,
	[Postcode] [nvarchar](20) NULL,
	[NoFixedAbode] [nvarchar](30) NULL,
	[LocalAuthority] [nvarchar](50) NULL,
	[LocalAuthorityCode] [nvarchar](50) NULL,
	[ResidencePhecCode] [nvarchar](50) NULL,
	[ResidencePhec] [nvarchar](50) NULL,
	[TreatmentPhecCode] [nvarchar](50) NULL,
	[TreatmentPhec] [nvarchar](50) NULL,
	[SymptomOnsetDate] [date] NULL,
	[PresentedDate] [date] NULL,
	[OnsetToPresentationDays] [smallint] NULL,
	[DiagnosisDate] [date] NULL,
	[PresentationToDiagnosisDays] [smallint] NULL,
	[StartOfTreatmentDate] [date] NULL,
	[DiagnosisToTreatmentDays] [smallint] NULL,
	[OnsetToTreatmentDays] [smallint] NULL,
	[HivTestOffered] [nvarchar](255) NULL,
	[SiteOfDisease] [nvarchar](50) NULL,
	[AdultContactsIdentified] [int] NULL,
	[ChildContactsIdentified] [int] NULL,
	[TotalContactsIdentified] [int] NULL,
	[AdultContactsAssessed] [int] NULL,
	[ChildContactsAssessed] [int] NULL,
	[TotalContactsAssessed] [int] NULL,
	[AdultContactsActiveTB] [int] NULL,
	[ChildContactsActiveTB] [int] NULL,
	[TotalContactsActiveTB] [int] NULL,
	[AdultContactsLTBI] [int] NULL,
	[ChildContactsLTBI] [int] NULL,
	[TotalContactsLTBI] [int] NULL,
	[AdultContactsLTBITreat] [int] NULL,
	[ChildContactsLTBITreat] [int] NULL,
	[TotalContactsLTBITreat] [int] NULL,
	[AdultContactsLTBITreatComplete] [int] NULL,
	[ChildContactsLTBITreatComplete] [int] NULL,
	[TotalContactsLTBITreatComplete] [int] NULL,
	[PreviouslyDiagnosed] [varchar](30) NULL,
	[YearsSinceDiagnosis] [tinyint] NULL,
	[PreviouslyTreated] [varchar](30) NULL,
	[TreatmentInUk] [varchar](30) NULL,
	[PreviousId] [nvarchar](50) NULL,
	[BcgVaccinated] [varchar](30) NULL,
	[AnySocialRiskFactor] [varchar](40) NULL,
	[AlcoholMisuse] [varchar](30) NULL,
	[DrugMisuse] [varchar](30) NULL,
	[CurrentDrugMisuse] [varchar](30) NULL,
	[DrugMisuseInLast5Years] [varchar](30) NULL,
	[DrugMisuseMoreThan5YearsAgo] [varchar](30) NULL,
	[Homeless] [varchar](30) NULL,
	[CurrentlyHomeless] [varchar](30) NULL,
	[HomelessInLast5Years] [varchar](30) NULL,
	[HomelessMoreThan5YearsAgo] [varchar](30) NULL,
	[Prison] [varchar](30) NULL,
	[CurrentlyInPrisonOrInPrisonWhenFirstSeen] [varchar](30) NULL,
	[InPrisonInLast5Years] [varchar](30) NULL,
	[InPrisonMoreThan5YearsAgo] [varchar](30) NULL,
	[TravelledOutsideUk] [varchar](30) NULL,
	[ToHowManyCountries] [nvarchar](5) NULL,
	[TravelCountry1] [nvarchar](255) NULL,
	[MonthsTravelled1] [int] NULL,
	[TravelCountry2] [nvarchar](255) NULL,
	[MonthsTravelled2] [int] NULL,
	[TravelCountry3] [nvarchar](255) NULL,
	[MonthsTravelled3] [int] NULL,
	[ReceivedVisitors] [varchar](30) NULL,
	[FromHowManyCountries] [nvarchar](5) NULL,
	[VisitorCountry1] [nvarchar](255) NULL,
	[DaysVisitorsStayed1] [nvarchar](50) NULL,
	[VisitorCountry2] [nvarchar](255) NULL,
	[DaysVisitorsStayed2] [nvarchar](50) NULL,
	[VisitorCountry3] [nvarchar](255) NULL,
	[DaysVisitorsStayed3] [nvarchar](50) NULL,
	[Diabetes] [varchar](30) NULL,
	[HepatitisB] [varchar](30) NULL,
	[HepatitisC] [varchar](30) NULL,
	[ChronicLiverDisease] [varchar](30) NULL,
	[ChronicRenalDisease] [varchar](30) NULL,
	[ImmunoSuppression] [varchar](30) NULL,
	[BiologicalTherapy] [varchar](100) NULL,
	[Transplantation] [varchar](30) NULL,
	[OtherImmunoSuppression] [varchar](30) NULL,
	[CurrentSmoker] [varchar](30) NULL,
	[PostMortemDiagnosis] [varchar](30) NULL,
	[DidNotStartTreatment] [varchar](30) NULL,
	[ShortCourse] [varchar](30) NULL,
	[MdrTreatment] [varchar](30) NULL,
	[MdrTreatmentDate] [date] NULL,
	[TreatmentOutcome12months] [varchar](30) NULL,
	[TreatmentOutcome24months] [varchar](30) NULL,
	[TreatmentOutcome36months] [varchar](30) NULL,
	[LastRecordedTreatmentOutcome] [varchar](30) NULL,
	[DateOfDeath] [date] NULL,
	[TreatmentEndDate] [date] NULL,
	[NoSampleTaken] [varchar](30) NULL,
	[CulturePositive] [varchar](30) NULL,
	[Species] [varchar](50) NULL,
	[EarliestSpecimenDate] [date] NULL,
	[DrugResistanceProfile] [varchar](30) NULL,
	[INH] [varchar](30) NULL,
	[RIF] [varchar](30) NULL,
	[EMB] [varchar](30) NULL,
	[PZA] [varchar](30) NULL,
	[AMINO] [varchar](30) NULL,
	[QUIN] [varchar](30) NULL,
	[MDR] [varchar](30) NULL,
	[XDR] [varchar](30) NULL,
	[RecordCreateDate] [datetime] NULL,
	[DataRefreshedAt] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReusableNotification_ETS]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReusableNotification_ETS](
	[ReusableNotificationId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[NtbsId] [int] NULL,
	[EtsId] [bigint] NULL,
	[SourceSystem] [nvarchar](50) NOT NULL,
	[LtbrId] [nvarchar](50) NULL,
	[NotificationDate] [date] NOT NULL,
	[CaseManager] [nvarchar](101) NULL,
	[Consultant] [nvarchar](255) NULL,
	[HospitalId] [nvarchar](36) NULL,
	[Hospital] [nvarchar](255) NULL,
	[TBServiceCode] [nvarchar](50) NULL,
	[Service] [nvarchar](150) NULL,
	[NhsNumber] [nvarchar](50) NULL,
	[Forename] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Age] [tinyint] NULL,
	[Sex] [varchar](30) NULL,
	[UkBorn] [varchar](30) NULL,
	[EthnicGroup] [varchar](255) NULL,
	[BirthCountry] [varchar](255) NULL,
	[UkEntryYear] [int] NULL,
	[Postcode] [nvarchar](20) NULL,
	[NoFixedAbode] [nvarchar](30) NULL,
	[LocalAuthority] [nvarchar](50) NULL,
	[LocalAuthorityCode] [nvarchar](50) NULL,
	[ResidencePhecCode] [nvarchar](50) NULL,
	[ResidencePhec] [nvarchar](50) NULL,
	[TreatmentPhecCode] [nvarchar](50) NULL,
	[TreatmentPhec] [nvarchar](50) NULL,
	[SymptomOnsetDate] [date] NULL,
	[PresentedDate] [date] NULL,
	[OnsetToPresentationDays] [int] NULL,
	[DiagnosisDate] [date] NULL,
	[PresentationToDiagnosisDays] [int] NULL,
	[StartOfTreatmentDate] [date] NULL,
	[DiagnosisToTreatmentDays] [int] NULL,
	[OnsetToTreatmentDays] [int] NULL,
	[HivTestOffered] [nvarchar](255) NULL,
	[SiteOfDisease] [nvarchar](50) NULL,
	[AdultContactsIdentified] [int] NULL,
	[ChildContactsIdentified] [int] NULL,
	[TotalContactsIdentified] [int] NULL,
	[AdultContactsAssessed] [int] NULL,
	[ChildContactsAssessed] [int] NULL,
	[TotalContactsAssessed] [int] NULL,
	[AdultContactsActiveTB] [int] NULL,
	[ChildContactsActiveTB] [int] NULL,
	[TotalContactsActiveTB] [int] NULL,
	[AdultContactsLTBI] [int] NULL,
	[ChildContactsLTBI] [int] NULL,
	[TotalContactsLTBI] [int] NULL,
	[AdultContactsLTBITreat] [int] NULL,
	[ChildContactsLTBITreat] [int] NULL,
	[TotalContactsLTBITreat] [int] NULL,
	[AdultContactsLTBITreatComplete] [int] NULL,
	[ChildContactsLTBITreatComplete] [int] NULL,
	[TotalContactsLTBITreatComplete] [int] NULL,
	[PreviouslyDiagnosed] [varchar](30) NULL,
	[YearsSinceDiagnosis] [int] NULL,
	[PreviouslyTreated] [varchar](30) NULL,
	[TreatmentInUk] [varchar](30) NULL,
	[PreviousId] [nvarchar](50) NULL,
	[BcgVaccinated] [varchar](30) NULL,
	[AnySocialRiskFactor] [varchar](40) NULL,
	[AlcoholMisuse] [varchar](30) NULL,
	[DrugMisuse] [varchar](30) NULL,
	[CurrentDrugMisuse] [varchar](30) NULL,
	[DrugMisuseInLast5Years] [varchar](30) NULL,
	[DrugMisuseMoreThan5YearsAgo] [varchar](30) NULL,
	[Homeless] [varchar](30) NULL,
	[CurrentlyHomeless] [varchar](30) NULL,
	[HomelessInLast5Years] [varchar](30) NULL,
	[HomelessMoreThan5YearsAgo] [varchar](30) NULL,
	[Prison] [varchar](30) NULL,
	[CurrentlyInPrisonOrInPrisonWhenFirstSeen] [varchar](30) NULL,
	[InPrisonInLast5Years] [varchar](30) NULL,
	[InPrisonMoreThan5YearsAgo] [varchar](30) NULL,
	[TravelledOutsideUk] [varchar](30) NULL,
	[ToHowManyCountries] [nvarchar](5) NULL,
	[TravelCountry1] [nvarchar](255) NULL,
	[MonthsTravelled1] [int] NULL,
	[TravelCountry2] [nvarchar](255) NULL,
	[MonthsTravelled2] [int] NULL,
	[TravelCountry3] [nvarchar](255) NULL,
	[MonthsTravelled3] [int] NULL,
	[ReceivedVisitors] [varchar](30) NULL,
	[FromHowManyCountries] [nvarchar](5) NULL,
	[VisitorCountry1] [nvarchar](255) NULL,
	[DaysVisitorsStayed1] [nvarchar](50) NULL,
	[VisitorCountry2] [nvarchar](255) NULL,
	[DaysVisitorsStayed2] [nvarchar](50) NULL,
	[VisitorCountry3] [nvarchar](255) NULL,
	[DaysVisitorsStayed3] [nvarchar](50) NULL,
	[Diabetes] [varchar](30) NULL,
	[HepatitisB] [varchar](30) NULL,
	[HepatitisC] [varchar](30) NULL,
	[ChronicLiverDisease] [varchar](30) NULL,
	[ChronicRenalDisease] [varchar](30) NULL,
	[ImmunoSuppression] [varchar](30) NULL,
	[BiologicalTherapy] [varchar](100) NULL,
	[Transplantation] [varchar](30) NULL,
	[OtherImmunoSuppression] [varchar](30) NULL,
	[CurrentSmoker] [varchar](30) NULL,
	[PostMortemDiagnosis] [varchar](30) NULL,
	[DidNotStartTreatment] [varchar](30) NULL,
	[ShortCourse] [varchar](30) NULL,
	[MdrTreatment] [varchar](30) NULL,
	[MdrTreatmentDate] [date] NULL,
	[TreatmentOutcome12months] [varchar](30) NULL,
	[TreatmentOutcome24months] [varchar](30) NULL,
	[TreatmentOutcome36months] [varchar](30) NULL,
	[LastRecordedTreatmentOutcome] [varchar](30) NULL,
	[DateOfDeath] [date] NULL,
	[TreatmentEndDate] [date] NULL,
	[NoSampleTaken] [varchar](30) NULL,
	[CulturePositive] [varchar](30) NULL,
	[Species] [varchar](50) NULL,
	[EarliestSpecimenDate] [date] NULL,
	[DrugResistanceProfile] [varchar](30) NULL,
	[INH] [varchar](30) NULL,
	[RIF] [varchar](30) NULL,
	[EMB] [varchar](30) NULL,
	[PZA] [varchar](30) NULL,
	[AMINO] [varchar](30) NULL,
	[QUIN] [varchar](30) NULL,
	[MDR] [varchar](30) NULL,
	[XDR] [varchar](30) NULL,
	[DataRefreshedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ReusableNotification_ETS] PRIMARY KEY CLUSTERED 
(
	[ReusableNotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SampleMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SampleMapping](
	[SampleId] [int] IDENTITY(1,1) NOT NULL,
	[SampleName] [nvarchar](50) NOT NULL,
	[SampleRank] [int] NULL,
 CONSTRAINT [PK_SampleId] PRIMARY KEY CLUSTERED 
(
	[SampleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SGSS_MTBC_Isolates]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SGSS_MTBC_Isolates](
	[WEEK_OF_YEAR] [smallint] NOT NULL,
	[CALENDAR_YEAR] [varchar](4) NOT NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SGSS_MTBC_Isolates_tmp]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SGSS_MTBC_Isolates_tmp](
	[WEEK_OF_YEAR] [smallint] NOT NULL,
	[CALENDAR_YEAR] [varchar](4) NOT NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SGSS_MTBC_Patients]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SGSS_MTBC_Patients](
	[WEEK_OF_YEAR] [smallint] NOT NULL,
	[CALENDAR_YEAR] [varchar](4) NOT NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SGSS_MTBC_Patients_tmp]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SGSS_MTBC_Patients_tmp](
	[WEEK_OF_YEAR] [smallint] NOT NULL,
	[CALENDAR_YEAR] [varchar](4) NOT NULL,
	[Total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteOfDisease]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteOfDisease](
	[SiteOfDiseaseId] [tinyint] IDENTITY(1,1) NOT NULL,
	[SiteOfDisease] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SiteOfDisease] PRIMARY KEY CLUSTERED 
(
	[SiteOfDiseaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialRiskFactors]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialRiskFactors](
	[SocialRiskFactorId] [tinyint] IDENTITY(1,1) NOT NULL,
	[SocialRiskFactor] [varchar](40) NOT NULL,
 CONSTRAINT [PK_SocialRiskFactors] PRIMARY KEY CLUSTERED 
(
	[SocialRiskFactorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Species]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[SpeciesId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Species] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[SpeciesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandardisedETSLaboratoryResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandardisedETSLaboratoryResult](
	[NotificationId] [bigint] NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[OpieId] [nvarchar](36) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TemplateText]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemplateText](
	[TemplateTextId] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [varchar](100) NOT NULL,
	[Text] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_TemplateText] PRIMARY KEY CLUSTERED 
(
	[TemplateTextId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TreatmentOrResidence]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreatmentOrResidence](
	[TreatmentOrResidenceId] [tinyint] IDENTITY(1,1) NOT NULL,
	[TreatmentOrResidence] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TreatmentOrResidence] PRIMARY KEY CLUSTERED 
(
	[TreatmentOrResidenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TreatmentOutcomeTimePeriod]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreatmentOutcomeTimePeriod](
	[TreatmentOutcomeTimePeriodId] [tinyint] IDENTITY(1,1) NOT NULL,
	[TreatmentOutcomeTimePeriod] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TreatmentOutcomeTimePeriod] PRIMARY KEY CLUSTERED 
(
	[TreatmentOutcomeTimePeriodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UkBorn]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UkBorn](
	[UkBornId] [tinyint] IDENTITY(1,1) NOT NULL,
	[UkBorn] [varchar](10) NOT NULL,
 CONSTRAINT [PK_UkBorn] PRIMARY KEY CLUSTERED 
(
	[UkBorn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](64) NOT NULL,
	[GivenName] [nvarchar](64) NULL,
	[FamilyName] [nvarchar](64) NULL,
	[AdGroups] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](64) NULL,
	[IsActive] [bit] NOT NULL,
	[IsCaseManager] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_bkup20200706]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_bkup20200706](
	[Username] [nvarchar](64) NOT NULL,
	[GivenName] [nvarchar](64) NULL,
	[FamilyName] [nvarchar](64) NULL,
	[AdGroups] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](64) NULL,
	[IsActive] [bit] NOT NULL,
	[IsCaseManager] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLookup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ACCOUNTNAME] [nvarchar](100) NULL,
	[TYPE] [char](8) NULL,
	[PRIVILEGE] [char](9) NULL,
	[MAPPEDLOGINNAME] [nvarchar](50) NULL,
	[SYSNAME] [nvarchar](50) NULL,
	[PERMISSIONPATH] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Boilerplate_NotificationId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Boilerplate_NotificationId] ON [dbo].[Boilerplate]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CultureResistance_NotificationId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_CultureResistance_NotificationId] ON [dbo].[CultureResistance]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DataQuality_NotificationId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_DataQuality_NotificationId] ON [dbo].[DataQuality]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ErrorLog_ErrorDateTime]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ErrorLog_ErrorDateTime] ON [dbo].[ErrorLog]
(
	[ErrorDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ErrorLog_UserName]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ErrorLog_UserName] ON [dbo].[ErrorLog]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LabSpecimen_ReferenceLaboratoryNumber]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_LabSpecimen_ReferenceLaboratoryNumber] ON [dbo].[LabSpecimen]
(
	[ReferenceLaboratoryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ManualLabResult_EtsId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ManualLabResult_EtsId] ON [dbo].[ManualLabResult]
(
	[EtsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ManualLabResultAll_EtsId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ManualLabResultAll_EtsId] ON [dbo].[ManualLabResult]
(
	[EtsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ManualLabResultMicroscopy_EtsId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ManualLabResultMicroscopy_EtsId] ON [dbo].[ManualLabResult]
(
	[EtsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NotificationClusterMatch_ClusterId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_NotificationClusterMatch_ClusterId] ON [dbo].[NotificationClusterMatch]
(
	[ClusterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Organism_OrganismId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Organism_OrganismId] ON [dbo].[Organism]
(
	[OrganismId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Organism_SortOrder]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Organism_SortOrder] ON [dbo].[Organism]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutcomeSummary_NotificationId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_OutcomeSummary_NotificationId] ON [dbo].[OutcomeSummary]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Phec_PhecCode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_PhecCode] ON [dbo].[Phec]
(
	[PhecCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Phec_PhecName]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_PhecName] ON [dbo].[Phec]
(
	[PhecName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Phec_SortOrder]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_SortOrder] ON [dbo].[Phec]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PhecAdGroup_AdGroupId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_PhecAdGroup_AdGroupId] ON [dbo].[PhecAdGroup]
(
	[AdGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PhecAdGroup_PhecId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_PhecAdGroup_PhecId] ON [dbo].[PhecAdGroup]
(
	[PhecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PostcodeLookup_Pcd2]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_PostcodeLookup_Pcd2] ON [dbo].[PostcodeLookup]
(
	[Pcd2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PostcodeLookup_Pcd2NoSpaces]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_PostcodeLookup_Pcd2NoSpaces] ON [dbo].[PostcodeLookup]
(
	[Pcd2NoSpaces] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReusableNotification_Age]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_Age] ON [dbo].[ReusableNotification]
(
	[Age] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_AlcoholMisuse]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_AlcoholMisuse] ON [dbo].[ReusableNotification]
(
	[AlcoholMisuse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_AnySocialRiskFactor]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_AnySocialRiskFactor] ON [dbo].[ReusableNotification]
(
	[AnySocialRiskFactor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_ChronicLiverDisease]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_ChronicLiverDisease] ON [dbo].[ReusableNotification]
(
	[ChronicLiverDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_ChronicRenalDisease]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_ChronicRenalDisease] ON [dbo].[ReusableNotification]
(
	[ChronicRenalDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_CurrentDrugMisuse]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_CurrentDrugMisuse] ON [dbo].[ReusableNotification]
(
	[CurrentDrugMisuse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_CurrentlyHomeless]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_CurrentlyHomeless] ON [dbo].[ReusableNotification]
(
	[CurrentlyHomeless] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_CurrentlyInPrisonOrInPrisonWhenFirstSeen]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_CurrentlyInPrisonOrInPrisonWhenFirstSeen] ON [dbo].[ReusableNotification]
(
	[CurrentlyInPrisonOrInPrisonWhenFirstSeen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_CurrentSmoker]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_CurrentSmoker] ON [dbo].[ReusableNotification]
(
	[CurrentSmoker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_Diabetes]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_Diabetes] ON [dbo].[ReusableNotification]
(
	[Diabetes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_DrugResistanceProfile]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_DrugResistanceProfile] ON [dbo].[ReusableNotification]
(
	[DrugResistanceProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_HepatitisB]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_HepatitisB] ON [dbo].[ReusableNotification]
(
	[HepatitisB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_HepatitisC]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_HepatitisC] ON [dbo].[ReusableNotification]
(
	[HepatitisC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_LocalAuthority]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_LocalAuthority] ON [dbo].[ReusableNotification]
(
	[LocalAuthority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReusableNotification_NotificationDate]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_NotificationDate] ON [dbo].[ReusableNotification]
(
	[NotificationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReusableNotification_NotificationId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_NotificationId] ON [dbo].[ReusableNotification]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_Postcode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_Postcode] ON [dbo].[ReusableNotification]
(
	[Postcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_ResidencePhec]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_ResidencePhec] ON [dbo].[ReusableNotification]
(
	[ResidencePhec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_ResidencePhecCode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_ResidencePhecCode] ON [dbo].[ReusableNotification]
(
	[ResidencePhecCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_Service]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_Service] ON [dbo].[ReusableNotification]
(
	[Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_SiteOfDisease]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_SiteOfDisease] ON [dbo].[ReusableNotification]
(
	[SiteOfDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_Species]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_Species] ON [dbo].[ReusableNotification]
(
	[Species] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_TBServiceCode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_TBServiceCode] ON [dbo].[ReusableNotification]
(
	[TBServiceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_TreatmentPhec]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_TreatmentPhec] ON [dbo].[ReusableNotification]
(
	[TreatmentPhec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_TreatmentPhecCode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_TreatmentPhecCode] ON [dbo].[ReusableNotification]
(
	[TreatmentPhecCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ReusableNotification_UkBorn]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_UkBorn] ON [dbo].[ReusableNotification]
(
	[UkBorn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_reusableNotification_ETS_Age]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_Age] ON [dbo].[ReusableNotification_ETS]
(
	[Age] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_AlcoholMisuse]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_AlcoholMisuse] ON [dbo].[ReusableNotification_ETS]
(
	[AlcoholMisuse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_AnySocialRiskFactor]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_AnySocialRiskFactor] ON [dbo].[ReusableNotification_ETS]
(
	[AnySocialRiskFactor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_ChronicLiverDisease]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_ChronicLiverDisease] ON [dbo].[ReusableNotification_ETS]
(
	[ChronicLiverDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_ChronicRenalDisease]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_ChronicRenalDisease] ON [dbo].[ReusableNotification_ETS]
(
	[ChronicRenalDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_CurrentDrugMisuse]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_CurrentDrugMisuse] ON [dbo].[ReusableNotification_ETS]
(
	[CurrentDrugMisuse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_CurrentlyHomeless]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_CurrentlyHomeless] ON [dbo].[ReusableNotification_ETS]
(
	[CurrentlyHomeless] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_CurrentlyInPrisonOrInPrisonWhenFirstSeen]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_CurrentlyInPrisonOrInPrisonWhenFirstSeen] ON [dbo].[ReusableNotification_ETS]
(
	[CurrentlyInPrisonOrInPrisonWhenFirstSeen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_CurrentSmoker]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_CurrentSmoker] ON [dbo].[ReusableNotification_ETS]
(
	[CurrentSmoker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_Diabetes]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_Diabetes] ON [dbo].[ReusableNotification_ETS]
(
	[Diabetes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_DrugResistanceProfile]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_DrugResistanceProfile] ON [dbo].[ReusableNotification_ETS]
(
	[DrugResistanceProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_HepatitisB]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_HepatitisB] ON [dbo].[ReusableNotification_ETS]
(
	[HepatitisB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_HepatitisC]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_HepatitisC] ON [dbo].[ReusableNotification_ETS]
(
	[HepatitisC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_LocalAuthority]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_LocalAuthority] ON [dbo].[ReusableNotification_ETS]
(
	[LocalAuthority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReusableNotification_ETS_NotificationDate]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_ETS_NotificationDate] ON [dbo].[ReusableNotification_ETS]
(
	[NotificationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReusableNotification_ETS_NotificationId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ReusableNotification_ETS_NotificationId] ON [dbo].[ReusableNotification_ETS]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_Postcode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_Postcode] ON [dbo].[ReusableNotification_ETS]
(
	[Postcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_ResidencePhec]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_ResidencePhec] ON [dbo].[ReusableNotification_ETS]
(
	[ResidencePhec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_ResidencePhecCode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_ResidencePhecCode] ON [dbo].[ReusableNotification_ETS]
(
	[ResidencePhecCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_Service]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_Service] ON [dbo].[ReusableNotification_ETS]
(
	[Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_SiteOfDisease]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_SiteOfDisease] ON [dbo].[ReusableNotification_ETS]
(
	[SiteOfDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_Species]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_Species] ON [dbo].[ReusableNotification_ETS]
(
	[Species] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_TBServiceCode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_TBServiceCode] ON [dbo].[ReusableNotification_ETS]
(
	[TBServiceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_TreatmentPhec]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_TreatmentPhec] ON [dbo].[ReusableNotification_ETS]
(
	[TreatmentPhec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_TreatmentPhecCode]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_TreatmentPhecCode] ON [dbo].[ReusableNotification_ETS]
(
	[TreatmentPhecCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_reusableNotification_ETS_UkBorn]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_reusableNotification_ETS_UkBorn] ON [dbo].[ReusableNotification_ETS]
(
	[UkBorn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SampleMapping_SampleName]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_SampleMapping_SampleName] ON [dbo].[SampleMapping]
(
	[SampleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceAdGroup_AdGroupId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ServiceAdGroup_AdGroupId] ON [dbo].[ServiceAdGroup]
(
	[AdGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceAdGroup_ServiceId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_ServiceAdGroup_ServiceId] ON [dbo].[ServiceAdGroup]
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StandardisedETSLaboratoryResult_NotificationId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_StandardisedETSLaboratoryResult_NotificationId] ON [dbo].[StandardisedETSLaboratoryResult]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StandardisedETSLaboratoryResult_OpieId]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_StandardisedETSLaboratoryResult_OpieId] ON [dbo].[StandardisedETSLaboratoryResult]
(
	[OpieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LabbaseSpecimen_ReferenceLaboratoryNumber]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_LabbaseSpecimen_ReferenceLaboratoryNumber] ON [dbo].[StandardisedLabbaseSpecimen]
(
	[ReferenceLaboratoryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LabBaseSusceptibilityResult_ReferenceLaboratoryNumber]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_LabBaseSusceptibilityResult_ReferenceLaboratoryNumber] ON [dbo].[StandardisedLabbaseSusceptibilityResult]
(
	[ReferenceLaboratoryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Phec_Phec_Code]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_Phec_Code] ON [dbo].[TB_Service]
(
	[PHEC_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Phec_phecid]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_phecid] ON [dbo].[TB_Service]
(
	[phecid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Phec_PhecName]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_PhecName] ON [dbo].[TB_Service]
(
	[PhecName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Phec_SortOrder]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_SortOrder] ON [dbo].[TB_Service]
(
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Phec_TB_Service_Code]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_TB_Service_Code] ON [dbo].[TB_Service]
(
	[TB_Service_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Phec_TB_Service_Name]    Script Date: 09/04/2021 15:21:24 ******/
CREATE NONCLUSTERED INDEX [IX_Phec_TB_Service_Name] ON [dbo].[TB_Service]
(
	[TB_Service_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[__MigrationLog] ADD  DEFAULT ((0)) FOR [WasSuccessful]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [CulturePositiveCases]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [NonCulturePositiveCases]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [SensitiveToAll4FirstLineDrugs]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [InhRes]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [Other]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [MdrRr]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [Xdr]
GO
ALTER TABLE [dbo].[CultureResistance] ADD  DEFAULT ((0)) FOR [IncompleteDrugResistanceProfile]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [TreatmentEndDate]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [TreatmentOutcome12Months]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [TreatmentOutcome24Months]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [TreatmentOutcome36Months]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [DateOfDeath]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [DateOfBirth]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [UKBorn]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [SiteOfDisease]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [Denotify]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [OnsetToPresentationDays]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [PresentationToDiagnosisDays]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [DiagnosisToTreatmentDays]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [OnsetToTreatmentDays]
GO
ALTER TABLE [dbo].[DataQuality] ADD  DEFAULT ((0)) FOR [Postcode]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  DEFAULT (getutcdate()) FOR [ErrorDateTime]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentCompletedLastOutcome]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [DiedLastOutcome]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [LostToFollowUpLastOutcome]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [StillOnTreatmentLastOutcome]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentStoppedLastOutcome]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [NotEvaluatedLastOutcome]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [UnknownLastOutcome]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentCompleted12Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [Died12Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [LostToFollowUp12Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [StillOnTreatment12Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentStopped12Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [NotEvaluated12Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [Unknown12Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentCompleted24Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [Died24Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [LostToFollowUp24Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [StillOnTreatment24Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentStopped24Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [NotEvaluated24Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [Unknown24Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentCompleted36Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [Died36Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [LostToFollowUp36Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [StillOnTreatment36Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [TreatmentStopped36Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [NotEvaluated36Month]
GO
ALTER TABLE [dbo].[OutcomeSummary] ADD  DEFAULT ((0)) FOR [Unknown36Month]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [IsCaseManager]
GO
ALTER TABLE [dbo].[DrugResistanceProfile]  WITH CHECK ADD  CONSTRAINT [FK_DrugResistanceProfile_Resistant] FOREIGN KEY([ResistantId])
REFERENCES [dbo].[Resistant] ([ResistantId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DrugResistanceProfile] CHECK CONSTRAINT [FK_DrugResistanceProfile_Resistant]
GO
ALTER TABLE [dbo].[OrganismNameMapping]  WITH CHECK ADD  CONSTRAINT [FK_OrganismNameMapping_Organism] FOREIGN KEY([OrganismId])
REFERENCES [dbo].[Organism] ([OrganismId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrganismNameMapping] CHECK CONSTRAINT [FK_OrganismNameMapping_Organism]
GO
/****** Object:  StoredProcedure [dbo].[sp_execute_script]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_execute_script]
	@sql nvarchar(MAX),
	@author nvarchar(250),
	@build nvarchar(50) = NULL
AS
	DECLARE @sqlHash binary(64) = HASHBYTES('SHA2_512', @sql);

	IF NOT EXISTS (
		SELECT 1 
		FROM [dbo].[__MigrationLog]
		WHERE SqlHash = @sqlHash
			AND WasSuccessful = 1
	)
	BEGIN
		BEGIN TRY
			IF NOT EXISTS (
				SELECT 1 
				FROM [dbo].[__MigrationLog]
				WHERE SqlHash = @sqlHash
			)
			BEGIN
				INSERT INTO [dbo].[__MigrationLog]
					([SqlHash], [StartTime], [SqlText], [Author], [Build])
				VALUES(@sqlHash, SYSUTCDATETIME(), @sql, @author, @build)     
			END
			ELSE BEGIN
				UPDATE [dbo].[__MigrationLog]
				SET [StartTime] = SYSUTCDATETIME(),
					--not so likely to change but just in case..
					SqlText = @sql,
					Author = @author,
					Build = @build
				WHERE SqlHash = @sqlHash 
			END
			
			BEGIN TRANSACTION
				PRINT 'Executing ' + CONVERT(varchar(max), @sqlHash, 1) + 
					': ' + LEFT(@sql, 15) + '...';

/*				EXECUTE [$(msdb)].sys.sp_executesql @sql; */
			
				UPDATE [dbo].[__MigrationLog]
				SET [EndTime] = SYSUTCDATETIME(),
					Error = NULL,
					WasSuccessful = 1
				WHERE SqlHash = @sqlHash

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION;

			UPDATE [dbo].[__MigrationLog]
			SET [EndTime] = SYSUTCDATETIME(),
				WasSuccessful = 0,
				Error = FORMATMESSAGE('%d: %s. ', ERROR_NUMBER(), ERROR_MESSAGE())
			WHERE SqlHash = @sqlHash; 
			-- throw again
			THROW
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_generate_merge]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Downloaded from https://github.com/readyroll/generate-sql-merge

CREATE PROC [dbo].[sp_generate_merge]
(
 @table_name varchar(776), -- The table/view for which the MERGE statement will be generated using the existing data
 @target_table varchar(776) = NULL, -- Use this parameter to specify a different table name into which the data will be inserted/updated/deleted
 @from nvarchar(max) = NULL, -- Use this parameter to filter the rows based on a filter condition (using WHERE)
 @include_timestamp bit = 0, -- Specify 1 for this parameter, if you want to include the TIMESTAMP/ROWVERSION column's data in the MERGE statement
 @debug_mode bit = 0, -- If @debug_mode is set to 1, the SQL statements constructed by this procedure will be printed for later examination
 @schema varchar(64) = NULL, -- Use this parameter if you are not the owner of the table
 @ommit_images bit = 0, -- Use this parameter to generate MERGE statement by omitting the 'image' columns
 @ommit_identity bit = 0, -- Use this parameter to ommit the identity columns
 @top int = NULL, -- Use this parameter to generate a MERGE statement only for the TOP n rows
 @cols_to_include varchar(8000) = NULL, -- List of columns to be included in the MERGE statement
 @cols_to_exclude varchar(8000) = NULL, -- List of columns to be excluded from the MERGE statement
 @update_only_if_changed bit = 1, -- When 1, only performs an UPDATE operation if an included column in a matched row has changed.
 @delete_if_not_matched bit = 1, -- When 1, deletes unmatched source rows from target, when 0 source rows will only be used to update existing rows or insert new.
 @disable_constraints bit = 0, -- When 1, disables foreign key constraints and enables them after the MERGE statement
 @ommit_computed_cols bit = 0, -- When 1, computed columns will not be included in the MERGE statement
 @include_use_db bit = 1, -- When 1, includes a USE [DatabaseName] statement at the beginning of the generated batch
 @results_to_text bit = 0, -- When 1, outputs results to grid/messages window. When 0, outputs MERGE statement in an XML fragment.
 @include_rowsaffected bit = 1, -- When 1, a section is added to the end of the batch which outputs rows affected by the MERGE
 @nologo bit = 0, -- When 1, the "About" comment is suppressed from output
 @batch_separator VARCHAR(50) = 'GO' -- Batch separator to use
)
AS
BEGIN

/***********************************************************************************************************
Procedure: sp_generate_merge (Version 0.93)
 (Adapted by Daniel Nolan for SQL Server 2008/2012)

Adapted from: sp_generate_inserts (Build 22) 
 (Copyright © 2002 Narayana Vyas Kondreddi. All rights reserved.)

Purpose: To generate a MERGE statement from existing data, which will INSERT/UPDATE/DELETE data based
 on matching primary key values in the source/target table.
 
 The generated statements can be executed to replicate the data in some other location.
 
 Typical use cases:
 * Generate statements for static data tables, store the .SQL file in source control and use 
 it as part of your Dev/Test/Prod deployment. The generated statements are re-runnable, so 
 you can make changes to the file and migrate those changes between environments.
 
 * Generate statements from your Production tables and then run those statements in your 
 Dev/Test environments. Schedule this as part of a SQL Job to keep all of your environments 
 in-sync.
 
 * Enter test data into your Dev environment, and then generate statements from the Dev
 tables so that you can always reproduce your test database with valid sample data.
 

Written by: Narayana Vyas Kondreddi
 http://vyaskn.tripod.com

 Daniel Nolan
 http://danere.com
 @dan3r3

Acknowledgements (sp_generate_merge):
 Nathan Skerl -- StackOverflow answer that provided a workaround for the output truncation problem
 http://stackoverflow.com/a/10489767/266882

 Bill Gibson -- Blog that detailed the static data table use case; the inspiration for this proc
 http://blogs.msdn.com/b/ssdt/archive/2012/02/02/including-data-in-an-sql-server-database-project.aspx
 
 Bill Graziano -- Blog that provided the groundwork for MERGE statement generation
 http://weblogs.sqlteam.com/billg/archive/2011/02/15/generate-merge-statements-from-a-table.aspx 

Acknowledgements (sp_generate_inserts):
 Divya Kalra -- For beta testing
 Mark Charsley -- For reporting a problem with scripting uniqueidentifier columns with NULL values
 Artur Zeygman -- For helping me simplify a bit of code for handling non-dbo owned tables
 Joris Laperre -- For reporting a regression bug in handling text/ntext columns

Tested on: SQL Server 2008 (10.50.1600), SQL Server 2012 (11.0.2100)

Date created: January 17th 2001 21:52 GMT
Modified: May 1st 2002 19:50 GMT
Last Modified: September 27th 2012 10:00 AEDT

Email: dan@danere.com, vyaskn@hotmail.com

NOTE: This procedure may not work with tables with a large number of columns (> 500).
 Results can be unpredictable with huge text columns or SQL Server 2000's sql_variant data types
 IMPORTANT: This procedure has not been extensively tested with international data (Extended characters or Unicode). If needed
 you might want to convert the datatypes of character variables in this procedure to their respective unicode counterparts
 like nchar and nvarchar

Get Started: Ensure that your SQL client is configured to send results to grid (default SSMS behaviour).
This ensures that the generated MERGE statement can be output in full, getting around SSMS's 4000 nchar limit.
After running this proc, click the hyperlink within the single row returned to copy the generated MERGE statement.

Example 1: To generate a MERGE statement for table 'titles':
 
 EXEC sp_generate_merge 'titles'

Example 2: To generate a MERGE statement for 'titlesCopy' table from 'titles' table:

 EXEC sp_generate_merge 'titles', 'titlesCopy'

Example 3: To generate a MERGE statement for table 'titles' that will unconditionally UPDATE matching rows 
 (ie. not perform a "has data changed?" check prior to going ahead with an UPDATE):
 
 EXEC sp_generate_merge 'titles', @update_only_if_changed = 0

Example 4: To generate a MERGE statement for 'titles' table for only those titles 
 which contain the word 'Computer' in them:
 NOTE: Do not complicate the FROM or WHERE clause here. It's assumed that you are good with T-SQL if you are using this parameter

 EXEC sp_generate_merge 'titles', @from = "from titles where title like '%Computer%'"

Example 5: To specify that you want to include TIMESTAMP column's data as well in the MERGE statement:
 (By default TIMESTAMP column's data is not scripted)

 EXEC sp_generate_merge 'titles', @include_timestamp = 1

Example 6: To print the debug information:

 EXEC sp_generate_merge 'titles', @debug_mode = 1

Example 7: If the table is in a different schema to the default, use @schema parameter to specify the schema name
 To use this option, you must have SELECT permissions on that table

 EXEC sp_generate_merge 'Nickstable', @schema = 'Nick'

Example 8: To generate a MERGE statement for the rest of the columns excluding images

 EXEC sp_generate_merge 'imgtable', @ommit_images = 1

Example 9: To generate a MERGE statement excluding (omitting) IDENTITY columns:
 (By default IDENTITY columns are included in the MERGE statement)

 EXEC sp_generate_merge 'mytable', @ommit_identity = 1

Example 10: To generate a MERGE statement for the TOP 10 rows in the table:
 
 EXEC sp_generate_merge 'mytable', @top = 10

Example 11: To generate a MERGE statement with only those columns you want:
 
 EXEC sp_generate_merge 'titles', @cols_to_include = "'title','title_id','au_id'"

Example 12: To generate a MERGE statement by omitting certain columns:
 
 EXEC sp_generate_merge 'titles', @cols_to_exclude = "'title','title_id','au_id'"

Example 13: To avoid checking the foreign key constraints while loading data with a MERGE statement:
 
 EXEC sp_generate_merge 'titles', @disable_constraints = 1

Example 14: To exclude computed columns from the MERGE statement:

 EXEC sp_generate_merge 'MyTable', @ommit_computed_cols = 1
 
***********************************************************************************************************/

SET NOCOUNT ON


--Making sure user only uses either @cols_to_include or @cols_to_exclude
IF ((@cols_to_include IS NOT NULL) AND (@cols_to_exclude IS NOT NULL))
 BEGIN
 RAISERROR('Use either @cols_to_include or @cols_to_exclude. Do not use both the parameters at once',16,1)
 RETURN -1 --Failure. Reason: Both @cols_to_include and @cols_to_exclude parameters are specified
 END


--Making sure the @cols_to_include and @cols_to_exclude parameters are receiving values in proper format
IF ((@cols_to_include IS NOT NULL) AND (PATINDEX('''%''',@cols_to_include) = 0))
 BEGIN
 RAISERROR('Invalid use of @cols_to_include property',16,1)
 PRINT 'Specify column names surrounded by single quotes and separated by commas'
 PRINT 'Eg: EXEC sp_generate_merge titles, @cols_to_include = "''title_id'',''title''"'
 RETURN -1 --Failure. Reason: Invalid use of @cols_to_include property
 END

IF ((@cols_to_exclude IS NOT NULL) AND (PATINDEX('''%''',@cols_to_exclude) = 0))
 BEGIN
 RAISERROR('Invalid use of @cols_to_exclude property',16,1)
 PRINT 'Specify column names surrounded by single quotes and separated by commas'
 PRINT 'Eg: EXEC sp_generate_merge titles, @cols_to_exclude = "''title_id'',''title''"'
 RETURN -1 --Failure. Reason: Invalid use of @cols_to_exclude property
 END


--Checking to see if the database name is specified along wih the table name
--Your database context should be local to the table for which you want to generate a MERGE statement
--specifying the database name is not allowed
IF (PARSENAME(@table_name,3)) IS NOT NULL
 BEGIN
 RAISERROR('Do not specify the database name. Be in the required database and just specify the table name.',16,1)
 RETURN -1 --Failure. Reason: Database name is specified along with the table name, which is not allowed
 END


--Checking for the existence of 'user table' or 'view'
--This procedure is not written to work on system tables
--To script the data in system tables, just create a view on the system tables and script the view instead
IF @schema IS NULL
 BEGIN
 IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @table_name AND (TABLE_TYPE = 'BASE TABLE' OR TABLE_TYPE = 'VIEW') AND TABLE_SCHEMA = SCHEMA_NAME())
 BEGIN
 RAISERROR('User table or view not found.',16,1)
 PRINT 'You may see this error if the specified table is not in your default schema (' + SCHEMA_NAME() + '). In that case use @schema parameter to specify the schema name.'
 PRINT 'Make sure you have SELECT permission on that table or view.'
 RETURN -1 --Failure. Reason: There is no user table or view with this name
 END
 END
ELSE
 BEGIN
 IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @table_name AND (TABLE_TYPE = 'BASE TABLE' OR TABLE_TYPE = 'VIEW') AND TABLE_SCHEMA = @schema)
 BEGIN
 RAISERROR('User table or view not found.',16,1)
 PRINT 'Make sure you have SELECT permission on that table or view.'
 RETURN -1 --Failure. Reason: There is no user table or view with this name 
 END
 END


--Variable declarations
DECLARE @Column_ID int, 
 @Column_List varchar(8000), 
 @Column_List_For_Update varchar(8000), 
 @Column_List_For_Check varchar(8000), 
 @Column_Name varchar(128), 
 @Column_Name_Unquoted varchar(128), 
 @Data_Type varchar(128), 
 @Actual_Values nvarchar(max), --This is the string that will be finally executed to generate a MERGE statement
 @IDN varchar(128), --Will contain the IDENTITY column's name in the table
 @Target_Table_For_Output varchar(776),
 @Source_Table_Qualified varchar(776)
 
 

--Variable Initialization
SET @IDN = ''
SET @Column_ID = 0
SET @Column_Name = ''
SET @Column_Name_Unquoted = ''
SET @Column_List = ''
SET @Column_List_For_Update = ''
SET @Column_List_For_Check = ''
SET @Actual_Values = ''

--Variable Defaults
IF @schema IS NULL
 BEGIN
 SET @Target_Table_For_Output = QUOTENAME(COALESCE(@target_table, @table_name))
 END
ELSE
 BEGIN
 SET @Target_Table_For_Output = QUOTENAME(@schema) + '.' + QUOTENAME(COALESCE(@target_table, @table_name))
 END

SET @Source_Table_Qualified = QUOTENAME(COALESCE(@schema,SCHEMA_NAME())) + '.' + QUOTENAME(@table_name)

--To get the first column's ID
SELECT @Column_ID = MIN(ORDINAL_POSITION) 
FROM INFORMATION_SCHEMA.COLUMNS (NOLOCK) 
WHERE TABLE_NAME = @table_name
AND TABLE_SCHEMA = COALESCE(@schema, SCHEMA_NAME())


--Loop through all the columns of the table, to get the column names and their data types
WHILE @Column_ID IS NOT NULL
 BEGIN
 SELECT @Column_Name = QUOTENAME(COLUMN_NAME), 
 @Column_Name_Unquoted = COLUMN_NAME,
 @Data_Type = DATA_TYPE 
 FROM INFORMATION_SCHEMA.COLUMNS (NOLOCK) 
 WHERE ORDINAL_POSITION = @Column_ID
 AND TABLE_NAME = @table_name
 AND TABLE_SCHEMA = COALESCE(@schema, SCHEMA_NAME())

 IF @cols_to_include IS NOT NULL --Selecting only user specified columns
 BEGIN
 IF CHARINDEX( '''' + SUBSTRING(@Column_Name,2,LEN(@Column_Name)-2) + '''',@cols_to_include) = 0 
 BEGIN
 GOTO SKIP_LOOP
 END
 END

 IF @cols_to_exclude IS NOT NULL --Selecting only user specified columns
 BEGIN
 IF CHARINDEX( '''' + SUBSTRING(@Column_Name,2,LEN(@Column_Name)-2) + '''',@cols_to_exclude) <> 0 
 BEGIN
 GOTO SKIP_LOOP
 END
 END

 --Making sure to output SET IDENTITY_INSERT ON/OFF in case the table has an IDENTITY column
 IF (SELECT COLUMNPROPERTY( OBJECT_ID(@Source_Table_Qualified),SUBSTRING(@Column_Name,2,LEN(@Column_Name) - 2),'IsIdentity')) = 1 
 BEGIN
 IF @ommit_identity = 0 --Determing whether to include or exclude the IDENTITY column
 SET @IDN = @Column_Name
 ELSE
 GOTO SKIP_LOOP 
 END
 
 --Making sure whether to output computed columns or not
 IF @ommit_computed_cols = 1
 BEGIN
 IF (SELECT COLUMNPROPERTY( OBJECT_ID(@Source_Table_Qualified),SUBSTRING(@Column_Name,2,LEN(@Column_Name) - 2),'IsComputed')) = 1 
 BEGIN
 GOTO SKIP_LOOP 
 END
 END
 
 --Tables with columns of IMAGE data type are not supported for obvious reasons
 IF(@Data_Type in ('image'))
 BEGIN
 IF (@ommit_images = 0)
 BEGIN
 RAISERROR('Tables with image columns are not supported.',16,1)
 PRINT 'Use @ommit_images = 1 parameter to generate a MERGE for the rest of the columns.'
 RETURN -1 --Failure. Reason: There is a column with image data type
 END
 ELSE
 BEGIN
 GOTO SKIP_LOOP
 END
 END

 --Determining the data type of the column and depending on the data type, the VALUES part of
 --the MERGE statement is generated. Care is taken to handle columns with NULL values. Also
 --making sure, not to lose any data from flot, real, money, smallmomey, datetime columns
 SET @Actual_Values = @Actual_Values +
 CASE 
 WHEN @Data_Type IN ('char','nchar') 
 THEN 
 'COALESCE(''N'''''' + REPLACE(RTRIM(' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')'
 WHEN @Data_Type IN ('varchar','nvarchar') 
 THEN 
 'COALESCE(''N'''''' + REPLACE(' + @Column_Name + ','''''''','''''''''''')+'''''''',''NULL'')'
 WHEN @Data_Type IN ('datetime','smalldatetime','datetime2','date') 
 THEN 
 'COALESCE('''''''' + RTRIM(CONVERT(char,' + @Column_Name + ',127))+'''''''',''NULL'')'
 WHEN @Data_Type IN ('uniqueidentifier') 
 THEN 
 'COALESCE(''N'''''' + REPLACE(CONVERT(char(36),RTRIM(' + @Column_Name + ')),'''''''','''''''''''')+'''''''',''NULL'')'
 WHEN @Data_Type IN ('text') 
 THEN 
 'COALESCE(''N'''''' + REPLACE(CONVERT(varchar(max),' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')' 
 WHEN @Data_Type IN ('ntext') 
 THEN 
 'COALESCE('''''''' + REPLACE(CONVERT(nvarchar(max),' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')' 
 WHEN @Data_Type IN ('xml') 
 THEN 
 'COALESCE('''''''' + REPLACE(CONVERT(nvarchar(max),' + @Column_Name + '),'''''''','''''''''''')+'''''''',''NULL'')' 
 WHEN @Data_Type IN ('binary','varbinary') 
 THEN 
 'COALESCE(RTRIM(CONVERT(varchar(max),' + @Column_Name + ', 1)),''NULL'')' 
 WHEN @Data_Type IN ('timestamp','rowversion') 
 THEN 
 CASE 
 WHEN @include_timestamp = 0 
 THEN 
 '''DEFAULT''' 
 ELSE 
 'COALESCE(RTRIM(CONVERT(char,' + 'CONVERT(int,' + @Column_Name + '))),''NULL'')' 
 END
 WHEN @Data_Type IN ('float','real','money','smallmoney')
 THEN
 'COALESCE(LTRIM(RTRIM(' + 'CONVERT(char, ' + @Column_Name + ',2)' + ')),''NULL'')' 
 WHEN @Data_Type IN ('hierarchyid')
 THEN 
  'COALESCE(''hierarchyid::Parse(''+'''''''' + LTRIM(RTRIM(' + 'CONVERT(char, ' + @Column_Name + ')' + '))+''''''''+'')'',''NULL'')' 
 ELSE 
 'COALESCE(LTRIM(RTRIM(' + 'CONVERT(char, ' + @Column_Name + ')' + ')),''NULL'')' 
 END + '+' + ''',''' + ' + '
 
 --Generating the column list for the MERGE statement
 SET @Column_List = @Column_List + @Column_Name + ',' 
 
 --Don't update Primary Key or Identity columns
 IF NOT EXISTS(
 SELECT 1
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
 INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
 WHERE pk.TABLE_NAME = @table_name
 AND pk.TABLE_SCHEMA = COALESCE(@schema, SCHEMA_NAME())
 AND CONSTRAINT_TYPE = 'PRIMARY KEY'
 AND c.TABLE_NAME = pk.TABLE_NAME
 AND c.TABLE_SCHEMA = pk.TABLE_SCHEMA
 AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
 AND c.COLUMN_NAME = @Column_Name_Unquoted 
 )
 BEGIN
 SET @Column_List_For_Update = @Column_List_For_Update + @Column_Name + ' = Source.' + @Column_Name + ', 
  ' 
 SET @Column_List_For_Check = @Column_List_For_Check +
 CASE @Data_Type 
 WHEN 'text' THEN CHAR(10) + CHAR(9) + 'NULLIF(CAST(Source.' + @Column_Name + ' AS VARCHAR(MAX)), CAST(Target.' + @Column_Name + ' AS VARCHAR(MAX))) IS NOT NULL OR NULLIF(CAST(Target.' + @Column_Name + ' AS VARCHAR(MAX)), CAST(Source.' + @Column_Name + ' AS VARCHAR(MAX))) IS NOT NULL OR '
 WHEN 'ntext' THEN CHAR(10) + CHAR(9) + 'NULLIF(CAST(Source.' + @Column_Name + ' AS NVARCHAR(MAX)), CAST(Target.' + @Column_Name + ' AS NVARCHAR(MAX))) IS NOT NULL OR NULLIF(CAST(Target.' + @Column_Name + ' AS NVARCHAR(MAX)), CAST(Source.' + @Column_Name + ' AS NVARCHAR(MAX))) IS NOT NULL OR ' 
 ELSE CHAR(10) + CHAR(9) + 'NULLIF(Source.' + @Column_Name + ', Target.' + @Column_Name + ') IS NOT NULL OR NULLIF(Target.' + @Column_Name + ', Source.' + @Column_Name + ') IS NOT NULL OR '
 END 
 END

 SKIP_LOOP: --The label used in GOTO

 SELECT @Column_ID = MIN(ORDINAL_POSITION) 
 FROM INFORMATION_SCHEMA.COLUMNS (NOLOCK) 
 WHERE TABLE_NAME = @table_name
 AND TABLE_SCHEMA = COALESCE(@schema, SCHEMA_NAME())
 AND ORDINAL_POSITION > @Column_ID

 END --Loop ends here!


--To get rid of the extra characters that got concatenated during the last run through the loop
IF LEN(@Column_List_For_Update) <> 0
 BEGIN
 SET @Column_List_For_Update = ' ' + LEFT(@Column_List_For_Update,len(@Column_List_For_Update) - 4)
 END

IF LEN(@Column_List_For_Check) <> 0
 BEGIN
 SET @Column_List_For_Check = LEFT(@Column_List_For_Check,len(@Column_List_For_Check) - 3)
 END

SET @Actual_Values = LEFT(@Actual_Values,len(@Actual_Values) - 6)

SET @Column_List = LEFT(@Column_List,len(@Column_List) - 1)
IF LEN(LTRIM(@Column_List)) = 0
 BEGIN
 RAISERROR('No columns to select. There should at least be one column to generate the output',16,1)
 RETURN -1 --Failure. Reason: Looks like all the columns are ommitted using the @cols_to_exclude parameter
 END


--Get the join columns ----------------------------------------------------------
DECLARE @PK_column_list VARCHAR(8000)
DECLARE @PK_column_joins VARCHAR(8000)
SET @PK_column_list = ''
SET @PK_column_joins = ''

SELECT @PK_column_list = @PK_column_list + '[' + c.COLUMN_NAME + '], '
, @PK_column_joins = @PK_column_joins + 'Target.[' + c.COLUMN_NAME + '] = Source.[' + c.COLUMN_NAME + '] AND '
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
WHERE pk.TABLE_NAME = @table_name
AND pk.TABLE_SCHEMA = COALESCE(@schema, SCHEMA_NAME())
AND CONSTRAINT_TYPE = 'PRIMARY KEY'
AND c.TABLE_NAME = pk.TABLE_NAME
AND c.TABLE_SCHEMA = pk.TABLE_SCHEMA
AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

IF IsNull(@PK_column_list, '') = '' 
 BEGIN
 RAISERROR('Table has no primary keys. There should at least be one column in order to have a valid join.',16,1)
 RETURN -1 --Failure. Reason: looks like table doesn't have any primary keys
 END

SET @PK_column_list = LEFT(@PK_column_list, LEN(@PK_column_list) -1)
SET @PK_column_joins = LEFT(@PK_column_joins, LEN(@PK_column_joins) -4)


--Forming the final string that will be executed, to output the a MERGE statement
SET @Actual_Values = 
 'SELECT ' + 
 CASE WHEN @top IS NULL OR @top < 0 THEN '' ELSE ' TOP ' + LTRIM(STR(@top)) + ' ' END + 
 '''' + 
 ' '' + CASE WHEN ROW_NUMBER() OVER (ORDER BY ' + @PK_column_list + ') = 1 THEN '' '' ELSE '','' END + ''(''+ ' + @Actual_Values + '+'')''' + ' ' + 
 COALESCE(@from,' FROM ' + @Source_Table_Qualified + ' (NOLOCK) ORDER BY ' + @PK_column_list)

 DECLARE @output VARCHAR(MAX) = ''
 DECLARE @b CHAR(1) = CHAR(13)

--Determining whether to ouput any debug information
IF @debug_mode =1
 BEGIN
 SET @output += @b + '/*****START OF DEBUG INFORMATION*****'
 SET @output += @b + ''
 SET @output += @b + 'The primary key column list:'
 SET @output += @b + @PK_column_list
 SET @output += @b + ''
 SET @output += @b + 'The INSERT column list:'
 SET @output += @b + @Column_List
 SET @output += @b + ''
 SET @output += @b + 'The UPDATE column list:'
 SET @output += @b + @Column_List_For_Update
 SET @output += @b + ''
 SET @output += @b + 'The SELECT statement executed to generate the MERGE:'
 SET @output += @b + @Actual_Values
 SET @output += @b + ''
 SET @output += @b + '*****END OF DEBUG INFORMATION*****/'
 SET @output += @b + ''
 END
 
IF (@include_use_db = 1)
BEGIN
	SET @output +=      'USE ' + DB_NAME()
	SET @output += @b + @batch_separator
	SET @output += @b + @b
END

IF (@nologo = 0)
BEGIN
 SET @output += @b + '--MERGE generated by ''sp_generate_merge'' stored procedure, Version 0.93'
 SET @output += @b + '--Originally by Vyas (http://vyaskn.tripod.com): sp_generate_inserts (build 22)'
 SET @output += @b + '--Adapted for SQL Server 2008/2012 by Daniel Nolan (http://danere.com)'
 SET @output += @b + ''
END

IF (@include_rowsaffected = 1) -- If the caller has elected not to include the "rows affected" section, let MERGE output the row count as it is executed.
 SET @output += @b + 'SET NOCOUNT ON'
 SET @output += @b + ''


--Determining whether to print IDENTITY_INSERT or not
IF (LEN(@IDN) <> 0)
 BEGIN
 SET @output += @b + 'SET IDENTITY_INSERT ' + @Target_Table_For_Output + ' ON'
 SET @output += @b + ''
 END


--Temporarily disable constraints on the target table
IF @disable_constraints = 1 AND (OBJECT_ID(@Source_Table_Qualified, 'U') IS NOT NULL)
 BEGIN
 SET @output += @b + 'ALTER TABLE ' + @Target_Table_For_Output + ' NOCHECK CONSTRAINT ALL' --Code to disable constraints temporarily
 END


--Output the start of the MERGE statement, qualifying with the schema name only if the caller explicitly specified it
SET @output += @b + 'MERGE INTO ' + @Target_Table_For_Output + ' AS Target'
SET @output += @b + 'USING (VALUES'


--All the hard work pays off here!!! You'll get your MERGE statement, when the next line executes!
DECLARE @tab TABLE (ID INT NOT NULL PRIMARY KEY IDENTITY(1,1), val NVARCHAR(max));
INSERT INTO @tab (val)
EXEC (@Actual_Values)

IF (SELECT COUNT(*) FROM @tab) <> 0 -- Ensure that rows were returned, otherwise the MERGE statement will get nullified.
BEGIN
 SET @output += CAST((SELECT @b + val FROM @tab ORDER BY ID FOR XML PATH('')) AS XML).value('.', 'VARCHAR(MAX)');
END

--Output the columns to correspond with each of the values above--------------------
SET @output += @b + ') AS Source (' + @Column_List + ')'


--Output the join columns ----------------------------------------------------------
SET @output += @b + 'ON (' + @PK_column_joins + ')'


--When matched, perform an UPDATE on any metadata columns only (ie. not on PK)------
IF LEN(@Column_List_For_Update) <> 0
BEGIN
 SET @output += @b + 'WHEN MATCHED ' + CASE WHEN @update_only_if_changed = 1 THEN 'AND (' + @Column_List_For_Check + ') ' ELSE '' END + 'THEN'
 SET @output += @b + ' UPDATE SET'
 SET @output += @b + '  ' + LTRIM(@Column_List_For_Update)
END


--When NOT matched by target, perform an INSERT------------------------------------
SET @output += @b + 'WHEN NOT MATCHED BY TARGET THEN';
SET @output += @b + ' INSERT(' + @Column_List + ')'
SET @output += @b + ' VALUES(' + REPLACE(@Column_List, '[', 'Source.[') + ')'


--When NOT matched by source, DELETE the row
IF @delete_if_not_matched=1 BEGIN
 SET @output += @b + 'WHEN NOT MATCHED BY SOURCE THEN '
 SET @output += @b + ' DELETE'
END;
SET @output += @b + ';'
SET @output += @b + @batch_separator

--Display the number of affected rows to the user, or report if an error occurred---
IF @include_rowsaffected = 1
BEGIN
 SET @output += @b + 'DECLARE @mergeError int'
 SET @output += @b + ' , @mergeCount int'
 SET @output += @b + 'SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT'
 SET @output += @b + 'IF @mergeError != 0'
 SET @output += @b + ' BEGIN'
 SET @output += @b + ' PRINT ''ERROR OCCURRED IN MERGE FOR ' + @Target_Table_For_Output + '. Rows affected: '' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected';
 SET @output += @b + ' END'
 SET @output += @b + 'ELSE'
 SET @output += @b + ' BEGIN'
 SET @output += @b + ' PRINT ''' + @Target_Table_For_Output + ' rows affected by MERGE: '' + CAST(@mergeCount AS VARCHAR(100));';
 SET @output += @b + ' END'
 SET @output += @b + @batch_separator
 SET @output += @b + @b
END

--Re-enable the previously disabled constraints-------------------------------------
IF @disable_constraints = 1 AND (OBJECT_ID(@Source_Table_Qualified, 'U') IS NOT NULL)
 BEGIN
 SET @output +=      'ALTER TABLE ' + @Target_Table_For_Output + ' CHECK CONSTRAINT ALL' --Code to enable the previously disabled constraints
 SET @output += @b + @batch_separator
 SET @output += @b
 END


--Switch-off identity inserting------------------------------------------------------
IF (LEN(@IDN) <> 0)
 BEGIN
 SET @output +=      'SET IDENTITY_INSERT ' + @Target_Table_For_Output + ' OFF'
 SET @output += @b + @batch_separator
 SET @output += @b
 END

IF (@include_rowsaffected = 1)
BEGIN
 SET @output +=      'SET NOCOUNT OFF'
 SET @output += @b + @batch_separator
 SET @output += @b
END

SET @output += @b + ''
SET @output += @b + ''

IF @results_to_text = 1
BEGIN
	--output the statement to the Grid/Messages tab
	SELECT @output;
END
ELSE
BEGIN
	--output the statement as xml (to overcome SSMS 4000/8000 char limitation)
	SELECT [processing-instruction(x)]=@output FOR XML PATH(''),TYPE;
	PRINT 'MERGE statement has been wrapped in an XML fragment and output successfully.'
	PRINT 'Ensure you have Results to Grid enabled and then click the hyperlink to copy the statement within the fragment.'
	PRINT ''
	PRINT 'If you would prefer to have results output directly (without XML) specify @results_to_text = 1, however please'
	PRINT 'note that the results may be truncated by your SQL client to 4000 nchars.'
END

SET NOCOUNT OFF
RETURN 0 --Success. We are done!
END
GO
/****** Object:  StoredProcedure [dbo].[uspAddToAudit]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    Every "Line List" needs to call this proc in order to log/audit each notification record
         together with information about the user, who has viewed it.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspAddToAudit]
	(
		@ReportName VARCHAR(50),
		@LoginGroups VARCHAR(500),
		@ReusableNotification ReusableNotificationType READONLY
	)
AS
	BEGIN TRY
		INSERT INTO AccessAudit
			SELECT
				@ReportName,
				GETUTCDATE(),
				SUBSTRING(SUSER_NAME(), CHARINDEX('\', SUSER_NAME()) + 1, LEN(SUSER_NAME())),
				@LoginGroups,
				NotificationId,
				EtsId
			FROM @ReusableNotification
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspAntibioticMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspAntibioticMapping]
	
AS

	SET NOCOUNT ON

	BEGIN TRY
		--RESET
		DELETE FROM [dbo].[AntibioticMapping]
		--REPOPULATE
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'ETA_W', 1, N'EMB')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'ETHAM', 0, N'EMB')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'ETHAM_W', 1, N'EMB')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'ISO', 0, N'INH')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'ISO_W', 1, N'INH')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'RIF', 0, N'RIF')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'RIF_W', 1, N'RIF')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'PYR', 0, N'PZA')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'PYR_W', 1, N'PZA')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'CLA', 0, N'CLA')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'AK', 0, N'AK')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'AMI', 0, N'AK')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'AMINO_W', 1, N'AMINO')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'AZI', 0, N'AZI')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'CAP', 0, N'CAP')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'CIP', 0, N'CIP')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'CLOF', 0, N'CLOF')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'CYC', 0, N'CYC')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'ETHION', 0, N'ETHION')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'IMI', 0, N'IMI')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'KAN', 0, N'KAN')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'LEV', 0, N'LEV')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'LINZ', 0, N'LZD')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'LZD', 0, N'LZD')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'MOXI', 0, N'MOXI')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'OFL', 0, N'OFX')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'OFX', 0, N'OFX')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'PAS', 0, N'PAS')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'PRO', 0, N'PRO')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'QUIN_W', 1, N'QUIN')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'RIFB', 0, N'RIFB')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'STR', 0, N'STR')
		INSERT [dbo].[AntibioticMapping] ([AntibioticCode], [IsWGS], [AntibioticOutputName]) VALUES (N'STR_W', 0, N'STR')
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspAuditLinelist]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This displays a filterable recordset to the National Team that contains logs/audits for 
         each notification record that has been viewed together with information about the user,
		 who has viewed it.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspAuditLinelist]
	(
		@DateFrom				DATETIME		=	NULL,
		@DateTo					DATETIME		=	NULL,
		@User					VARCHAR(200)	=	NULL,
		@Group					VARCHAR(200)	=	NULL,
		@ETSID					BIGINT			=	NULL	
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @LoginGroups

		IF (@LoginGroups != '###')
		BEGIN
			SELECT
				AccessAuditId	AS 'ID',
				ReportName		AS 'Report name',
				AccessDate		AS 'Date',
				[User]			AS 'User',
				[Group]			AS 'Group',
				NotificationId	AS 'Notification ID',
				EtsId			AS 'ETS ID'
			FROM dbo.AccessAudit
			WHERE AccessDate BETWEEN @DateFrom AND @DateTo
				AND (@ETSID IS NULL OR EtsId = @ETSID)
				AND (@User IS NULL OR [User] = @User)
			ORDER BY AccessAuditId DESC
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspBoilerplateLineList]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Boilerplate Line List", which returns every/most notification data point
         in detail, based on the user's permission & filtering preference. Every notification record
		 returned gets audited, whch means a log entry gets added for each user that views a notification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspBoilerplateLineList]
		(
			@NotificationYearFrom			INTEGER			=	-3,
			@NotificationMonthFrom			INTEGER			=	1,
			@NotificationYearTo				INTEGER			=	0,
			@NotificationMonthTo			INTEGER			=	1,
			@Region							VARCHAR(50)		=	NULL,
			@LocalAuthority					VARCHAR(50)		=	NULL,
			@ServiceName					VARCHAR(150)	=	NULL,
			@Bucket							VARCHAR(50)		=	NULL	
		)
AS
	SET NOCOUNT ON

	-- Debugging
	-- EXEC master..xp_logevent 60000, @ResidenceTreatment

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN

			/*
				-- DEBUGGING: The below variables are for faking parameter values for debugging purposes
				DECLARE @LoginGroups VARCHAR(500), @NotificationYearFrom INTEGER, @NotificationMonthFrom INTEGER, @NotificationYearTo INTEGER, @NotificationMonthTo INTEGER, @Region VARCHAR(50), @LocalAuthority VARCHAR(50), @ServiceName VARCHAR(150), @Bucket VARCHAR(50)
				SET @LoginGroups = '###Global.NIS.NTBS.LON###'
				SET @NotificationYearFrom =	-3
				SET @NotificationMonthFrom	= 1
				SET @NotificationYearTo	= 0
				SET @NotificationMonthTo = 1
				SET @Region	= 'London'
				SET @LocalAuthority	= 'Brent'
				SET @ServiceName = NULL
				SET @Bucket	= 'table total'
			*/

			DECLARE @NotificationYearTypeFrom	VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)

            DECLARE @NotificationYearTypeTo		VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			DECLARE @BoilerplateCalculation1 INT = NULL
			DECLARE @BoilerplateCalculation2 INT = NULL
			DECLARE @TableTotal INT = NULL

			IF (@Bucket = 'Boilerplate calculation 1')
				SET @BoilerplateCalculation1 = 1
			ELSE IF (@Bucket = 'Boilerplate calculation 2')
				SET @BoilerplateCalculation2 = 1
			ELSE IF (@Bucket = 'Table total')
				SET @TableTotal = 1
							
			DECLARE @ReusableNotification ReusableNotificationType

			INSERT INTO @ReusableNotification
				SELECT n.*
				FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n  -- This filters the records by regional PHEC permissions!

					INNER JOIN dbo.Boilerplate b ON b.NotificationId = n.NotificationId
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND (((@ServiceName IS NULL OR @Region IS NULL) OR @ServiceName <> 'All') OR n.TreatmentPhec = @Region)
				AND (((@LocalAuthority IS NULL OR @Region IS NULL) OR @LocalAuthority <> 'All') OR n.ResidencePhec = @Region)
				AND ((@ServiceName IS NULL OR @ServiceName = 'All') OR n.[Service] = @ServiceName)
				AND ((@LocalAuthority IS NULL OR @LocalAuthority = 'All') OR n.LocalAuthority = @LocalAuthority)
				AND (@BoilerplateCalculation1 IS NULL OR b.BoilerplateCalculationNo1 = @BoilerplateCalculation1)	
				AND (@BoilerplateCalculation2 IS NULL OR b.BoilerplateCalculationNo2 = @BoilerplateCalculation2)
				AND (@TableTotal IS NULL OR (  b.BoilerplateCalculationNo1 = @TableTotal 
											OR b.BoilerplateCalculationNo2  = @TableTotal
											
											)
					)

			SELECT
			-- Primary key
			n.NotificationId                                       AS 'ID',

			-- Demographics
			n.EtsId                                                AS 'ETS ID',
			n.LtbrId											   AS 'LTBR ID',
			dbo.ufnFormatDateConsistently(n.NotificationDate)      AS 'Notification date',
			n.CaseManager                                          AS 'Case manager',
			n.Consultant                                           AS 'Consultant',
			n.Hospital                                             AS 'Hospital',
			n.[Service]                                            AS 'Service',
			n.NhsNumber                                            AS 'NHS Number',
			n.Forename                                             AS 'Forename',
			n.Surname                                              AS 'Surname',
			dbo.ufnFormatDateConsistently(n.DateOfBirth)           AS 'Date of birth',
			n.Age                                                  AS 'Age',
			n.Sex                                                  AS 'Sex',
			n.UkBorn                                               AS 'UK born',
			n.EthnicGroup                                          AS 'Ethnic group',
			n.BirthCountry                                         AS 'Birth country',
			n.UkEntryYear                                          AS 'UK entry year',
			n.Postcode                                             AS 'Postcode',
			n.NoFixedAbode                                         AS 'No fixed abode',

			-- Geographies
			n.LocalAuthority                                       AS 'Local Authority',
			n.ResidencePhec                                        AS 'Residence PHEC',
			n.TreatmentPhec                                        AS 'Treatment PHEC',

			-- Treatment
			n.PostMortemDiagnosis                                  AS 'Post-mortem diagnosis',
			n.DidNotStartTreatment                                 AS 'Did not start treatment',
			n.ShortCourse                                          AS 'Short course',
			n.MdrTreatment                                         AS 'MDR treatment',
			dbo.ufnFormatDateConsistently(n.MdrTreatmentDate)      AS 'MDR treatment date',
			n.TreatmentOutcome12months                             AS 'Treatment outcome 12 months',
			n.TreatmentOutcome24months                             AS 'Treatment outcome 24 months',
			n.TreatmentOutcome36months                             AS 'Treatment outcome 36 months',
			n.LastRecordedTreatmentOutcome                         AS 'Last recorded treatment outcome',
			dbo.ufnFormatDateConsistently(n.DateOfDeath)           AS 'Date of death',
			dbo.ufnFormatDateConsistently(n.TreatmentEndDate)      AS 'Treatment end date',

			-- Culture & Resistance
			n.NoSampleTaken                                        AS 'No sample taken',
			n.CulturePositive                                      AS 'Culture positive',
			n.Species                                              AS 'Species',
			dbo.ufnFormatDateConsistently(n.EarliestSpecimenDate)  AS 'Earliest specimen date',
			n.DrugResistanceProfile                                AS 'Drug resistance profile',
			n.INH                                                  AS 'INH',
			n.RIF                                                  AS 'RIF',
			n.EMB	                                               AS 'EMB',
			n.PZA                                                  AS 'PZA',
			n.MDR                                                  AS 'MDR',
			n.XDR                                                  AS 'XDR',
			
			-- Clinical Details
			dbo.ufnFormatDateConsistently(n.SymptomOnsetDate)      AS 'Symptom onset date',
			dbo.ufnFormatDateConsistently(n.PresentedDate)         AS 'Presented date',
			n.OnsetToPresentationDays                              AS 'Onset to presentation days',
			dbo.ufnFormatDateConsistently(n.DiagnosisDate)         AS 'Diagnosis date',
			n.PresentationToDiagnosisDays                          AS 'Presentation to diagnosis days',
			dbo.ufnFormatDateConsistently(n.StartOfTreatmentDate)  AS 'Start of treatment date',
			n.DiagnosisToTreatmentDays                             AS 'Diagnosis to treatment days',
			n.OnsetToTreatmentDays                                 AS 'Onset to treatment days',
			n.HivTestOffered                                       AS 'HIV test offered',
			n.SiteOfDisease                                        AS 'Site of disease',

			-- Risk Factors
			n.AnySocialRiskFactor                                  AS 'Any social risk factor',
			n.AlcoholMisuse		                                   AS 'Alcohol misuse',
			n.DrugMisuse 							               AS 'Drug misuse',
			n.Homeless								               AS 'Homeless',
			n.Prison								               AS 'Prison'
			FROM @ReusableNotification n

			ORDER BY n.NotificationDate DESC

			-- Write data to audit log
			EXEC dbo.uspAddToAudit 'Boilerplate', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspBoilerplateResidence]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Boilerplate" notification aggregate counts for the residence
         portion of the report's entry web page.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspBoilerplateResidence]
	(
		@NotificationYearFrom			INTEGER			=	-3,
		@NotificationMonthFrom			INTEGER			=	1,
		@NotificationYearTo				INTEGER			=	0,
		@NotificationMonthTo			INTEGER			=	1,
		@Region							VARCHAR(50)		=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @Region

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			SELECT
				n.LocalAuthority						AS 'Local Authority',
				SUM(b.BoilerplateCalculationNo1)		AS 'Boilerplate calculation no 1',
				SUM(b.BoilerplateCalculationNo2)		AS 'Boilerplate calculation no 2'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.Boilerplate b ON b.NotificationId = n.NotificationId
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND n.ResidencePhec = @Region
			GROUP BY n.LocalAuthority
			ORDER BY n.LocalAuthority
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspBoilerplateTreatment]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Boilerplate" notification aggregate counts for the treatment
         portion of the report's entry web page.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspBoilerplateTreatment]
	(
		@NotificationYearFrom			INTEGER			=	-3,
		@NotificationMonthFrom			INTEGER			=	1,
		@NotificationYearTo				INTEGER			=	0,
		@NotificationMonthTo			INTEGER			=	1,
		@Region							VARCHAR(50)		=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @Region

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			SELECT
				n.[Service]								AS 'Service',
				SUM(b.BoilerplateCalculationNo1)		AS 'Boilerplate calculation no 1',
				SUM(b.BoilerplateCalculationNo2)		AS 'Boilerplate calculation no 2'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.Boilerplate b ON b.NotificationId = n.NotificationId
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND n.TreatmentPhec = @Region
			GROUP BY n.[Service]
			ORDER BY n.[Service]
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspCallDivZero]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspCallDivZero] 
	
AS
BEGIN
	BEGIN TRY
		EXEC dbo.uspDivZero
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspCountOfClusterNotificationsPerMonth]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspCountOfClusterNotificationsPerMonth]
	@ClusterId NVARCHAR(50) = NULL
AS
	--get a list of all the months between the first notification in the cluster and the last
	WITH YearAndMonth(YearMonthValue, MonthYearFormatted) AS
		(SELECT DISTINCT [YearMonthValue], CONCAT(c.PaddedMonthValue, '-', c.YearValue) AS MonthYearFormatted
		FROM [dbo].[Calendar] c
		WHERE c.DateValue >= (SELECT MIN(rn.NotificationDate) FROM [dbo].[ReusableNotification] rn
			INNER JOIN [dbo].[NotificationClusterMatch] ncm ON ncm.NotificationId = rn.NotificationId
		WHERE ncm.ClusterId = @ClusterId)
		and c.DateValue <= (SELECT MAX(rn.NotificationDate) FROM [dbo].[ReusableNotification] rn
		INNER JOIN [dbo].[NotificationClusterMatch] ncm ON ncm.NotificationId = rn.NotificationId
		WHERE ncm.ClusterId = @ClusterId)),

		--then a count of notifications by month
		CountByMonth(YearMonthValue, CountByMonth) AS
			(SELECT c.YearMonthValue, Count(rn.NotificationId) as 'CountByMonth' FROM [dbo].[ReusableNotification] rn
				INNER JOIN [dbo].[NotificationClusterMatch] ncm ON ncm.NotificationId = rn.NotificationId
				INNER JOIN [dbo].[Calendar] c ON c.DateValue = rn.NotificationDate
			WHERE ncm.ClusterId = @ClusterId
			GROUP BY c.YearMonthValue)


	SELECT y.YearMonthValue, y.MonthYearFormatted, COALESCE(c.CountByMonth, 0) AS CountByMonth, SUM(c.CountByMonth) OVER (ORDER BY y.YearMonthValue) AS RunningTotal  
		FROM YearAndMonth y 
		LEFT OUTER JOIN CountByMonth c ON c.YearMonthValue = y.YearMonthValue
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspCultureResistanceLineList]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Culture And Resistance Line List", which returns every/most notification data point
         in detail, based on the user's permission & filtering preference. Every notification record
		 returned gets audited, whch means a log entry gets added for each user that views a notification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspCultureResistanceLineList]
(
		@NotificationYearFrom	INTEGER			=	-3,
		@NotificationMonthFrom	INTEGER			=	1,
		@NotificationYearTo		INTEGER			=	0,
		@NotificationMonthTo	INTEGER			=	1,
	--	@ResidenceTreatment		TINYINT			=   3,
		@Region					VARCHAR(50)		=	NULL,
		@Service				VARCHAR(5000)	=	NULL,
		@LocalAuthority					VARCHAR(50)		=	NULL,
		@SiteOfDisease			VARCHAR(16)		=	NULL,	
		@Bucket					VARCHAR(50)		=	NULL	
	)
AS
	SET NOCOUNT ON

	-- Debugging
	-- EXEC master..xp_logevent 60000, @Region

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			/*
				-- Debugging
				DECLARE @NotificationDateFrom DATE = '2016-01-01'
				DECLARE @NotificationDateTo DATE = '2019-01-31'
				DECLARE @ResidenceTreatment TINYINT = 1
				-- DECLARE @SOD VARCHAR(16) = NULL
				DECLARE @Region VARCHAR(50) = 'London'
				DECLARE @Bucket VARCHAR(50) = 'Culture positive cases'
				DECLARE @LoginGroups VARCHAR(50) = '###Global.NIS.NTBS.LON###'
			*/

			DECLARE @NotificationYearTypeFrom	VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			-- If value is All then set to null  = null in where clause, otherwise set to filter value
			DECLARE @SOD						VARCHAR(16) = (CASE WHEN @SiteOfDisease = 'All' THEN NULL ELSE @SiteOfDisease END)

			DECLARE @CulturePositiveCases TINYINT = NULL
			DECLARE @NonCulturePositiveCases TINYINT = NULL
			DECLARE @Table1Total TINYINT = NULL
			DECLARE @SensitiveToAll4FirstLineDrugs TINYINT = NULL
			DECLARE @InhRes TINYINT = NULL
			DECLARE @Other TINYINT = NULL
			DECLARE @MdrRr TINYINT = NULL
			DECLARE @Xdr TINYINT = NULL
			DECLARE @IncompleteDrugResistanceProfile TINYINT = NULL
			DECLARE @Table2Total TINYINT = NULL

			IF (@Bucket = 'Culture positive cases')
				SET @CulturePositiveCases = 1
			ELSE IF (@Bucket = 'Non-culture positive cases')
				SET @NonCulturePositiveCases = 1
			ELSE IF (@Bucket = 'Table 1 total')
				SET @Table1Total = 1
			ELSE IF (@Bucket = 'Sensitive to all 4 first line drugs')
				SET @SensitiveToAll4FirstLineDrugs = 1
			ELSE IF (@Bucket = 'INH-RES')
				SET @InhRes = 1
			ELSE IF (@Bucket = 'Other')
				SET @Other = 1
			ELSE IF (@Bucket = 'MDR/RR')
				SET @MdrRr = 1
			ELSE IF (@Bucket = 'XDR')
				SET @Xdr = 1
			ELSE IF (@Bucket = 'Incomplete drug resistance profile')
				SET @IncompleteDrugResistanceProfile = 1
			ELSE IF (@Bucket = 'Table 2 total')
				SET @Table2Total = 1
			ELSE 
				RAISERROR ('The @Bucket passed is invalid', 16, 1) WITH NOWAIT

			DECLARE @ReusableNotification ReusableNotificationType

			INSERT INTO @ReusableNotification
				SELECT n.*
				FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n  -- This filters the records by regional PHEC permissions!
					INNER JOIN dbo.CultureResistance c ON c.NotificationId = n.NotificationId
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND (((@Service IS NULL OR @Region IS NULL) OR @Service <> 'All') OR n.TreatmentPhec = @Region)
				AND (((@LocalAuthority IS NULL OR @Region IS NULL) OR @LocalAuthority <> 'All') OR n.ResidencePhec = @Region)
				AND ((@Service IS NULL OR @Service = 'All') OR 
					n.[Service] in (select value from STRING_SPLIT(@Service, ',')) or
					(@Service = 'Blank' and Service is null and n.ResidencePhec = @region and n.TreatmentPhec is null))
				AND ((@LocalAuthority IS NULL OR @LocalAuthority = 'All') OR n.LocalAuthority = @LocalAuthority)
					AND (@SOD IS NULL OR n.SiteOfDisease = @SOD)
					-- Buckets			
					AND (@CulturePositiveCases IS NULL OR c.CulturePositiveCases = @CulturePositiveCases)
					AND (@NonCulturePositiveCases IS NULL OR c.NonCulturePositiveCases = @NonCulturePositiveCases)
					AND (@Table1Total IS NULL OR (c.CulturePositiveCases > 0 OR c.NonCulturePositiveCases > 0))
					AND (@SensitiveToAll4FirstLineDrugs IS NULL OR c.SensitiveToAll4FirstLineDrugs = @SensitiveToAll4FirstLineDrugs)
					AND (@InhRes IS NULL OR c.InhRes = @InhRes)
					AND (@Other IS NULL OR c.Other = @Other)
					AND (@MdrRr IS NULL OR c.MdrRr = @MdrRr)
					AND (@Xdr IS NULL OR c.Xdr = @Xdr)
					AND (@IncompleteDrugResistanceProfile IS NULL OR c.IncompleteDrugResistanceProfile = @IncompleteDrugResistanceProfile)
					AND (@Table2Total IS NULL OR (c.SensitiveToAll4FirstLineDrugs > 0 OR c.InhRes > 0 OR c.Other > 0 OR c.MdrRr > 0 OR c.Xdr > 0 OR c.IncompleteDrugResistanceProfile> 0))

			SELECT
				-- Primary key
				n.NotificationId                                       AS 'ID',

				-- Demographics
				n.EtsId                                                AS 'ETS ID',
				n.LtbrId                                               AS 'LTBR ID',
				dbo.ufnFormatDateConsistently(n.NotificationDate)      AS 'Notification date',
				n.CaseManager                                          AS 'Case manager',
				n.Consultant                                           AS 'Consultant',
				n.Hospital                                             AS 'Hospital',
				n.[Service]                                            AS 'Service',
				n.NhsNumber                                            AS 'NHS Number',
				n.Forename                                             AS 'Forename',
				n.Surname                                              AS 'Surname',
				dbo.ufnFormatDateConsistently(n.DateOfBirth)           AS 'Date of birth',
				n.Age                                                  AS 'Age',
				n.Sex                                                  AS 'Sex',
				n.Ukborn                                               AS 'UK born',
				n.EthnicGroup                                          AS 'Ethnic group',
				n.BirthCountry                                         AS 'Birth country',
				n.UkEntryYear                                          AS 'UK entry year',
				n.Postcode                                             AS 'Postcode',
				n.NoFixedAbode                                         AS 'No fixed abode',

				-- Culture & Resistance
				n.NoSampleTaken                                        AS 'No sample taken',
				n.CulturePositive                                      AS 'Culture positive',
				n.Species                                              AS 'Species',
				dbo.ufnFormatDateConsistently(n.EarliestSpecimenDate)  AS 'Earliest specimen date',
				n.DrugResistanceProfile                                AS 'Drug resistance profile',
				n.INH                                                  AS 'INH',
				n.RIF                                                  AS 'RIF',
				n.EMB                                                  AS 'EMB',
				n.PZA                                                  AS 'PZA',
				n.MDR                                                  AS 'MDR',
				n.XDR                                                  AS 'XDR',

				-- Geographies
				n.LocalAuthority                                       AS 'Local Authority',
				n.LocalAuthorityCode                                   AS 'Local Authority Code',
				n.ResidencePhec                                        AS 'Residence PHEC',
				n.TreatmentPhec                                        AS 'Treatment PHEC',

				-- Clinical Details
				dbo.ufnFormatDateConsistently(n.SymptomOnsetDate)      AS 'Symptom onset date',
				dbo.ufnFormatDateConsistently(n.PresentedDate)         AS 'Presented date',
				n.OnsetToPresentationDays                              AS 'Onset to presentation days',
				dbo.ufnFormatDateConsistently(n.DiagnosisDate)         AS 'Diagnosis date',
				n.PresentationToDiagnosisDays                          AS 'Presentation to diagnosis days',
				dbo.ufnFormatDateConsistently(n.StartOfTreatmentDate)  AS 'Start of treatment date',
				n.DiagnosisToTreatmentDays                             AS 'Diagnosis to treatment days',
				n.OnsetToTreatmentDays                                 AS 'Onset to treatment days',
				n.HivTestOffered                                       AS 'HIV test offered',
				n.SiteOfDisease                                        AS 'Site of disease',

				-- Risk Factors
				n.AnySocialRiskFactor                                  AS 'Any social risk factor',
				n.AlcoholMisuse                                        AS 'Alcohol misuse',
				n.DrugMisuse 							               AS 'Drug misuse',
				n.Homeless								               AS 'Homeless',
				n.Prison								               AS 'Prison',
			
				-- Treatment
				n.PostMortemDiagnosis                                  AS 'Post-mortem diagnosis',
				n.DidNotStartTreatment                                 AS 'Did not start treatment',
				n.ShortCourse                                          AS 'Short course',
				n.MdrTreatment                                         AS 'MDR treatment',
				dbo.ufnFormatDateConsistently(n.MdrTreatmentDate)      AS 'MDR treatment date',
				n.TreatmentOutcome12months                             AS 'Treatment outcome 12 months',
				n.TreatmentOutcome24months                             AS 'Treatment outcome 24 months',
				n.TreatmentOutcome36months                             AS 'Treatment outcome 36 months',
				n.LastRecordedTreatmentOutcome                         AS 'Last recorded treatment outcome',
				dbo.ufnFormatDateConsistently(n.DateOfDeath)           AS 'Date of death',
				dbo.ufnFormatDateConsistently(n.TreatmentEndDate)      AS 'Treatment end date'
			FROM @ReusableNotification n
			ORDER BY n.NotificationDate DESC

			-- Write data to audit log
			EXEC dbo.uspAddToAudit 'Culture And Resistance', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspCultureResistanceNational]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspCultureResistanceNational]
(
		@NotificationYearFrom	INTEGER			=	-3,
		@NotificationMonthFrom	INTEGER			=	1,
		@NotificationYearTo		INTEGER			=	0,
		@NotificationMonthTo	INTEGER			=	1,
		@SiteOfDisease			VARCHAR(16)		=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			DECLARE @SOD						VARCHAR(16) = (CASE WHEN @SiteOfDisease = 'All' THEN NULL ELSE @SiteOfDisease END)

			-- Debugging
			-- EXEC master..xp_logevent 60000, @SOD
		
			/*
				DECLARE @LoginGroups VARCHAR(500) = '###Global.NIS.NTBS.NTS###'
				DECLARE @NotificationDateFrom DATE = '2016-01-01'
				DECLARE @NotificationDateTo DATE = '2019-01-31'
				DECLARE @ResidenceTreatment TINYINT = 1
				DECLARE @SOD VARCHAR(16) = NULL
				DECLARE @Region VARCHAR(50) = 'London'
			*/

			SELECT
				n.TreatmentPhec							AS 'Region',

				SUM(c.CulturePositiveCases)				AS 'Culture positive cases',
				CAST(
					(100 / 
						(
							CAST(SUM(c.CulturePositiveCases) AS FLOAT) + 
							CAST(SUM(c.NonCulturePositiveCases) AS FLOAT)
						) * CAST(SUM(c.CulturePositiveCases) AS FLOAT)
					) AS DECIMAL(4, 1)
				)										AS 'Culture positive percentage',
				SUM(c.NonCulturePositiveCases)          AS 'Non-culture positive cases',
				CAST(
					(100 / 
						(
							CAST(SUM(c.NonCulturePositiveCases) AS FLOAT) + 
							CAST(SUM(c.CulturePositiveCases) AS FLOAT)
						) * CAST(SUM(c.NonCulturePositiveCases) AS FLOAT)
					) AS DECIMAL(4, 1)
				)										AS 'Non-culture positive percentage',
				SUM(c.CulturePositiveCases) +              
				SUM(c.NonCulturePositiveCases)			AS 'Table 1 total',

				SUM(c.SensitiveToAll4FirstLineDrugs)    AS 'Sensitive to all 4 first line drugs',
				dbo.ufnCalculatePercentage(
					SUM(c.SensitiveToAll4FirstLineDrugs),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'Sensitive to all 4 first line drugs percentage',
				
				SUM(c.InhRes)                           AS 'INH-RES',
				dbo.ufnCalculatePercentage(
					SUM(c.InhRes),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'INH-RES percentage',

				SUM(c.Other)                            AS 'Other',
				dbo.ufnCalculatePercentage(
					SUM(c.Other),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'Other percentage',

				SUM(c.MdrRr)                            AS 'MDR/RR-TB',
				dbo.ufnCalculatePercentage(
					SUM(c.MdrRr),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'MDR/RR-TB percentage',

				SUM(c.Xdr)                              AS 'XDR',
				dbo.ufnCalculatePercentage(
					SUM(c.Xdr),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'XDR percentage',

				SUM(c.IncompleteDrugResistanceProfile)  AS 'Incomplete drug resistance profile',
				dbo.ufnCalculatePercentage(
					SUM(c.IncompleteDrugResistanceProfile),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'Incomplete drug resistance profile percentage',

				SUM(c.SensitiveToAll4FirstLineDrugs) +
				SUM(c.InhRes) +
				SUM(c.Other) +
				SUM(c.MdrRr) +
				SUM(c.Xdr) +
				SUM(c.IncompleteDrugResistanceProfile)  AS 'Table 2 total'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.CultureResistance c ON c.NotificationId = n.NotificationId
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND n.TreatmentPhec IS NOT NULL -- Exclude non-english phecs
				AND n.ResidencePhec IS NOT NULL -- Exclude non-english phecs		
				AND (n.SiteOfDisease = @SOD OR @SOD IS NULL)			
			GROUP BY n.TreatmentPhec
			ORDER BY n.TreatmentPhec
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspCultureResistanceResidence]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Culture And Resistance Line List", which returns every/most notification data point
         in detail, based on the user's permission & filtering preference. Every notification record
		 returned gets audited, whch means a log entry gets added for each user that views a notification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspCultureResistanceResidence]
	(
		@NotificationYearFrom	INTEGER			=	-3,		-- The report's "Year"  drop-down from which notifications are being returned
		@NotificationMonthFrom	INTEGER			=	1,		-- The report's "Month" drop-down from which notifications are being returned
		@NotificationYearTo		INTEGER			=	0,		-- The report's "Year" drop-down up to which notifications are being returned
		@NotificationMonthTo	INTEGER			=	1,		-- The report's "Month" drop-down up to which notifications are being returned
		--@ResidenceTreatment		TINYINT			=   3,		-- The report's "Residence or Treatment?" drop-down that controls whether notifications are within a certain PHEC rgion
		@Region					VARCHAR(50)		=	NULL,	-- The report's "Region" drop-down that allows to view notifications of others PHECs (based on permissions)
		@SiteOfDisease			VARCHAR(16)		=	NULL	-- The report's "Site Of Disease" drop-down that filters on "Pulmonary, Extra-Pulmonary" notifications
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			DECLARE @SOD						VARCHAR(16) = (CASE WHEN @SiteOfDisease = 'All' THEN NULL ELSE @SiteOfDisease END)

			-- Debugging
			-- EXEC master..xp_logevent 60000, @SOD
		
			/*
				DECLARE @LoginGroups VARCHAR(500) = '###Global.NIS.NTBS.NTS###'
				DECLARE @NotificationDateFrom DATE = '2016-01-01'
				DECLARE @NotificationDateTo DATE = '2019-01-31'
				DECLARE @ResidenceTreatment TINYINT = 1
				DECLARE @SOD VARCHAR(16) = NULL
				DECLARE @Region VARCHAR(50) = 'London'
			*/

			SELECT
				n.LocalAuthority						AS 'Local authority',

				SUM(c.CulturePositiveCases)				AS 'Culture positive cases',
				dbo.ufnCalculatePercentage(
					SUM(c.CulturePositiveCases),
					SUM(c.CulturePositiveCases) + SUM(c.NonCulturePositiveCases)
				)										AS 'Culture positive percentage',

				SUM(c.NonCulturePositiveCases)          AS 'Non-culture positive cases',
				dbo.ufnCalculatePercentage(
					SUM(c.NonCulturePositiveCases),
					SUM(c.CulturePositiveCases) + SUM(c.NonCulturePositiveCases)
				)									AS 'Non-culture positive percentage',

				SUM(c.CulturePositiveCases) +              
				SUM(c.NonCulturePositiveCases)			AS 'Table 1 total',

				SUM(c.SensitiveToAll4FirstLineDrugs)    AS 'Sensitive to all 4 first line drugs',
				dbo.ufnCalculatePercentage(
					SUM(c.SensitiveToAll4FirstLineDrugs),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'Sensitive to all 4 first line drugs percentage',

				SUM(c.InhRes)                           AS 'INH-RES',
				dbo.ufnCalculatePercentage(
					SUM(c.InhRes),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'INH-RES percentage',

				SUM(c.Other)                            AS 'Other',
				dbo.ufnCalculatePercentage(
					SUM(c.Other),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'Other percentage',

				SUM(c.MdrRr)                            AS 'MDR/RR-TB',
				dbo.ufnCalculatePercentage(
					SUM(c.MdrRr),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'MDR/RR-TB percentage',

				SUM(c.Xdr)                              AS 'XDR',
				dbo.ufnCalculatePercentage(
					SUM(c.Xdr),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'XDR percentage',

				SUM(c.IncompleteDrugResistanceProfile)  AS 'Incomplete drug resistance profile',
				dbo.ufnCalculatePercentage(
					SUM(c.IncompleteDrugResistanceProfile),
					SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
				)										AS 'Incomplete drug resistance profile percentage',

				SUM(c.SensitiveToAll4FirstLineDrugs) +
				SUM(c.InhRes) +
				SUM(c.Other) +
				SUM(c.MdrRr) +
				SUM(c.Xdr) +
				SUM(c.IncompleteDrugResistanceProfile)  AS 'Table 2 total'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.CultureResistance c ON c.NotificationId = n.NotificationId
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND (n.SiteOfDisease = @SOD OR @SOD IS NULL)		
				AND n.LocalAuthority IS NOT NULL
				AND n.TreatmentPhec IS NOT NULL -- Exclude non-english phecs
				AND n.ResidencePhec IS NOT NULL -- Exclude non-english phecs		
				AND (@Region IS NULL OR n.ResidencePhec = @Region)
				/*			
				AND (
						(
								@ResidenceTreatment = 1 AND
								(n.TreatmentPhec = @Region OR n.ResidencePhec = @Region)
						) OR (
								@ResidenceTreatment = 2 AND
								n.TreatmentPhec = @Region
						) OR (
								@ResidenceTreatment = 3 AND
								n.ResidencePhec = @Region
						)
				) 
				*/
			GROUP BY n.[LocalAuthority]
			ORDER BY n.LocalAuthority
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspCultureResistanceTreatment]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Culture And Resistance Line List", which returns every/most notification data point
         in detail, based on the user's permission & filtering preference. Every notification record
		 returned gets audited, whch means a log entry gets added for each user that views a notification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspCultureResistanceTreatment]
	(
		@NotificationYearFrom	INTEGER			=	-3,		-- The report's "Year"  drop-down from which notifications are being returned
		@NotificationMonthFrom	INTEGER			=	1,		-- The report's "Month" drop-down from which notifications are being returned
		@NotificationYearTo		INTEGER			=	0,		-- The report's "Year" drop-down up to which notifications are being returned
		@NotificationMonthTo	INTEGER			=	1,		-- The report's "Month" drop-down up to which notifications are being returned
	--	@ResidenceTreatment		TINYINT			=   3,		-- The report's "Residence or Treatment?" drop-down that controls whether notifications are within a certain PHEC rgion
		@Region					VARCHAR(50)		=	NULL,	-- The report's "Region" drop-down that allows to view notifications of others PHECs (based on permissions)
		@SiteOfDisease			VARCHAR(16)		=	NULL,	-- The report's "Site Of Disease" drop-down that filters on "Pulmonary, Extra-Pulmonary" notifications
		@Service				varchar(5000)	=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)
			SET @Service = case when len(@Service) - len(replace(@Service, ',', '')) +1 = 
					(select count(*) from TB_Service where PhecName = @Region) then 'All' else @Service end

			DECLARE @SOD						VARCHAR(16) = (CASE WHEN @SiteOfDisease = 'All' THEN NULL ELSE @SiteOfDisease END)

			-- Debugging
			-- EXEC master..xp_logevent 60000, @SOD
		
			/*
				DECLARE @LoginGroups VARCHAR(500) = '###Global.NIS.NTBS.NTS###'
				DECLARE @NotificationDateFrom DATE = '2016-01-01'
				DECLARE @NotificationDateTo DATE = '2019-01-31'
				DECLARE @ResidenceTreatment TINYINT = 1
				DECLARE @SOD VARCHAR(16) = NULL
				DECLARE @Region VARCHAR(50) = 'London'
			*/
			If (@Service <> 'All')
			Begin
				SELECT
					n.[Service]								AS 'Service',

					SUM(c.CulturePositiveCases)				AS 'Culture positive cases',
					dbo.ufnCalculatePercentage(
						SUM(c.CulturePositiveCases),
						SUM(c.CulturePositiveCases) + SUM(c.NonCulturePositiveCases)
					)										AS 'Culture positive percentage',

					SUM(c.NonCulturePositiveCases)          AS 'Non-culture positive cases',
					dbo.ufnCalculatePercentage(
						SUM(c.NonCulturePositiveCases),
						SUM(c.CulturePositiveCases) + SUM(c.NonCulturePositiveCases)
					)									AS 'Non-culture positive percentage',

					SUM(c.CulturePositiveCases) +              
					SUM(c.NonCulturePositiveCases)			AS 'Table 1 total',

					SUM(c.SensitiveToAll4FirstLineDrugs)    AS 'Sensitive to all 4 first line drugs',
					dbo.ufnCalculatePercentage(
						SUM(c.SensitiveToAll4FirstLineDrugs),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'Sensitive to all 4 first line drugs percentage',

					SUM(c.InhRes)                           AS 'INH-RES',
					dbo.ufnCalculatePercentage(
						SUM(c.InhRes),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'INH-RES percentage',

					SUM(c.Other)                            AS 'Other',
					dbo.ufnCalculatePercentage(
						SUM(c.Other),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'Other percentage',

					SUM(c.MdrRr)                            AS 'MDR/RR-TB',
					dbo.ufnCalculatePercentage(
						SUM(c.MdrRr),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'MDR/RR-TB percentage',

					SUM(c.Xdr)                              AS 'XDR',
					dbo.ufnCalculatePercentage(
						SUM(c.Xdr),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'XDR percentage',

					SUM(c.IncompleteDrugResistanceProfile)  AS 'Incomplete drug resistance profile',
					dbo.ufnCalculatePercentage(
						SUM(c.IncompleteDrugResistanceProfile),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'Incomplete drug resistance profile percentage',

					SUM(c.SensitiveToAll4FirstLineDrugs) +
					SUM(c.InhRes) +
					SUM(c.Other) +
					SUM(c.MdrRr) +
					SUM(c.Xdr) +
					SUM(c.IncompleteDrugResistanceProfile)  AS 'Table 2 total'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
					INNER JOIN dbo.CultureResistance c ON c.NotificationId = n.NotificationId
					inner join TB_Service s on s.TB_Service_Name = n.Service
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					and Serviceid in (select value from STRING_SPLIT(@Service, ','))
					AND (n.SiteOfDisease = @SOD OR @SOD IS NULL)		
					AND n.TreatmentPhec IS NOT NULL -- Exclude non-english phecs
					AND n.ResidencePhec IS NOT NULL -- Exclude non-english phecs	
					AND (@Region IS NULL OR n.TreatmentPhec = @Region)
				GROUP BY n.[Service]
				ORDER BY n.[Service]
			END
			
			
			If (@Service = 'All')
			Begin
				SELECT
					n.[Service]								AS 'Service',

					SUM(c.CulturePositiveCases)				AS 'Culture positive cases',
					dbo.ufnCalculatePercentage(
						SUM(c.CulturePositiveCases),
						SUM(c.CulturePositiveCases) + SUM(c.NonCulturePositiveCases)
					)										AS 'Culture positive percentage',

					SUM(c.NonCulturePositiveCases)          AS 'Non-culture positive cases',
					dbo.ufnCalculatePercentage(
						SUM(c.NonCulturePositiveCases),
						SUM(c.CulturePositiveCases) + SUM(c.NonCulturePositiveCases)
					)									AS 'Non-culture positive percentage',

					SUM(c.CulturePositiveCases) +              
					SUM(c.NonCulturePositiveCases)			AS 'Table 1 total',

					SUM(c.SensitiveToAll4FirstLineDrugs)    AS 'Sensitive to all 4 first line drugs',
					dbo.ufnCalculatePercentage(
						SUM(c.SensitiveToAll4FirstLineDrugs),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'Sensitive to all 4 first line drugs percentage',

					SUM(c.InhRes)                           AS 'INH-RES',
					dbo.ufnCalculatePercentage(
						SUM(c.InhRes),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'INH-RES percentage',

					SUM(c.Other)                            AS 'Other',
					dbo.ufnCalculatePercentage(
						SUM(c.Other),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'Other percentage',

					SUM(c.MdrRr)                            AS 'MDR/RR-TB',
					dbo.ufnCalculatePercentage(
						SUM(c.MdrRr),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'MDR/RR-TB percentage',

					SUM(c.Xdr)                              AS 'XDR',
					dbo.ufnCalculatePercentage(
						SUM(c.Xdr),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'XDR percentage',

					SUM(c.IncompleteDrugResistanceProfile)  AS 'Incomplete drug resistance profile',
					dbo.ufnCalculatePercentage(
						SUM(c.IncompleteDrugResistanceProfile),
						SUM(c.SensitiveToAll4FirstLineDrugs) + SUM(c.InhRes) + SUM(c.Other) + SUM(c.MdrRr) + SUM(c.Xdr) + SUM(c.IncompleteDrugResistanceProfile)
					)										AS 'Incomplete drug resistance profile percentage',

					SUM(c.SensitiveToAll4FirstLineDrugs) +
					SUM(c.InhRes) +
					SUM(c.Other) +
					SUM(c.MdrRr) +
					SUM(c.Xdr) +
					SUM(c.IncompleteDrugResistanceProfile)  AS 'Table 2 total'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
					INNER JOIN dbo.CultureResistance c ON c.NotificationId = n.NotificationId
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (n.SiteOfDisease = @SOD OR @SOD IS NULL)		
					AND n.TreatmentPhec IS NOT NULL -- Exclude non-english phecs
					AND n.ResidencePhec IS NOT NULL -- Exclude non-english phecs	
					AND (@Region IS NULL OR n.TreatmentPhec = @Region)
				GROUP BY n.[Service]
				ORDER BY n.[Service]
			END
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspDataQuality]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Data Quality" notification aggregate counts.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspDataQuality]
	(
		@NotificationYearFrom			INTEGER			=	-3,
		@NotificationMonthFrom			INTEGER			=	1,
		@NotificationYearTo				INTEGER			=	0,
		@NotificationMonthTo			INTEGER			=	1,
		@Region							VARCHAR(50)		=	NULL,
		@ServiceName					VARCHAR(5000)	=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		--Debugging
		--EXEC master..xp_logevent 60000, @Region

		IF (@LoginGroups != '###')
		BEGIN
			--Date
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)
			SET @ServiceName = case when len(@ServiceName) - len(replace(@ServiceName, ',', '')) +1 = 
					(select count(*) from TB_Service where PhecName = @Region) then 'All' else @ServiceName end
			If (@ServiceName <> 'All')
			Begin
			SELECT 
				n.[Service]								AS 'Service',
				s.Serviceid								AS 'Serviceid',
				SUM(d.TreatmentEndDate)					AS 'Treatment end date',
				SUM(d.TreatmentOutcome12Months)			AS '12 month treatment outcome',
				SUM(d.TreatmentOutcome24Months)			AS '24 month treatment outcome',
				SUM(d.TreatmentOutcome36Months)			AS '36 month treatment outcome',
				SUM(d.DateOfDeath)						AS 'Date of death',
				SUM(d.DateOfBirth)						AS 'Date of birth',
				SUM(d.UKBorn)							AS 'UK born',
				SUM(d.SiteOfDisease)					AS 'Site of Disease',
				SUM(d.Denotify)							AS 'Denotify',
				SUM(d.OnsetToPresentationDays)					AS 'Onset to presentation days',
				SUM(d.PresentationToDiagnosisDays)					AS 'Presentation to diagnosis days',
				SUM(d.DiagnosisToTreatmentDays)					AS 'Diagnosis to treatment days',
				SUM(d.OnsetToTreatmentDays)					AS 'Onset to treatment days',
				SUM(d.Postcode)							AS 'Postcode',

				SUM(d.TreatmentEndDate)					+
				SUM(d.TreatmentOutcome12Months)			+
				SUM(d.TreatmentOutcome24Months)			+
				SUM(d.TreatmentOutcome36Months)			+
				SUM(d.DateOfDeath)						+
				SUM(d.DateOfBirth)						+
				SUM(d.UKBorn)						   +
				SUM(d.SiteOfDisease)					+
				SUM(d.Denotify)							+
				SUM(d.OnsetToPresentationDays)				 +
				SUM(d.PresentationToDiagnosisDays)				 +
				SUM(d.DiagnosisToTreatmentDays)				 +
				SUM(d.OnsetToTreatmentDays)				 +
				SUM(d.Postcode)							 AS 'Total'


			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.DataQuality d ON d.NotificationId = n.NotificationId
				inner join TB_Service s on s.TB_Service_Name = n.Service
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND n.TreatmentPhec = @Region
				and Serviceid in (select value from STRING_SPLIT(@ServiceName, ','))
				--AND ((@ServiceName IS NULL OR @ServiceName = 'All') OR n.[Service] = @ServiceName)
			GROUP BY n.[Service],s.Serviceid
			ORDER BY n.[Service]
			END
			If (@ServiceName = 'All')
			Begin
			SELECT 
				n.[Service]								AS 'Service',
				SUM(d.TreatmentEndDate)					AS 'Treatment end date',
				SUM(d.TreatmentOutcome12Months)			AS '12 month treatment outcome',
				SUM(d.TreatmentOutcome24Months)			AS '24 month treatment outcome',
				SUM(d.TreatmentOutcome36Months)			AS '36 month treatment outcome',
				SUM(d.DateOfDeath)						AS 'Date of death',
				SUM(d.DateOfBirth)						AS 'Date of birth',
				SUM(d.UKBorn)							AS 'UK born',
				SUM(d.SiteOfDisease)					AS 'Site of Disease',
				SUM(d.Denotify)							AS 'Denotify',
				SUM(d.OnsetToPresentationDays)					AS 'Onset to presentation days',
				SUM(d.PresentationToDiagnosisDays)					AS 'Presentation to diagnosis days',
				SUM(d.DiagnosisToTreatmentDays)					AS 'Diagnosis to treatment days',
				SUM(d.OnsetToTreatmentDays)					AS 'Onset to treatment days',
				SUM(d.Postcode)							AS 'Postcode',

				SUM(d.TreatmentEndDate)					+
				SUM(d.TreatmentOutcome12Months)			+
				SUM(d.TreatmentOutcome24Months)			+
				SUM(d.TreatmentOutcome36Months)			+
				SUM(d.DateOfDeath)						+
				SUM(d.DateOfBirth)						+
				SUM(d.UKBorn)						   +
				SUM(d.SiteOfDisease)					+
				SUM(d.Denotify)							+
				SUM(d.OnsetToPresentationDays)				 +
				SUM(d.PresentationToDiagnosisDays)				 +
				SUM(d.DiagnosisToTreatmentDays)				 +
				SUM(d.OnsetToTreatmentDays)				 +
				SUM(d.Postcode)							 AS 'Total'


			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.DataQuality d ON d.NotificationId = n.NotificationId
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND n.TreatmentPhec = @Region
			GROUP BY n.[Service]
			ORDER BY n.[Service]
			END
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspDataQualityLineList]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Data Quality Line List", which returns every/most notification data point
         in detail, based on the user's permission & filtering preference. Every notification record
		 returned gets audited, whch means a log entry gets added for each user that views a notification.


         
**************************************************************************************************/



CREATE PROCEDURE [dbo].[uspDataQualityLineList]
		(
			@NotificationYearFrom			INTEGER			=	-3,
			@NotificationMonthFrom			INTEGER			=	1,
			@NotificationYearTo				INTEGER			=	0,
			@NotificationMonthTo			INTEGER			=	1,
			@Region							VARCHAR(50)		=	NULL,
			@ServiceName					VARCHAR(150)	=	NULL,
			@Bucket							VARCHAR(50)		=	NULL	
		)
AS
	SET NOCOUNT ON

	--Debugging
	--EXEC master..xp_logevent 60000, @ResidenceTreatment
	--EXEC master..xp_logevent 60000, @Region

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN

			-- DEBUGGING: the below comments are for setting parameter values for debugging
			/*
				DECLARE @LoginGroups VARCHAR(500), @NotificationYearFrom INTEGER, @NotificationMonthFrom INTEGER, @NotificationYearTo INTEGER, @NotificationMonthTo INTEGER, @Region VARCHAR(50), @LocalAuthority VARCHAR(50), @ServiceName VARCHAR(150), @Bucket VARCHAR(50)
				SET @LoginGroups = '###Global.NIS.NTBS.LON###'
				SET @NotificationYearFrom =	-3
				SET @NotificationMonthFrom	= 1
				SET @NotificationYearTo	= 0
				SET @NotificationMonthTo = 1
				SET @Region	= 'London'
				SET @LocalAuthority	= 'Brent'
				SET @ServiceName = NULL
				SET @Bucket	= 'table total'
			*/

			DECLARE @NotificationYearTypeFrom	VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)

            DECLARE @NotificationYearTypeTo		VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			--Buckets
			DECLARE @TreatmentEndDate INT = NULL
			DECLARE @TreatmentOutcome12Months INT = NULL
			DECLARE @TreatmentOutcome24Months INT = NULL
			DECLARE @TreatmentOutcome36Months INT = NULL
			DECLARE @DateOfDeath INT = NULL
			DECLARE @DateOfBirth INT = NULL
			DECLARE @UKBorn INT = NULL
			DECLARE @SiteOfDisease INT = NULL
			DECLARE @Denotify INT = NULL
			DECLARE @OnsetToPresentationDays INT = NULL
			DECLARE @PresentationToDiagnosisDays INT = NULL
			DECLARE @DiagnosisToTreatmentDays INT = NULL
			DECLARE @OnsetToTreatmentDays INT = NULL
			DECLARE @Postcode INT = NULL
			DECLARE @TableTotal INT = NULL

		

	IF (@Bucket = 'Treatment end date')  SET @TreatmentEndDate = 1
	 IF (@Bucket = '12 month treatment outcome')  SET @TreatmentOutcome12Months = 1
	IF (@Bucket = '24 month treatment outcome')  SET @TreatmentOutcome24Months = 1
	IF (@Bucket = '36 month treatment outcome')  SET @TreatmentOutcome36Months = 1
	IF (@Bucket = 'Date of death')  SET @DateOfDeath = 1
	IF (@Bucket = 'date of birth')  SET @DateOfBirth = 1
	IF (@Bucket = 'UK born')  SET @UKBorn = 1
	IF (@Bucket = 'Site of Disease')  SET @SiteOfDisease = 1
	IF (@Bucket = 'Denotify')  SET @Denotify = 1
	IF (@Bucket = 'Onset to presentation days')  SET @OnsetToPresentationDays = 1
	IF (@Bucket = 'Presentation to diagnosis days')  SET @PresentationToDiagnosisDays = 1
	IF (@Bucket = 'Diagnosis to treatment days')  SET @DiagnosisToTreatmentDays = 1
	IF (@Bucket = 'Onset to treatment days')  SET @OnsetToTreatmentDays = 1
	IF (@Bucket = 'Postcode')  SET @Postcode = 1

			 IF (@Bucket = 'Total') 
			 begin 
				SET @TreatmentEndDate = 1
				SET @TreatmentOutcome12Months = 1
				SET @TreatmentOutcome24Months = 1
				SET @TreatmentOutcome36Months = 1
				SET @DateOfDeath = 1
				SET @DateOfBirth = 1
				SET @UKBorn = 1
				SET @SiteOfDisease = 1
				SET @Denotify = 1
				SET @OnsetToPresentationDays = 1
				SET @PresentationToDiagnosisDays = 1
				SET @DiagnosisToTreatmentDays = 1
				SET @OnsetToTreatmentDays = 1
				SET @Postcode = 1

			 end
			
							
			DECLARE @ReusableNotification ReusableNotificationType

			INSERT INTO @ReusableNotification
				SELECT distinct n.*
				FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n

					INNER JOIN dbo.DataQuality d ON d.NotificationId = n.NotificationId
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo 
				AND (((@ServiceName IS NULL OR @Region IS NULL) OR @ServiceName <> 'All') OR n.TreatmentPhec = @Region)
								AND ((@ServiceName IS NULL OR @ServiceName = 'All') OR 
					n.[Service] in (select value from STRING_SPLIT(@ServiceName, ',')) or
					(@serviceName = 'Blank' and Service is null and n.ResidencePhec = @region and n.TreatmentPhec is null))

				--and @TreatmentEndDate IS NULL OR d.TreatmentEndDate = @TreatmentEndDate
				
				AND (
					(( d.TreatmentEndDate = @TreatmentEndDate) OR (@TableTotal = 1 and (d.TreatmentEndDate = @TreatmentEndDate)))
					OR (( d.TreatmentOutcome12Months = @TreatmentOutcome12Months) OR (@TableTotal = 1 and (d.TreatmentOutcome12Months = @TreatmentOutcome12Months)))
					OR (( d.TreatmentOutcome24Months = @TreatmentOutcome24Months) OR (@TableTotal = 1 and (d.TreatmentOutcome24Months = @TreatmentOutcome24Months)))
					OR (( d.TreatmentOutcome36Months = @TreatmentOutcome36Months) OR (@TableTotal = 1 and (d.TreatmentOutcome36Months = @TreatmentOutcome36Months)))
					OR (( d.DateOfDeath = @DateOfDeath) OR (@TableTotal = 1 and (d.DateOfDeath = @DateOfDeath)))
					OR (( d.DateOfBirth = @DateOfBirth) OR (@TableTotal = 1 and (d.DateOfBirth = @DateOfBirth)))
					OR (( d.UKBorn = @UKBorn) OR (@TableTotal = 1 and (d.UKBorn = @UKBorn)))
					OR (( d.SiteOfDisease = @SiteOfDisease) OR (@TableTotal = 1 and (d.SiteOfDisease = @SiteOfDisease)))
					OR (( d.Denotify = @Denotify) OR (@TableTotal = 1 and (d.Denotify = @Denotify)))
					OR (( d.OnsetToPresentationDays = @OnsetToPresentationDays) OR (@TableTotal = 1 and (d.OnsetToPresentationDays = @OnsetToPresentationDays)))
					OR (( d.PresentationToDiagnosisDays = @PresentationToDiagnosisDays) OR (@TableTotal = 1 and (d.PresentationToDiagnosisDays = @PresentationToDiagnosisDays)))
					OR (( d.DiagnosisToTreatmentDays = @DiagnosisToTreatmentDays) OR (@TableTotal = 1 and (d.DiagnosisToTreatmentDays = @DiagnosisToTreatmentDays)))
					OR (( d.OnsetToTreatmentDays = @OnsetToTreatmentDays) OR (@TableTotal = 1 and (d.OnsetToTreatmentDays = @OnsetToTreatmentDays)))
					OR (( d.Postcode = @Postcode) OR (@TableTotal = 1 and (d.Postcode = @Postcode)))
				)



			SELECT distinct
			-- Primary key
			n.NotificationId                                       AS 'ID',
			-- Demographics
			n.EtsId                                                AS 'ETS ID',
			n.LtbrId											   AS 'LTBR ID',
			n.Service												As 'Service',
			n.CaseManager											AS 'Case manager',
			case 
				when @bucket = 'Treatment end date' or (@bucket = 'Total' and d.TreatmentEndDate = 1) then 'Missing treatment end date'
				when @bucket = '12 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome12Months = 1) then 'Missing 12 month treatment outcome'
				when @bucket = '24 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome24Months = 1) then 'Missing 24 month treatment outcome'
				when @bucket = '36 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome36Months = 1) then 'Missing 36 month treatment outcome'
				when @bucket = 'Date of death' or (@bucket = 'Total' and d.DateOfDeath = 1) then 'Missing date of death'
				when @bucket = 'date of birth' or (@bucket = 'Total' and d.DateOfBirth = 1) then 'Missing date of birth'
				when @bucket = 'UK born' or (@bucket = 'Total' and d.UKBorn = 1) then 'UK Born is Unknown'
				when @bucket = 'Site of Disease' or (@bucket = 'Total' and d.SiteOfDisease = 1) then 'Site of disease is Unknown'
				when @bucket = 'Denotify' or (@bucket = 'Total' and d.Denotify = 1) then 'Patient did not have TB'
				when @bucket = 'Onset to presentation days' or (@bucket = 'Total' and d.OnsetToPresentationDays = 1) then 'Onset to presentation days'
				when @bucket = 'Presentation to diagnosis days' or (@bucket = 'Total' and d.PresentationToDiagnosisDays = 1) then 'Presentation to diagnosis days'
				when @bucket = 'Diagnosis to treatment days' or (@bucket = 'Total' and d.DiagnosisToTreatmentDays = 1) then 'Diagnosis to treatment days'
				when @bucket = 'Onset to treatment days' or (@bucket = 'Total' and d.OnsetToTreatmentDays = 1) then 'Onset to treatment days'
				when @bucket = 'Postcode' or (@bucket = 'Total' and d.Postcode = 1) then 'Invalid postcode'
				end AS 'Error text',
			dbo.ufnFormatDateConsistently(n.NotificationDate)       AS 'Notification date',
			case when	(@bucket = 'Date of death' or (@bucket = 'Total' and d.DateOfDeath = 1) ) or 
						(@bucket = 'Treatment end date' or (@bucket = 'Total' and d.TreatmentEndDate = 1) ) OR
						(@bucket = 'Denotify' or (@bucket = 'Total' and d.Denotify = 1) ) OR
						(@bucket = '12 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome12Months = 1) ) OR
						(@bucket = '24 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome24Months = 1) ) OR
						(@bucket = '36 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome36Months = 1) ) 
						then n.TreatmentOutcome12months else '' end as 'Treatment outcome 12 months' ,
			case when	(@bucket = 'Date of death' or (@bucket = 'Total' and d.DateOfDeath = 1) ) or 
						(@bucket = 'Treatment end date' or (@bucket = 'Total' and d.TreatmentEndDate = 1) ) OR
						(@bucket = 'Denotify' or (@bucket = 'Total' and d.Denotify = 1) ) OR
						(@bucket = '12 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome12Months = 1) ) OR
						(@bucket = '24 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome24Months = 1) ) OR
						(@bucket = '36 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome36Months = 1) )
						then n.TreatmentOutcome24months else '' end as 'Treatment outcome 24 months' ,
			case when	(@bucket = 'Date of death' or (@bucket = 'Total' and d.DateOfDeath = 1) ) or 
						(@bucket = 'Treatment end date' or (@bucket = 'Total' and d.TreatmentEndDate = 1) ) OR
						(@bucket = 'Denotify' or (@bucket = 'Total' and d.Denotify = 1) ) OR
						(@bucket = '12 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome12Months = 1) ) OR
						(@bucket = '24 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome24Months = 1) ) OR
						(@bucket = '36 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome36Months = 1) )
						then n.TreatmentOutcome36months else '' end as 'Treatment outcome 36 months' ,
			case when	(@bucket = 'Date of death' or (@bucket = 'Total' and d.DateOfDeath = 1) ) or 
						(@bucket = 'Denotify' or (@bucket = 'Total' and d.Denotify = 1) ) OR
						(@bucket = '12 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome12Months = 1) ) OR
						(@bucket = '24 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome24Months = 1) ) OR
						(@bucket = '36 month treatment outcome' or (@bucket = 'Total' and d.TreatmentOutcome36Months = 1) )
						then n.LastRecordedTreatmentOutcome end AS 'Last recorded treatment outcome',
			case when	(@bucket = 'Date of death' or (@bucket = 'Total' and d.DateOfDeath = 1) )
						then dbo.ufnFormatDateConsistently(n.DateOfDeath)  end as 'Date of death',
			case when	(@bucket = 'date of birth' or (@bucket = 'Total' and d.DateOfBirth = 1) )
						then dbo.ufnFormatDateConsistently(n.DateOfBirth)  end AS  'Date of Birth',
			case when	(@bucket = 'UK born' or (@bucket = 'Total' and d.UKBorn = 1) )
						then n.UkBorn end as 'UK born', 
			case when	(@bucket = 'Site of Disease' or (@bucket = 'Total' and d.SiteOfDisease = 1) )
						then n.SiteOfDisease end as 'Site of disease',
			case when	(@bucket = 'Onset to presentation days' or (@bucket = 'Total' and d.OnsetToPresentationDays = 1) ) OR
						(@bucket = 'Presentation to diagnosis days' or (@bucket = 'Total' and d.PresentationToDiagnosisDays = 1) ) OR
						(@bucket = 'Diagnosis to treatment days' or (@bucket = 'Total' and d.DiagnosisToTreatmentDays = 1) ) OR
						(@bucket = 'Onset to treatment days' or (@bucket = 'Total' and d.OnsetToTreatmentDays = 1) )
						then dbo.ufnFormatDateConsistently(n.SymptomOnsetDate) end as 'Symptom onset date',
			case when	(@bucket = 'Onset to presentation days' or (@bucket = 'Total' and d.OnsetToPresentationDays = 1) ) OR
						(@bucket = 'Presentation to diagnosis days' or (@bucket = 'Total' and d.PresentationToDiagnosisDays = 1) ) OR
						(@bucket = 'Diagnosis to treatment days' or (@bucket = 'Total' and d.DiagnosisToTreatmentDays = 1) ) OR
						(@bucket = 'Onset to treatment days' or (@bucket = 'Total' and d.OnsetToTreatmentDays = 1) ) then 
						dbo.ufnFormatDateConsistently(n.PresentedDate) end as 'Presentation date' ,
			case when	(@bucket = 'Onset to presentation days' or (@bucket = 'Total' and d.OnsetToPresentationDays = 1) ) OR
						(@bucket = 'Presentation to diagnosis days' or (@bucket = 'Total' and d.PresentationToDiagnosisDays = 1) ) OR
						(@bucket = 'Diagnosis to treatment days' or (@bucket = 'Total' and d.DiagnosisToTreatmentDays = 1) ) OR
						(@bucket = 'Onset to treatment days' or (@bucket = 'Total' and d.OnsetToTreatmentDays = 1) ) then 
						dbo.ufnFormatDateConsistently(n.DiagnosisDate) end as 'Diagnosis date' ,
			case when	(@bucket = 'Onset to presentation days' or (@bucket = 'Total' and d.OnsetToPresentationDays = 1) ) OR
						(@bucket = 'Presentation to diagnosis days' or (@bucket = 'Total' and d.PresentationToDiagnosisDays = 1) ) OR
						(@bucket = 'Diagnosis to treatment days' or (@bucket = 'Total' and d.DiagnosisToTreatmentDays = 1) ) OR
						(@bucket = 'Onset to treatment days' or (@bucket = 'Total' and d.OnsetToTreatmentDays = 1) ) then 
						dbo.ufnFormatDateConsistently(n.StartOfTreatmentDate) end as 'Start of treatment date' ,
			case when	(@bucket = 'Postcode' or (@bucket = 'Total' and d.Postcode = 1) )
						 then  n.Postcode end As 'Postcode'
			
			FROM @ReusableNotification n
			inner join DataQuality d on d.NotificationId = n.NotificationId
			ORDER BY [Notification date] DESC,id 
			--order by [Error text]

			-- Write data to audit log
			
			EXEC dbo.uspAddToAudit 'Data Quality', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspDisplayException]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This handles an exception in a way that information about the problem gets logged to the
         Windows Event Viewer, and also returned to the user. Only invoke this function, if you are 
		 a DB admin user, an are meant to see this debug information on-screen, else it compromises
		 system security.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspDisplayException] AS
	BEGIN TRY
		BEGIN
			-- Compile error message
		/*	DECLARE @ErrorMsg AS VARCHAR(1000) = CHAR(13) + CHAR(13) +
												 'Message: ' + ERROR_MESSAGE() + CHAR(13) +
												 'Proc: ' + ERROR_PROCEDURE() + CHAR(13) +
												 'Line: ' + CONVERT(VARCHAR, ERROR_LINE()) + CHAR(13) +
												 'Error no: ' + CONVERT(VARCHAR, ERROR_NUMBER()) + CHAR(13) +
												 'Username: ' + SUSER_SNAME()
	*/
		INSERT INTO dbo.ErrorLog (ErrorDateTime,UserName,ErrorNumber,ErrorMessage,ProcName,LineNumber)
			VALUES( GETUTCDATE(),  SYSTEM_USER, CONVERT(VARCHAR, ERROR_NUMBER()),ERROR_MESSAGE(),ERROR_PROCEDURE(),CONVERT(VARCHAR, ERROR_LINE()))

			-- Log error
		--	EXEC [$(master)].sys.xp_logevent 60000, @ErrorMsg

			-- Display error
			SELECT ERROR_MESSAGE() AS 'ErrorMessage'
		END
	END TRY
	BEGIN CATCH
		RAISERROR ('The SQL Stored Procedure dbo.uspDisplayException failed to return an error message to the DB admin', 16, 1) WITH NOWAIT;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspDivZero]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspDivZero] 
	
AS
BEGIN
	BEGIN TRY
		DECLARE @result INT
		--Generate divide-by-zero error
		SET @result = 55/0
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspDrugResistanceProfileByResistantId]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns the associated DrugResistanceProfile drop-down values depending on which
         drop-down values have been selected from the Resistant table.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspDrugResistanceProfileByResistantId] (
	@ResistantId TINYINT = NULL
) AS
	SET NOCOUNT ON

	BEGIN TRY
		IF (@ResistantId IS NOT NULL) 
			SELECT 
				'All' AS DrugResistanceProfile
			UNION
			SELECT 
				DrugResistanceProfile
			FROM dbo.DrugResistanceProfile
			WHERE ResistantId = @ResistantId
		ELSE
			RAISERROR ('You need to pass a @ResistantId', 16, 1) WITH NOWAIT;
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspEnhancedLineList]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Enhanced Line List", which returns every/most notification data point
         in detail, based on the user's permission & filtering preference. Every notification record
		 returned gets audited, whch means a log entry gets added for each user that views a notification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspEnhancedLineList]
	(
		@NotificationYearFrom	INTEGER			=	-3,
		@NotificationMonthFrom	INTEGER			=	1,
		@NotificationYearTo		INTEGER			=	0,
		@NotificationMonthTo	INTEGER			=	1,
		@ResidenceTreatment		TINYINT			=   1,
		@Region					VARCHAR(1000)	=	NULL,
		@AgeFrom				INTEGER			=	NULL,
		@AgeTo					INTEGER			=	NULL,
		@UKBorn					VARCHAR(3)		=	NULL,
		@SocialRiskFactors		INTEGER			=	NULL,
		@Comorbidities			INTEGER			=	NULL,
		@SiteOfDisease			VARCHAR(16)		=	NULL,	
		@DrugResistanceProfile	varchar(1000)	=	NULL,
		@Species				VARCHAR(25)		=	NULL,	
		@Service				varchar(5000)	=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @LoginGroups

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
			DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
			DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
			DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo) -- Move end date to last day of month

			DECLARE @SRF_Any				VARCHAR(3) = (CASE WHEN @SocialRiskFactors = 2 THEN 'No'
																WHEN @SocialRiskFactors = 3 THEN 'Yes' ELSE NULL END)
			DECLARE @SRF_Alcohol_Misuse		VARCHAR(3) = (CASE WHEN @SocialRiskFactors = 4 THEN 'Yes' ELSE NULL END)	
			DECLARE @SRF_Drug_Misuse		VARCHAR(3) = (CASE WHEN @SocialRiskFactors = 5 THEN 'Yes' ELSE NULL END)
			DECLARE @SRF_Homeless			VARCHAR(3) = (CASE WHEN @SocialRiskFactors = 6 THEN 'Yes' ELSE NULL END)
			DECLARE @SRF_Prison				VARCHAR(3) = (CASE WHEN @SocialRiskFactors = 7 THEN 'Yes' ELSE NULL END)

			DECLARE @CRF_None				VARCHAR(3) = (CASE WHEN @Comorbidities = 2 THEN 'Yes' ELSE NULL END)	
			DECLARE @CRF_Chronic_Liver		VARCHAR(3) = (CASE WHEN @Comorbidities = 3 THEN 'Yes' ELSE NULL END)	
			DECLARE @CRF_Chronic_Renal		VARCHAR(3) = (CASE WHEN @Comorbidities = 4 THEN 'Yes' ELSE NULL END)
			DECLARE @CRF_Diabetes			VARCHAR(3) = (CASE WHEN @Comorbidities = 5 THEN 'Yes' ELSE NULL END)
			DECLARE @CRF_Hepatitis_B		VARCHAR(3) = (CASE WHEN @Comorbidities = 6 THEN 'Yes' ELSE NULL END)
			DECLARE @CRF_Hepatitis_C		VARCHAR(3) = (CASE WHEN @Comorbidities = 7 THEN 'Yes' ELSE NULL END)
			DECLARE @CRF_Smoking			VARCHAR(3) = (CASE WHEN @Comorbidities = 8 THEN 'Yes' ELSE NULL END)

			-- If value is All then set to null  = null in where clause, otherwise set to filter value
			DECLARE @BornInUK				VARCHAR(3) = (CASE WHEN @UKBorn = 'All' THEN NULL ELSE @UKBorn END)
			DECLARE @SOD					VARCHAR(16) = (CASE WHEN @SiteOfDisease = 'All' THEN NULL ELSE @SiteOfDisease END)
			--DECLARE @DRP					VARCHAR(30) = (CASE WHEN @DrugResistanceProfile = 'All' THEN NULL ELSE @DrugResistanceProfile END)
			DECLARE @SpeciesValue			VARCHAR(25) = (CASE WHEN @Species = 'All' THEN NULL ELSE @Species END)
			set @Service					= CASE
												WHEN
													-- the number of services provided into the parameter
													LEN(@Service) - LEN(REPLACE(@Service, ',', '')) +1 
													-- the number of services that exist in the provieded regions
													= (SELECT COUNT(*) FROM TB_Service WHERE PhecName IN (SELECT VALUE FROM STRING_SPLIT(@Region, ',')))
													THEN'All' 
												ELSE @Service
											END
			
			DECLARE @ReusableNotification ReusableNotificationType

			If (@Service = 'All')
			Begin

			INSERT INTO @ReusableNotification
				SELECT n.*
				FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n  -- This filters the records by regional PHEC permissions!
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (
							(
									@ResidenceTreatment = 1 AND
									(n.TreatmentPhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ',')) OR n.ResidencePhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ',')))
							) OR (
									@ResidenceTreatment = 2 AND
									n.TreatmentPhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ','))
							) OR (
									@ResidenceTreatment = 3 AND
									n.ResidencePhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ','))
							)
					)
					AND (@AgeFrom IS NULL OR n.Age IS NULL OR n.Age >= @AgeFrom)
					AND (@AgeTo IS NULL OR n.Age IS NULL OR n.Age <= @AgeTo)
					AND (@BornInUK IS NULL OR n.UkBorn = @BornInUK)
					AND (@SOD IS NULL OR n.SiteOfDisease = @SOD)
					AND n.DrugResistanceProfile in  (select value from STRING_SPLIT(@DrugResistanceProfile, ','))
					AND (@SpeciesValue IS NULL OR n.Species = @SpeciesValue)
					--SocialRiskFactors
					AND (@SRF_Any IS NULL OR n.AnySocialRiskFactor = @SRF_Any)
					AND (@SRF_Alcohol_Misuse IS NULL OR n.AlcoholMisuse = @SRF_Alcohol_Misuse)
					AND (@SRF_Drug_Misuse IS NULL OR n.DrugMisuse = @SRF_Drug_Misuse)
					AND (@SRF_Homeless IS NULL OR n.Homeless = @SRF_Homeless)
					AND (@SRF_Prison IS NULL OR n.Prison = @SRF_Prison)
					--ClinicalRiskFactors
					AND (@CRF_None IS NULL OR n.ChronicLiverDisease = 'No' AND n.ChronicRenalDisease = 'No' AND n.Diabetes = 'No' AND n.HepatitisB = 'No' AND n.HepatitisC = 'No' AND n.ImmunoSuppression = 'No' AND n.CurrentSmoker = 'No')
					AND (@CRF_Chronic_Liver IS NULL OR n.ChronicLiverDisease = @CRF_Chronic_Liver) 
					AND (@CRF_Chronic_Renal IS NULL OR n.ChronicRenalDisease = @CRF_Chronic_Renal)
					AND (@CRF_Diabetes IS NULL OR n.Diabetes = @CRF_Diabetes)
					AND (@CRF_Hepatitis_B IS NULL OR n.HepatitisB = @CRF_Hepatitis_B)
					AND (@CRF_Hepatitis_C IS NULL OR n.HepatitisC = @CRF_Hepatitis_C)
					AND (@CRF_Smoking IS NULL OR n.CurrentSmoker = @CRF_Smoking)
				End

			If (@Service <> 'All')
			Begin

			INSERT INTO @ReusableNotification
				SELECT n.*
				FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n  -- This filters the records by regional PHEC permissions!
				inner join TB_Service s on s.TB_Service_Name = n.Service
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (
							(
									@ResidenceTreatment = 1 AND
									(n.TreatmentPhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ',')) OR n.ResidencePhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ',')))
							) OR (
									@ResidenceTreatment = 2 AND
									n.TreatmentPhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ','))
							) OR (
									@ResidenceTreatment = 3 AND
									n.ResidencePhec IN (SELECT VALUE FROM STRING_SPLIT(@Region, ','))
							)
					)
					and Serviceid in (select value from STRING_SPLIT(@Service, ','))
					AND (@AgeFrom IS NULL OR n.Age IS NULL OR n.Age >= @AgeFrom)
					AND (@AgeTo IS NULL OR n.Age IS NULL OR n.Age <= @AgeTo)
					AND (@BornInUK IS NULL OR n.UkBorn = @BornInUK)
					AND (@SOD IS NULL OR n.SiteOfDisease = @SOD)
					AND n.DrugResistanceProfile in  (select value from STRING_SPLIT(@DrugResistanceProfile, ','))
					AND (@SpeciesValue IS NULL OR n.Species = @SpeciesValue)
					--SocialRiskFactors
					AND (@SRF_Any IS NULL OR n.AnySocialRiskFactor = @SRF_Any)
					AND (@SRF_Alcohol_Misuse IS NULL OR n.AlcoholMisuse = @SRF_Alcohol_Misuse)
					AND (@SRF_Drug_Misuse IS NULL OR n.DrugMisuse = @SRF_Drug_Misuse)
					AND (@SRF_Homeless IS NULL OR n.Homeless = @SRF_Homeless)
					AND (@SRF_Prison IS NULL OR n.Prison = @SRF_Prison)
					--ClinicalRiskFactors
					AND (@CRF_None IS NULL OR n.ChronicLiverDisease = 'No' AND n.ChronicRenalDisease = 'No' AND n.Diabetes = 'No' AND n.HepatitisB = 'No' AND n.HepatitisC = 'No' AND n.ImmunoSuppression = 'No' AND n.CurrentSmoker = 'No')
					AND (@CRF_Chronic_Liver IS NULL OR n.ChronicLiverDisease = @CRF_Chronic_Liver) 
					AND (@CRF_Chronic_Renal IS NULL OR n.ChronicRenalDisease = @CRF_Chronic_Renal)
					AND (@CRF_Diabetes IS NULL OR n.Diabetes = @CRF_Diabetes)
					AND (@CRF_Hepatitis_B IS NULL OR n.HepatitisB = @CRF_Hepatitis_B)
					AND (@CRF_Hepatitis_C IS NULL OR n.HepatitisC = @CRF_Hepatitis_C)
					AND (@CRF_Smoking IS NULL OR n.CurrentSmoker = @CRF_Smoking)

				End

			-- Return data to client app
			SELECT
				-- Primary key
				n.NotificationId                                       AS 'ID',

				-- Demographics
				n.EtsId                                                AS 'ETS ID',
				n.LtbrId                                               AS 'LTBR ID',
				dbo.ufnFormatDateConsistently(n.NotificationDate)      AS 'Notification date',
				n.CaseManager                                          AS 'Case manager',
				n.Consultant                                           AS 'Consultant',
				n.Hospital                                             AS 'Hospital',
				n.[Service]                                            AS 'Service',
				n.NhsNumber                                            AS 'NHS Number',
				n.Forename                                             AS 'Forename',
				n.Surname                                              AS 'Surname',
				dbo.ufnFormatDateConsistently(n.DateOfBirth)           AS 'Date of birth',
				n.Age                                                  AS 'Age',
				n.Sex                                                  AS 'Sex',
				n.UkBorn                                               AS 'UK born',
				n.EthnicGroup                                          AS 'Ethnic group',
				n.BirthCountry                                         AS 'Birth country',
				n.UkEntryYear                                          AS 'UK entry year',
				n.Postcode                                             AS 'Postcode',
				n.NoFixedAbode                                         AS 'No fixed abode',

				-- Geographies
				n.LocalAuthority                                       AS 'Local Authority',
				n.LocalAuthorityCode                                   AS 'Local Authority Code',
				n.ResidencePhec                                        AS 'Residence PHEC',
				n.TreatmentPhec                                        AS 'Treatment PHEC',

				-- Clinical Details
				dbo.ufnFormatDateConsistently(n.SymptomOnsetDate)      AS 'Symptom onset date',
				dbo.ufnFormatDateConsistently(n.PresentedDate)         AS 'Presented date',
				n.OnsetToPresentationDays                              AS 'Onset to presentation days',
				dbo.ufnFormatDateConsistently(n.DiagnosisDate)         AS 'Diagnosis date',
				n.PresentationToDiagnosisDays                          AS 'Presentation to diagnosis days',
				dbo.ufnFormatDateConsistently(n.StartOfTreatmentDate)  AS 'Start of treatment date',
				n.DiagnosisToTreatmentDays                             AS 'Diagnosis to treatment days',
				n.OnsetToTreatmentDays                                 AS 'Onset to treatment days',
				n.HivTestOffered                                       AS 'HIV test offered',
				n.SiteOfDisease                                        AS 'Site of disease',
				n.AdultContactsIdentified                              AS 'Adult contacts identified',
				n.ChildContactsIdentified	                           AS 'Child contacts identified',
				n.TotalContactsIdentified	                           AS 'Total contacts identified',
				n.AdultContactsAssessed                                AS 'Adult contacts screened',
				n.ChildContactsAssessed                                AS 'Child contacts screened',
				n.TotalContactsAssessed                                AS 'Total contacts screened',
				n.AdultContactsActiveTB                                AS 'Adult contacts with active TB',
				n.ChildContactsActiveTB                                AS 'Child contacts with active TB',
				n.TotalContactsActiveTB                                AS 'Total contacts with active TB',
				n.AdultContactsLTBI                                    AS 'Adult contacts with LTBI',
				n.ChildContactsLTBI                                    AS 'Child contacts with LTBI',
				n.TotalContactsLTBI                                    AS 'Total contacts with LTBI',
				n.AdultContactsLTBITreat                               AS 'Adult LTBI contacts started LTBI treatment',
				n.ChildContactsLTBITreat                               AS 'Child LTBI contacts started LTBI treatment',
				n.TotalContactsLTBITreat                               AS 'Total LTBI  contacts started LTBI treatment',
				n.AdultContactsLTBITreatComplete                       AS 'Adult LTBI contacts completed LTBI treatment',
				n.ChildContactsLTBITreatComplete                       AS 'Child LTBI contacts completed LTBI treatment',
				n.TotalContactsLTBITreatComplete                       AS 'Total LTBI contacts completed LTBI treatment',
				n.PreviouslyDiagnosed                                  AS 'Previously diagnosed',
				n.YearsSinceDiagnosis                                  AS 'Years since diagnosis',
				n.PreviouslyTreated                                    AS 'Previously treated',
				n.TreatmentInUk                                        AS 'Treatment in UK',
				n.PreviousId                                           AS 'Previous ID',
				n.BcgVaccinated                                        AS 'BCG vaccinated',

				-- Risk Factors
				n.AnySocialRiskFactor                                  AS 'Any social risk factor',
				n.AlcoholMisuse                                        AS 'Alcohol misuse',
				n.DrugMisuse 							               AS 'Drug misuse',
				n.CurrentDrugMisuse                                    AS 'Current drug misuse',
				n.DrugMisuseInLast5Years                               AS 'Drug misuse in last 5 years',
				n.DrugMisuseMoreThan5YearsAgo                          AS 'Drug misuse more than 5 years ago',
				n.Homeless								               AS 'Homeless',
				n.CurrentlyHomeless                                    AS 'Currently homeless',
				n.HomelessInLast5Years                                 AS 'Homeless in last 5 years',
				n.HomelessMoreThan5YearsAgo                            AS 'Homeless more than 5 years ago',
				n.Prison								               AS 'Prison',
				n.CurrentlyInPrisonOrInPrisonWhenFirstSeen             AS 'Currently in prison or in prison when first seen',
				n.InPrisonInLast5Years                                 AS 'In prison in last 5 years',
				n.InPrisonMoreThan5YearsAgo                            AS 'In prison more than 5 years ago',
				n.TravelledOutsideUk                                   AS 'Travelled outside UK',
				n.ToHowManyCountries                                   AS 'To how many countries',
				n.TravelCountry1                                       AS 'Travel country 1',
				n.MonthsTravelled1                                     AS 'Months travelled 1',
				n.TravelCountry2                                       AS 'Travel country 2',
				n.MonthsTravelled2                                     AS 'Months travelled 2',
				n.TravelCountry3                                       AS 'Travel country 3',
				n.MonthsTravelled3                                     AS 'Months travelled 3',
				n.ReceivedVisitors                                     AS 'Received visitors',
				n.FromHowManyCountries                                 AS 'From how many countries',
				n.VisitorCountry1                                      AS 'Visitor country 1',
				n.DaysVisitorsStayed1                                  AS 'Days visitors stayed 1',
				n.VisitorCountry2                                      AS 'Visitor country 2',
				n.DaysVisitorsStayed2                                  AS 'Days visitors stayed 2',
				n.VisitorCountry3                                      AS 'Visitor country 3',
				n.DaysVisitorsStayed3                                  AS 'Days visitors stayed 3',
				n.Diabetes                                             AS 'Diabetes',
				n.HepatitisB                                           AS 'Hepatitis B',
				n.HepatitisC                                           AS 'Hepatitis C',
				n.ChronicLiverDisease                                  AS 'Chronic liver disease',
				n.ChronicRenalDisease                                  AS 'Chronic renal disease',
				n.ImmunoSuppression                                    AS 'Immunosuppression',
				n.BiologicalTherapy                                    AS 'Biological therapy',
				n.Transplantation                                      AS 'Transplantation',
				n.OtherImmunoSuppression                               AS 'Other immunosuppression',
				n.CurrentSmoker                                        AS 'Current smoker',
			
				-- Treatment
				n.PostMortemDiagnosis                                  AS 'Post-mortem diagnosis',
				n.DidNotStartTreatment                                 AS 'Did not start treatment',
				n.ShortCourse                                          AS 'Short course',
				n.MdrTreatment                                         AS 'MDR treatment',
				dbo.ufnFormatDateConsistently(n.MdrTreatmentDate)      AS 'MDR treatment date',
				n.TreatmentOutcome12months                             AS 'Treatment outcome 12 months',
				n.TreatmentOutcome24months                             AS 'Treatment outcome 24 months',
				n.TreatmentOutcome36months                             AS 'Treatment outcome 36 months',
				n.LastRecordedTreatmentOutcome                         AS 'Last recorded treatment outcome',
				dbo.ufnFormatDateConsistently(n.DateOfDeath)           AS 'Date of death',
				dbo.ufnFormatDateConsistently(n.TreatmentEndDate)      AS 'Treatment end date',

				-- Culture & Resistance
				n.NoSampleTaken                                        AS 'No sample taken',
				n.CulturePositive                                      AS 'Culture positive',
				n.Species                                              AS 'Species',
				dbo.ufnFormatDateConsistently(n.EarliestSpecimenDate)  AS 'Earliest specimen date',
				n.DrugResistanceProfile                                AS 'Drug resistance profile',
				n.INH                                                  AS 'INH',
				n.RIF                                                  AS 'RIF',
				n.EMB                                                  AS 'EMB',
				n.PZA                                                  AS 'PZA',
				n.MDR                                                  AS 'MDR',
				n.XDR                                                  AS 'XDR'
			FROM @ReusableNotification n
			ORDER BY n.NotificationDate DESC

			-- Write data to audit log
			EXEC dbo.uspAddToAudit 'Enhanced Line List', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspFooter]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns the pre-calculated footer text that gets displayed underneath every SSRS report
         (calculated by uspGenerateFooter).


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspFooter] AS
	SET NOCOUNT ON

	BEGIN TRY
		SELECT 
			FooterTextId,
			FooterText
		FROM dbo.FooterText
	END TRY

	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerate]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This pre-calculates and pre-generates most reporting data.
         This job is scheduled to run over-night!


         
**************************************************************************************************/
CREATE PROCEDURE [dbo].[uspGenerate] AS
	SET NOCOUNT ON

	BEGIN TRY
		-- If any "Generate" procs errors, then roll back all "Generate" procs !
		BEGIN TRANSACTION

		-- Re-seed drop-downs (in case data has changed)
		EXEC dbo.uspSeed
		EXEC dbo.uspGenerateTB_Service

		-- Populate Reference Lab Result data
		EXEC dbo.uspLabSpecimen

		-- Populate manual lab result tables
		EXEC dbo.uspManualLabResult

		-- Populate reusable notification table
		EXEC dbo.uspGenerateReusableNotification_ETS
		EXEC dbo.uspGenerateReusableNotification

		-- Populate report-specific tables
		EXEC dbo.uspGenerateCultureResistance
		EXEC dbo.uspGenerateOutcomeSummary
		EXEC dbo.uspGenerateDataQuality

		-- Populate boilerplate report too (not much overhead, so might as well for demo purposes)
		EXEC dbo.uspGenerateBoilerplate

		-- Needs to be executed after any report requiring use of PostcodeLookup table
		EXEC dbo.uspUpdateReusableNotificationPostcode

		-- Save last refresh date to footer
		EXEC dbo.uspGenerateFooter

		COMMIT
	END TRY
	BEGIN CATCH
		-- A "Generate" proc has errored
		IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  

		-- Show error on screen
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateBoilerplate]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This pre-calculates the figures for the "Boilerplate" report for performance reasons
         (this is part of the re-generation schedule every night).


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateBoilerplate] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- Reset
		DELETE FROM dbo.Boilerplate

		-- Seed table with all (valid) notifications to consider
		INSERT INTO dbo.Boilerplate (NotificationId)
			SELECT
				NotificationId
			FROM dbo.ReusableNotification WITH (NOLOCK)

		-- Boilerplate: Replace this random calculation by something you want to pre-calculate
		UPDATE dbo.Boilerplate SET
			BoilerplateCalculationNo1 = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM ReusableNotification WITH (NOLOCK)
								 WHERE UkBorn = 'Yes')

		-- Boilerplate: You may want to do an alternative calculation for all remaining notifications
		UPDATE dbo.Boilerplate SET
			BoilerplateCalculationNo1 = 0
		WHERE BoilerplateCalculationNo1 IS NULL
			AND NotificationId IN (SELECT NotificationId
								 FROM ReusableNotification WITH (NOLOCK)
								 WHERE (UkBorn != 'Yes' OR UkBorn IS NULL))

		-- Boilerplate: Replace this random calculation by something you want to pre-calculate
		UPDATE dbo.Boilerplate SET
			BoilerplateCalculationNo2 = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM ReusableNotification WITH (NOLOCK)
								 WHERE Age <= 40)

		-- Boilerplate: You may want to do an alternative calculation for all remaining notifications
		UPDATE dbo.Boilerplate SET
			BoilerplateCalculationNo2 = 0
		WHERE BoilerplateCalculationNo2 IS NULL
			AND NotificationId IN (SELECT NotificationId
								 FROM ReusableNotification WITH (NOLOCK)
								 WHERE (Age > 40 OR Age IS NULL))
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateCultureResistance]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This pre-calculates the figures for the "Culture And Resistance" report for performance reasons
         (this is part of the re-generation schedule every night).


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateCultureResistance] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- Reset
		DELETE FROM dbo.CultureResistance

		-- Seed table with all (valid) notifications to consider
		INSERT INTO dbo.CultureResistance (NotificationId)
			SELECT
				NotificationId
			FROM dbo.ReusableNotification

		-- Total records where Culture Positive is set to 'Yes'
		UPDATE dbo.CultureResistance SET
			CulturePositiveCases = 1
		WHERE NotificationId IN (SELECT NotificationId
				 FROM dbo.ReusableNotification WITH (NOLOCK)
				 WHERE CulturePositive = 'Yes')

		-- 1. Drug Resistance Profile is 'No Result' and Culture Positive is not set to 'Yes'
		UPDATE dbo.CultureResistance SET
			NonCulturePositiveCases = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DrugResistanceProfile = 'No Result'
									AND (CulturePositive != 'Yes' OR CulturePositive IS NULL))

		-- 2. Drug Resistance Profile is set to 'No result' and Culture Positive is set to 'Yes'
		UPDATE dbo.CultureResistance SET
			IncompleteDrugResistanceProfile = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DrugResistanceProfile = 'No Result'
									AND CulturePositive = 'Yes')

		-- 3. Drug Resistance Profile is set to 'Sensitive to first line'
		UPDATE dbo.CultureResistance SET
			SensitiveToAll4FirstLineDrugs = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DrugResistanceProfile = 'Sensitive to first line')

		-- 4. Drug Resistance Profile is 'INH Resistant'
		UPDATE dbo.CultureResistance SET
			InhRes = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DrugResistanceProfile = 'INH Resistant')

		-- 5. Drug Resistance Profile is 'INH+RIF Sensitive'
		UPDATE dbo.CultureResistance SET
			Other = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DrugResistanceProfile = 'INH+RIF Sensitive')

		-- 6. Drug Resistance Profile is 'RR/MDR/XDR' and XDR is not Yes
		UPDATE dbo.CultureResistance SET
			MdrRr = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DrugResistanceProfile = 'RR/MDR/XDR'
									AND (XDR != 'Yes' OR XDR IS NULL))

		-- 7. Drug Resistance Profile is 'RR/MDR/XDR' and XDR is Yes
		UPDATE dbo.CultureResistance SET
			Xdr = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DrugResistanceProfile = 'RR/MDR/XDR'
									AND XDR = 'Yes')

		-- 8. An error has occurred, record belongs in Bucket 'Other'
		-- This query captures all notifications that are not part of any of the above buckets yet
		UPDATE dbo.CultureResistance SET
			Other = 1
		WHERE NonCulturePositiveCases = 0
			AND IncompleteDrugResistanceProfile = 0
			AND SensitiveToAll4FirstLineDrugs = 0
			AND InhRes = 0
			AND Other = 0
			AND MdrRr = 0
			AND Xdr = 0
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateDataQuality]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This pre-calculates the figures for the "Data Quality" report for performance reasons
         (this is part of the re-generation schedule every night).


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateDataQuality] AS
	BEGIN TRY
		SET NOCOUNT ON

				-- Reset
		DELETE FROM dbo.DataQuality

		-- Seed table with all (valid) notifications to consider
		INSERT INTO dbo.DataQuality (NotificationId,TreatmentEndDate)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentEndDate is null and LastRecordedTreatmentOutcome = 'Completed'

		INSERT INTO dbo.DataQuality (NotificationId,TreatmentOutcome12Months)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE datediff(day, NotificationDate, getdate()) > 365
								  and  TreatmentOutcome12months in ('Error: Invalid value','Unknown','Not evaluated','')

		INSERT INTO dbo.DataQuality (NotificationId,TreatmentOutcome24Months)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE datediff(day, NotificationDate, getdate()) > 730 
								 and  TreatmentOutcome12months = 'Still on treatment'
										and TreatmentOutcome24months in ('Error: Invalid value','Unknown','Not evaluated','')			

		INSERT INTO dbo.DataQuality (NotificationId,TreatmentOutcome36Months)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE datediff(day, NotificationDate, getdate()) > 1095 
								 and  TreatmentOutcome24months = 'Still on treatment'
								 and TreatmentOutcome36months in ('Error: Invalid value','Unknown','Not evaluated','') 	

		INSERT INTO dbo.DataQuality (NotificationId,DateOfDeath)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Died' and DateOfDeath is null

		INSERT INTO dbo.DataQuality (NotificationId,DateOfBirth)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DateOfBirth is null

		INSERT INTO dbo.DataQuality (NotificationId,UKBorn)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE UkBorn = 'Unknown'

		INSERT INTO dbo.DataQuality (NotificationId,SiteOfDisease)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE SiteOfDisease = 'Unknown'

		INSERT INTO dbo.DataQuality (NotificationId,Denotify)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Patient did not have TB'

		INSERT INTO dbo.DataQuality (NotificationId,OnsetToPresentationDays)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE OnsetToPresentationDays <0

		INSERT INTO dbo.DataQuality (NotificationId,PresentationToDiagnosisDays)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE PresentationToDiagnosisDays <0

		INSERT INTO dbo.DataQuality (NotificationId,DiagnosisToTreatmentDays)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE DiagnosisToTreatmentDays < 0

		INSERT INTO dbo.DataQuality (NotificationId,OnsetToTreatmentDays)
		SELECT NotificationId,1
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE OnsetToTreatmentDays <0

		INSERT INTO dbo.DataQuality (NotificationId,Postcode)
		SELECT distinct NotificationId,1
								 FROM dbo.ReusableNotification n WITH (NOLOCK)
								LEFT OUTER JOIN [NTBS_R1_Geography_Staging].dbo.Reduced_Postcode_file r ON r.Pcode = n.Postcode
								WHERE 
								NoFixedAbode = 'No' AND
								 (ResidencePhec IS NULL OR  ResidencePhec = 'Unknown')
								AND (Postcode <> '' AND r.Pcode IS NULL)
								 
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateFooter]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This pre-calculates over-night the footer text that gets displayed underneath every SSRS report
         (derived from some template text).


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateFooter] AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE @FooterText AS VARCHAR(1000)
		DECLARE @ReportingLastRefreshed AS DATETIME
		DECLARE @EtsLastRefreshed AS DATETIME
		
		-- Get footer template text
		SET @FooterText = (SELECT Text
							FROM TemplateText)
		
		-- When were the generated reusable tables last refreshed ?
		Set @ReportingLastRefreshed = (select top 1 DataRefreshedAt from ReusableNotification n order by DataRefreshedAt desc)

		-- When was ETS last loaded ?
		Set @EtsLastRefreshed = (SELECT top 1 AuditAlter FROM [ETS].[dbo].[Notification] order by AuditAlter desc)
		--This is not correct but is the best approximation that can be obtained.

		-- Fail gracefully
		IF (@ReportingLastRefreshed IS NOT NULL)
			SET @FooterText = REPLACE(@FooterText, '{REPORTING_LAST_REFRESHED}', dbo.ufnFormatDateConsistently(@ReportingLastRefreshed) + ' ' + FORMAT(@ReportingLastRefreshed, 'HH:mm'))
		ELSE 
			SET @FooterText = REPLACE(@FooterText, '{REPORTING_LAST_REFRESHED}', '"UNKNOWN"')

		IF (@EtsLastRefreshed IS NOT NULL)
			SET @FooterText = REPLACE(@FooterText, '{ETS_LAST_REFRESHED}', dbo.ufnFormatDateConsistently(@EtsLastRefreshed) + ' ' + FORMAT(@EtsLastRefreshed, 'HH:mm'))
		ELSE 
			SET @FooterText = REPLACE(@FooterText, '{ETS_LAST_REFRESHED}', '"UNKNOWN"')

		DELETE FROM [dbo].[FooterText]

		INSERT INTO [dbo].[FooterText] (
			FooterTextId,
			FooterText
		) VALUES (
			1,
			@FooterText
		)
	END TRY

	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateLabMappings]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGenerateLabMappings] AS
declare @Mappings as table
	 (
		FieldName nvarchar(100),
		ETSDisplayCode nvarchar(100),
		LabDisplayCode nvarchar(50),
		LabName nvarchar(100),
		auditcreate date,
		Description nvarchar(100)
	 )

if object_id('dbo.LabMappings','U') is not null 
begin    
	drop table LabMappings
end
	 insert into @Mappings
 SELECT LF.FieldName, EC.DisplayCode AS ETSDisplayCode, LC.DisplayCode AS LabDisplayCode,l.Name as LabName,LCM.AuditCreate as auditcreate,EC.Description
 
	 FROM  [ETS].dbo.STM_LabCodeMapping AS LCM 
	  INNER JOIN [ETS].dbo.STM_LabCode AS LC on LC.LabCodeID = LCM.LabCodeID 
	  INNER JOIN [ETS].dbo.STM_ETSCode AS EC on EC.ETSCodeID = LCM.ETSCodeID
	  INNER JOIN [ETS].dbo.STM_LabField LF on LF.LabFieldID = LCM.FieldID
	  inner join [ETS].dbo.[Laboratory] l on l.id= lcm.[LabID]
	  order by labname, ETSDisplayCode

select [FieldName]
      ,[ETSDisplayCode]
      ,[LabDisplayCode]
      ,[LabName]
      ,cast([auditcreate] as date) as auditcreate
      ,[Description] into LabMappings from (select * from @Mappings
union all
select distinct 'Organism',OrganismCode, OrganismCode, 'Cardiff',o.AuditCreate,t.OrganismType from [ETS].dbo.STM_Organism o
inner join [ETS].dbo.STM_OrganismType t on t.OrganismTypeID = o.OrganismTypeID and t.OrganismType = 'Atypical'
inner join [LabBase2].dbo.Anonymised a on a.OrganismName = o.OrganismCode and ReferenceLaboratory = 'Cardiff' 
union all
select distinct 'Organism',OrganismCode, OrganismCode, 'Northern Ireland',o.AuditCreate,t.OrganismType from [ETS].dbo.STM_Organism o
inner join [ETS].dbo.STM_OrganismType t on t.OrganismTypeID = o.OrganismTypeID and t.OrganismType = 'Atypical'
inner join [LabBase2].dbo.Anonymised a on a.OrganismName = o.OrganismCode and ReferenceLaboratory = 'Northern Ireland'
Union all
select distinct 'Organism',OrganismDisplayName, OrganismCode, 'NMRL',o.AuditCreate,t.OrganismType from [ETS].dbo.STM_Organism o
inner join [ETS].dbo.STM_OrganismType t on t.OrganismTypeID = o.OrganismTypeID and t.OrganismType = 'Atypical'
inner join [LabBase2].dbo.Anonymised a on a.OrganismName = o.OrganismCode and ReferenceLaboratory = 'NMRL'
Union all
select distinct 'Organism',OrganismName, OrganismName, 'Birmingham',null,case when IsAtypicalOrganismRecord = 1 then 'Atypical' else 'MTB' end  from [LabBase2].dbo.Anonymised where MergedRecord = 0 and ReferenceLaboratory = 'Birmingham' and IsAtypicalOrganismRecord = 1) a
where FieldName not in (
'General Practitioner Code',
'Hospital/Trust or Sender',
'LaboratoryName',
'PatientEthnicity',
'PatientSex',
'ReferenceLaboratory') and LabName in ('NMRL','Birmingham','Cardiff','Northern Ireland')
order by FieldName, LabName, ETSDisplayCode
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateOutcomeSummary]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This pre-calculates the figures for the "Outcome Summary" report for performance reasons
         (this is part of the re-generation schedule every night).


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateOutcomeSummary] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- Reset
		DELETE FROM dbo.OutcomeSummary

		-- Seed table with all (valid) notifications to consider
		INSERT INTO dbo.OutcomeSummary (NotificationId)
			SELECT
				NotificationId
			FROM dbo.ReusableNotification WITH (NOLOCK)

		-- Populate LAST treatment outcome
		UPDATE dbo.OutcomeSummary SET
			TreatmentCompletedLastOutcome = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Completed')

		UPDATE dbo.OutcomeSummary SET
			DiedLastOutcome = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Died')

		UPDATE dbo.OutcomeSummary SET
			LostToFollowUpLastOutcome = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Lost to follow-up')

		UPDATE dbo.OutcomeSummary SET
			StillOnTreatmentLastOutcome = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Still on treatment')

		UPDATE dbo.OutcomeSummary SET
			TreatmentStoppedLastOutcome = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Treatment stopped')

		UPDATE dbo.OutcomeSummary SET
			NotEvaluatedLastOutcome = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Not evaluated')

		UPDATE dbo.OutcomeSummary SET
			UnknownLastOutcome = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE LastRecordedTreatmentOutcome = 'Unknown' 
								 OR LastRecordedTreatmentOutcome = 'Patient did not have TB')

		-- Populate 12 MONTH treatment outcome
		UPDATE dbo.OutcomeSummary SET
			TreatmentCompleted12Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome12Months = 'Completed')

		UPDATE dbo.OutcomeSummary SET
			Died12Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome12Months = 'Died')

		UPDATE dbo.OutcomeSummary SET
			LostToFollowUp12Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome12Months = 'Lost to follow-up')

		UPDATE dbo.OutcomeSummary SET
			StillOnTreatment12Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome12Months = 'Still on treatment')

		UPDATE dbo.OutcomeSummary SET
			TreatmentStopped12Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome12Months = 'Treatment stopped')

		UPDATE dbo.OutcomeSummary SET
			NotEvaluated12Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome12Months = 'Not evaluated')

		UPDATE dbo.OutcomeSummary SET
			Unknown12Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome12Months = 'Unknown'
								 OR TreatmentOutcome12Months = 'Patient did not have TB')

		-- Populate 24 MONTH treatment outcome
		UPDATE dbo.OutcomeSummary SET
			TreatmentCompleted24Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome24Months = 'Completed')

		UPDATE dbo.OutcomeSummary SET
			Died24Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome24Months = 'Died')

		UPDATE dbo.OutcomeSummary SET
			LostToFollowUp24Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome24Months = 'Lost to follow-up')

		UPDATE dbo.OutcomeSummary SET
			StillOnTreatment24Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome24Months = 'Still on treatment')

		UPDATE dbo.OutcomeSummary SET
			TreatmentStopped24Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome24Months = 'Treatment stopped')

		UPDATE dbo.OutcomeSummary SET
			NotEvaluated24Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome24Months = 'Not evaluated')

		UPDATE dbo.OutcomeSummary SET
			Unknown24Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome24Months = 'Unknown'
								 OR TreatmentOutcome24Months = 'Patient did not have TB')

		-- Populate 36 MONTH treatment outcome
		UPDATE dbo.OutcomeSummary SET
			TreatmentCompleted36Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome36Months = 'Completed')

		UPDATE dbo.OutcomeSummary SET
			Died36Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome36Months = 'Died')

		UPDATE dbo.OutcomeSummary SET
			LostToFollowUp36Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome36Months = 'Lost to follow-up')

		UPDATE dbo.OutcomeSummary SET
			StillOnTreatment36Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome36Months = 'Still on treatment')

		UPDATE dbo.OutcomeSummary SET
			TreatmentStopped36Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome36Months = 'Treatment stopped')

		UPDATE dbo.OutcomeSummary SET
			NotEvaluated36Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome36Months = 'Not evaluated')

		UPDATE dbo.OutcomeSummary SET
			Unknown36Month = 1
		WHERE NotificationId IN (SELECT NotificationId
								 FROM dbo.ReusableNotification WITH (NOLOCK)
								 WHERE TreatmentOutcome36Months = 'Unknown'
								 OR TreatmentOutcome36Months = 'Patient did not have TB')
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableCreateDate]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGenerateReusableCreateDate]
	
AS
	
	UPDATE [dbo].ReusableNotification
		SET RecordCreateDate = n.AuditCreate
		FROM [ETS].[dbo].[Notification] n
			INNER JOIN [dbo].ReusableNotification rn ON rn.EtsId = n.LegacyId
		WHERE rn.LtbrId IS NULL
		

	UPDATE [dbo].ReusableNotification
		SET RecordCreateDate = Q1.MinDate
	FROM dbo.ReusableNotification rn
		INNER JOIN (SELECT n.LegacyId, DATEADD(day,-3,MIN(el.AuditDateTime)) as MinDate
        FROM [ETS].[dbo].[Notification] n
            INNER JOIN [ETS].[dbo].[LTBRImportErrorLog] el ON el.CaseId = n.AuditMigrateId
        WHERE el.[Status] = 'Success'
        GROUP BY n.LegacyId) Q1 on Q1.LegacyId = rn.EtsId
	WHERE rn.LtbrId IS NOT NULL
	

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotification]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:	This populates ReusableNotification with every record in ReusableNotification_ETS whose 
		ETS ID is not already in ReusableNotification along with every record in NTBS         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotification]
AS

SET NOCOUNT ON

BEGIN TRY
	TRUNCATE TABLE ReusableNotification

	DECLARE @IncludeNTBS BIT = (SELECT TOP(1) IncludeNTBS FROM [dbo].[ReportingFeatureFlags])
	IF @IncludeNTBS = 1
	--only include NTBS records if NTBS is live.  
	BEGIN
		INSERT INTO ReusableNotification ([NotificationId]
			  ,[NtbsId]
			  ,[EtsId]
			  ,[SourceSystem]
			  ,[LtbrId]
			  ,[NotificationDate]
			  ,[CaseManager]
			  ,[Consultant]
			  ,[HospitalId]
			  ,[Hospital]
			  ,[TBServiceCode]
			  ,[Service]
			  ,[NhsNumber]
			  ,[Forename]
			  ,[Surname]
			  ,[DateOfBirth]
			  ,[Age]
			  ,[Sex]
			  ,[UkBorn]
			  ,[EthnicGroup]
			  ,[BirthCountry]
			  ,[UkEntryYear]
			  ,[Postcode]
			  ,[NoFixedAbode]
			  ,[LocalAuthority]
			  ,[LocalAuthorityCode]
			  ,[ResidencePhecCode]
			  ,[ResidencePhec]
			  ,[TreatmentPhecCode]
			  ,[TreatmentPhec]
			  ,[SymptomOnsetDate]
			  ,[PresentedDate]
			  ,[OnsetToPresentationDays]
			  ,[DiagnosisDate]
			  ,[PresentationToDiagnosisDays]
			  ,[StartOfTreatmentDate]
			  ,[DiagnosisToTreatmentDays]
			  ,[OnsetToTreatmentDays]
			  ,[HivTestOffered]
			  ,[SiteOfDisease]
			  ,[AdultContactsIdentified]
			  ,[ChildContactsIdentified]
			  ,[TotalContactsIdentified]
			  ,[AdultContactsAssessed]
			  ,[ChildContactsAssessed]
			  ,[TotalContactsAssessed]
			  ,[AdultContactsActiveTB]
			  ,[ChildContactsActiveTB]
			  ,[TotalContactsActiveTB]
			  ,[AdultContactsLTBI]
			  ,[ChildContactsLTBI]
			  ,[TotalContactsLTBI]
			  ,[AdultContactsLTBITreat]
			  ,[ChildContactsLTBITreat]
			  ,[TotalContactsLTBITreat]
			  ,[AdultContactsLTBITreatComplete]
			  ,[ChildContactsLTBITreatComplete]
			  ,[TotalContactsLTBITreatComplete]
			  ,[PreviouslyDiagnosed]
			  ,[YearsSinceDiagnosis]
			  ,[PreviouslyTreated]
			  ,[TreatmentInUk]
			  ,[PreviousId]
			  ,[BcgVaccinated]
			  ,[AnySocialRiskFactor]
			  ,[AlcoholMisuse]
			  ,[DrugMisuse]
			  ,[CurrentDrugMisuse]
			  ,[DrugMisuseInLast5Years]
			  ,[DrugMisuseMoreThan5YearsAgo]
			  ,[Homeless]
			  ,[CurrentlyHomeless]
			  ,[HomelessInLast5Years]
			  ,[HomelessMoreThan5YearsAgo]
			  ,[Prison]
			  ,[CurrentlyInPrisonOrInPrisonWhenFirstSeen]
			  ,[InPrisonInLast5Years]
			  ,[InPrisonMoreThan5YearsAgo]
			  ,[TravelledOutsideUk]
			  ,[ToHowManyCountries]
			  ,[TravelCountry1]
			  ,[MonthsTravelled1]
			  ,[TravelCountry2]
			  ,[MonthsTravelled2]
			  ,[TravelCountry3]
			  ,[MonthsTravelled3]
			  ,[ReceivedVisitors]
			  ,[FromHowManyCountries]
			  ,[VisitorCountry1]
			  ,[DaysVisitorsStayed1]
			  ,[VisitorCountry2]
			  ,[DaysVisitorsStayed2]
			  ,[VisitorCountry3]
			  ,[DaysVisitorsStayed3]
			  ,[Diabetes]
			  ,[HepatitisB]
			  ,[HepatitisC]
			  ,[ChronicLiverDisease]
			  ,[ChronicRenalDisease]
			  ,[ImmunoSuppression]
			  ,[BiologicalTherapy]
			  ,[Transplantation]
			  ,[OtherImmunoSuppression]
			  ,[CurrentSmoker]
			  ,[PostMortemDiagnosis]
			  ,[DidNotStartTreatment]
			  ,[ShortCourse]
			  ,[MdrTreatment]
			  ,[MdrTreatmentDate]
			  ,[TreatmentOutcome12months]
			  ,[TreatmentOutcome24months]
			  ,[TreatmentOutcome36months]
			  ,[LastRecordedTreatmentOutcome]
			  ,[DateOfDeath]
			  ,[TreatmentEndDate]
			  ,[NoSampleTaken]
			  ,[CulturePositive]
			  ,[Species]
			  ,[EarliestSpecimenDate]
			  ,[DrugResistanceProfile]
			  ,[INH]
			  ,[RIF]
			  ,[EMB]
			  ,[PZA]
			  ,[AMINO]
			  ,[QUIN]
			  ,[MDR]
			  ,[XDR]
			  ,[DataRefreshedAt]) 
		SELECT 
			n.NotificationId								AS 'NotificationId'
			,n.NotificationId								AS 'NTBS_ID'
			,n.ETSID										AS 'EtsId'
			,'NTBS'											AS 'SourceSystem'
			,n.LTBRID										AS 'LtbrId'
			,CONVERT(DATE, n.NotificationDate)				AS 'NotificationDate' 
			,u.DisplayName									AS 'CaseManager'
			,hd.Consultant									AS 'Consultant'
			,hd.HospitalId									AS 'HospitalID'
			,h.[Name]										AS 'Hospital'
			,hd.TBServiceCode								AS 'TBServiceCode'
			,tbs.[Name]										AS 'Service'
			,p.NhsNumber									AS 'NhsNumber' 
			,p.GivenName									AS 'Forename'
			,p.FamilyName									AS 'Surname'
			,CONVERT(DATE, p.Dob) 							AS 'DateOfBirth' 
			,dbo.ufnGetAgefrom(p.Dob,n.NotificationDate)	AS 'Age' 
			,s.Label										AS 'Sex' 
			,dbo.ufnYesNo(p.UkBorn)							AS 'UKBorn'
			,e.Label										AS 'EthnicGroup'
			,dbo.ufnGetCountryName(p.CountryId)			    AS 'BirthCountry'
			,p.YearOfUkEntry								AS 'UkEntryYear'
			,p.Postcode										AS 'Postcode' 
			,dbo.ufnYesNo(p.NoFixedAbode)					AS 'NoFixedAbode'
			,la.[Name]										AS 'LocalAuthority'
			,la.Code										AS 'LocalAuthorityCode'
			,resphec.Code									AS 'ResidencePhecCode' 
			,resphec.[Name]									AS 'ResidencePhec'
			,treatphec.Code									AS 'TreatmentPhecCode'
			,treatphec.[Name]								AS 'TreatmentPhec'
			--clinical dates are next. We will want to extend these to include the additional dates captured in NTBS
			,cd.SymptomStartDate							AS 'SymptomOnsetDate'
			,cd.FirstPresentationDate					    AS 'PresentedDate' 
			,CAST((DATEDIFF(DAY,
							cd.SymptomStartDate, 
							cd.TBServicePresentationDate))
						AS SMALLINT)						AS 'OnsetToPresentationDays' 
			,cd.DiagnosisDate								AS 'DiagnosisDate'
			,CAST((DATEDIFF(DAY,
							cd.TBServicePresentationDate, 
							cd.DiagnosisDate))
						AS SMALLINT)						AS 'PresentationToDiagnosisDays' 
			,cd.TreatmentStartDate							AS 'StartOfTreatmentDate'
			,CAST((DATEDIFF(DAY,
							cd.DiagnosisDate, 
							cd.TreatmentStartDate))
						AS SMALLINT)						AS 'DiagnosisToTreatmentDays' 
			,CAST((DATEDIFF(DAY,
							cd.SymptomStartDate, 
							cd.TreatmentStartDate))
						AS SMALLINT)						AS 'OnsetToTreatmentDays' 
			,dbo.ufnGetHivTestOffered (cd.HIVTestState)		AS 'HivTestOffered' 
			--NEXT: need to join to NotificationSite and Site tables to summarise site of disease
			,dbo.ufnGetSiteOfDisease(n.NotificationId)		AS 'SiteOfDisease' -- New function created for this. To be checked.
			--Contact Tracing
			,ct.AdultsIdentified							AS 'AdultContactsIdentified'
			,ct.ChildrenIdentified							AS 'ChildContactsIdentified'
			,ct.AdultsIdentified + ct.ChildrenIdentified	AS 'TotalContactsIdentified'
			,ct.AdultsScreened								AS 'AdultContactsAssessed'
			,ct.ChildrenScreened							AS 'ChildContactsAssessed'
			,ct.AdultsScreened + ct.ChildrenScreened		AS 'TotalContactsAssessed'
			,ct.AdultsActiveTB								AS 'AdultContactsActiveTB'
			,ct.ChildrenActiveTB							AS 'ChildContactsActiveTB'
			,ct.AdultsActiveTB + ct.ChildrenActiveTB		AS 'TotalContactsActiveTB'
			,ct.AdultsLatentTB								AS 'AdultContactsLTBI'
			,ct.ChildrenLatentTB							AS 'ChildContactsLTBI'
			,ct.AdultsLatentTB + ct.ChildrenLatentTB		AS 'TotalContactsLTBI'
			,ct.AdultsStartedTreatment						AS 'AdultContactsLTBITreat'
			,ct.ChildrenStartedTreatment					AS 'ChildContactsLTBITreat'
			,ct.AdultsStartedTreatment + 
				ct.ChildrenStartedTreatment					AS 'TotalContactsLTBITreat'
			,ct.AdultsFinishedTreatment						AS 'AdultContactsLTBITreatComplete'
			,ct.ChildrenFinishedTreatment					AS 'ChildContactsLTBITreatComplete'
			,ct.AdultsFinishedTreatment + 
				ct.ChildrenFinishedTreatment				AS 'TotalContactsLTBITreatComplete'
			--non-NTBS Diagnosis
			,pth.PreviouslyHadTb            				AS 'PreviouslyDiagnosed' 
			,DATEPART(YEAR, n.NotificationDate)-
				pth.PreviousTbDiagnosisYear				    AS 'YearsSinceDiagnosis' 
			,pth.PreviouslyTreated							AS 'PreviouslyTreated'
			,(CASE 
				WHEN ptc.IsoCode = 'GB' THEN 'Yes'
				WHEN ptc.IsoCode IS NOT NULL THEN 'No'
				ELSE NULL
			END)		            						AS 'TreatmentInUK'
			,NULL											AS 'PreviousId' --not relevant to NTBS as this dataset is for non-NTBS cases
			,cd.BCGVaccinationState							AS 'BcgVaccinated' 
			--social risk factors
			-- we have additional ones in NTBS for asylym seeker and immigration detainee, smoker (currently in co-morbid) and mental health
			,NULL											AS 'AnySocialRiskFactor' -- updated at end
			,srf.AlcoholMisuseStatus						AS 'AlcoholMisuse' 
			,rfd.[Status]									AS 'DrugMisuse' 
			,dbo.ufnYesNo(rfd.IsCurrent)					AS 'CurrentDrugMisuse'
			,dbo.ufnYesNo(rfd.InPastFiveYears)				AS 'DrugMisuseInLast5Years'
			,dbo.ufnYesNo(rfd.MoreThanFiveYearsAgo)			AS 'DrugMisuseMoreThan5YearsAgo'
			,rfh.[Status]									AS 'Homeless'
			,dbo.ufnYesNo(rfh.IsCurrent)					AS 'CurrentlyHomeless'
			,dbo.ufnYesNo(rfh.InPastFiveYears)				AS 'HomelessInLast5Years'
			,dbo.ufnYesNo(rfh.MoreThanFiveYearsAgo)			AS 'HomelessMoreThan5YearsAgo'
			,rfp.[Status]									AS 'Prison'
			,dbo.ufnYesNo(rfp.IsCurrent)					AS 'CurrentlyInPrisonOrInPrisonWhenFirstSeen'
			,dbo.ufnYesNo(rfp.InPastFiveYears)				AS 'InPrisonInLast5Years'
			,dbo.ufnYesNo(rfp.MoreThanFiveYearsAgo)			AS 'InPrisonMoreThan5YearsAgo'
			--travel and visitors
			,td.HasTravel									AS 'TravelledOutsideUk'
			,td.TotalNumberOfCountries						AS 'ToHowManyCountries'
			,dbo.ufnGetCountryName(td.Country1Id)			AS 'TravelCountry1'
			,td.StayLengthInMonths1							AS 'MonthsTravelled1'
			,dbo.ufnGetCountryName(td.Country2Id)			AS 'TravelCountry2'
			,td.StayLengthInMonths2							AS 'MonthsTravelled2'
			,dbo.ufnGetCountryName(td.Country3Id)			AS 'TravelCountry3' 
			,td.StayLengthInMonths3							AS 'MonthsTravelled3'
			,vd.HasVisitor									AS 'ReceivedVisitors'
			,vd.TotalNumberOfCountries						AS 'FromHowManyCountries'
			,dbo.ufnGetCountryName(vd.Country1Id)			AS 'VisitorCountry1'
			,vd.StayLengthInMonths1							AS 'DaysVisitorsStayed1' --NB is this captured in days in ETS? It's captured in months in NTBS
			,dbo.ufnGetCountryName(vd.Country2Id)			AS 'VisitorCountry2'
			,vd.StayLengthInMonths2							AS 'DaysVisitorsStayed2'
			,dbo.ufnGetCountryName(vd.Country3Id)			AS 'VisitorCountry3' 
			,vd.StayLengthInMonths3							AS 'DaysVisitorsStayed3'
			--comorbidities
			,cod.DiabetesStatus								AS 'Diabetes' 
			,cod.HepatitisBStatus							AS 'HepatitisB'
			,cod.HepatitisCStatus							AS 'HepatitisC' 
			,cod.LiverDiseaseStatus							AS 'ChronicLiverDisease'
			,cod.RenalDiseaseStatus							AS 'ChronicRenalDisease'
			,id.[Status]									AS 'ImmunoSuppression'
			,dbo.ufnYesNo(id.HasBioTherapy)					AS 'BiologicalTherapy'
			,dbo.ufnYesNo(id.HasTransplantation)			AS 'Transplantation' 
			,dbo.ufnYesNo(id.HasOther)						AS 'OtherImmunoSuppression'
			,rfs.[Status]                                   AS 'CurrentSmoker'
			--treatment details
			,dbo.ufnYesNo(cd.IsPostMortem)					AS 'PostMortemDiagnosis' 
			,dbo.ufnYesNo(cd.DidNotStartTreatment)			AS 'DidNotStartTreatment' 
			--next two fields set in separate function later on
			,NULL						                    AS 'ShortCourse' 
			,NULL							                AS 'MdrTreatment' 
			,cd.MDRTreatmentStartDate						AS 'MdrTreatmentDate' 
			--Outcomes are done in a separate function later on
			,NULL											AS 'TreatmentOutcome12months'
			,NULL											AS 'TreatmentOutcome24months'
			,NULL											AS 'TreatmentOutcome36months'
			,NULL											AS 'LastRecordedTreatmentOutcome'
			--dates
			--date of death fetched from the Treatment Event table
			,dbo.ufnGetDateOfDeath(n.NotificationId)		AS 'DateOfDeath'
			,dbo.ufnGetTreatmentEndDate(n.NotificationId)	AS 'TreatmentEndDate'
			,dbo.ufnYesNo (ted.HasTestCarriedOut)			AS 'NoSampleTaken'
			,NULL               							AS 'CulturePositive'
			,NULL									        AS 'Species'
			,NULL						                    AS 'EarliestSpecimenDate'
			,NULL						                    AS 'DrugResistanceProfile'
			,NULL										    AS 'INH'
			,NULL										    AS 'RIF'
			,NULL										    AS 'EMB'
			,NULL										    AS 'PZA'
			,NULL										    AS 'AMINO'
			,NULL										    AS 'QUIN'
			,NULL										    AS 'MDR'
			,NULL										    AS 'XDR'
			,GETUTCDATE()									AS 'DataRefreshedAt'
	
			FROM [NTBS_Empty].[dbo].[Notification] n
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[HospitalDetails] hd ON hd.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[User] u ON u.Username = hd.CaseManagerUsername
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[Hospital] h ON h.HospitalId = hd.HospitalId
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[TbService] tbs ON tbs.Code = hd.TBServiceCode
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[Patients] p on p.NotificationId = n.NotificationId 
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[Sex] s ON s.SexId = p.SexId
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[Ethnicity] e ON e.EthnicityId = p.EthnicityId
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[PostcodeLookup] pl ON pl.Postcode = p.PostcodeToLookup
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[LocalAuthority] la ON pl.LocalAuthorityCode = la.Code
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[LocalAuthorityToPHEC] la2p ON la2p.LocalAuthorityCode = pl.LocalAuthorityCode
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[PHEC] resphec ON resphec.Code = la2p.PHECCode
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[PHEC] treatphec ON treatphec.Code = tbs.PHECCode
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[ClinicalDetails] cd ON cd.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[ContactTracing] ct ON ct.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[PreviousTbHistory] pth ON pth.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[ReferenceData].[Country] ptc ON pth.PreviousTreatmentCountryId = ptc.CountryId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[SocialRiskFactors] srf ON srf.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[RiskFactorDrugs] rfd ON rfd.SocialRiskFactorsNotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[RiskFactorHomelessness] rfh ON rfh.SocialRiskFactorsNotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[RiskFactorImprisonment] rfp ON rfp.SocialRiskFactorsNotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[RiskFactorSmoking] rfs ON rfs.SocialRiskFactorsNotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[TravelDetails] td ON td.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[VisitorDetails] vd ON vd.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[ComorbidityDetails] cod ON cod.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[ImmunosuppressionDetails] id ON id.NotificationId = n.NotificationId
				LEFT OUTER JOIN [NTBS_Empty].[dbo].[TestData] ted ON ted.NotificationId = n.NotificationId
			WHERE n.NotificationStatus IN ('Notified', 'Closed')

			UPDATE ReusableNotification 
			SET AnySocialRiskFactor = CASE WHEN AlcoholMisuse = 'Yes' OR 
												DrugMisuse = 'Yes' OR 
												Homeless = 'Yes' OR
												Prison = 'Yes' 
												THEN 'Yes' ELSE 'No' END  --TODO: do we want/are there any other scenarios?

			EXEC [dbo].uspGenerateReusableNotificationTreatmentRegimen                                  

			EXEC [dbo].uspGenerateReusableOutcome

			EXEC [dbo].uspGenerateReusableNotificationLastRecordedTreatmentOutcome

			EXEC [dbo].uspNotificationCultureResistanceSummary
		END
    
    --now add the records from the ReusableNotification_ETS table which aren't already in the ReusableNotification table
    --these will be ETS records within the reporting time period (currently 2016 onwards) which haven't been migrated into NTBS
    INSERT INTO ReusableNotification ([NotificationId]
          ,[NtbsId]
          ,[EtsId]
          ,[SourceSystem]
          ,[LtbrId]
          ,[NotificationDate]
          ,[CaseManager]
          ,[Consultant]
          ,[HospitalId]
          ,[Hospital]
          ,[TBServiceCode]
          ,[Service]
          ,[NhsNumber]
          ,[Forename]
          ,[Surname]
          ,[DateOfBirth]
          ,[Age]
          ,[Sex]
          ,[UkBorn]
          ,[EthnicGroup]
          ,[BirthCountry]
          ,[UkEntryYear]
          ,[Postcode]
          ,[NoFixedAbode]
          ,[LocalAuthority]
          ,[LocalAuthorityCode]
          ,[ResidencePhecCode]
          ,[ResidencePhec]
          ,[TreatmentPhecCode]
          ,[TreatmentPhec]
          ,[SymptomOnsetDate]
          ,[PresentedDate]
          ,[OnsetToPresentationDays]
          ,[DiagnosisDate]
          ,[PresentationToDiagnosisDays]
          ,[StartOfTreatmentDate]
          ,[DiagnosisToTreatmentDays]
          ,[OnsetToTreatmentDays]
          ,[HivTestOffered]
          ,[SiteOfDisease]
          ,[AdultContactsIdentified]
          ,[ChildContactsIdentified]
          ,[TotalContactsIdentified]
          ,[AdultContactsAssessed]
          ,[ChildContactsAssessed]
          ,[TotalContactsAssessed]
          ,[AdultContactsActiveTB]
          ,[ChildContactsActiveTB]
          ,[TotalContactsActiveTB]
          ,[AdultContactsLTBI]
          ,[ChildContactsLTBI]
          ,[TotalContactsLTBI]
          ,[AdultContactsLTBITreat]
          ,[ChildContactsLTBITreat]
          ,[TotalContactsLTBITreat]
          ,[AdultContactsLTBITreatComplete]
          ,[ChildContactsLTBITreatComplete]
          ,[TotalContactsLTBITreatComplete]
          ,[PreviouslyDiagnosed]
          ,[YearsSinceDiagnosis]
          ,[PreviouslyTreated]
          ,[TreatmentInUk]
          ,[PreviousId]
          ,[BcgVaccinated]
          ,[AnySocialRiskFactor]
          ,[AlcoholMisuse]
          ,[DrugMisuse]
          ,[CurrentDrugMisuse]
          ,[DrugMisuseInLast5Years]
          ,[DrugMisuseMoreThan5YearsAgo]
          ,[Homeless]
          ,[CurrentlyHomeless]
          ,[HomelessInLast5Years]
          ,[HomelessMoreThan5YearsAgo]
          ,[Prison]
          ,[CurrentlyInPrisonOrInPrisonWhenFirstSeen]
          ,[InPrisonInLast5Years]
          ,[InPrisonMoreThan5YearsAgo]
          ,[TravelledOutsideUk]
          ,[ToHowManyCountries]
          ,[TravelCountry1]
          ,[MonthsTravelled1]
          ,[TravelCountry2]
          ,[MonthsTravelled2]
          ,[TravelCountry3]
          ,[MonthsTravelled3]
          ,[ReceivedVisitors]
          ,[FromHowManyCountries]
          ,[VisitorCountry1]
          ,[DaysVisitorsStayed1]
          ,[VisitorCountry2]
          ,[DaysVisitorsStayed2]
          ,[VisitorCountry3]
          ,[DaysVisitorsStayed3]
          ,[Diabetes]
          ,[HepatitisB]
          ,[HepatitisC]
          ,[ChronicLiverDisease]
          ,[ChronicRenalDisease]
          ,[ImmunoSuppression]
          ,[BiologicalTherapy]
          ,[Transplantation]
          ,[OtherImmunoSuppression]
          ,[CurrentSmoker]
          ,[PostMortemDiagnosis]
          ,[DidNotStartTreatment]
          ,[ShortCourse]
          ,[MdrTreatment]
          ,[MdrTreatmentDate]
          ,[TreatmentOutcome12months]
          ,[TreatmentOutcome24months]
          ,[TreatmentOutcome36months]
          ,[LastRecordedTreatmentOutcome]
          ,[DateOfDeath]
          ,[TreatmentEndDate]
          ,[NoSampleTaken]
          ,[CulturePositive]
          ,[Species]
          ,[EarliestSpecimenDate]
          ,[DrugResistanceProfile]
          ,[INH]
          ,[RIF]
          ,[EMB]
          ,[PZA]
          ,[AMINO]
          ,[QUIN]
          ,[MDR]
          ,[XDR]
          ,[DataRefreshedAt]) 
    SELECT	rne.[NotificationId]
          ,rne.[NtbsId]
          ,rne.[EtsId]
          ,rne.[SourceSystem]
          ,rne.[LtbrId]
          ,rne.[NotificationDate]
          ,rne.[CaseManager]
          ,rne.[Consultant]
          ,rne.[HospitalId]
          ,rne.[Hospital]
          ,rne.[TBServiceCode]
          ,rne.[Service]
          ,rne.[NhsNumber]
          ,rne.[Forename]
          ,rne.[Surname]
          ,rne.[DateOfBirth]
          ,rne.[Age]
          ,rne.[Sex]
          ,rne.[UkBorn]
          ,rne.[EthnicGroup]
          ,rne.[BirthCountry]
          ,rne.[UkEntryYear]
          ,rne.[Postcode]
          ,rne.[NoFixedAbode]
          ,rne.[LocalAuthority]
          ,rne.[LocalAuthorityCode]
          ,rne.[ResidencePhecCode]
          ,rne.[ResidencePhec]
          ,rne.[TreatmentPhecCode]
          ,rne.[TreatmentPhec]
          ,rne.[SymptomOnsetDate]
          ,rne.[PresentedDate]
          ,rne.[OnsetToPresentationDays]
          ,rne.[DiagnosisDate]
          ,rne.[PresentationToDiagnosisDays]
          ,rne.[StartOfTreatmentDate]
          ,rne.[DiagnosisToTreatmentDays]
          ,rne.[OnsetToTreatmentDays]
          ,rne.[HivTestOffered]
          ,rne.[SiteOfDisease]
          ,rne.[AdultContactsIdentified]
          ,rne.[ChildContactsIdentified]
          ,rne.[TotalContactsIdentified]
          ,rne.[AdultContactsAssessed]
          ,rne.[ChildContactsAssessed]
          ,rne.[TotalContactsAssessed]
          ,rne.[AdultContactsActiveTB]
          ,rne.[ChildContactsActiveTB]
          ,rne.[TotalContactsActiveTB]
          ,rne.[AdultContactsLTBI]
          ,rne.[ChildContactsLTBI]
          ,rne.[TotalContactsLTBI]
          ,rne.[AdultContactsLTBITreat]
          ,rne.[ChildContactsLTBITreat]
          ,rne.[TotalContactsLTBITreat]
          ,rne.[AdultContactsLTBITreatComplete]
          ,rne.[ChildContactsLTBITreatComplete]
          ,rne.[TotalContactsLTBITreatComplete]
          ,rne.[PreviouslyDiagnosed]
          ,rne.[YearsSinceDiagnosis]
          ,rne.[PreviouslyTreated]
          ,rne.[TreatmentInUk]
          ,rne.[PreviousId]
          ,rne.[BcgVaccinated]
          ,rne.[AnySocialRiskFactor]
          ,rne.[AlcoholMisuse]
          ,rne.[DrugMisuse]
          ,rne.[CurrentDrugMisuse]
          ,rne.[DrugMisuseInLast5Years]
          ,rne.[DrugMisuseMoreThan5YearsAgo]
          ,rne.[Homeless]
          ,rne.[CurrentlyHomeless]
          ,rne.[HomelessInLast5Years]
          ,rne.[HomelessMoreThan5YearsAgo]
          ,rne.[Prison]
          ,rne.[CurrentlyInPrisonOrInPrisonWhenFirstSeen]
          ,rne.[InPrisonInLast5Years]
          ,rne.[InPrisonMoreThan5YearsAgo]
          ,rne.[TravelledOutsideUk]
          ,rne.[ToHowManyCountries]
          ,rne.[TravelCountry1]
          ,rne.[MonthsTravelled1]
          ,rne.[TravelCountry2]
          ,rne.[MonthsTravelled2]
          ,rne.[TravelCountry3]
          ,rne.[MonthsTravelled3]
          ,rne.[ReceivedVisitors]
          ,rne.[FromHowManyCountries]
          ,rne.[VisitorCountry1]
          ,rne.[DaysVisitorsStayed1]
          ,rne.[VisitorCountry2]
          ,rne.[DaysVisitorsStayed2]
          ,rne.[VisitorCountry3]
          ,rne.[DaysVisitorsStayed3]
          ,rne.[Diabetes]
          ,rne.[HepatitisB]
          ,rne.[HepatitisC]
          ,rne.[ChronicLiverDisease]
          ,rne.[ChronicRenalDisease]
          ,rne.[ImmunoSuppression]
          ,rne.[BiologicalTherapy]
          ,rne.[Transplantation]
          ,rne.[OtherImmunoSuppression]
          ,rne.[CurrentSmoker]
          ,rne.[PostMortemDiagnosis]
          ,rne.[DidNotStartTreatment]
          ,rne.[ShortCourse]
          ,rne.[MdrTreatment]
          ,rne.[MdrTreatmentDate]
          ,rne.[TreatmentOutcome12months]
          ,rne.[TreatmentOutcome24months]
          ,rne.[TreatmentOutcome36months]
          ,rne.[LastRecordedTreatmentOutcome]
          ,rne.[DateOfDeath]
          ,rne.[TreatmentEndDate]
          ,rne.[NoSampleTaken]
          ,rne.[CulturePositive]
          ,rne.[Species]
          ,rne.[EarliestSpecimenDate]
          ,rne.[DrugResistanceProfile]
          ,rne.[INH]
          ,rne.[RIF]
          ,rne.[EMB]
          ,rne.[PZA]
          ,rne.[AMINO]
          ,rne.[QUIN]
          ,rne.[MDR]
          ,rne.[XDR]
          ,rne.[DataRefreshedAt]  
		  FROM [dbo].[ReusableNotification_ETS] rne
          LEFT OUTER JOIN [dbo].[ReusableNotification] rn ON rn.EtsId = rne.EtsId
	      WHERE rn.EtsId IS NULL
          --using a LEFT OUTER JOIN because 'NOT IN' doesn't cope with NULL values
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotification_ETS]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This pre-calculates apprx 90 reusable notification data points over-night that each report 
         can report from. Please DO NOT report from ETS directly, if the data can also be found here!
		 If you write an aggregate proc, you can query join up on this Reusablenotification table directly.
		 If you write a list list proc, please query ufnAuthorizedReusableNotification() instead, which
		 will apply permission restrictions to the notification records you report on.


         
**************************************************************************************************/

Create PROCEDURE [dbo].[uspGenerateReusableNotification_ETS] AS
	SET NOCOUNT ON

	BEGIN TRY
		
		--prep the lab results
		DELETE FROM [dbo].[StandardisedETSLaboratoryResult]

		INSERT INTO [dbo].[StandardisedETSLaboratoryResult](NotificationId, Id, OpieId)
			SELECT n.LegacyId AS NotificationId
				,lr.Id
				,lr.OpieId
			FROM [ETS].[dbo].[LaboratoryResult] lr
			LEFT JOIN [ETS].dbo.[Notification] n ON n.Id = lr.NotificationId
				WHERE lr.AuditDelete IS NULL

		-- Reset
		DELETE FROM dbo.ReusableNotification_ETS

		INSERT INTO dbo.ReusableNotification_ETS
			SELECT
				-- Primary key
				n.LegacyId                                                  AS NotificationId,
				NULL														AS NtbsId,
				-- Demographics
				n.LegacyId                                                  AS EtsId,
				'ETS'														AS SourceSystem,
				dbo.ufnNormalizeLtbrId(n.AuditMigrateId)                    AS LtbrId,
				CONVERT(DATE, n.NotificationDate)                           AS NotificationDate,
				s.Forename + ' ' + s.Surname                                AS CaseManager,
				n.PatientConsultant                                         AS Consultant,
				CONVERT(VARCHAR(36), h.Id)                                  AS HospitalId,
				h.Name                                                      AS Hospital,
				NULL														AS [TBServiceCode],
				NULL                                                        AS [Service],
				p.NhsNumber                                                 AS NhsNumber,
				p.Forename                                                  AS Forename,
				p.Surname                                                   AS Surname,
				CONVERT(DATE, p.DateOfBirth)                                AS DateOfBirth,
				dbo.ufnGetAgefrom(p.DateOfBirth,n.NotificationDate)			As Age,
				dbo.ufnSex(p.Sex)                                           AS Sex,
				dbo.ufnYesNoUnknown(p.UkBorn)                               AS UkBorn,
				eg.Name                                                     AS EthnicGroup,
				-- RP-859 populate birth country consistently
				case 
					when p.UkBorn = 1 
					then 'UNITED KINGDOM' 
					else c.Name
				end 														AS BirthCountry,
				p.UkEntryYear                                               AS UkEntryYear,
				case 
					when po.Pcd2  is null 
					then '' 
					else po.Pcd2
				end                                                         AS Postcode,
				dbo.ufnYesNo(a.NoFixedAbode)                                AS NoFixedAbode,

				-- Geographies
				NULL                                                        AS LocalAuthority,
				NULL														AS LocalAuthorityCode,
				NULL														AS ResidencePhecCode,
				NULL                                                        AS ResidencePhec,
				NULL														AS TreatmentPhecCode,
				NULL                                                        AS TreatmentPhec,

				-- Clinical Details
				CONVERT(DATE, te.SymptomOnset)                              AS SymptomOnsetDate,
				CONVERT(DATE, te.DatePresented)                             AS PresentedDate,
				DATEDIFF(DAY,
					te.SymptomOnset, 
					te.DatePresented)                                       AS OnsetToPresentationDays,
				CONVERT(DATE, te.DateOfDiagnosis)                           AS DiagnosisDate, 
				DATEDIFF(DAY,
					te.DatePresented, 
					te.DateOfDiagnosis)                                     AS PresentationToDiagnosisDays,
				CONVERT(DATE, te.StartOfTreatment)                          AS StartOfTreatmentDate, 
				DATEDIFF(DAY,
					te.DateOfDiagnosis, 
					te.StartOfTreatment)                                    AS DiagnosisToTreatmentDays,
				DATEDIFF(DAY,
					te.SymptomOnset, 
					te.StartOfTreatment)                                    AS OnsetToTreatmentDays,
				dbo.ufnGetHivTestOffered_ETS (
					n.Id, 
					te.HIVTestOffered
				)															AS HivTestOffered,
				dbo.ufnGetETSSiteOfDisease(n.TuberculosisEpisodeId)            AS SiteOfDisease,
				ct.AdultContactsIdentified									AS AdultContactsIdentified,
				ct.ChildContactsIdentified									AS ChildContactsIdentified,
				ct.TotalContactsIdentified									AS TotalContactsIdentified,	
				ct.AdultContactsAssessed									AS AdultContactsAssessed,	
				ct.ChildContactsAssessed									AS ChildContactsAssessed,	
				ct.TotalContactsAssessed									AS TotalContactsAssessed,	
				ct.AdultContactsActiveTB									AS AdultContactsActiveTB,	
				ct.ChildContactsActiveTB									AS ChildContactsActiveTB,	
				ct.TotalContactsActiveTB									AS TotalContactsActiveTB,	
				ct.AdultContactsLTBI										AS AdultContactsLTBI,	
				ct.ChildContactsLTBI										AS ChildContactsLTBI,
				ct.TotalContactsLTBI										AS TotalContactsLTBI,	
				ct.AdultContactsLTBITreat									AS AdultContactsLTBITreat,	
				ct.ChildContactsLTBITreat									AS ChildContactsLTBITreat,	
				ct.TotalContactsLTBITreat									AS TotalContactsLTBITreat,	
				ct.AdultContactsLTBITreatComplete							AS AdultContactsLTBITreatComplete,	
				ct.ChildContactsLTBITreatComplete							AS ChildContactsLTBITreatComplete,	
				ct.TotalContactsLTBITreatComplete							AS TotalContactsLTBITreatComplete,
				dbo.ufnYesNoUnknown(th.PreviouslyDiagnosed)                 AS PreviouslyDiagnosed, 
				dbo.ufnEmptyOrIntValue(th.YearsSinceDiagnosis)              AS YearsSinceDiagnosis,
				(CASE th.PreviouslyDiagnosed
					WHEN 1 THEN dbo.ufnYesNo(th.DrugTherapyTreated)
					ELSE NULL
				END)                                                        AS PreviouslyTreated, 
				(CASE th.DrugTherapyTreated
					WHEN 1 THEN dbo.ufnYesNo(th.TreatmentInUK)
					ELSE NULL
				END)                                                        AS TreatmentInUk, 
				th.PreviousId                                               AS PreviousId, 
				dbo.ufnYesNoUnknown(th.BcgVaccinated)                       AS BcgVaccinated,

				-- Risk Factors
				dbo.ufnGetAnySocialRiskFactor (
					th.MisUse,
					th.ProblemUse,
					th.Homeless,
					th.PrisonAtDiagnosis
				)                                                           AS AnySocialRiskFactor,
				dbo.ufnYesNoUnknown(th.MisUse)                              AS AlcoholMisuse, 
				dbo.ufnYesNoUnknown(th.ProblemUse)                          AS DrugMisuse,
				dbo.ufnGetDrugUseStatus(
					1,
					th.ProblemUse, 
					n.TuberculosisHistoryId
				)														    AS CurrentDrugMisuse,
				dbo.ufnGetDrugUseStatus(
					2,
					th.ProblemUse, 
					n.TuberculosisHistoryId
				)                                                           AS DrugMisuseInLast5Years,
				dbo.ufnGetDrugUseStatus(
					3,
					th.ProblemUse, 
					n.TuberculosisHistoryId
				)                                                           AS DrugMisuseMoreThan5YearsAgo,
				dbo.ufnYesNoUnknown(th.Homeless)			                AS Homeless,
				dbo.ufnGetHomelessStatus(
					1,
					th.Homeless, 
					n.TuberculosisHistoryId
				)                                                           AS CurrentlyHomeless,
				dbo.ufnGetHomelessStatus(
					2,
					th.Homeless, 
					n.TuberculosisHistoryId
				)                                                           AS HomelessInLast5Years,
				dbo.ufnGetHomelessStatus(
					3,
					th.Homeless, 
					n.TuberculosisHistoryId
				)                                                           AS HomelessMoreThan5YearsAgo,
				dbo.ufnYesNoUnknown(th.PrisonAtDiagnosis)	                AS Prison,
				dbo.ufnGetPrisonStatus(
					1,
					th.PrisonAtDiagnosis, 
					n.TuberculosisHistoryId
				)                                                           AS CurrentlyInPrisonOrInPrisonWhenFirstSeen,
				dbo.ufnGetPrisonStatus(
					2,
					th.PrisonAtDiagnosis, 
					n.TuberculosisHistoryId
				)                                                           AS InPrisonInLast5Years,
				dbo.ufnGetPrisonStatus(
					3,
					th.PrisonAtDiagnosis, 
					n.TuberculosisHistoryId
				)                                                           AS InPrisonMoreThan5YearsAgo,
				dbo.ufnYesNoUnknown(th.Haspatienttravelledpriordiagonosis)  AS TravelledOutsideUk, 
				th.Countriestravelled                                       AS ToHowManyCountries, 
				dbo.ufnGetETSCountryName(th.TravelledCountryId1)               AS TravelCountry1, 
				dbo.ufnEmptyOrIntValue(th.Travelduration1)                  AS MonthsTravelled1,
				dbo.ufnGetETSCountryName(th.TravelledCountryId2)               AS TravelCountry2, 
				dbo.ufnEmptyOrIntValue(th.Travelduration2)                  AS MonthsTravelled2,
				dbo.ufnGetETSCountryName(th.TravelledCountryId3)               AS TravelCountry3, 
				dbo.ufnEmptyOrIntValue(th.Travelduration3)                  AS MonthsTravelled3,
				dbo.ufnYesNoUnknown(th.Haspatientreceivevisitors)           AS ReceivedVisitors, 
				th.Visitorcountrycount                                      AS FromHowManyCountries, 
				dbo.ufnGetETSCountryName(th.VisitorCountryId1)                 AS VisitorCountry1, 
				th.Visitduration1                                           AS DaysVisitorsStayed1,
				dbo.ufnGetETSCountryName(th.VisitorCountryId2)                 AS VisitorCountry2, 
				th.Visitduration1                                           AS DaysVisitorsStayed2,
				dbo.ufnGetETSCountryName(th.VisitorCountryId3)                 AS VisitorCountry3, 
				th.Visitduration3                                           AS DaysVisitorsStayed3,
				dbo.ufnYesNoUnknown(co.Diabetes)                            AS Diabetes, 
				dbo.ufnYesNoUnknown(co.HepatitisB)                          AS HepatitisB, 
				dbo.ufnYesNoUnknown(co.HepatitisC)                          AS HepatitisC, 
				dbo.ufnYesNoUnknown(co.ChronicLiverdisease)                 AS ChronicLiverDisease,		
				dbo.ufnYesNoUnknown(co.ChronicRenaldisease)                 AS ChronicRenalDisease, 
				dbo.ufnYesNoUnknown(co.Immunosuppression)                   AS ImmunoSuppression, 
				NULL                                                        AS BiologicalTherapy, 
				NULL                                                        AS Transplantation, 
				NULL                                                        AS OtherImmunoSuppression,
				dbo.ufnYesNoUnknown(co.Smoker)                              AS CurrentSmoker, 

				-- Treatment
				dbo.ufnYesNo(te.PostMortemDiagnosis)                        AS PostMortemDiagnosis, 
				dbo.ufnYesNo(te.DidNotStartTreatment)                       AS DidNotStartTreatment, 
				dbo.ufnYesNoNotknown(tp.ShortCourseTreatment)               AS ShortCourse, 
				dbo.ufnYesNoUnknown(tp.MDRTreatment)                        AS MdrTreatment, 
				CONVERT(DATE, tp.MDRTreatmentDate)                          AS MdrTreatmentDate,
				(CASE
					WHEN te.PostMortemDiagnosis = 1 THEN 'Died' -- Step no 1
					ELSE dbo.ufnGetTreatmentOutcome(
							'12',
							tr12.AnswerToCompleteQuestion,
							tr12.AnswerToIncompleteReason1,
							tr12.AnswerToIncompleteReason2
						 )
				END)                                                        AS TreatmentOutcome12months,
				(CASE
					WHEN tr24.Id IS NULL THEN '' -- Step no 1
					ELSE dbo.ufnGetTreatmentOutcome(
							'24',
							tr24.AnswerToCompleteQuestion,
							tr24.AnswerToIncompleteReason1,
							tr24.AnswerToIncompleteReason2
						 )
				END)                                                        AS TreatmentOutcome24months,
				(CASE
					WHEN tr36.Id IS NULL THEN '' -- Step no 1
					ELSE dbo.ufnGetTreatmentOutcome(
							'36',
							tr36.AnswerToCompleteQuestion,
							tr36.AnswerToIncompleteReason1,
							tr36.AnswerToIncompleteReason2
						 )
				END)                                                        AS TreatmentOutcome36months,
				NULL                                                        AS LastRecordedTreatmentOutcome,
				dbo.ufnGetDateOfDeath_ETS(
					te.DateOfDeath,
					tr12.DeathDate,
					tr24.DeathDate,
					tr36.DeathDate
				)                                                           AS DateOfDeath,
				dbo.ufnGetTreatmentEndDate_ETS(
					tr12.EndOfTreatmentDate,
					tr24.EndOfTreatmentDate,
					tr36.EndOfTreatmentDate
				)                                                           AS TreatmentEndDate,
				
				-- Culture & Resistance
				dbo.ufnYesNo(n.NoSampleTaken)                               AS NoSampleTaken, 
				NULL                                                        AS CulturePositive,
				dbo.ufnGetSpecies(n.LegacyId)                               AS Species,
				dbo.ufnGetEarliestSpecimenDate(n.LegacyId)                  AS EarliestSpecimenDate,
				NULL                                                        AS DrugResistanceProfile,
				NULL                                                        AS INH,
				NULL                                                        AS RIF,
				NULL                                                        AS EMB,
				NULL                                                        AS PZA,
				NULL                                                        AS AMINO,
				NULL                                                        AS QUIN,
				NULL                                                        AS MDR,
				NULL                                                        AS XDR,
				GETDATE()                                                   AS DataAsAt
			FROM [ETS].dbo.Patient p
				INNER JOIN [ETS].dbo.Notification n ON n.PatientId = p.Id
				LEFT OUTER JOIN [ETS].dbo.Hospital h ON h.Id = n.HospitalId
				LEFT OUTER JOIN [ETS].dbo.SystemUser s ON s.Id = n.OwnerUserId
				LEFT OUTER JOIN [ETS].dbo.Address a ON a.Id = n.AddressId
				LEFT OUTER JOIN [ETS].dbo.Postcode po ON po.Id = a.PostcodeId
				LEFT OUTER JOIN [ETS].dbo.TuberculosisEpisode te ON te.Id = n.TuberculosisEpisodeId
				LEFT OUTER JOIN [ETS].dbo.TuberculosisHistory th ON th.Id = n.TuberculosisHistoryId
				LEFT OUTER JOIN [ETS].dbo.TreatmentOutcome tr12 ON tr12.Id = n.TreatmentOutcomeId
				LEFT OUTER JOIN [ETS].dbo.TreatmentOutcomeTwentyFourMonth tr24 ON tr24.Id = n.TreatmentOutcomeTwentyFourMonthId
				LEFT OUTER JOIN [ETS].dbo.TreatmentOutcome36Month tr36 ON tr36.Id = n.TreatmentOutcome36MonthId
				LEFT OUTER JOIN [ETS].dbo.TreatmentPlanned tp ON tp.Id = n.TreatmentPlannedId
				LEFT OUTER JOIN [ETS].dbo.Comorbidities co ON co.Id = n.ComorbiditiesId
				LEFT OUTER JOIN [ETS].dbo.ContactTracing ct ON ct.Id = n.ContactTracingId
				LEFT OUTER JOIN [ETS].dbo.EthnicGroup eg ON eg.Id = p.EthnicGroupId
				LEFT OUTER JOIN [ETS].dbo.Country C ON c.Id = p.BirthCountryId
				LEFT OUTER JOIN dbo.NotificationClusterMatch cluster ON cluster.NotificationId = n.LegacyId
			WHERE n.Submitted = 1
				AND n.AuditDelete IS NULL
				AND n.DenotificationId IS NULL
				AND (cluster.ClusterId IS NOT NULL OR YEAR(n.NotificationDate) IN (SELECT NotificationYear FROM vwNotificationYear))

			--now remove spaces from postcodes in order to perform lookups. The spaces will be added back in for improved readability later on 
			--in uspUpdateReusableNotificationPostcode
			UPDATE dbo.ReusableNotification_ETS
				SET Postcode = REPLACE(Postcode, ' ', '')


			-- Populate NULL columns from above
			EXEC dbo.uspGenerateReusableResidence
			EXEC dbo.uspGenerateReusableTreatment
			EXEC dbo.uspGenerateReusableNotificationImmunosuppression
			EXEC dbo.uspGenerateReusableNotificationLastRecordedTreatmentOutcome_ETS
			EXEC dbo.uspGenerateReusableNotificationCulturePositive

			
			-- WARNING: The following 2nd argument will be used as an IN WHERE clause inside a dynamic SQL string that we pass together with single-quotes and commas
			EXEC dbo.uspGenerateReusableNotificationCultureResistance 'INH', '''ISO'', ''ISO_W'''
			EXEC dbo.uspGenerateReusableNotificationCultureResistance 'RIF', '''RIF'', ''RIF_W'''
			EXEC dbo.uspGenerateReusableNotificationCultureResistance 'EMB', '''ETHAM'', ''ETHAM_W'', ''ETA_W'''
			EXEC dbo.uspGenerateReusableNotificationCultureResistance 'PZA', '''PYR'', ''PYR_W'''
			EXEC dbo.uspGenerateReusableNotificationCultureResistance 'AMINO', '''AK'', ''AMI'', ''KAN'', ''CAP'', ''AMINO_W'''
			EXEC dbo.uspGenerateReusableNotificationCultureResistance 'QUIN', '''OFX'', ''MOXI'', ''CIP'', ''QUIN_W'''

			-- Populate more NULL columns from above
			EXEC dbo.uspGenerateReusableNotificationMdr
			EXEC dbo.uspGenerateReusableNotificationXdr
			EXEC dbo.uspGenerateReusableNotificationDrugResistanceProfile
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationCulturePositive]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.CulturePositive
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationCulturePositive] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- 1. Notification has no LaboratoryResult records
		UPDATE dbo.ReusableNotification_ETS SET
			CulturePositive = 'No'
		WHERE CulturePositive IS NULL
			AND NotificationId NOT IN (SELECT DISTINCT NotificationId -- You can have multiple lab result records for the same case
										FROM [dbo].[StandardisedETSLaboratoryResult])

		-- 3. Notification has LaboratoryResult records where the OpieID is not null
		UPDATE dbo.ReusableNotification_ETS SET
			CulturePositive = 'Yes'
		WHERE CulturePositive IS NULL
			AND NotificationId IN (SELECT DISTINCT NotificationId -- You can have multiple lab result records for the same case
									FROM [dbo].[StandardisedETSLaboratoryResult]
									WHERE OpieId IS NOT NULL) -- Ignore manually entered lab results

		-- 2. Notification only has LaboratoryResult records where the OpieID is null
		UPDATE dbo.ReusableNotification_ETS SET
			CulturePositive = 'No'
		WHERE CulturePositive IS NULL
			AND NotificationId IN (SELECT DISTINCT NotificationId -- You can have multiple lab result records for the same case
									FROM [dbo].[StandardisedETSLaboratoryResult]
									WHERE OpieId IS NULL) -- Ignore manually entered lab results

		-- 3. An error has occurred
		UPDATE dbo.ReusableNotification_ETS SET
			CulturePositive = 'Error: Invalid value'
		WHERE CulturePositive IS NULL
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationCultureResistance]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.ISO,
         ReusableNotification.RIF, ReusableNotification.ETHAM, and ReusableNotification.PYR
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationCultureResistance] (
	@ReportingAntibioticCode NVARCHAR(5) = '',
	@EtsAntibioticCodeList NVARCHAR(100) = ''
) AS
	BEGIN TRY
		SET NOCOUNT ON

		-- Debugging
		-- DECLARE @EtsAntibioticCodeList VARCHAR(5) = 'INH'
		-- DECLARE @ReportingAntibioticCode VARCHAR(5) = 'ISO'

		DECLARE @Sql NVARCHAR(2000)

		-- 1. Patient has no drug sensitivity test results for the given antibiotic
		SET @Sql = 'UPDATE dbo.ReusableNotification_ETS SET
						' + @ReportingAntibioticCode + ' = ''No result''
					WHERE ' + @ReportingAntibioticCode + ' IS NULL
						AND NotificationId NOT IN (SELECT DISTINCT l.NotificationId
													FROM [dbo].[StandardisedETSLaboratoryResult] l
														INNER JOIN [LabBase2].dbo.Anonymised a ON a.OpieId = l.OpieId
													WHERE a.LabDataID IN (SELECT DISTINCT su.LabDataID
																			FROM [LabBase2].dbo.Susceptibility su
																			WHERE su.AntibioticCode IN (' + @EtsAntibioticCodeList + ')))' -- Comma-separated list of codes

		PRINT @Sql
		EXEC sp_executesql @Sql

		-- 2. Patient has one or more drug sensitivity test results for the given antibiotic with the value 'Resistant' or 'R'
		SET @Sql = 'UPDATE dbo.ReusableNotification_ETS SET
						' + @ReportingAntibioticCode + ' = ''Resistant''
					WHERE ' + @ReportingAntibioticCode + ' IS NULL
						AND NotificationId IN (SELECT DISTINCT l.NotificationId
													FROM [dbo].[StandardisedETSLaboratoryResult] l
														INNER JOIN [LabBase2].dbo.Anonymised a ON a.OpieId = l.OpieId
													WHERE a.LabDataID IN (SELECT DISTINCT su.LabDataID
																			FROM [LabBase2].dbo.Susceptibility su
																			WHERE su.AntibioticCode IN (' + @EtsAntibioticCodeList + ') -- Comma-separated list of codes
																			AND su.SusceptibilityResult IN (''Resistant'', ''R'')))'

		PRINT @Sql
		EXEC sp_executesql @Sql

		-- 3. Patient has one or more drug sensitivity test results for the given antibiotic with the value 'Sensitive' or 'S'
		SET @Sql = 'UPDATE dbo.ReusableNotification_ETS SET
						' + @ReportingAntibioticCode + ' = ''Sensitive''
					WHERE ' + @ReportingAntibioticCode + ' IS NULL
					AND NotificationId IN (SELECT DISTINCT l.NotificationId
												FROM [dbo].[StandardisedETSLaboratoryResult] l
													INNER JOIN [LabBase2].dbo.Anonymised a ON a.OpieId = l.OpieId
												WHERE a.LabDataID IN (SELECT DISTINCT su.LabDataID
																		FROM [LabBase2].dbo.Susceptibility su
																		WHERE su.AntibioticCode IN (' + @EtsAntibioticCodeList + ') -- Comma-separated list of codes
																		AND su.SusceptibilityResult IN (''Sensitive'', ''S'')))'

		PRINT @Sql
		EXEC sp_executesql @Sql

		-- 4. Patient ONLY has drug sensitivity test results which are 'Unknown' or 'Failed'
		-- The SQL where clause below "looks" duplicated, but watch out for the 2 "NOT IN" differences
		SET @Sql = 'UPDATE dbo.ReusableNotification_ETS SET
						' + @ReportingAntibioticCode + ' = ''Unknown''
					WHERE ' + @ReportingAntibioticCode + ' IS NULL
					AND NotificationId IN (SELECT DISTINCT l.NotificationId
											FROM [dbo].[StandardisedETSLaboratoryResult] l
												INNER JOIN [LabBase2].dbo.Anonymised a ON a.OpieId = l.OpieId
											WHERE a.LabDataID IN (SELECT DISTINCT su.LabDataID
																	FROM [LabBase2].dbo.Susceptibility su
																	WHERE su.AntibioticCode IN (' + @EtsAntibioticCodeList + ') -- Comma-separated list of codes
																	AND su.SusceptibilityResult IN (''Unknown'', ''U'', ''Failed'', ''F'')))
					AND NotificationId NOT IN (SELECT DISTINCT l.NotificationId
												FROM [dbo].[StandardisedETSLaboratoryResult] l
													INNER JOIN [LabBase2].dbo.Anonymised a ON a.OpieId = l.OpieId
												WHERE a.LabDataID IN (SELECT DISTINCT su.LabDataID
																		FROM [LabBase2].dbo.Susceptibility su
																		WHERE su.AntibioticCode IN (' + @EtsAntibioticCodeList + ') -- Comma-separated list of codes
																		AND su.SusceptibilityResult NOT IN (''Unknown'', ''U'', ''Failed'', ''F'')))'


		PRINT @Sql
		EXEC sp_executesql @Sql

		-- 5. An error has occurred
		SET @Sql = 'UPDATE dbo.ReusableNotification_ETS SET
						' + @ReportingAntibioticCode + ' = ''Error: Invalid value''
					WHERE ' + @ReportingAntibioticCode + ' IS NULL'

		PRINT @Sql
		EXEC sp_executesql @Sql
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationDrugResistanceProfile]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.DrugResistanceProfile
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationDrugResistanceProfile] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- 1. MDR has the value 'Yes'
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'RR/MDR/XDR'
		WHERE DrugResistanceProfile IS NULL
			AND MDR = 'Yes'

		-- 2. RIF has the value 'Resistant'
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'RR/MDR/XDR'
		WHERE DrugResistanceProfile IS NULL
			AND RIF = 'Resistant' AND INH = 'Sensitive'

		-- 3. INH has the value 'Resistant'
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'INH resistant'
		WHERE DrugResistanceProfile IS NULL
			AND INH = 'Resistant' AND RIF = 'Sensitive'

		-- 4. INH and RIF are both 'Sensitive' but one or both of EMB and PZA are 'Resistant'
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'INH+RIF sensitive'
		WHERE DrugResistanceProfile IS NULL
			AND INH = 'Sensitive'
			AND RIF = 'Sensitive'
			AND (EMB = 'Resistant' OR PZA = 'Resistant')

		-- 5. INH, RIF, EMB & PZA are all 'Sensitive'
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'Sensitive to first line'
		WHERE DrugResistanceProfile IS NULL
			AND INH = 'Sensitive'
			AND RIF = 'Sensitive'
			AND EMB = 'Sensitive'
			AND PZA = 'Sensitive'

		-- 6. Notification does not have culture positive confirmation
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'No result'
		WHERE DrugResistanceProfile IS NULL
			AND CulturePositive != 'Yes'

		-- 7. In other words, the notification either has no results or has results which are 'Failed' or 'Unknown', and/or a few stray 'Sensitive' records
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'No result'
		WHERE DrugResistanceProfile IS NULL
			AND (
					   (INH = 'No result' OR INH = 'Unknown')
					OR (RIF = 'No result' OR RIF = 'Unknown')
					OR (EMB = 'No result' OR EMB = 'Unknown')
					OR (PZA = 'No result' OR PZA = 'Unknown')
				)

		-- 9. An error has occurred
		UPDATE dbo.ReusableNotification_ETS SET
			DrugResistanceProfile = 'Error: Invalid value'
		WHERE DrugResistanceProfile IS NULL
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationImmunosuppression]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.BiologicalTherapy,
         ReusableNotification.Transplantation and ReusableNotification.OtherImmunoSuppression
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationImmunosuppression] AS
	BEGIN TRY
		SET NOCOUNT ON

		UPDATE dbo.ReusableNotification_ETS SET
			BiologicalTherapy = 'Yes'
		WHERE NotificationId IN (SELECT n.LegacyId
								 FROM [ETS].dbo.Notification n
									INNER JOIN [ETS].dbo.Comorbidities co ON co.Id = n.ComorbiditiesId
									INNER JOIN [ETS].dbo.ComorbiditiesImmunoStatus cim ON cim.ComorbiditiesId = co.Id
									INNER JOIN [ETS].dbo.Immunosupressionstatus ims ON ims.Id  = cim.ImmunosuppressionStatusId
								 WHERE ims.Name = 'Biological therapy (e.g. Anti-TNF-Alpha-Treatment)')

		UPDATE dbo.ReusableNotification_ETS SET
			Transplantation = 'Yes'
		WHERE NotificationId IN (SELECT n.LegacyId
								 FROM [ETS].dbo.Notification n
									INNER JOIN [ETS].dbo.Comorbidities co ON co.Id = n.ComorbiditiesId
									INNER JOIN [ETS].dbo.ComorbiditiesImmunoStatus cim ON cim.ComorbiditiesId = co.Id
									INNER JOIN [ETS].dbo.Immunosupressionstatus ims ON ims.Id  = cim.ImmunosuppressionStatusId
								 WHERE ims.Name = 'Transplantation')

		UPDATE dbo.ReusableNotification_ETS SET
			OtherImmunoSuppression = 'Yes'
		WHERE NotificationId IN (SELECT n.LegacyId
								 FROM [ETS].dbo.Notification n
									INNER JOIN [ETS].dbo.Comorbidities co ON co.Id = n.ComorbiditiesId
									INNER JOIN [ETS].dbo.ComorbiditiesImmunoStatus cim ON cim.ComorbiditiesId = co.Id
									INNER JOIN [ETS].dbo.Immunosupressionstatus ims ON ims.Id  = cim.ImmunosuppressionStatusId
								 WHERE ims.Name = 'Other')

		-- TODO: Log 'Error: Invalid value' has occurred (if any other value in ims.Name)
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationLastRecordedTreatmentOutcome]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.LastRecordedTreatmentOutcome
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationLastRecordedTreatmentOutcome] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- 1. 36 month outcome has a non-empty/non-error value
		UPDATE dbo.ReusableNotification SET
			LastRecordedTreatmentOutcome = TreatmentOutcome36months
		WHERE LastRecordedTreatmentOutcome IS NULL
			AND TreatmentOutcome36months IS NOT NULL
			AND TreatmentOutcome36months != ''
			AND TreatmentOutcome36months != 'Error: Invalid value'

		-- 2. 24 month outcome has a non-empty/non-error value
		UPDATE dbo.ReusableNotification SET
			LastRecordedTreatmentOutcome = TreatmentOutcome24months
		WHERE LastRecordedTreatmentOutcome IS NULL
			AND TreatmentOutcome24months IS NOT NULL
			AND TreatmentOutcome24months != ''
			AND TreatmentOutcome24months != 'Error: Invalid value'

		-- 3. 12 month outcome has a non-empty/non-error value
		UPDATE dbo.ReusableNotification SET
			LastRecordedTreatmentOutcome = TreatmentOutcome12months
		WHERE LastRecordedTreatmentOutcome IS NULL
			AND TreatmentOutcome12months IS NOT NULL
			AND TreatmentOutcome12months != ''
			AND TreatmentOutcome12months != 'Error: Invalid value'

		-- 4. An error has occurred
		UPDATE dbo.ReusableNotification SET
			LastRecordedTreatmentOutcome = 'Error: Invalid value'
		WHERE LastRecordedTreatmentOutcome IS NULL
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationLastRecordedTreatmentOutcome_ETS]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.LastRecordedTreatmentOutcome
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationLastRecordedTreatmentOutcome_ETS] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- 1. 36 month outcome has a non-empty/non-error value
		UPDATE dbo.ReusableNotification_ETS SET
			LastRecordedTreatmentOutcome = TreatmentOutcome36months
		WHERE LastRecordedTreatmentOutcome IS NULL
			AND TreatmentOutcome36months IS NOT NULL
			AND TreatmentOutcome36months != ''
			AND TreatmentOutcome36months != 'Error: Invalid value'

		-- 2. 24 month outcome has a non-empty/non-error value
		UPDATE dbo.ReusableNotification_ETS SET
			LastRecordedTreatmentOutcome = TreatmentOutcome24months
		WHERE LastRecordedTreatmentOutcome IS NULL
			AND TreatmentOutcome24months IS NOT NULL
			AND TreatmentOutcome24months != ''
			AND TreatmentOutcome24months != 'Error: Invalid value'

		-- 3. 12 month outcome has a non-empty/non-error value
		UPDATE dbo.ReusableNotification_ETS SET
			LastRecordedTreatmentOutcome = TreatmentOutcome12months
		WHERE LastRecordedTreatmentOutcome IS NULL
			AND TreatmentOutcome12months IS NOT NULL
			AND TreatmentOutcome12months != ''
			AND TreatmentOutcome12months != 'Error: Invalid value'

		-- 4. An error has occurred
		UPDATE dbo.ReusableNotification_ETS SET
			LastRecordedTreatmentOutcome = 'Error: Invalid value'
		WHERE LastRecordedTreatmentOutcome IS NULL
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationMdr]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.MDR
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationMdr] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- 1. Both INH and RIF are set to 'Resistant'
		UPDATE dbo.ReusableNotification_ETS SET
			MDR = 'Yes'
		WHERE MDR IS NULL
			AND (INH = 'Resistant' AND RIF = 'Resistant')

		-- 2. One of INH and RIF (or both) is 'Sensitive'
		UPDATE dbo.ReusableNotification_ETS SET
			MDR = 'No'
		WHERE MDR IS NULL
			AND (INH = 'Sensitive' OR RIF = 'Sensitive')

		-- 3. One of INH and RIF (or both) is 'No result' or 'Unknown'
		UPDATE dbo.ReusableNotification_ETS SET
			MDR = 'No result'
		WHERE MDR IS NULL
			AND (
					   INH = 'No result' 
					OR RIF = 'No result' 
					OR INH = 'Unknown' 
					OR RIF = 'Unknown'
					--OR INH = 'Failed' 
					--OR RIF = 'Failed' 
				)

		-- 4. An error has occurred
		UPDATE dbo.ReusableNotification_ETS SET
			MDR = 'Error: Invalid value'
		WHERE MDR IS NULL
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationTreatmentRegimen]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:	The reusable notification table contains two fields 'ShortCourse' and 'MDRTreatment'.
There is only one field in NTBS to capture this information, so set both fields based on the value
captured there.

ENUM for the NTBS field is stored in TreatmentRegimen.cs in the NTBS code
Values are:

        StandardTherapy,
        MdrTreatment,
        Other
**************************************************************************************************/




CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationTreatmentRegimen]
	
AS

    UPDATE dbo.ReusableNotification
        SET ShortCourse = 'Yes', MdrTreatment = 'No' 
        WHERE NtbsId IN (SELECT NotificationId FROM [NTBS_Empty].dbo.ClinicalDetails WHERE TreatmentRegimen = 'StandardTherapy')

    UPDATE dbo.ReusableNotification
        SET ShortCourse = 'No', MdrTreatment = 'Yes' 
        WHERE NtbsId IN (SELECT NotificationId FROM [NTBS_Empty].dbo.ClinicalDetails WHERE TreatmentRegimen = 'MdrTreatment')

    UPDATE dbo.ReusableNotification
        SET ShortCourse = 'No', MdrTreatment = 'No' 
        WHERE NtbsId IN (SELECT NotificationId FROM [NTBS_Empty].dbo.ClinicalDetails WHERE TreatmentRegimen = 'Other')

	
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableNotificationXdr]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data point ReusableNotification.XDR
         for each notification record (every night when the uspGenerate schedule runs).
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableNotificationXdr] AS
	BEGIN TRY
		SET NOCOUNT ON

		-- 1 MDR is not set to 'Yes'
		-- a. MDR is set to 'No' - set XDR to 'No'
		UPDATE dbo.ReusableNotification_ETS SET
			XDR = 'No'
		WHERE XDR IS NULL
			AND MDR = 'No'

		-- 1 MDR is not set to 'Yes'
		-- b. MDR is set to 'No result' - set XDR to 'No result'
		UPDATE dbo.ReusableNotification_ETS SET
			XDR = 'No result'
		WHERE XDR IS NULL
			AND MDR = 'No result'

		-- 2. Both AMINO and QUIN are set to 'Resistant'
		UPDATE dbo.ReusableNotification_ETS SET
			XDR = 'Yes'
		WHERE XDR IS NULL
			AND MDR = 'Yes'
			AND (AMINO = 'Resistant' AND QUIN = 'Resistant')

		-- 3. One of AMINO and QUIN (or both) is 'Sensitive'
		UPDATE dbo.ReusableNotification_ETS SET
			XDR = 'No'
		WHERE XDR IS NULL
			AND MDR = 'Yes'
			AND (AMINO = 'Sensitive' OR QUIN = 'Sensitive')

		-- 4. One of AMINO and QUIN (or both) is 'No result' or 'Unknown'
		UPDATE dbo.ReusableNotification_ETS SET
			XDR = 'No result'
		WHERE XDR IS NULL
			AND MDR = 'Yes'
			AND (
					   AMINO = 'No result' 
					OR QUIN = 'No result' 
					OR AMINO = 'Unknown' 
					OR QUIN = 'Unknown'
					--OR AMINO = 'Failed' 
					--OR QUIN = 'Failed' 
				)

		-- 5. An error has occurred
		UPDATE dbo.ReusableNotification_ETS SET
			XDR = 'Error: Invalid value'
		WHERE XDR IS NULL
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableOutcome]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*This will calculate 12, 24, 36 month outcomes for NTBS notifications
and then update ReusableNotification with the appropriate values for each*/


CREATE PROCEDURE [dbo].[uspGenerateReusableOutcome]
	
AS

	--SET UP STEPS
		--clear down the companion tables
		DELETE FROM [dbo].[Outcome]
		DELETE FROM [dbo].[PeriodicOutcome]

		--populate with base records from ReusableNotification where source system is NTBS
		--this will only contain Notified and Closed records, so Draft, Deleted and Denotified are excluded by default
		INSERT INTO [dbo].[Outcome] (NotificationId)
			SELECT NotificationID FROM ReusableNotification WHERE SourceSystem = 'NTBS'


		--now calculate the treatment start date. Where this is populated in NTBS, use this. If not, use the notification date as a proxy
		--there should be an event in the TreatmentEvent table which has the right value, with type 'TreatmentStart'

		UPDATE [dbo].[Outcome] SET TreatmentStartDate = Q1.StartDate FROM
			(SELECT n.NotificationId, COALESCE(te.EventDate, n.NotificationDate) AS 'StartDate'
				FROM [NTBS_Empty].[dbo].[Notification] n
					LEFT OUTER JOIN [NTBS_Empty].[dbo].TreatmentEvent te ON te.NotificationId = n.NotificationId
					AND te.TreatmentEventType = 'TreatmentStart') AS Q1
			WHERE Q1.NotificationId = [dbo].[Outcome].NotificationId

		--Call the stored proc for each outcome period: 1, 2 and 3 (12 month, 24 month, 36 month)
		EXEC [dbo].[uspGenerateReusableOutcomePeriodic] 1
		EXEC [dbo].[uspGenerateReusableOutcomePeriodic] 2
		EXEC [dbo].[uspGenerateReusableOutcomePeriodic] 3
		

		--TODO: consider:
		-- 1. Do I need the Outcome table? Should the treatment start date calculation logic not just be used directly against ReusableNotification? Currently
		--	this just pulls out the treatment start date if one has been entered by the user (I guess maybe this does make sense)
		-- 2. Should I use this set of SPs to calculate the Treatment End Date, rather than doing it in ufnGetTreatmentEndDate? That is a very simple function,
		--	however.
		-- 3. At the moment this will produce some incongruous results, i.e. result for 1, result for 3 with nothing in between. This is if 1 was final but
		-- then some activity happens again during period 3.  This shouldn't happen as the notification should become read-only before it can


	--WRAP-UP STEPS

		--update the main table with the values for each outcome
		--if it can be found in the Periodic Outcome table, use this
		--if not, set it to an empty string
		

		UPDATE dbo.ReusableNotification
			SET
				TreatmentOutcome12months = COALESCE(po1.OutcomeValue, ''), 
				TreatmentOutcome24months = COALESCE(po2.OutcomeValue, ''), 
				TreatmentOutcome36months = COALESCE(po3.OutcomeValue, '') 
			FROM [dbo].[Outcome] o
				LEFT OUTER JOIN [dbo].[PeriodicOutcome] po1 ON po1.NotificationId = o.NotificationId AND po1.TimePeriod = 1
				LEFT OUTER JOIN [dbo].[PeriodicOutcome] po2 ON po2.NotificationId = o.NotificationId AND po2.TimePeriod = 2
				LEFT OUTER JOIN [dbo].[PeriodicOutcome] po3 ON po3.NotificationId = o.NotificationId AND po3.TimePeriod = 3
			WHERE dbo.ReusableNotification.NtbsId = o.NotificationId



		--finally delete this table. TODO: Leave commented out for now for debugging
		--DELETE FROM [dbo].[Outcome]
		--DELETE FROM [dbo].[PeriodicOutcome]


RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableOutcomePeriodic]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**
This will populate the companion table PeriodicOutcome with records for a given time period
First it looks for all notifications which have events within the time period
Then it looks for all notifications which should have an event within the time period:
- the notification is old enough that could have events within the time period (i.e. if time period is 2, events in year 2)
AND the most recent outcome in preceding periods was not an ending one, i.e. treatment restart

Using 24 months as an example, the conditions we have to satisfy:

	
		1. 24 month outcome is present (whether expected or not)

		2. 24 month outcome is expected and not present

		3. No 24 month outcome is expected
    			-final at 12 + no further events
    			-not yet time for there to be one
    
		For this last category, no record will be inserted into the PeriodicOutcome table


**/

CREATE PROCEDURE [dbo].[uspGenerateReusableOutcomePeriodic]
	@TimePeriod INT = 0
AS
	
	--first insert a record into PeriodicOutcome where one exists for the notification in the time period
	INSERT INTO [dbo].PeriodicOutcome (NotificationId, TimePeriod, OutcomeValue, IsFinal)
		SELECT o.NotificationId, @TimePeriod, po.OutcomeValue, po.EndingEvent from [dbo].Outcome o
		CROSS APPLY ufnGetPeriodicOutcome(@TimePeriod, o.NotificationId) po

	--then add a record with 'No outcome recorded' if an outcome was expected but does not exist
	 
	--for period 1, this should not be necessary because every notification should have a 'TreatmentStart' event within the first 12 months (i.e. on day 1)
	--so should all have been dealt with by the clause above
	IF @TimePeriod > 1
		INSERT INTO [dbo].PeriodicOutcome (NotificationId, TimePeriod, OutcomeValue, IsFinal)
			SELECT NotificationId, @TimePeriod, 'No outcome recorded', 0  FROM [dbo].[Outcome] o 
			--find the records that are old enough for inclusion - they should be older by at least one day than the end of the previous time period
			WHERE GETUTCDATE() > DATEADD(YEAR, @TimePeriod-1, o.TreatmentStartDate)
			--and the previous period's outcome was non-final
			AND o.NotificationId IN 
			(SELECT po.NotificationId FROM [dbo].[PeriodicOutcome] po 
				WHERE po.IsFinal = 0
				AND po.TimePeriod = @TimePeriod-1)
			--and we haven't already found an outcome for them in this time period
			AND o.NotificationId NOT IN 
				(SELECT po.NotificationId FROM [dbo].[PeriodicOutcome] po WHERE TimePeriod = @TimePeriod)
	


RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusablePostcodeLookup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGenerateReusablePostcodeLookup] AS
	SET NOCOUNT ON

	BEGIN TRY
		-- Reset
		DELETE FROM PostcodeLookup

		INSERT INTO dbo.PostcodeLookup
			SELECT 
				Id, 
				Pcd2,
				NULL
			FROM [ETS].dbo.Postcode

		-- Populate table to remove spaces from postcodes
		UPDATE dbo.PostcodeLookup
			SET Pcd2NoSpaces = REPLACE(Pcd2, ' ', '')
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableResidence]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.LocalAuthority/ResidencePhec
         for each notification record (every night when the uspGenerate schedule runs).
		 This calculation involves reference data from the JOIN tables below, eg Reduced_Postcode_file.
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableResidence] AS
	SET NOCOUNT ON

	BEGIN TRY
		-- 1. Only include english post codes
		UPDATE n SET
			LocalAuthority = l.LA_Name,
			LocalAuthorityCode = l.LA_Code,
			ResidencePhec = p.PHEC_Name,
			ResidencePhecCode = p.PHEC_Code
		-- SELECT n.NotificationId -- Debugging
		FROM dbo.ReusableNotification_ETS n WITH (NOLOCK)
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.Reduced_Postcode_file r ON r.Pcode = n.Postcode
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.Local_Authority l ON l.LA_Code = r.LA_Code
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.LA_to_PHEC lp ON lp.LA_Code = l.LA_Code
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.PHEC p ON p.PHEC_Code = lp.PHEC_Code
		WHERE r.Country = 'E92000001'

		-- 2. Unknown when no matching postcode
		UPDATE n SET
			ResidencePhec = 'Unknown'
		-- SELECT n.NotificationId -- Debugging
		FROM dbo.ReusableNotification_ETS n WITH (NOLOCK)
			LEFT OUTER JOIN [NTBS_R1_Geography_Staging].dbo.Reduced_Postcode_file r ON r.Pcode = n.Postcode
		WHERE (r.Country IS NULL or (r.Country = 'E92000001' and r.LA_Code is null)) and ResidencePhec is null
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateReusableTreatment]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This re/calculates the value for the data points ReusableNotification.Service/TreatmentPhec
         for each notification record (every night when the uspGenerate schedule runs).
		 This calculation involves reference data from the JOIN tables below, eg Reduced_Postcode_file.
		 The inline comments no 1, 2, 3 ... below have been copied across from the NTBS R1
		 specification in Confluence, and are to be kept in sync with that specification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGenerateReusableTreatment] AS
	SET NOCOUNT ON

	BEGIN TRY
		-- 1. Only include english hospitals
		UPDATE n SET
			[Service] = s.TB_Service_Name,
			[TBServiceCode] = s.TB_Service_Code,
			TreatmentPhec = p.PHEC_Name,
			TreatmentPhecCode = p.PHEC_Code
		-- SELECT n.NotificationId -- Debugging
		FROM dbo.ReusableNotification_ETS n WITH (NOLOCK)
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.Hospital h ON h.HospitalId = n.HospitalId
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.TB_Service_to_Hospital sh ON sh.HospitalID = h.HospitalId
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.TB_Service s ON s.TB_Service_Code = sh.TB_Service_Code
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.TB_Service_to_PHEC sp ON sp.TB_Service_Code = sh.TB_Service_Code
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.PHEC p ON p.PHEC_Code = sp.PHEC_Code
		WHERE h.CountryCode = 'E92000001'

		-- 2. Unknown when no matching hospital or service records
		UPDATE n SET
			TreatmentPhec = 'Unknown'
		-- SELECT n.NotificationId -- Debugging
		FROM dbo.ReusableNotification_ETS n WITH (NOLOCK)
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.Hospital h ON h.HospitalId = n.HospitalId
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.TB_Service_to_Hospital sh ON sh.HospitalID = h.HospitalId
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.TB_Service s ON s.TB_Service_Code = sh.TB_Service_Code
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.TB_Service_to_PHEC sp ON sp.TB_Service_Code = sh.TB_Service_Code
			INNER JOIN [NTBS_R1_Geography_Staging].dbo.PHEC p ON p.PHEC_Code = sp.PHEC_Code
		WHERE h.CountryCode IS NULL -- No matching hospital record

		-- 3. Remaining notifications stay NULL, cos they are assumed to be welsh/scottish/northern-irish hospitals
		-- Nothing to do here!
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateSGSSMTBCIsolates]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspGenerateSGSSMTBCIsolates] as
select * from SGSS_MTBC_Isolates
/*
select * from (select CALENDAR_YEAR, WEEK_OF_YEAR, Total from SGSS_MTBC_Patients) a
PIVOT (
	SUM(Total) for 
		Calendar_Year in ([2019], [2020])
		) AS PivotTable

		*/
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateSGSSMTBCPatients]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGenerateSGSSMTBCPatients] as
select * from SGSS_MTBC_Patients
/*
select * from (select CALENDAR_YEAR, WEEK_OF_YEAR, Total from SGSS_MTBC_Patients) a
PIVOT (
	SUM(Total) for 
		Calendar_Year in ([2019], [2020])
		) AS PivotTable

		*/
GO
/****** Object:  StoredProcedure [dbo].[uspGenerateTB_Service]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This refreshes the TB_Service table based on the TB_Service table in the NTBS_R1_Geography_Staging database. It includes details of the Phec

Author:  PHE
		 Adil Mirza
**************************************************************************************************/
CREATE procedure [dbo].[uspGenerateTB_Service] as


if object_id('tempdb.dbo.#Service','U') is not null 
begin	
	drop table #Service
end

create table #Service (	
						Serviceid int IDENTITY(1,1) NOT NULL, 
						TB_Service_Code varchar(50) not null,
						TB_Service_Name varchar(150) not null,
						phecid tinyint not null, 
						SortOrder tinyint not null,
						PHEC_Code [nvarchar](50) NOT NULL, 
						PhecName [nvarchar](50) NOT NULL)

insert into #Service (phecid, SortOrder,PHEC_Code, PhecName,TB_Service_Code,TB_Service_Name)


 SELECT distinct phecid, SortOrder,PHEC_Code, PhecName,s.TB_Service_Code,s.TB_Service_Name
  FROM [dbo].[Phec] p inner join 

  [NTBS_R1_Geography_Staging].dbo.TB_Service_to_PHEC l on l.PHEC_Code = p.PhecCode
  inner join [NTBS_R1_Geography_Staging].dbo.TB_Service s on s.TB_Service_Code = l.TB_Service_Code
   order by SortOrder,TB_Service_Name


truncate table TB_Service

SET IDENTITY_INSERT [dbo].[TB_Service] ON 
insert into dbo.TB_Service ([Serviceid]
      ,[TB_Service_Code]
      ,[TB_Service_Name]
      ,[phecid]
      ,[SortOrder]
      ,[PHEC_Code]
      ,[PhecName]) select [Serviceid]
      ,[TB_Service_Code]
      ,[TB_Service_Name]
      ,[phecid]
      ,[SortOrder]
      ,[PHEC_Code]
      ,[PhecName] from #Service order by Serviceid   
SET IDENTITY_INSERT [dbo].[TB_Service] OFF
GO
/****** Object:  StoredProcedure [dbo].[uspGetAgeStatsBySex]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetAgeStatsBySex]
(
	@ClusterId VARCHAR(200)
)
AS
BEGIN
	CREATE TABLE #AgeRangeTempTable
	(
		AgeRange VARCHAR(10)
	)

	INSERT INTO #AgeRangeTempTable
	VALUES 
		('0-14'),
		('15-44'),
		('45-64'),
		('65+')

	SELECT
		ar.AgeRange,
		ISNULL(ageGroupings.FemaleCount, 0) AS FemaleCount,
		ISNULL(ageGroupings.MaleCount, 0) AS MaleCount
	FROM (
		SELECT
			AgeRange,
			SUM(CASE Sex WHEN 'Male' THEN 1 ELSE 0 END) AS MaleCount,
			SUM(CASE Sex WHEN 'Female' THEN 1 ELSE 0 END) AS FemaleCount
		FROM (
			SELECT
				n.NotificationId,
				n.Sex,
				CASE
					WHEN n.Age BETWEEN 0 AND 14 THEN '0-14'
					WHEN n.Age BETWEEN 15 AND 44 THEN '15-44'
					WHEN n.Age BETWEEN 45 AND 64 THEN '45-64'
					WHEN n.Age >= 65 THEN '65+'
				END AS AgeRange
			FROM ReusableNotification n WITH (NOLOCK)
			LEFT JOIN NotificationClusterMatch cluster ON cluster.NotificationId = n.NotificationId
			WHERE ClusterId = @ClusterId) notificationsWithAgeRange
		GROUP BY AgeRange) ageGroupings
	RIGHT JOIN #AgeRangeTempTable ar ON ar.AgeRange = ageGroupings.AgeRange

	DROP TABLE #AgeRangeTempTable
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetAuthenticatedLoginGroups]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This proc must get called by EVERY end-user proc (= procs that deliver reports to SSRS).
         It must wrap all data that the end-user proc would normally return. Only then it is
		 guaranteed that the NTBS R1 reports are restricted to the AD group users that were imported
		 into the SQL Server instance (= 9 regional PHEC groups & National Team).
		 This is just the first step! At query run-time then ufnAuthorizedReusableNotification()
		 makes sure that the notifcation records get filtered according to permissions.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGetAuthenticatedLoginGroups] (
	@LoginGroups VARCHAR(500) = '' OUTPUT,
	@UserType VARCHAR(1) = '' OUTPUT
) AS
	BEGIN TRY
		SET NOCOUNT ON

		-- Debugging
		-- DECLARE @LoginGroups AS VARCHAR(500);

		SET @LoginGroups = '###'
		
		SELECT @LoginGroups = CONCAT('###',REPLACE(AdGroups, ',', '###'),'###') from [User]
				WHERE Username = SYSTEM_USER

		-- Debugging
		-- PRINT @LoginGroups

		-- Log, if user not found
		IF (@LoginGroups = '###')
			RAISERROR ('This user is not authorized to log into NTBS Reporting', 16, 1) WITH NOWAIT

		SELECT @UserType = ADGroupType
		FROM AdGroup
		WHERE CHARINDEX('###' + AdGroupName + '###', @LoginGroups) != 0
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGetAuthenticatedLoginGroups2]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***************************************************************************************************
Desc:    This proc must get called by EVERY end-user proc (= procs that deliver reports to SSRS).
         It must wrap all data that the end-user proc would normally return. Only then it is
		 guaranteed that the NTBS R1 reports are restricted to the AD group users that were imported
		 into the SQL Server instance (= 9 regional PHEC groups & National Team).
		 This is just the first step! At query run-time then ufnAuthorizedReusableNotification()
		 makes sure that the notifcation records get filtered according to permissions.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGetAuthenticatedLoginGroups2] (
	@LoginGroups VARCHAR(500) = '' OUTPUT
) AS
	BEGIN TRY
		SET NOCOUNT ON

		-- Debugging
		-- DECLARE @LoginGroups AS VARCHAR(500);

		SET @LoginGroups = '###'
		
		SELECT @LoginGroups = CONCAT('###',REPLACE(AdGroups, ',', '###'),'###') from [test-ntbs].dbo.[User]
				WHERE Username = SYSTEM_USER

		-- Debugging
		 select @LoginGroups

		-- Log, if user not found
		IF (@LoginGroups = '###')
			RAISERROR ('This user is not authorized to log into NTBS Reporting', 16, 1) WITH NOWAIT
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGetAuthenticatedLoginGroupsAndType]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This proc must get called by EVERY end-user proc (= procs that deliver reports to SSRS).
         It must wrap all data that the end-user proc would normally return. Only then it is
		 guaranteed that the NTBS R1 reports are restricted to the AD group users that were imported
		 into the SQL Server instance (= 9 regional PHEC groups & National Team).
		 This is just the first step! At query run-time then ufnAuthorizedReusableNotification()
		 makes sure that the notifcation records get filtered according to permissions.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspGetAuthenticatedLoginGroupsAndType] (
	@LoginGroups VARCHAR(500) = '' OUTPUT,
	@LoginType VARCHAR(1) = '' OUTPUT
) AS
	BEGIN TRY
		SET NOCOUNT ON

		-- Debugging
		-- DECLARE @LoginGroups AS VARCHAR(500);

		SET @LoginGroups = '###'
		
		SELECT @LoginGroups = CONCAT('###',REPLACE(AdGroups, ',', '###'),'###') from [dbo].[User]
				WHERE Username = SYSTEM_USER

		-- Debugging
		-- PRINT @LoginGroups

		-- Log, if user not found
		IF (@LoginGroups = '###')
			RAISERROR ('This user is not authorized to log into NTBS Reporting', 16, 1) WITH NOWAIT

		SELECT @LoginType = ADGroupType
		FROM AdGroup
		WHERE CHARINDEX('###' + AdGroupName + '###', @LoginGroups) != 0
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspGetDrugResistanceStatsInCluster]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetDrugResistanceStatsInCluster]
(
	@ClusterId VARCHAR(200)
)
AS
BEGIN
	WITH notificationsInCluster(NotificationId, DrugResistanceProfile) AS
	(
		SELECT 
			n.NotificationId, n.DrugResistanceProfile
		FROM dbo.ReusableNotification n WITH (NOLOCK)
		LEFT JOIN NotificationClusterMatch cluster ON cluster.NotificationId = n.NotificationId
		WHERE ClusterId = @ClusterId
	)

	SELECT
		DrugResistanceProfile,
		COUNT(NotificationId) AS CountOfDRP
	FROM notificationsInCluster

	GROUP BY DrugResistanceProfile
	ORDER BY CountOfDRP DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetNotificationsInClusterWithMask]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetNotificationsInClusterWithMask]
(
	@ClusterId VARCHAR(200)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @LoginGroups VARCHAR(500)
		EXEC uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT;

		IF (@LoginGroups != '###')
			BEGIN
				DECLARE @ReusableNotification ReusableNotificationType

				--get a list of Ids and masked values into @ReusableNotification
				--so that this can then be audited

				INSERT INTO @ReusableNotification(NotificationId, EtsId, Forename, Surname, NhsNumber, DateOfBirth, Postcode)
					SELECT
						notifications.NotificationId,
						notifications.EtsId,
						notifications.Forename,
						notifications.Surname,
						notifications.NhsNumber,
						notifications.DateOfBirth,
						notifications.Postcode
					FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) notifications
						INNER JOIN NotificationClusterMatch cluster ON cluster.NotificationId = notifications.NotificationId
					WHERE ClusterId = @ClusterId
				
				INSERT INTO @ReusableNotification(NotificationId, EtsId, Forename, Surname, NhsNumber, DateOfBirth, Postcode)
					SELECT
						rn.NotificationId,
						rn.EtsId,
						LEFT(rn.Forename, 1) AS Forename,
						LEFT(rn.Surname, 1) AS Surname,
						'Withheld' AS NhsNumber,
						 NULL AS DateOfBirth,
						'Withheld' AS Postcode
					FROM
						[dbo].[ReusableNotification] rn 
						INNER JOIN NotificationClusterMatch cluster ON cluster.NotificationId = rn.NotificationId AND cluster.ClusterId = @ClusterId
						AND rn.NotificationId NOT IN (SELECT NotificationId FROM @ReusableNotification)

				--now send data back to the client
				SELECT 
					notifications.NotificationId,
					notifications.EtsId,
					rn.LtbrId,
					FORMAT(rn.NotificationDate, 'dd MMM yyyy') AS NotificationDate,
					rn.CaseManager,
					rn.Hospital,
					rn.[Service],
					notifications.Forename,
					notifications.Surname,
					notifications.NhsNumber,
					CASE 
						WHEN notifications.DateOfBirth IS NULL THEN 'Withheld' 
						ELSE FORMAT(notifications.DateOfBirth, 'dd MMM yyyy') 
					END AS DateOfBirth,
					notifications.Postcode,
					rn.Age,
					rn.Sex,
					rn.EthnicGroup,
					rn.BirthCountry,
					rn.UkEntryYear,
					rn.NoFixedAbode,
					rn.LocalAuthorityCode,
					rn.LocalAuthority,
					rn.ResidencePhec,
					rn.TreatmentPhec,
					FORMAT(rn.SymptomOnsetDate, 'dd MMM yyyy') AS SymptomOnsetDate,
					FORMAT(rn.PresentedDate, 'dd MMM yyyy') AS PresentedDate,
					FORMAT(rn.DiagnosisDate, 'dd MMM yyyy') AS DiagnosisDate,
					FORMAT(rn.StartOfTreatmentDate, 'dd MMM yyyy') AS StartOfTreatmentDate,
					rn.AnySocialRiskFactor,
					rn.Prison,
					rn.Homeless,
					rn.AlcoholMisuse,
					rn.DrugMisuse,
					rn.LastRecordedTreatmentOutcome,
					FORMAT(rn.EarliestSpecimenDate, 'dd MMM yyyy') AS EarliestSpecimenDate,
					rn.DrugResistanceProfile
				FROM @ReusableNotification notifications
					INNER JOIN [dbo].[ReusableNotification] rn ON rn.NotificationId = notifications.NotificationId
				ORDER BY rn.NotificationDate DESC
			
			-- Write data to audit log
			EXEC dbo.uspAddToAudit 'Cluster Line List', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetNotificationsLocalAuthorityStatsInCluster]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetNotificationsLocalAuthorityStatsInCluster]
(
	@ClusterId VARCHAR(200)
)
AS
BEGIN
	WITH notificationsInCluster AS
	(
		SELECT 
			LocalAuthority,
			LocalAuthorityCode
		FROM dbo.ReusableNotification n WITH (NOLOCK)
		LEFT JOIN NotificationClusterMatch cluster ON cluster.NotificationId = n.NotificationId
		WHERE ClusterId = @ClusterId
	)

	SELECT
		LocalAuthority,
		MAX(LocalAuthorityCode) AS LocalAuthorityCode,
		COUNT(LocalAuthority) AS LocalAuthorityCount
	FROM notificationsInCluster
	WHERE LocalAuthority IS NOT NULL
	GROUP BY LocalAuthority
	ORDER BY LocalAuthorityCount DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetNotificationsRegionStatsInCluster]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetNotificationsRegionStatsInCluster]
(
	@ClusterId VARCHAR(200)
)
AS
BEGIN
	WITH notificationsInCluster AS
	(
		SELECT 
			ResidencePhec,
			ResidencePhecCode
		FROM dbo.ReusableNotification n WITH (NOLOCK)
		LEFT JOIN NotificationClusterMatch cluster ON cluster.NotificationId = n.NotificationId
		WHERE ClusterId = @ClusterId
	)

	SELECT
		ResidencePhec,
		MAX(ResidencePhecCode) AS ResidencePhecCode,
		COUNT(ResidencePhec) AS ResidencePhecCount
	FROM notificationsInCluster
	WHERE ResidencePhec IS NOT NULL
	GROUP BY ResidencePhec
	ORDER BY ResidencePhecCount DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetNotificationStatsInCluster]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetNotificationStatsInCluster]
(
	@ClusterId VARCHAR(200)
)
AS
BEGIN

	WITH notificationsInCluster AS
	(
		SELECT NotificationDate,
			BirthCountry, 
			Sex,
			Age,
			(CASE AlcoholMisuse WHEN 'Yes' THEN 1 ELSE 0 END) AS Alcohol,
			(CASE DrugMisuse WHEN 'Yes' THEN 1 ELSE 0 END) AS Drug,
			(CASE Prison WHEN 'Yes' THEN 1 ELSE 0 END) AS Prison,
			(CASE Homeless WHEN 'Yes' THEN 1 ELSE 0 END) AS Homeless,
			cluster.ClusterId
		FROM dbo.ReusableNotification n WITH (NOLOCK)
		INNER JOIN NotificationClusterMatch cluster ON cluster.NotificationId = n.NotificationId
		WHERE ClusterId = @ClusterId
	),
	MedianCalc(MedianAge) AS
	(
		SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Age)
			OVER (PARTITION BY ClusterId) AS MedianAge
			FROM notificationsInCluster
	)
	

	SELECT
		MIN(NotificationDate) AS EarliestNotificationDate,
		MAX(NotificationDate) AS LatestNotificationDate,
		SUM(CASE Sex WHEN 'Male' THEN 1 ELSE 0 END) AS MaleCount,
		SUM(CASE Sex WHEN 'Female' THEN 1 ELSE 0 END) AS FemaleCount,
		SUM(Alcohol) AS AlcoholCount,
		SUM(Homeless) AS HomelessCount,
		SUM(Drug) AS DrugCount,
		SUM(Prison) AS PrisonCount,
		COUNT(NotificationDate) AS TotalCount,
		MIN(Age) AS MinAge,
		MAX(Age) AS MaxAge,
		--there is only one value for MedianAge but the select requires all values to be in aggregate form
		MAX(MedianAge) AS MedianAge,
		SUM(CASE WHEN Age < 15 THEN 1 ELSE 0 END) AS ChildSum
	FROM notificationsInCluster, MedianCalc
END
GO
/****** Object:  StoredProcedure [dbo].[uspgetsystemuser]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspgetsystemuser] as

DECLARE @sys_usr char(30);  
SET @sys_usr = SYSTEM_USER;  
SELECT 'The current system user is: '+ @sys_usr;  
		DECLARE	@LoginGroups VARCHAR(500) = '###Global.NIS.NTBS.YHR###Global.NIS.NTBS.EMS###'
	--	EXEC dbo.uspGetAuthenticatedLoginGroups @LoginGroups OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @LoginGroups

		IF (@LoginGroups != '###')
		BEGIN
			SELECT 
				PhecCode, 
				PhecName,
				SortOrder
			FROM dbo.Phec pt
				INNER JOIN dbo.PhecAdGroup pat ON pat.PhecId = pt.PhecId
				INNER JOIN dbo.AdGroup agt ON agt.AdGroupId = pat.AdGroupId
			WHERE PhecName != 'Unknown'
				-- Permission restrictions on logged-in treatment region
				AND CHARINDEX('###' + agt.AdGroupName + '###', @LoginGroups) != 0
			UNION
			SELECT
				PhecCode,
				PhecName,
				SortOrder
			FROM dbo.Phec pr
				INNER JOIN dbo.PhecAdGroup par ON par.PhecId = pr.PhecId
				INNER JOIN dbo.AdGroup agr ON agr.AdGroupId = par.AdGroupId
			WHERE PhecName != 'Unknown'
				-- Permission restrictions on logged-in residence region
				AND CHARINDEX('###' + agr.AdGroupName + '###', @LoginGroups) != 0
			ORDER BY SortOrder
			END
GO
/****** Object:  StoredProcedure [dbo].[uspGetTopBirthCountriesInCluster]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetTopBirthCountriesInCluster] (
	@ClusterId VARCHAR(200)
)
AS
BEGIN
	WITH notificationsInCluster AS
	(
		SELECT BirthCountry
		FROM dbo.ReusableNotification n WITH (NOLOCK)
		LEFT JOIN NotificationClusterMatch cluster ON cluster.NotificationId = n.NotificationId
		WHERE ClusterId = @ClusterId
	)

	SELECT TOP 3 
		BirthCountry, 
		Count(BirthCountry) AS CountryCount
	FROM notificationsInCluster
	GROUP BY BirthCountry
	ORDER BY CountryCount DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspHandleException]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This handles an exception in a way that information about the problem gets logged to the
         Windows Event Viewer, but this proc can easily be adjusted to log to any other log instead.
		 The end-user in SSRS only gets returned a generic error message, but no exploitable 
		 details about the problem.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspHandleException] AS
	BEGIN TRY
		BEGIN
			-- Compile error message for investigation
		--	DECLARE @ErrorMsg AS VARCHAR(1000);
			-- Compile error message
		/*	DECLARE @ErrorMsg AS VARCHAR(1000) = CHAR(13) + CHAR(13) +
												 'Message: ' + ERROR_MESSAGE() + CHAR(13) +
												 'Proc: ' + ERROR_PROCEDURE() + CHAR(13) +
												 'Line: ' + CONVERT(VARCHAR, ERROR_LINE()) + CHAR(13) +
												 'Error no: ' + CONVERT(VARCHAR, ERROR_NUMBER()) + CHAR(13) +
												 'Username: ' + SUSER_SNAME()
	*/
		INSERT INTO dbo.ErrorLog (ErrorDateTime,UserName,ErrorNumber,ErrorMessage,ProcName,LineNumber)
			VALUES (GETUTCDATE(),  SYSTEM_USER, CONVERT(VARCHAR, ERROR_NUMBER()),ERROR_MESSAGE(),ERROR_PROCEDURE(),CONVERT(VARCHAR, ERROR_LINE()))

			-- Log error
		--	EXEC [$(master)].sys.xp_logevent 60000, @ErrorMsg

			-- Display error
			SELECT ERROR_MESSAGE() AS 'ErrorMessage'
		END
	END TRY
	BEGIN CATCH
		RAISERROR ('The SQL Stored Procedure dbo.uspHandleException failed to log an error and to return a user-friendly error message to the end-user', 16, 1) WITH NOWAIT;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspLabSpecimen]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
uspLabSpecimen:
	This stored proc processes specimen data from LabBase2 into a more digestible format

*/

CREATE PROCEDURE [dbo].[uspLabSpecimen] AS
	SET NOCOUNT ON

	BEGIN TRY
		
		/*Reset and reload base data*/

		-- Reset
		DELETE FROM [dbo].[LabSpecimen]
		DELETE FROM [dbo].[StandardisedLabbaseSpecimen]
		DELETE FROM [dbo].[StandardisedLabbaseSusceptibilityResult]

		-- first populate the temporary table with basic data from LabBase
		-- !!! The migration db uses the same way to make up missing reference laboratory numbers - make sure to keep them in sync: 
		-- https://github.com/PublicHealthEngland/ntbs-data-migration/blob/master/migration/27_aggregate_views/EtsLaboratoryResultsView.sql#L14
		INSERT INTO [dbo].[StandardisedLabbaseSpecimen]
			([ReferenceLaboratoryNumber]
		  ,[SpecimenDate]
		  ,[LabDataID]
		  ,[OpieId]
		  ,[IdentityColumn]
		  ,[SpecimenTypeCode]
		  ,[AuditCreate]
		  ,[OrganismName])
				SELECT
					CASE
						WHEN a.ReferenceLaboratoryNumber = '' THEN CONCAT('TBSURV', a.IdentityColumn)
						WHEN a.ReferenceLaboratoryNumber is not null THEN TRIM(a.ReferenceLaboratoryNumber)
						ELSE CONCAT('TBSURV', a.IdentityColumn)
					END AS 'ReferenceLaboratoryNumber'
					,sr.SpecimenDate
					,sr.LabDataID
					,a.OpieId
					,a.IdentityColumn
					,sr.SpecimenTypeCode
					,a.AuditCreate
					,a.OrganismName
				FROM [LabBase2].[dbo].[Anonymised] a 
					--inner join because we only want TB specimens and isAtypical flag lives in Anonymised
					INNER JOIN [LabBase2].[dbo].[SpecimenResult] sr ON sr.LabDataID = a.LabDataID
					AND a.IsAtypicalOrganismRecord = 0
					AND a.MergedRecord = 0


		--Find the specimens to insert into LabSpecimen
		--First fetch all the matched specimens, regardless of specimen date
		INSERT INTO dbo.LabSpecimen (ReferenceLaboratoryNumber)
			SELECT DISTINCT [ReferenceLaboratoryNumber]
			FROM [NTBS_Specimen_Matching].[dbo].[NotificationSpecimenMatch]
			WHERE [MatchType] = 'Confirmed'

		
		--Now fetch all the unmatched specimens for the last three years
		INSERT INTO dbo.LabSpecimen (ReferenceLaboratoryNumber)
			SELECT DISTINCT s.ReferenceLaboratoryNumber FROM
				[dbo].[StandardisedLabbaseSpecimen] s
			WHERE YEAR(s.SpecimenDate) IN (SELECT NotificationYear FROM vwNotificationYear)
			AND s.ReferenceLaboratoryNumber NOT IN (SELECT ReferenceLaboratoryNumber FROM LabSpecimen)

		--load basic information about drug sensitivity results from Labase, but only for the specimens in LabSpecimen
		--impacts performance too much to pull all the data across
		INSERT INTO [dbo].[StandardisedLabbaseSusceptibilityResult]
			([ReferenceLaboratoryNumber],
			[AntibioticOutputName],
			[IsWGS],
			[ResultOutputName],
			[Rank])

				SELECT DISTINCT 
					lbs.ReferenceLaboratoryNumber, 
					am.AntibioticOutputName, 
					am.IsWGS, 
					rm.ResultOutputName, 
					rm.[Rank] 
				FROM StandardisedLabbaseSpecimen lbs
					INNER JOIN LabSpecimen ls ON ls.ReferenceLaboratoryNumber = lbs.ReferenceLaboratoryNumber
					INNER JOIN [LabBase2].dbo.Susceptibility su ON su.LabDataID = lbs.LabDataID
					LEFT OUTER JOIN [dbo].[AntibioticMapping] am  ON am.AntibioticCode = su.AntibioticCode
					LEFT OUTER JOIN [dbo].[ResultMapping] rm  ON rm.Result = su.SusceptibilityResult
				WHERE ResultOutputName NOT IN ('New', 'Awaiting', 'No result')

		--Now populate each row with the relevant summarised information

		UPDATE [dbo].[LabSpecimen] SET 

			SpecimenTypeCode = gs.SpecimenTypeCode,
			SpecimenDate = gs.SpecimenDate,
			Species = gs.Species,
			LaboratoryName = a.LaboratoryName,
			ReferenceLaboratory = CASE
									WHEN a.ReferenceLaboratory = 'NMRL' THEN 'NMRS'
									ELSE a.ReferenceLaboratory
								  END,
			PatientNhsNumber = TRIM(REPLACE(a.PatientNhsNumber,CHAR(13),'')),
			PatientBirthDate = a.PatientBirthDate,
			PatientName = CASE
							WHEN UPPER(TRIM(a.PatientSurname)) ='' THEN TRIM(a.PatientForename)
							WHEN UPPER(TRIM(a.PatientSurname)) is not null THEN CONCAT(UPPER(TRIM(a.PatientSurname)), ', ', TRIM(a.PatientForename))
							ELSE TRIM(a.PatientForename)
						END, 
			PatientGivenName = TRIM(a.PatientForename),
			PatientFamilyName = TRIM(a.PatientSurname),
			PatientSex = TRIM(a.PatientSex),
			PatientAddress = TRIM(CONCAT(TRIM(a.AddressLine1), ' ', TRIM(a.AddressLine2), ' ', TRIM(a.AddressLine3))),
			PatientPostcode = TRIM(a.PatientPostcode),
			INH = ss.INH,
			RIF = ss.RIF,
			EMB = ss.EMB,
			PZA = ss.PZA,
			AMINO = ss.AMINO,
			QUIN = ss.QUIN
			
			FROM 
				[dbo].[LabSpecimen] ls
				CROSS APPLY [dbo].[ufnGetSpecimenInfo](ls.ReferenceLaboratoryNumber) gs
				CROSS APPLY [dbo].[ufnGetSpecimenSusceptibilityInfo](ls.ReferenceLaboratoryNumber) ss
				INNER JOIN [LabBase2].[dbo].[Anonymised] a ON a.IdentityColumn = gs.IdentityColumn
				

		/*START OF MDR/XDR RESULT*/
		EXEC uspSpecimenMDRXDR
		/*END OF SENSITIVITY RESULT*/
	
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspLabSpecimenSecondLineSensitivityResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspLabSpecimenSecondLineSensitivityResult]
	@GroupName nvarchar(5) = NULL
AS
	
	BEGIN TRY
		SET NOCOUNT ON
		
			DECLARE @Sql NVARCHAR(2000)

			--DEBUGGING
			--SET @GroupName = 'AMINO'


			--first update the records which do have a result to the result with the lowest ranking - this indicates the highest severity
			SET @Sql = 'UPDATE [dbo].LabSpecimen
			SET ' + @GroupName + ' = Q2.ResultOutputName FROM
				-- second query joins the Rank number to the matching result
				(SELECT DISTINCT Q1.ReferenceLaboratoryNumber, rm.ResultOutputName FROM

					-- innermost query, finds the lowest ranked result for the second line group
					(SELECT DISTINCT vr.ReferenceLaboratoryNumber, MIN(vr.[Rank]) As ''MinRank'' FROM 
							[dbo].vwSusceptibilityResult vr
							INNER JOIN [dbo].[LabSpecimen] ls ON 
								vr.ReferenceLaboratoryNumber = ls.ReferenceLaboratoryNumber
							WHERE vr.AntibioticOutputName IN (SELECT AntibioticOutputName from vwSecondLineMapping WHERE GroupName = ''' + @GroupName + ''')
								GROUP BY vr.ReferenceLaboratoryNumber) AS Q1
				INNER JOIN [dbo].ResultMapping rm ON Q1.MinRank = rm.[Rank]) as Q2
				WHERE [dbo].LabSpecimen.ReferenceLaboratoryNumber = Q2.ReferenceLaboratoryNumber'

			

			PRINT @Sql
			EXEC sp_executesql @Sql
	

	
			--then update the records with no result for the specified antibiotic
			SET @Sql = 'UPDATE LabSpecimen
				SET ' + @GroupName + ' = ''No result''
				WHERE ReferenceLaboratoryNumber NOT IN 
				(SELECT DISTINCT vr.ReferenceLaboratoryNumber from [dbo].vwSusceptibilityResult vr
				where vr.AntibioticOutputName IN (SELECT AntibioticOutputName from vwSecondLineMapping WHERE GroupName = ''' + @GroupName + '''))'

			PRINT @Sql
			EXEC sp_executesql @Sql

END TRY
BEGIN CATCH
	THROW
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspLabSpecimenSensitivityResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspLabSpecimenSensitivityResult]
	@Antibiotic nvarchar(5) = NULL
AS
	
	BEGIN TRY
		SET NOCOUNT ON
		
			DECLARE @Sql NVARCHAR(2000)

			--DEBUGGING
			--SET @Antibiotic = 'RIF'


			--first update the records which do have a result to the result with the lowest ranking - this indicates the highest severity
			SET @Sql = 'UPDATE [dbo].LabSpecimen
			SET ' + @Antibiotic + ' = Q2.ResultOutputName FROM
	
						-- second query joins the Rank number to the matching result
						(SELECT DISTINCT Q1.ReferenceLaboratoryNumber, rm.ResultOutputName FROM

								-- innermost query, finds the lowest ranked result for each antibio
								(SELECT DISTINCT vr.ReferenceLaboratoryNumber, MIN(vr.[Rank]) As ''MinRank'' FROM 
											[dbo].vwSusceptibilityResult vr
											INNER JOIN [dbo].[LabSpecimen] ls ON 
												vr.ReferenceLaboratoryNumber = ls.ReferenceLaboratoryNumber
										WHERE vr.AntibioticOutputName = ''' + @Antibiotic + '''  
										 GROUP BY vr.ReferenceLaboratoryNumber) as Q1
							INNER JOIN [dbo].ResultMapping rm ON Q1.MinRank = rm.[Rank]) as Q2
			WHERE [dbo].LabSpecimen.ReferenceLaboratoryNumber = Q2.ReferenceLaboratoryNumber'

			PRINT @Sql
			EXEC sp_executesql @Sql
	

	
			--then update the records with no result for the specified antibiotic
			SET @Sql = 'UPDATE LabSpecimen
				SET ' + @Antibiotic + ' = ''No result''
				WHERE ReferenceLaboratoryNumber NOT IN 
				(SELECT DISTINCT vr.ReferenceLaboratoryNumber from [dbo].vwSusceptibilityResult vr
				where vr.AntibioticOutputName = ''' + @Antibiotic +''')'

			PRINT @Sql
			EXEC sp_executesql @Sql

END TRY
BEGIN CATCH
	THROW
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspLog]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This logs a specified piece of text that has been passed. Currently this simply logs to 
         the Windows Event Viewer, but it can easily be adjusted to log to any other log instead.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspLog]  
	@LogText VARCHAR(500)


AS
	BEGIN
		--SET @LogText = 'Log: ' + @LogText

		--DECLARE @LogStatus AS TINYINT = 0
		insert into dbo.ErrorLog (ErrorDateTime,UserName,ErrorMessage)
		values( GETUTCDATE(),  SYSTEM_USER, @LogText)
		--EXEC [$(master)].sys.xp_logevent 60000, @LogText

		RETURN 0
	END
GO
/****** Object:  StoredProcedure [dbo].[uspManualLabResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspManualLabResult]
	
AS
	SET NOCOUNT ON

	BEGIN TRY
		
		-- Reset
		DELETE FROM dbo.ManualLabResult

		EXEC dbo.uspManualLabResultAll

		EXEC dbo.uspManualLabResultMicroscopy

		--insert a row for every ETS ID in the ReusableNotification table

		INSERT INTO dbo.ManualLabResult(EtsId)
			SELECT DISTINCT [EtsId]
			FROM [dbo].[ReusableNotification] rn


		--1. Microscopy
		--First set the rows with a result
		
		UPDATE dbo.ManualLabResult
		SET Microscopy = 
		
		(SELECT Result from [dbo].ManualLabResultAll mra
			WHERE mra.[TestType]  = 'Microscopy'
			AND mra.EtsId = dbo.ManualLabResult.EtsId)
		WHERE Microscopy IS NULL

		--Then update rows with no result
		UPDATE dbo.ManualLabResult
		SET Microscopy = 'No Result'
		WHERE Microscopy IS NULL

		--2. MicroscopySputum
		--First set the rows with a result
		UPDATE dbo.ManualLabResult
		SET MicroscopySputum = 
		
		(SELECT Result from [dbo].ManualLabResultMicroscopy mrs
			WHERE mrs.Sputum = 1
			AND mrs.EtsId = dbo.ManualLabResult.EtsId)
		WHERE MicroscopySputum IS NULL
		
		--Then update rows with no result

		UPDATE dbo.ManualLabResult
		SET MicroscopySputum = 'No Result'
		WHERE MicroscopySputum IS NULL


		--3. MicroscopyNonSputum
		--First set the rows with a result
		UPDATE dbo.ManualLabResult
		SET MicroscopyNonSputum = 
		
		(SELECT Result from [dbo].ManualLabResultMicroscopy mrs
			WHERE mrs.Sputum = 0
			AND mrs.EtsId = dbo.ManualLabResult.EtsId)
		WHERE MicroscopyNonSputum IS NULL
		
		--Then update rows with no result

		UPDATE dbo.ManualLabResult
		SET MicroscopyNonSputum = 'No Result'
		WHERE MicroscopyNonSputum IS NULL

		--4. Histology
		
		--Set results for Histo
		UPDATE dbo.ManualLabResult
		SET Histology = 
		
		(SELECT Result from [dbo].ManualLabResultAll mra
			WHERE mra.[TestType]  = 'Histology'
			AND mra.EtsId = dbo.ManualLabResult.EtsId)
		WHERE Histology IS NULL

		--Then update rows with no result
		UPDATE dbo.ManualLabResult
		SET Histology = 'No Result'
		WHERE Histology IS NULL


		--5. Culture
		

		--Then set results for Culture
		UPDATE dbo.ManualLabResult
		SET Culture = 
		
		(SELECT Result from [dbo].ManualLabResultAll mra
			WHERE mra.[TestType] = 'Mycobacterial Culture'
			AND mra.EtsId = dbo.ManualLabResult.EtsId)
		WHERE Culture IS NULL

		--Then update rows with no result
		UPDATE dbo.ManualLabResult
		SET Culture = 'No Result'
		WHERE Culture IS NULL

		--6	Molecular Amplification
		
		--Set results for Amplification
		UPDATE dbo.ManualLabResult
		SET Amplification =
		(SELECT Result from [dbo].ManualLabResultAll mra
			WHERE mra.[TestType] = 'Molecular Amplification'
			AND mra.EtsId = dbo.ManualLabResult.EtsId)
		WHERE Amplification IS NULL


		--Then update rows with no result
		UPDATE dbo.ManualLabResult
		SET Amplification = 'No Result'
		WHERE Amplification IS NULL

		--finally clear out the look-up tables ManualLabResultAll and ManualLabResultMicroscopy
		DELETE FROM [dbo].ManualLabResultAll
		DELETE FROM [dbo].ManualLabResultMicroscopy

	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspManualLabResultAll]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspManualLabResultAll]
	
AS
	SET NOCOUNT ON

	BEGIN TRY
		
		-- Reset
		DELETE FROM dbo.ManualLabResultAll

		INSERT INTO [dbo].ManualLabResultAll (EtsId, TestType, Result)
		--OUTER QUERY converts the minrank back to a result
		SELECT 
			Q1.LegacyID, 
			Q1.[Name],
			(CASE Q1.ResultRank
				WHEN 1 THEN 'Positive'
				WHEN 2 THEN 'Negative'
				WHEN 3 THEN 'Not known'
				WHEN 4 THEN 'Awaiting'
				ELSE NULL
			END) AS 'Result' FROM
				--INNER QUERY SELECTS THE HIGHEST RANKED RESULT FOR EACH COMBINATION OF NOTIFICATION ID AND TEST
				(SELECT DISTINCT n.LegacyId
					  ,lc.[Name]
						,MIN((CASE lr.Result
							WHEN 0 THEN 2
							WHEN 1 THEN 1
							WHEN 2 THEN 3
							WHEN 3 THEN 4
							ELSE NULL
						END)) AS 'ResultRank'
				
				  FROM [ETS].[dbo].[LaboratoryResult] lr
					INNER JOIN [ETS].[dbo].[Notification] n on n.Id = lr.NotificationId
					INNER JOIN [ETS].[dbo].[LaboratoryCategory] lc on lc.Id = lr.LaboratoryCategoryId
					INNER JOIN [ETS].[dbo].[SpecimenType] st on st.Id = lr.SpecimenTypeId
				WHERE OpieId is NULL
				AND lr.AuditDelete IS NULL
				GROUP BY n.LegacyId, lc.[Name]) AS Q1
			INNER JOIN [dbo].ReusableNotification rn ON rn.EtsId = Q1.LegacyId
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspManualLabResultLineList]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspManualLabResultLineList]
		@NotificationYearFrom	INTEGER			=	-3,
		@NotificationMonthFrom	INTEGER			=	1,
		@NotificationYearTo		INTEGER			=	0,
		@NotificationMonthTo	INTEGER			=	1,
		@ResidenceTreatment		TINYINT			=   1,
		@Region					VARCHAR(50)		=	NULL
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN

			/*
				-- Debugging
				DECLARE @NotificationYearFrom INTEGER = -1
				DECLARE @NotificationMonthFrom INTEGER = 1
				DECLARE @NotificationYearTo INTEGER = -1

				DECLARE @NotificationMonthTo INTEGER = 3
				DECLARE @ResidenceTreatment INTEGER = 1
				
				DECLARE @Region VARCHAR(50) = 'London'
				
				DECLARE @LoginGroups VARCHAR(50) = '###Global.NIS.NTBS.LON###'
			*/
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
			DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
			DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
			DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo) -- Move end date to last day of month

			DECLARE @ReusableNotification ReusableNotificationType

			INSERT INTO @ReusableNotification
				SELECT n.*
				FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n  -- This filters the records by regional PHEC permissions!
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (
							(
									@ResidenceTreatment = 1 AND
									(n.TreatmentPhec = @Region OR n.ResidencePhec = @Region)
							) OR (
									@ResidenceTreatment = 2 AND
									n.TreatmentPhec = @Region
							) OR (
									@ResidenceTreatment = 3 AND
									n.ResidencePhec = @Region
							)
						)
			SELECT
				-- Primary key
				n.NotificationId                                       AS 'ID',

				-- Demographics
				n.EtsId                                                AS 'ETS ID',
				n.LtbrId                                               AS 'LTBR ID',
				dbo.ufnFormatDateConsistently(n.NotificationDate)      AS 'Notification date',
				n.[Service]                                            AS 'Service',
				mr.Microscopy										   AS 'Microscopy',
				mr.MicroscopySputum									   AS 'Microscopy sputum',
				mr.MicroscopyNonSputum								   AS 'Microscopy non-sputum',
				mr.Histology										   AS 'Histology',
				mr.Amplification									   AS 'Molecular Amplification',
				mr.Culture											   AS 'Manually-entered culture'	
				
			FROM @ReusableNotification n
				INNER JOIN dbo.ManualLabResult mr ON mr.EtsId = n.EtsId
			ORDER BY n.NotificationDate DESC

			-- Write data to audit log
			EXEC dbo.uspAddToAudit 'Manual Lab Result Line List', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspManualLabResultMicroscopy]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspManualLabResultMicroscopy]
	
AS
	SET NOCOUNT ON

	BEGIN TRY
		
		-- Reset
		DELETE FROM dbo.ManualLabResultMicroscopy

		INSERT INTO [dbo].ManualLabResultMicroscopy (EtsId, Result, Sputum)
			--OUTER QUERY converts the minrank back to a result
			SELECT Q1.LegacyID, 
				(CASE Q1.ResultRank
					WHEN 1 THEN 'Positive'
					WHEN 2 THEN 'Negative'
					WHEN 3 THEN 'Not known'
					WHEN 4 THEN 'Awaiting'
					ELSE NULL
				END) AS 'Result', 
				0 AS 'Sputum'
				FROM
				--INNER QUERY SELECTS THE HIGHEST RANKED RESULT FOR EACH COMBINATION OF NOTIFICATION ID AND TEST
				(SELECT DISTINCT n.LegacyId
						,MIN((CASE lr.Result
							WHEN 0 THEN 2
							WHEN 1 THEN 1
							WHEN 2 THEN 3
							WHEN 3 THEN 4
							ELSE NULL
						END)) AS 'ResultRank'
				  FROM [ETS].[dbo].[LaboratoryResult] lr
					INNER JOIN [ETS].[dbo].[Notification] n on n.Id = lr.NotificationId
					INNER JOIN [ETS].[dbo].[LaboratoryCategory] lc on lc.Id = lr.LaboratoryCategoryId
					INNER JOIN [ETS].[dbo].[SpecimenType] st on st.Id = lr.SpecimenTypeId
				WHERE OpieId is NULL
				AND lc.[Name] = 'Microscopy'
				AND st.[Name] not like '%sputum%'
				AND lr.AuditDelete is NULL
				GROUP BY n.LegacyId, lc.[Name]) AS Q1
					INNER JOIN [dbo].ReusableNotification rn ON rn.EtsId = Q1.LegacyId

			UNION
				--OUTER QUERY converts the minrank back to a result
			SELECT Q1.LegacyID, 
				(CASE Q1.ResultRank
					WHEN 1 THEN 'Positive'
					WHEN 2 THEN 'Negative'
					WHEN 3 THEN 'Not known'
					WHEN 4 THEN 'Awaiting'
					ELSE NULL
				END) AS 'Result',
				1 AS 'Sputum'
		
				FROM
				--INNER QUERY SELECTS THE HIGHEST RANKED RESULT FOR EACH COMBINATION OF NOTIFICATION ID AND TEST
				(SELECT DISTINCT n.LegacyId
						,MIN((CASE lr.Result
							WHEN 0 THEN 2
							WHEN 1 THEN 1
							WHEN 2 THEN 3
							WHEN 3 THEN 4
							ELSE NULL
						END)) AS 'ResultRank'
				
				  FROM [ETS].[dbo].[LaboratoryResult] lr
					INNER JOIN [ETS].[dbo].[Notification] n on n.Id = lr.NotificationId
					INNER JOIN [ETS].[dbo].[LaboratoryCategory] lc on lc.Id = lr.LaboratoryCategoryId
					INNER JOIN [ETS].[dbo].[SpecimenType] st on st.Id = lr.SpecimenTypeId
				WHERE OpieId is NULL
				AND lc.[Name] = 'Microscopy'
				AND st.[Name] like '%sputum%'
				AND lr.AuditDelete is NULL
				GROUP BY n.LegacyId, lc.[Name]) AS Q1
					INNER JOIN [dbo].ReusableNotification rn ON rn.EtsId = Q1.LegacyId
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationCultureResistanceSummary]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspNotificationCultureResistanceSummary]
	
AS
	SET NOCOUNT ON

	BEGIN TRY
		/*This will populate ReusableNotification with fields which give a culture and resistance summary for each notification, built from the
		LabSpecimen summaries which are matched to the notification*/

		
		
		/*CALCULATE CULTURE POSITIVE FIELD. This is determined by presence of at least one matched lab specimen for the notification*/
		UPDATE [dbo].ReusableNotification SET
			CulturePositive = 'Yes' WHERE NotificationId IN (
				SELECT DISTINCT NotificationID FROM dbo.vwConfirmedMatch)

		UPDATE [dbo].ReusableNotification SET
			CulturePositive = 'No' WHERE NotificationId NOT IN (
				SELECT DISTINCT NotificationID FROM dbo.vwConfirmedMatch)

		/*END OF CALCULATE CULTURE POSITIVE FIELD*/
		--TODO: if not culture positive, there is no real point in running the logic on the rest of the fields - just set to 'No result' or blank?


		/*CALCULATE THE SPECIES*/

		--grab the highest ranked species for each notification

		UPDATE [dbo].ReusableNotification SET
			Species = Q2.OrganismName FROM
			--next query links the rank back to the organism name
			(SELECT Q1.NotificationId, o.OrganismName FROM
				--innermost query gets the highest ranked Organism from the matched specimens
				(SELECT DISTINCT vcm.[NotificationID], MIN(o.OrganismId) AS 'MinRank'
				FROM [dbo].[vwConfirmedMatch] vcm
				INNER JOIN [dbo].Organism o on o.OrganismName = vcm.Species
				GROUP BY vcm.[NotificationID]) AS Q1
			INNER JOIN [dbo].Organism o on o.OrganismId = Q1.MinRank) AS Q2
			WHERE Q2.NotificationID = [dbo].ReusableNotification.NotificationId

		UPDATE [dbo].ReusableNotification SET Species = 'No result'
			WHERE Species IS NULL

		/*END OF CALCULATE THE SPECIES*/

		/*CALCULATE EARLIEST SPECIMEN DATE*/

		UPDATE [dbo].ReusableNotification SET
			EarliestSpecimenDate = Q1.MinDate FROM
				(SELECT NotificationID, MIN(SpecimenDate) AS 'MinDate' FROM [dbo].vwConfirmedMatch
				GROUP BY NotificationID) AS Q1
			WHERE Q1.NotificationID = [dbo].ReusableNotification.NotificationId

		/*END OF CALCULATE EARLIEST SPECIMEN DATE*/


		/*CALCULATE EACH OF THE DRUG SENSITIVITY TEST RESULTS IN TURN*/

		EXEC [dbo].uspNotificationSensitivityResult 'INH'
		EXEC [dbo].uspNotificationSensitivityResult 'RIF'
		EXEC [dbo].uspNotificationSensitivityResult 'EMB'
		EXEC [dbo].uspNotificationSensitivityResult 'PZA'
		EXEC [dbo].uspNotificationSensitivityResult 'QUIN'
		EXEC [dbo].uspNotificationSensitivityResult 'AMINO'

		--now calculate the MDR and XDR values. Do this from scratch rather than rely on the specimen values
		--on the off chance one specimen is resistant to ISO and another is resistant to RIF, in which case
		--neither specimen will have had MDR set to 'Yes'
		EXEC [dbo].uspNotificationMDRXDR
		
	
	
		/*CALCULATE DRUG RESISTANCE PROFILE AT THE END - DEPENDS ON THE OTHER VALUES*/

		--1. Set RR/MDR/XDR
		UPDATE [dbo].ReusableNotification SET
			DrugResistanceProfile = 'RR/MDR/XDR' 
			WHERE
				DrugResistanceProfile IS NULL
				AND (MDR = 'Yes' OR (RIF = 'Resistant' AND INH = 'Sensitive'))
			

		--2. Set INH resistant
		UPDATE [dbo].ReusableNotification SET
			DrugResistanceProfile = 'INH resistant' 
			WHERE
				DrugResistanceProfile IS NULL
				AND INH = 'Resistant' AND RIF = 'Sensitive'

		--3. Set INH + RIF sensitive (ISO and RIF are both 'Sensitive' but one or both of ETHAM and PYR are 'Resistant')
		UPDATE [dbo].ReusableNotification SET
			DrugResistanceProfile = 'INH+RIF sensitive' 
			WHERE
				DrugResistanceProfile IS NULL
				AND
				(INH = 'Sensitive' AND RIF = 'Sensitive') AND (EMB = 'Resistant' OR PZA = 'Resistant')
			

		--4. INH, RIF, EMB & PZA are all 'Sensitive'
		UPDATE [dbo].ReusableNotification SET
			DrugResistanceProfile = 'Sensitive to first line'
			WHERE DrugResistanceProfile IS NULL
				AND (INH = 'Sensitive'
				AND RIF = 'Sensitive'
				AND EMB = 'Sensitive'
				AND PZA = 'Sensitive')

		-- 5. Notification does not have culture positive confirmation
		UPDATE [dbo].ReusableNotification SET
			DrugResistanceProfile = 'No result'
			WHERE DrugResistanceProfile IS NULL
				AND CulturePositive != 'Yes'

		--6. Finally set remaining records to No result
		UPDATE [dbo].ReusableNotification SET
			DrugResistanceProfile = 'No result'
			WHERE DrugResistanceProfile IS NULL


	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationMDRXDR]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspNotificationMDRXDR]
	
AS
		--calculate MDR using same rules as R1

		-- 1. Both INH and RIF are set to 'Resistant'
		UPDATE [dbo].ReusableNotification SET
			MDR = 'Yes'
		WHERE MDR IS NULL
			AND (INH = 'Resistant' AND RIF = 'Resistant')

		-- 2. One of INH and RIF (or both) is 'Sensitive'
		UPDATE [dbo].ReusableNotification SET
			MDR = 'No'
		WHERE MDR IS NULL
			AND (INH = 'Sensitive' OR RIF = 'Sensitive')

		-- 3. One of INH and RIF (or both) is 'No result' or 'Unknown'
		
		UPDATE [dbo].ReusableNotification SET
			MDR = 'No result'
		WHERE MDR IS NULL
			AND (
					   INH = 'No result' 
					OR RIF = 'No result' 
					OR INH = 'Unknown' 
					OR RIF = 'Unknown'
				)

		--calculate XDR using same rules as R1

		-- 1. Both QUIN and AMINO are set to 'Resistant'
		UPDATE [dbo].ReusableNotification SET
			XDR = 'Yes'
		WHERE XDR IS NULL
			AND (AMINO = 'Resistant' AND QUIN = 'Resistant')

		-- 2. One of QUIN or AMINO (or both) is 'Sensitive'
		UPDATE [dbo].ReusableNotification SET
			XDR = 'No'
		WHERE XDR IS NULL
			AND (AMINO = 'Sensitive' OR QUIN = 'Sensitive')

		-- 3. One of AMINO and QUIN (or both) is 'No result' or 'Unknown'
		UPDATE [dbo].ReusableNotification SET
			XDR = 'No result'
		WHERE XDR IS NULL
			AND (
					   AMINO = 'No result' 
					OR QUIN = 'No result' 
					OR AMINO = 'Unknown' 
					OR QUIN = 'Unknown'
				)

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationSensitivityResult]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspNotificationSensitivityResult]
	@Antibiotic nvarchar(5) = NULL
AS
	
	BEGIN TRY
		SET NOCOUNT ON
		
			DECLARE @Sql NVARCHAR(2000)

			--DEBUGGING
			--SET @Antibiotic = 'RIF'


			--first update the records which do have a result to the result with the lowest ranking - this indicates the highest severity
			SET @Sql = 'UPDATE [dbo].ReusableNotification SET '
			 + @Antibiotic + ' = Q2.ResultOutputName FROM
				(SELECT Q1.NotificationID, vrm.ResultOutputName FROM
				(SELECT DISTINCT vcm.[NotificationID], MIN(vrm.[Rank]) AS ''MinRank''
					FROM [dbo].[vwConfirmedMatch] vcm
					INNER JOIN [dbo].vwResultMapping vrm on vrm.ResultOutputName = ' + @Antibiotic + '
					GROUP BY vcm.[NotificationID]) AS Q1
				INNER JOIN [dbo].vwResultMapping vrm on vrm.[Rank] = Q1.MinRank) AS Q2 
			WHERE Q2.NotificationID = [dbo].ReusableNotification.NotificationId'

			PRINT @Sql
			EXEC sp_executesql @Sql
	

			SET @Sql = 'UPDATE [dbo].ReusableNotification SET '
			 + @Antibiotic + ' = ''No result'' WHERE ' + @Antibiotic + ' IS NULL'
			
			PRINT @Sql
			EXEC sp_executesql @Sql
END TRY
BEGIN CATCH
	THROW
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationSummaryByRegion]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspNotificationSummaryByRegion]
	(
			@NotificationYearFrom			INTEGER			=	-3,
			@NotificationMonthFrom			INTEGER			=	1,
			@NotificationYearTo				INTEGER			=	0,
			@NotificationMonthTo			INTEGER			=	1,
			@Regions						VARCHAR(5000)	=	NULL,
			@GroupBy						VARCHAR(50)		=	'MONTH'

	)
AS
BEGIN TRY

	DECLARE @NotificationYearTypeFrom	VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
    DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)

    DECLARE @NotificationYearTypeTo		VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
    DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
		SET @NotificationDateTo						= EOMONTH(@NotificationDateTo)

	DECLARE @DateFormat					VARCHAR(10)	= CASE @GroupBy WHEN 'MONTH' THEN 'yyyy-MM' ELSE 'yyyy' END;

	SELECT [PHEC_Name] AS [Region]
	INTO #RegionGroup
	FROM [NTBS_R1_Geography_Staging].dbo.PHEC
	UNION SELECT 'Unknown' AS Region

	-- Get the list of months
	SELECT [YearMonthValue], 
		MIN(FirstOfMonthValue) AS [FirstOfMonthValue]
	INTO #MonthNumber
	FROM Calendar
	WHERE [DateValue] >= @NotificationDateFrom AND [DateValue] <= @NotificationDateTo
	GROUP BY YearMonthValue

	-- Get list of years
	SELECT DISTINCT([YearValue])
	INTO #YearNumber
	FROM Calendar
	WHERE [DateValue] >= @NotificationDateFrom AND [DateValue] <= @NotificationDateTo

	-- Get Notification count by date period and region
	SELECT 
		COALESCE([TreatmentPhec], 'Unknown')		AS [Region], 
		FORMAT(rn.[NotificationDate], @DateFormat)	AS [DateGroup], 
		COUNT(rn.[NotificationId])					AS [NumberOfNotifications]
	INTO #Count
	FROM [dbo].ReusableNotification rn
	GROUP BY 
		FORMAT(rn.[NotificationDate], @DateFormat), 
		[TreatmentPhec]


	IF (@GroupBy = 'MONTH')
		SELECT m.[YearMonthValue]					AS 'Notification period sortable',
			FORMAT(m.[FirstOfMonthValue], 'MMM yyyy')	AS 'Notification period',
			r.[Region]								AS 'Region',		
			COALESCE (c.[NumberofNotifications], 0) AS 'Notification count'
		FROM #MonthNumber m 
			CROSS JOIN #RegionGroup r
			LEFT OUTER JOIN #Count AS c
			ON c.[Region] = r.[Region]
			AND c.[DateGroup] = m.[YearMonthValue]
		WHERE (@Regions IS NULL OR r.Region IN (SELECT VALUE FROM STRING_SPLIT(@Regions, ',')))
		ORDER BY
			r.[Region],
			m.[FirstOfMonthValue]
	ELSE IF (@GroupBy = 'YEAR')
		SELECT m.[YearValue]						AS 'Notification period sortable',
			m.[YearValue]							AS 'Notification period',
			r.[Region]								AS 'Region', 
			COALESCE (c.[NumberofNotifications], 0) AS 'Notification count'
		FROM #YearNumber m 
			CROSS JOIN #RegionGroup r
			LEFT OUTER JOIN #Count as c
			ON c.[Region] = r.[Region]
			AND c.[DateGroup] = m.[YearValue]
		WHERE (@Regions IS NULL OR r.Region IN (SELECT VALUE FROM STRING_SPLIT(@Regions, ',')))
		ORDER BY
			r.[Region],
			m.[YearValue]

	DROP TABLE #RegionGroup

	DROP TABLE #YearNumber

	DROP TABLE #MonthNumber

	DROP TABLE #Count
END TRY
BEGIN CATCH
	EXEC dbo.uspHandleException
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationSummaryLineList]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Notification Summary" notification aggregate counts for the residence
         portion of the report's entry web page.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspNotificationSummaryLineList]
(
		@NotificationYearFrom	INTEGER			=	NULL,
		@NotificationMonthFrom	INTEGER			=	NULL,
		@NotificationYearTo		INTEGER			=	NULL,
		@NotificationMonthTo	INTEGER			=	NULL,
		@NotificationPeriod		VARCHAR(8)		=	NULL,
		@LocalAuthority			VARCHAR(50)		=	NULL,
		@Service				VARCHAR(5000)	=	NULL,
		@GroupBy				VARCHAR(50)		=	NULL,
		@Region					VARCHAR(50)		=	NULL
	)
AS
	SET NOCOUNT ON

	-- Debugging
	-- EXEC master..xp_logevent 60000, @Region
	
	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(16) = NULL
			DECLARE @NotificationDateFrom		DATE = NULL
			DECLARE @NotificationYearTypeTo		VARCHAR(16) = NULL
			DECLARE @NotificationDateTo			DATE = NULL
			DECLARE @NotificationMonth			VARCHAR(8) = NULL
			DECLARE @NotificationYear			VARCHAR(4) = NULL
			declare @NotificationPeriodMonth	varchar(2) = null
			Declare @NotificationPeriodYear		VARCHAR(4) = null

			IF (@NotificationYearFrom IS NOT NULL AND @NotificationMonthFrom IS NOT NULL AND @NotificationYearTo IS NOT NULL AND @NotificationMonthTo IS NOT NULL 
				and @NotificationPeriod IS null)
			BEGIN
				SET @NotificationYearTypeFrom	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
				SET @NotificationDateFrom		= CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
				SET @NotificationYearTypeTo		= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
				SET @NotificationDateTo			= CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
				SET @NotificationDateTo			= EOMONTH(@NotificationDateTo)
			END
			ELSE IF (@NotificationPeriod IS NOT NULL)
			BEGIN
				IF (@GroupBy = 'MONTH')
				Begin
					set @NotificationPeriodMonth = right(@NotificationPeriod,2)
					set @NotificationPeriodYear = left(@notificationPeriod,4)
					 set @NotificationDateFrom = CONVERT(DATE, @NotificationPeriodMonth + '/01/' + @NotificationPeriodYear)
					 set @NotificationDateTo =  EOMONTH(@NotificationDateFrom)
				End
					--SET @NotificationMonth = @NotificationPeriodMonth
				ELSE IF (@GroupBy = 'YEAR')
					Begin
						set @NotificationPeriodYear = @NotificationPeriod
						set @NotificationDateFrom = CONVERT(DATE,'01'  + '/01/' + @NotificationPeriodYear)
						set @NotificationDateTo =   CONVERT(DATE, '12' + '/31/' + @NotificationPeriodYear)  
					End
				ELSE 
					RAISERROR ('The @GroupBy argument passed is invalid', 16, 1) WITH NOWAIT
			END
			ELSE 
				RAISERROR ('Either the @NotificationYear/Month/From/To arguments or the @NotificationPeriod argument passed are invalid', 16, 1) WITH NOWAIT

			DECLARE @ReusableNotification ReusableNotificationType

			INSERT INTO @ReusableNotification
				SELECT n.*
				FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n  -- This filters the records by regional PHEC permissions!
				WHERE ((@NotificationDateFrom IS NULL AND @NotificationDateTo IS NULL) OR (n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo))
					AND (@NotificationMonth IS NULL OR FORMAT(n.NotificationDate, 'MMM yyyy') = @NotificationMonth)
					AND (@NotificationYear IS NULL OR FORMAT(n.NotificationDate, 'yyyy') = @NotificationYear)
					AND (((@Service IS NULL OR @Region IS NULL) OR @Service <> 'All') OR n.TreatmentPhec = @Region)
					AND (((@LocalAuthority IS NULL OR @Region IS NULL) OR @LocalAuthority <> 'All') OR n.ResidencePhec = @Region)
					AND ((@Service IS NULL OR @Service = 'All') OR 
						n.[Service] in (select value from STRING_SPLIT(@Service, ',')) or
					--n.[Service] = @Service or 
								(@Service = 'Blank' and [Service] is null and n.ResidencePhec = @region and n.TreatmentPhec is null))
					AND ((@LocalAuthority IS NULL OR @LocalAuthority = 'All') OR n.LocalAuthority = @LocalAuthority)


			SELECT
				-- Primary key
				--n.NotificationId                                       AS 'ID',

				-- Demographics
				n.EtsId                                                AS 'ETS ID',
				n.LtbrId                                               AS 'LTBR ID',
				dbo.ufnFormatDateConsistently(n.NotificationDate)      AS 'Notification date',
				n.CaseManager                                          AS 'Case manager',
				n.Consultant                                           AS 'Consultant',
				n.Hospital                                             AS 'Hospital',
				n.[Service]                                            AS 'Service',
				n.NhsNumber                                            AS 'NHS Number',
				n.Forename                                             AS 'Forename',
				n.Surname                                              AS 'Surname',
				dbo.ufnFormatDateConsistently(n.DateOfBirth)           AS 'Date of birth',
				n.Age                                                  AS 'Age',
				n.Sex                                                  AS 'Sex',
				n.Ukborn                                               AS 'UK born',
				n.EthnicGroup                                          AS 'Ethnic group',
				n.BirthCountry                                         AS 'Birth country',
				n.UkEntryYear                                          AS 'UK entry year',
				n.Postcode                                             AS 'Postcode',
				n.NoFixedAbode                                         AS 'No fixed abode',

				-- Geographies
				n.LocalAuthority                                       AS 'Local Authority',
				n.LocalAuthorityCode                                   AS 'Local Authority Code',
				n.ResidencePhec                                        AS 'Residence PHEC',
				n.TreatmentPhec                                        AS 'Treatment PHEC'

			FROM @ReusableNotification n
			ORDER BY n.NotificationDate DESC

			-- Write data to audit log
			EXEC dbo.uspAddToAudit 'Notification Summary', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationSummaryResidence]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Notification Summary" notification aggregate counts for the residence
         portion of the report's entry web page.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspNotificationSummaryResidence]
	(
			@NotificationYearFrom			INTEGER			=	-3,
			@NotificationMonthFrom			INTEGER			=	1,
			@NotificationYearTo				INTEGER			=	0,
			@NotificationMonthTo			INTEGER			=	1,
			@Region							VARCHAR(50)		=	NULL,
			@GroupBy						VARCHAR(50)		=	'MONTH'

	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		-- START DEBUGGING
		--DECLARE @NotificationYearFrom INTEGER, @NotificationMonthFrom INTEGER, @NotificationYearTo INTEGER, @NotificationMonthTo INTEGER, @Region VARCHAR(50), @GroupBy VARCHAR(50)
		--SET @Region	= 'London'
		--SET @GroupBy = 'YEAR'
		--SET @NotificationYearFrom =	-3
		--SET @NotificationMonthFrom	= 1
		--SET @NotificationYearTo	= 0
		--SET @NotificationMonthTo = 1
		-- END DEBUGGING

		DECLARE @NotificationYearTypeFrom	VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
        DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)

        DECLARE @NotificationYearTypeTo		VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
        DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
		SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)
	
		IF (@GroupBy = 'MONTH')
			SELECT 
				FORMAT(n.NotificationDate, 'yyyy-MM')		AS 'Notification period sortable',
				FORMAT(n.NotificationDate, 'MMM yyyy')		AS 'Notification period',
				n.LocalAuthority							AS 'Local Authority',
				COUNT(n.notificationId)						AS 'Notification count'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
			WHERE 
					n.ResidencePhec = @Region
				AND n.NotificationDate BETWEEN @NotificationDateFrom and @NotificationDateTo
			GROUP BY 
				FORMAT(n.NotificationDate, 'yyyy-MM'),
				FORMAT(n.NotificationDate, 'MMM yyyy'),
				n.LocalAuthority
			ORDER BY 
				FORMAT(n.NotificationDate, 'yyyy-MM'),
				n.LocalAuthority
		ELSE IF (@GroupBy = 'YEAR')
			SELECT 
				FORMAT(n.NotificationDate, 'yyyy')			AS 'Notification period sortable',
				FORMAT(n.NotificationDate, 'yyyy')			AS 'Notification period',
				n.LocalAuthority							AS 'Local Authority',
				COUNT(n.notificationId)						AS 'Notification count'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
			WHERE 
					n.ResidencePhec = @Region
				AND n.NotificationDate BETWEEN @NotificationDateFrom and @NotificationDateTo
			GROUP BY 
				FORMAT(n.NotificationDate, 'yyyy'), 
				n.LocalAuthority
			ORDER BY 
				FORMAT(n.NotificationDate, 'yyyy'), 
				n.LocalAuthority
		ELSE 
			RAISERROR ('The @GroupBy argument passed is invalid', 16, 1) WITH NOWAIT
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationSummaryResidenceGeography]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This is a legacy proc that used to serve the "Notification Summary" Power BI report.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspNotificationSummaryResidenceGeography] AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500);
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT;

		IF (@LoginGroups != '###')
		BEGIN
			SELECT DISTINCT
				-- Primary key:
				n.NotificationId AS 'Notification ID',
				-- Notification record:
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, CAST(n.EtsId AS VARCHAR(200))) AS 'ETS id', -- WORKAROUND: Varchar for Power BI "See Records" functionality
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.LtbrId) AS 'ID Original',
				n.NotificationDate AS 'Notification date',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.CaseManager) AS 'Case manager',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Consultant) AS 'Consultant',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Forename) AS 'Forename',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Surname) AS 'Surname',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.NhsNumber) AS 'NHS Number',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Sex) AS 'Sex',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, CAST(n.Age AS VARCHAR(200))) AS 'Age', -- WORKAROUND: Varchar for Power BI "See Records" functionality
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, CONVERT(VARCHAR, n.DateOfBirth, 106)) AS 'Date of birth',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Postcode) AS 'Postcode',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.NoFixedAbode) AS 'No fixed abode',
				-- Geographies:
				ISNULL(n.Hospital, 'Unknown') AS 'Hospital',
				ISNULL(n.LocalAuthority, 'Unknown') AS 'Local authority',
				ISNULL(n.ResidencePhec, 'Unknown') AS 'PHEC',
				-- Custom date formats:
				FORMAT(n.NotificationDate, 'yyyy') AS 'Notification Year',
				FORMAT(n.NotificationDate, 'yyyy/MM') AS 'Notification Month',
				CONCAT(FORMAT(n.NotificationDate, 'yyyy/'), REPLICATE('0', 2 - LEN(DATEPART(week, n.NotificationDate))), DATEPART(week, n.NotificationDate)) AS 'Notification Week',
				FORMAT(n.NotificationDate, 'yyyy/MM/dd') AS 'Notification Day'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.Phec p ON p.PhecName = n.ResidencePhec
				INNER JOIN dbo.PhecAdGroup pa ON pa.PhecId = p.PhecId
				INNER JOIN dbo.AdGroup ag ON ag.AdGroupId = pa.AdGroupId
		END
	END TRY
	BEGIN CATCH
		--EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationSummaryTreatment]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Notification Summary" notification aggregate counts for the treatment
         portion of the report's entry web page.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspNotificationSummaryTreatment]
	(
			@NotificationYearFrom			INTEGER			=	-3,
			@NotificationMonthFrom			INTEGER			=	1,
			@NotificationYearTo				INTEGER			=	0,
			@NotificationMonthTo			INTEGER			=	1,
			@Region							VARCHAR(50)		=	NULL,
			@GroupBy						VARCHAR(50)		=	'MONTH',
			@Service						Varchar(5000)	=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		-- START DEBUGGING
		-- DECLARE @NotificationYearFrom INTEGER, @NotificationMonthFrom INTEGER, @NotificationYearTo INTEGER, @NotificationMonthTo INTEGER, @Region VARCHAR(50), @GroupBy VARCHAR(50)
		-- SET @Region	= 'London'
		-- SET @GroupBy = 'MONTH'
		-- SET @NotificationYearFrom =	-3
		-- SET @NotificationMonthFrom	= 1
		-- SET @NotificationYearTo	= 0
		-- SET @NotificationMonthTo = 1
		-- END DEBUGGING

		DECLARE @NotificationYearTypeFrom	VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
        DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)

        DECLARE @NotificationYearTypeTo		VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
        DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
		SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)
					SET @Service = case when len(@Service) - len(replace(@Service, ',', '')) +1 = 
					(select count(*) from TB_Service where PhecName = @Region) then 'All' else @Service end
	
		If (@Service <> 'All')
		Begin
			IF (@GroupBy = 'MONTH')
				SELECT 
					FORMAT(n.NotificationDate, 'yyyy-MM')		AS 'Notification period sortable',
					FORMAT(n.NotificationDate, 'MMM yyyy')		AS 'Notification period',
					n.Service									AS 'TB Service',
					COUNT(n.NotificationId)						AS 'Notification count'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
				inner join TB_Service s on s.TB_Service_Name = n.Service
				WHERE 
						n.TreatmentPhec = @Region
					AND n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					and Serviceid in (select value from STRING_SPLIT(@Service, ','))
					AND (@Region IS NULL OR n.TreatmentPhec = @Region)
				GROUP BY 
					FORMAT(n.NotificationDate, 'yyyy-MM'),
					FORMAT(n.NotificationDate, 'MMM yyyy'),
					n.Service
				ORDER BY 
					FORMAT(n.NotificationDate, 'yyyy-MM'),
					n.Service
			ELSE IF (@GroupBy = 'YEAR')
				SELECT 
					FORMAT(n.NotificationDate, 'yyyy')			AS 'Notification period sortable',
					FORMAT(n.NotificationDate, 'yyyy')			AS 'Notification period',
					n.Service									AS 'TB Service',
					COUNT(n.NotificationId)						AS 'Notification count'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
				inner join TB_Service s on s.TB_Service_Name = n.Service
				WHERE 
						n.TreatmentPhec = @Region
					AND n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					and Serviceid in (select value from STRING_SPLIT(@Service, ','))
					AND (@Region IS NULL OR n.TreatmentPhec = @Region)
				GROUP BY 
					FORMAT(n.NotificationDate, 'yyyy'), 
					n.Service
				ORDER BY 
					FORMAT(n.NotificationDate, 'yyyy'), 
					n.Service
			ELSE 
				RAISERROR ('The @GroupBy argument passed is invalid', 16, 1) WITH NOWAIT
			END

		If (@Service = 'All')
		Begin
						IF (@GroupBy = 'MONTH')
				SELECT 
					FORMAT(n.NotificationDate, 'yyyy-MM')		AS 'Notification period sortable',
					FORMAT(n.NotificationDate, 'MMM yyyy')		AS 'Notification period',
					n.Service									AS 'TB Service',
					COUNT(n.NotificationId)						AS 'Notification count'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
				WHERE 
					--	n.TreatmentPhec = @Region
					n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (n.TreatmentPhec = @Region )
				GROUP BY 
					FORMAT(n.NotificationDate, 'yyyy-MM'),
					FORMAT(n.NotificationDate, 'MMM yyyy'),
					n.Service
				ORDER BY 
					FORMAT(n.NotificationDate, 'yyyy-MM'),
					n.Service
			ELSE IF (@GroupBy = 'YEAR')
				SELECT 
					FORMAT(n.NotificationDate, 'yyyy')			AS 'Notification period sortable',
					FORMAT(n.NotificationDate, 'yyyy')			AS 'Notification period',
					n.Service									AS 'TB Service',
					COUNT(n.NotificationId)						AS 'Notification count'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
				WHERE 
					--	n.TreatmentPhec = @Region
					n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (n.TreatmentPhec = @Region )
				GROUP BY 
					FORMAT(n.NotificationDate, 'yyyy'), 
					n.Service
				ORDER BY 
					FORMAT(n.NotificationDate, 'yyyy'), 
					n.Service
			ELSE 
				RAISERROR ('The @GroupBy argument passed is invalid', 16, 1) WITH NOWAIT
		END

	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNotificationSummaryTreatmentGeography]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This is a legacy proc that used to serve the "Notification Summary" Power BI report.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspNotificationSummaryTreatmentGeography] AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500);
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT;

		IF (@LoginGroups != '###')
		BEGIN
			SELECT DISTINCT
				-- Primary key:
				n.NotificationId AS 'Notification ID',
				-- Notification record:
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, CAST(n.EtsId AS VARCHAR(200))) AS 'ETS id', -- WORKAROUND: Varchar for Power BI "See Records" functionality
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.LtbrId) AS 'ID Original',
				n.NotificationDate AS 'Notification date',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.CaseManager) AS 'Case manager',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Consultant) AS 'Consultant',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Forename) AS 'Forename',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Surname) AS 'Surname',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.NhsNumber) AS 'NHS Number',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Sex) AS 'Sex',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, CAST(n.Age AS VARCHAR(200))) AS 'Age', -- WORKAROUND: Varchar for Power BI "See Records" functionality
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, CONVERT(VARCHAR, n.DateOfBirth, 106)) AS 'Date of birth',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.Postcode) AS 'Postcode',
				dbo.ufnMaskField(ag.AdGroupName, @LoginGroups, n.NoFixedAbode) AS 'No fixed abode',
				-- Geographies:
				ISNULL(n.Hospital, 'Unknown') AS 'Hospital',
				ISNULL(n.[Service], 'Unknown') AS 'Service',
				ISNULL(n.TreatmentPhec, 'Unknown') AS 'PHEC',
				-- Custom date formats:
				FORMAT(n.NotificationDate, 'yyyy') AS 'Notification Year',
				FORMAT(n.NotificationDate, 'yyyy/MM') AS 'Notification Month',
				CONCAT(FORMAT(n.NotificationDate, 'yyyy/'), REPLICATE('0', 2 - LEN(DATEPART(week, n.NotificationDate))), DATEPART(week, n.NotificationDate)) AS 'Notification Week',
				FORMAT(n.NotificationDate, 'yyyy/MM/dd') AS 'Notification Day'
			FROM dbo.ReusableNotification n WITH (NOLOCK)
				INNER JOIN dbo.Phec p ON p.PhecName = n.TreatmentPhec
				INNER JOIN dbo.PhecAdGroup pa ON pa.PhecId = p.PhecId
				INNER JOIN dbo.AdGroup ag ON ag.AdGroupId = pa.AdGroupId
		END
	END TRY
	BEGIN CATCH
		--EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspNTSReportLabMappings]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***************************************************************************************************
Desc:    This report shows all the mappings used when importing records to the Labbase2 database.

Author:  PHE
         Adil Mirza    <adil.mirza@phe.gov.uk>
**************************************************************************************************/

Create PROCEDURE [dbo].[uspNTSReportLabMappings]
		(
			@FieldName			VARCHAR(50)			=	NULL,
			@LabName			VARCHAR(50)			=	NULL
		)
AS
	SET NOCOUNT ON

	-- Debugging
	-- EXEC master..xp_logevent 60000, @ResidenceTreatment

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroups @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN


			select [FieldName]
      ,[ETSDisplayCode]
      ,[LabDisplayCode]
      ,[LabName]
      ,dbo.ufnFormatDateConsistently([auditcreate]) as [auditcreate]
      ,[Description] 
			from LabMappings m where 
			m.FieldName = @FieldName and m.LabName = @LabName
			order by FieldName, LabName, ETSDisplayCode
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspOutcomeSummaryLineList]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***************************************************************************************************
Desc:    This serves the "Outcome Summary Line List", which returns every/most notification data point
         in detail, based on the user's permission & filtering preference. Every notification record
		 returned gets audited, whch means a log entry gets added for each user that views a notification.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspOutcomeSummaryLineList]
	(
		@NotificationYearFrom			INTEGER			=	-3,
		@NotificationMonthFrom			INTEGER			=	1,
		@NotificationYearTo				INTEGER			=	0,
		@NotificationMonthTo			INTEGER			=	1,
		@Region							VARCHAR(50)		=	NULL,
		@DrugResistanceProfile			VARCHAR(50)		=	NULL,
		@LocalAuthority					VARCHAR(50)		=	NULL,
		@ServiceName					VARCHAR(5000)	=	NULL,
		@Bucket							VARCHAR(50)		=	NULL,
		@TreatmentOutcomeTimePeriodId	VARCHAR(50)		=	NULL
	)
AS
	SET NOCOUNT ON

	-- Debugging
	-- EXEC master..xp_logevent 60000, @ResidenceTreatment
	-- EXEC master..xp_logevent 60000, @Region

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			/*
				-- Debugging
				DECLARE @NotificationYearFrom INTEGER, @NotificationMonthFrom INTEGER, @NotificationYearTo INTEGER, @NotificationMonthTo INTEGER, @Region VARCHAR(50), @DrugResistanceProfile VARCHAR(50), @LocalAuthority VARCHAR(50), @ServiceName VARCHAR(150), @Bucket VARCHAR(50), @LoginGroups VARCHAR(500)
				SET @LoginGroups = '###Global.NIS.NTBS.NTS###'
				SET @NotificationYearFrom =	-3
				SET @NotificationMonthFrom	= 1
				SET @NotificationYearTo	= 0
				SET @NotificationMonthTo = 12
				SET @Region	= 'London'
				SET @DrugResistanceProfile = 'All'
				SET @LocalAuthority	=	NULL
				SET @ServiceName =	'All'
				SET @Bucket	= 'Table Total'
				declare @TreatmentOutcomeTimePeriodId nvarchar(1) = '1' 
			*/

			DECLARE @NotificationYearTypeFrom	VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(16) = YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			DATE        = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			IF(@DrugResistanceProfile = 'All')
				SET @DrugResistanceProfile = NULL

			--Buckets
			DECLARE @TreatmentLast TINYINT = NULL
			DECLARE @Treatment12 TINYINT = NULL
			DECLARE @Treatment24 TINYINT = NULL
			DECLARE @Treatment36 TINYINT = NULL
			DECLARE @DiedLast TINYINT = NULL
			DECLARE @Died12 TINYINT = NULL
			DECLARE @Died24 TINYINT = NULL
			DECLARE @Died36 TINYINT = NULL
			DECLARE @LostToFollowUpLast TINYINT = NULL
			DECLARE @LostToFollowUp12 TINYINT = NULL
			DECLARE @LostToFollowUp24 TINYINT = NULL
			DECLARE @LostToFollowUp36 TINYINT = NULL
			DECLARE @StillOnTreatmentLast TINYINT = NULL
			DECLARE @StillOnTreatment12 TINYINT = NULL
			DECLARE @StillOnTreatment24 TINYINT = NULL
			DECLARE @StillOnTreatment36 TINYINT = NULL
			DECLARE @TreatmentStoppedLast TINYINT = NULL
			DECLARE @TreatmentStopped12 TINYINT = NULL
			DECLARE @TreatmentStopped24 TINYINT = NULL
			DECLARE @TreatmentStopped36 TINYINT = NULL
			DECLARE @NotEvaluatedLast TINYINT = NULL
			DECLARE @NotEvaluated12 TINYINT = NULL
			DECLARE @NotEvaluated24 TINYINT = NULL
			DECLARE @NotEvaluated36 TINYINT = NULL
			DECLARE @UnknownLast TINYINT = NULL
			DECLARE @Unknown12 TINYINT = NULL
			DECLARE @Unknown24 TINYINT = NULL
			DECLARE @Unknown36 TINYINT = NULL
			DECLARE @TableTotalLast TINYINT = NULL
			DECLARE @TableTotal12 TINYINT = NULL
			DECLARE @TableTotal24 TINYINT = NULL
			DECLARE @TableTotal36 TINYINT = NULL


			IF (@Bucket = 'Treatment completed'  and @TreatmentOutcomeTimePeriodId = '1')
				SET @TreatmentLast = 1
			ELSE IF (@Bucket = 'Treatment completed'  and @TreatmentOutcomeTimePeriodId = '2')
				SET @Treatment12 = 1
			ELSE IF (@Bucket = 'Treatment completed' and @TreatmentOutcomeTimePeriodId = '3')
				SET @Treatment24 = 1
			ELSE IF (@Bucket = 'Treatment completed' and @TreatmentOutcomeTimePeriodId = '4')
				SET @Treatment36 = 1
			ELSE IF (@Bucket = 'Died' and @TreatmentOutcomeTimePeriodId = '1')
				SET @DiedLast = 1
			ELSE IF (@Bucket = 'Died' and @TreatmentOutcomeTimePeriodId = '2')
				SET @Died12 = 1
			ELSE IF (@Bucket = 'Died' and @TreatmentOutcomeTimePeriodId = '3')
				SET @Died24 = 1
			ELSE IF (@Bucket = 'Died' and @TreatmentOutcomeTimePeriodId = '4')
				SET @Died36 = 1
			ELSE IF (@Bucket = 'Lost to follow up' and @TreatmentOutcomeTimePeriodId = '1')
				SET @LostToFollowUpLast = 1
			ELSE IF (@Bucket = 'Lost to follow up' and @TreatmentOutcomeTimePeriodId = '2')
				SET @LostToFollowUp12 = 1
			ELSE IF (@Bucket = 'Lost to follow up' and @TreatmentOutcomeTimePeriodId = '3')
				SET @LostToFollowUp24 = 1
			ELSE IF (@Bucket = 'Lost to follow up' and @TreatmentOutcomeTimePeriodId = '4')
				SET @LostToFollowUp36 = 1
			ELSE IF (@Bucket = 'Still on treatment' and @TreatmentOutcomeTimePeriodId = '1')
				SET @StillOnTreatmentLast = 1
			ELSE IF (@Bucket = 'Still on treatment' and @TreatmentOutcomeTimePeriodId = '2')
				SET @StillOnTreatment12 = 1
			ELSE IF (@Bucket = 'Still on treatment' and @TreatmentOutcomeTimePeriodId = '3')
				SET @StillOnTreatment24 = 1
			ELSE IF (@Bucket = 'Still on treatment' and @TreatmentOutcomeTimePeriodId = '4')
				SET @StillOnTreatment36 = 1
			ELSE IF (@Bucket = 'Treatment stopped' and @TreatmentOutcomeTimePeriodId = '1')
				SET @TreatmentStoppedLast = 1
			ELSE IF (@Bucket = 'Treatment stopped' and @TreatmentOutcomeTimePeriodId = '2')
				SET @TreatmentStopped12 = 1
			ELSE IF (@Bucket = 'Treatment stopped' and @TreatmentOutcomeTimePeriodId = '3')
				SET @TreatmentStopped24 = 1
			ELSE IF (@Bucket = 'Treatment stopped' and @TreatmentOutcomeTimePeriodId = '4')
				SET @TreatmentStopped36 = 1
			ELSE IF (@Bucket = 'Not evaluated' and @TreatmentOutcomeTimePeriodId = '1')
				SET @NotEvaluatedLast = 1
			ELSE IF (@Bucket = 'Not evaluated' and @TreatmentOutcomeTimePeriodId = '2')
				SET @NotEvaluated12 = 1
			ELSE IF (@Bucket = 'Not evaluated' and @TreatmentOutcomeTimePeriodId = '3')
				SET @NotEvaluated24 = 1
			ELSE IF (@Bucket = 'Not evaluated' and @TreatmentOutcomeTimePeriodId = '4')
				SET @NotEvaluated36 = 1
			ELSE IF (@Bucket = 'Unknown' and @TreatmentOutcomeTimePeriodId = '1')
				SET @UnknownLast = 1
			ELSE IF (@Bucket = 'Unknown' and @TreatmentOutcomeTimePeriodId = '2')
				SET @Unknown12 = 1
			ELSE IF (@Bucket = 'Unknown' and @TreatmentOutcomeTimePeriodId = '3')
				SET @Unknown24 = 1
			ELSE IF (@Bucket = 'Unknown' and @TreatmentOutcomeTimePeriodId = '4')
				SET @Unknown36 = 1
			ELSE IF (@Bucket = 'Table total' and @TreatmentOutcomeTimePeriodId = '1')
				SET @TableTotalLast = 1
			ELSE IF (@Bucket = 'Table total' and @TreatmentOutcomeTimePeriodId = '2')
				SET @TableTotal12 = 1
			ELSE IF (@Bucket = 'Table total' and @TreatmentOutcomeTimePeriodId = '3')
				SET @TableTotal24 = 1
			ELSE IF (@Bucket = 'Table total' and @TreatmentOutcomeTimePeriodId = '4')
				SET @TableTotal36 = 1

			DECLARE @ReusableNotification ReusableNotificationType

			INSERT INTO @ReusableNotification 
			SELECT n.*
			FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n  -- This filters the records by regional PHEC permissions!
				INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
				INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId			
			WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
				AND (((@ServiceName IS NULL OR @Region IS NULL) OR @ServiceName <> 'All') OR n.TreatmentPhec = @Region)
				AND (((@LocalAuthority IS NULL OR @Region IS NULL) OR @LocalAuthority <> 'All') OR n.ResidencePhec = @Region)
				AND ((@ServiceName IS NULL OR @ServiceName = 'All') OR 
					n.[Service] in (select value from STRING_SPLIT(@ServiceName, ',')) or
				--n.[Service] = @ServiceName or 
							(@serviceName = 'Blank' and service is null and n.ResidencePhec = @region and n.TreatmentPhec is null))
				AND ((@LocalAuthority IS NULL OR @LocalAuthority = 'All') OR n.LocalAuthority = @LocalAuthority)
				AND (@DrugResistanceProfile IS NULL OR n.DrugResistanceProfile = @DrugResistanceProfile)	
				AND (@TreatmentLast IS NULL OR o.TreatmentCompletedLastOutcome = @TreatmentLast)
				AND (@Treatment12 IS NULL OR o.TreatmentCompleted12Month = @Treatment12)
				AND (@Treatment24 IS NULL OR o.TreatmentCompleted24Month = @Treatment24)
				AND (@Treatment36 IS NULL OR o.TreatmentCompleted36Month = @Treatment36)
				AND (@DiedLast IS NULL OR o.DiedLastOutcome  = @DiedLast)
				AND (@Died12 IS NULL OR o.Died12Month  = @Died12)
				AND (@Died24 IS NULL OR o.Died24Month  = @Died24)
				AND (@Died36 IS NULL OR o.Died36Month  = @Died36)
				AND (@LostToFollowUpLast IS NULL OR o.LostToFollowUpLastOutcome  = @LostToFollowUpLast)
				AND (@LostToFollowUp12 IS NULL OR o.LostToFollowUp12Month  = @LostToFollowUp12)
				AND (@LostToFollowUp24 IS NULL OR o.LostToFollowUp24Month  = @LostToFollowUp24)
				AND (@LostToFollowUp36 IS NULL OR o.LostToFollowUp36Month  = @LostToFollowUp36)
				AND (@StillOnTreatmentLast IS NULL OR o.StillOnTreatmentLastOutcome  = @StillOnTreatmentLast)
				AND (@StillOnTreatment12 IS NULL OR o.StillOnTreatment12Month  = @StillOnTreatment12)
				AND (@StillOnTreatment24 IS NULL OR o.StillOnTreatment24Month  = @StillOnTreatment24)
				AND (@StillOnTreatment36 IS NULL OR o.StillOnTreatment36Month  = @StillOnTreatment36)
				AND (@TreatmentStoppedLast IS NULL OR o.TreatmentStoppedLastOutcome = @TreatmentStoppedLast)
				AND (@TreatmentStopped12 IS NULL OR o.TreatmentStopped12Month = @TreatmentStopped12)
				AND (@TreatmentStopped24 IS NULL OR o.TreatmentStopped24Month = @TreatmentStopped24)
				AND (@TreatmentStopped36 IS NULL OR o.TreatmentStopped36Month = @TreatmentStopped36)
				AND (@NotEvaluatedLast IS NULL OR o.NotEvaluatedLastOutcome  = @NotEvaluatedLast)
				AND (@NotEvaluated12 IS NULL OR o.NotEvaluated12Month  = @NotEvaluated12)
				AND (@NotEvaluated24 IS NULL OR o.NotEvaluated24Month  = @NotEvaluated24)
				AND (@NotEvaluated36 IS NULL OR o.NotEvaluated36Month  = @NotEvaluated36)
				AND (@UnknownLast IS NULL OR o.UnknownLastOutcome  = @UnknownLast)
				AND (@Unknown12 IS NULL OR o.Unknown12Month  = @Unknown12)
				AND (@Unknown24 IS NULL OR o.Unknown24Month  = @Unknown24)
				AND (@Unknown36 IS NULL OR o.Unknown36Month  = @Unknown36)
				AND (@TableTotalLast IS NULL OR (o.TreatmentCompletedLastOutcome  > 0 
											OR o.TreatmentCompleted12Month  > 0 
											OR o.TreatmentCompleted24Month  > 0 
											OR o.TreatmentCompleted36Month  > 0 
											OR o.DiedLastOutcome > 0 
											OR o.Died12Month > 0 
											OR o.Died24Month > 0 
											OR o.Died36Month > 0 
											OR o.LostToFollowUpLastOutcome > 0 
											OR o.LostToFollowUp12Month > 0 
											OR o.LostToFollowUp24Month > 0 
											OR o.LostToFollowUp36Month > 0 
											OR o.StillOnTreatmentLastOutcome > 0 
											OR o.StillOnTreatment12Month > 0 
											OR o.StillOnTreatment24Month > 0 
											OR o.StillOnTreatment36Month > 0 
											OR o.TreatmentStoppedLastOutcome > 0 
											OR o.TreatmentStopped12Month > 0 
											OR o.TreatmentStopped24Month > 0 
											OR o.TreatmentStopped36Month > 0 
											OR o.NotEvaluatedLastOutcome > 0
											OR o.NotEvaluated12Month > 0
											OR o.NotEvaluated24Month > 0
											OR o.NotEvaluated36Month > 0
											OR o.UnknownLastOutcome > 0 
											OR o.Unknown12Month > 0 
											OR o.Unknown24Month > 0 
											OR o.Unknown36Month > 0 ))				
				AND (@TableTotal12 IS NULL OR (o.TreatmentCompleted12Month  > 0 
											OR o.Died12Month > 0 
											OR o.LostToFollowUp12Month > 0 
											OR o.StillOnTreatment12Month > 0 
											OR o.TreatmentStopped12Month > 0 
											OR o.NotEvaluated12Month > 0
											OR o.Unknown12Month > 0))
				AND (@TableTotal24 IS NULL OR (o.TreatmentCompleted24Month  > 0 
											OR o.Died24Month > 0 
											OR o.LostToFollowUp24Month > 0 
											OR o.StillOnTreatment24Month > 0 
											OR o.TreatmentStopped24Month > 0 
											OR o.NotEvaluated24Month > 0
											OR o.Unknown24Month > 0))
				AND (@TableTotal36 IS NULL OR (o.TreatmentCompleted36Month  > 0 
											OR o.Died36Month > 0 
											OR o.LostToFollowUp36Month > 0 
											OR o.StillOnTreatment36Month > 0 
											OR o.TreatmentStopped36Month > 0 
											OR o.NotEvaluated36Month > 0
											OR o.Unknown36Month > 0))
					
			SELECT
				-- Primary key
				n.NotificationId                                       AS 'ID',

				-- Demographics
				n.EtsId                                                AS 'ETS ID',
				n.LtbrId											   AS 'LTBR ID',
				dbo.ufnFormatDateConsistently(n.NotificationDate)      AS 'Notification date',
				n.CaseManager                                          AS 'Case manager',
				n.Consultant                                           AS 'Consultant',
				n.Hospital                                             AS 'Hospital',
				n.[Service]                                            AS 'Service',
				n.NhsNumber                                            AS 'NHS Number',
				n.Forename                                             AS 'Forename',
				n.Surname                                              AS 'Surname',
				dbo.ufnFormatDateConsistently(n.DateOfBirth)           AS 'Date of birth',
				n.Age                                                  AS 'Age',
				n.Sex                                                  AS 'Sex',
				n.UkBorn                                               AS 'UK born',
				n.EthnicGroup                                          AS 'Ethnic group',
				n.BirthCountry                                         AS 'Birth country',
				n.UkEntryYear                                          AS 'UK entry year',
				n.Postcode                                             AS 'Postcode',
				n.NoFixedAbode                                         AS 'No fixed abode',

				-- Geographies
				n.LocalAuthority                                       AS 'Local Authority',
				n.LocalAuthorityCode                                   AS 'Local Authority Code',
				n.ResidencePhec                                        AS 'Residence PHEC',
				n.TreatmentPhec                                        AS 'Treatment PHEC',

				-- Treatment
				n.PostMortemDiagnosis                                  AS 'Post-mortem diagnosis',
				n.DidNotStartTreatment                                 AS 'Did not start treatment',
				n.ShortCourse                                          AS 'Short course',
				n.MdrTreatment                                         AS 'MDR treatment',
				dbo.ufnFormatDateConsistently(n.MdrTreatmentDate)      AS 'MDR treatment date',
				n.TreatmentOutcome12months                             AS 'Treatment outcome 12 months',
				n.TreatmentOutcome24months                             AS 'Treatment outcome 24 months',
				n.TreatmentOutcome36months                             AS 'Treatment outcome 36 months',
				n.LastRecordedTreatmentOutcome                         AS 'Last recorded treatment outcome',
				dbo.ufnFormatDateConsistently(n.DateOfDeath)           AS 'Date of death',
				dbo.ufnFormatDateConsistently(n.TreatmentEndDate)      AS 'Treatment end date',

				-- Culture & Resistance
				n.NoSampleTaken                                        AS 'No sample taken',
				n.CulturePositive                                      AS 'Culture positive',
				n.Species                                              AS 'Species',
				dbo.ufnFormatDateConsistently(n.EarliestSpecimenDate)  AS 'Earliest specimen date',
				n.DrugResistanceProfile                                AS 'Drug resistance profile',
				n.INH                                                  AS 'INH',
				n.RIF                                                  AS 'RIF',
				n.EMB	                                               AS 'EMB',
				n.PZA                                                  AS 'PZA',
				n.MDR                                                  AS 'MDR',
				n.XDR                                                  AS 'XDR',
			
				-- Clinical Details
				dbo.ufnFormatDateConsistently(n.SymptomOnsetDate)      AS 'Symptom onset date',
				dbo.ufnFormatDateConsistently(n.PresentedDate)         AS 'Presented date',
				n.OnsetToPresentationDays                              AS 'Onset to presentation days',
				dbo.ufnFormatDateConsistently(n.DiagnosisDate)         AS 'Diagnosis date',
				n.PresentationToDiagnosisDays                          AS 'Presentation to diagnosis days',
				dbo.ufnFormatDateConsistently(n.StartOfTreatmentDate)  AS 'Start of treatment date',
				n.DiagnosisToTreatmentDays                             AS 'Diagnosis to treatment days',
				n.OnsetToTreatmentDays                                 AS 'Onset to treatment days',
				n.HivTestOffered                                       AS 'HIV test offered',
				n.SiteOfDisease                                        AS 'Site of disease',

				-- Risk Factors
				n.AnySocialRiskFactor                                  AS 'Any social risk factor',
				n.AlcoholMisuse		                                   AS 'Alcohol misuse',
				n.DrugMisuse 							               AS 'Drug misuse',
				n.Homeless								               AS 'Homeless',
				n.Prison								               AS 'Prison'
			FROM @ReusableNotification n
			ORDER BY n.NotificationDate DESC

			/*
				-- Debugging
				SELECT @NotificationDateFrom AS '@NotificationDateFrom',
					@NotificationDateTo AS '@NotificationDateTo',
					@NotificationYearFrom AS '@NotificationYearFrom',
			        @NotificationMonthFrom	AS '@NotificationMonthFrom',
			        @NotificationYearTo	AS '@NotificationYearTo',
			        @NotificationMonthTo AS '@NotificationMonthTo',
			        @Region	AS '@Region',
			        @DrugResistanceProfile AS '@DrugResistanceProfile',
			        @LocalAuthority	AS '@LocalAuthority',
			        @ServiceName AS '@ServiceName',
			        @Bucket	AS '@Bucket'
			*/

			-- Write data to audit log
			EXEC dbo.uspAddToAudit 'Outcome Summary', @LoginGroups, @ReusableNotification
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspOutcomeSummaryResidence]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Outcome Summary" notification aggregate counts for the residence
         portion of the report's entry web page.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspOutcomeSummaryResidence]
	(
		@NotificationYearFrom			INTEGER			=	NULL,
		@NotificationMonthFrom			INTEGER			=	NULL,
		@NotificationYearTo				INTEGER			=	NULL,
		@NotificationMonthTo			INTEGER			=	NULL,
		@Region							VARCHAR(50)		=	NULL,
		@TreatmentOutcomeTimePeriodId	VARCHAR(50)		=	NULL, -- TODO: This should be an INTEGER, but somehow an INTEGER does not get passed through!
		@ResistantId					VARCHAR(50)		=	NULL, -- TODO: This should be an INTEGER, but somehow an INTEGER does not get passed through!
		@DrugResistanceProfile			VARCHAR(50)		=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)

			IF (@TreatmentOutcomeTimePeriodId = '1')
			BEGIN
				/*
				-- This commented-out SQL statement needs to be swapped with the following SQL statement in order to fulfil the user requirement
				-- RP-871 "Clinic/LA missed from table if no data within time period" at 
				-- https://airelogic-nis.atlassian.net/secure/RapidBoard.jspa?rapidView=8&projectKey=RP&modal=detail&selectedIssue=RP-871&quickFilter=27 :
				SELECT *
				FROM dbo.ufnOutcomeSummaryResidence1(@NotificationDateFrom, @NotificationDateTo, @Region, @ResistantId, @DrugResistanceProfile)
				UNION
				SELECT
					la.LocalAuthority						AS 'Local Authority',
					0										AS 'Treatment completed',
					0										AS 'Died',
					0										AS 'Lost to follow-up',
					0										AS 'Still on treatment',
					0										AS 'Treatment stopped',
					0										AS 'Not evaluated',
					0										AS 'Unknown'
				FROM dbo.ufnGetLAsByRegion(@Region) la
					WHERE la.LocalAuthority NOT IN (SELECT [Local Authority] 
													FROM dbo.ufnOutcomeSummaryResidence1(@NotificationDateFrom, @NotificationDateTo, @Region, @ResistantId, @DrugResistanceProfile) AS existingLAs)
				ORDER BY [Local Authority]
				*/
				SELECT
					n.LocalAuthority						AS 'Local Authority',
					SUM(o.TreatmentCompletedLastOutcome)	AS 'Treatment completed',
					SUM(o.DiedLastOutcome)					AS 'Died',
					SUM(o.LostToFollowUpLastOutcome)		AS 'Lost to follow-up',
					SUM(o.StillOnTreatmentLastOutcome)		AS 'Still on treatment',
					SUM(o.TreatmentStoppedLastOutcome)		AS 'Treatment stopped',
					SUM(o.NotEvaluatedLastOutcome)			AS 'Not evaluated',
					SUM(o.UnknownLastOutcome)				AS 'Unknown'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
					INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
					INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
					INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (@Region IS NULL OR n.ResidencePhec = @Region)
					AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
					AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
					AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
				GROUP BY n.LocalAuthority
				ORDER BY n.LocalAuthority
			END

			IF (@TreatmentOutcomeTimePeriodId = '2')
			BEGIN
				SELECT
					n.LocalAuthority					AS 'Local Authority',
					SUM(o.TreatmentCompleted12Month)	AS 'Treatment completed',
					SUM(o.Died12Month)					AS 'Died',
					SUM(o.LostToFollowUp12Month)		AS 'Lost to follow-up',
					SUM(o.StillOnTreatment12Month)		AS 'Still on treatment',
					SUM(o.TreatmentStopped12Month)		AS 'Treatment stopped',
					SUM(o.NotEvaluated12Month)			AS 'Not evaluated',
					SUM(o.Unknown12Month)				AS 'Unknown'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
					INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
					INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
					INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (@Region IS NULL OR n.ResidencePhec = @Region)
					AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
					AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
					AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
				GROUP BY n.LocalAuthority
				ORDER BY n.LocalAuthority
			END

			IF (@TreatmentOutcomeTimePeriodId = '3')
			BEGIN
				SELECT
					n.LocalAuthority					AS 'Local Authority',
					SUM(o.TreatmentCompleted24Month)	AS 'Treatment completed',
					SUM(o.Died24Month)					AS 'Died',
					SUM(o.LostToFollowUp24Month)		AS 'Lost to follow-up',
					SUM(o.StillOnTreatment24Month)		AS 'Still on treatment',
					SUM(o.TreatmentStopped24Month)		AS 'Treatment stopped',
					SUM(o.NotEvaluated24Month)			AS 'Not evaluated',
					SUM(o.Unknown24Month)				AS 'Unknown'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
					INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
					INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
					INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (@Region IS NULL OR n.ResidencePhec = @Region)
					AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
					AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
					AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
				GROUP BY n.LocalAuthority
				ORDER BY n.LocalAuthority
			END

			IF (@TreatmentOutcomeTimePeriodId = '4')
			BEGIN
				SELECT
					n.LocalAuthority					AS 'Local Authority',
					SUM(o.TreatmentCompleted36Month)	AS 'Treatment completed',
					SUM(o.Died36Month)					AS 'Died',
					SUM(o.LostToFollowUp36Month)		AS 'Lost to follow-up',
					SUM(o.StillOnTreatment36Month)		AS 'Still on treatment',
					SUM(o.TreatmentStopped36Month)		AS 'Treatment stopped',
					SUM(o.NotEvaluated36Month)			AS 'Not evaluated',
					SUM(o.Unknown36Month)				AS 'Unknown'
				FROM dbo.ReusableNotification n WITH (NOLOCK)
					INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
					INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
					INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
				WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
					AND (@Region IS NULL OR n.ResidencePhec = @Region)
					AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
					AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
					AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
				GROUP BY n.LocalAuthority
				ORDER BY n.LocalAuthority
			END			
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspOutcomeSummaryTreatment]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This serves the "Outcome Summary" notification aggregate counts for the treatment
         portion of the report's entry web page.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspOutcomeSummaryTreatment]
	(
		@NotificationYearFrom			INTEGER			=	NULL,
		@NotificationMonthFrom			INTEGER			=	NULL,
		@NotificationYearTo				INTEGER			=	NULL,
		@NotificationMonthTo			INTEGER			=	NULL,
		@Region							VARCHAR(50)		=	NULL,
		@TreatmentOutcomeTimePeriodId	VARCHAR(50)		=	NULL, -- TODO: This should be an INTEGER, but somehow an INTEGER does not get passed through!
		@ResistantId					VARCHAR(50)		=	NULL, -- TODO: This should be an INTEGER, but somehow an INTEGER does not get passed through!
		@DrugResistanceProfile			VARCHAR(50)		=	NULL,
		@Service				varchar(5000)	=	NULL
	)
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		IF (@LoginGroups != '###')
		BEGIN
			DECLARE @NotificationYearTypeFrom	VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearFrom, GETDATE()))
            DECLARE @NotificationDateFrom		VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthFrom) + '/01/' + @NotificationYearTypeFrom)
            DECLARE @NotificationYearTypeTo		VARCHAR(4)	= YEAR(DATEADD(YEAR, @NotificationYearTo, GETDATE()))
            DECLARE @NotificationDateTo			VARCHAR(10) = CONVERT(DATE, CONVERT(VARCHAR(2), @NotificationMonthTo) + '/01/' + @NotificationYearTypeTo)
			SET @NotificationDateTo							= EOMONTH(@NotificationDateTo)
			SET @Service = case when len(@Service) - len(replace(@Service, ',', '')) +1 = 
					(select count(*) from TB_Service where PhecName = @Region) then 'All' else @Service end

			If (@Service <> 'All')
			Begin
				IF (@TreatmentOutcomeTimePeriodId = '1')
				BEGIN
					SELECT
						n.[Service]								AS 'TB Service',
						SUM(o.TreatmentCompletedLastOutcome)	AS 'Treatment completed',
						SUM(o.DiedLastOutcome)					AS 'Died',
						SUM(o.LostToFollowUpLastOutcome)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatmentLastOutcome)		AS 'Still on treatment',
						SUM(o.TreatmentStoppedLastOutcome)		AS 'Treatment stopped',
						SUM(o.NotEvaluatedLastOutcome)			AS 'Not evaluated',
						SUM(o.UnknownLastOutcome)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
						inner join TB_Service s on s.TB_Service_Name = n.Service
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						and Serviceid in (select value from STRING_SPLIT(@Service, ','))
						AND (@Region IS NULL OR n.TreatmentPhec = @Region)
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END

				IF (@TreatmentOutcomeTimePeriodId = '2')
				BEGIN
					SELECT
						n.[Service]							AS 'TB Service',
						SUM(o.TreatmentCompleted12Month)	AS 'Treatment completed',
						SUM(o.Died12Month)					AS 'Died',
						SUM(o.LostToFollowUp12Month)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatment12Month)		AS 'Still on treatment',
						SUM(o.TreatmentStopped12Month)		AS 'Treatment stopped',
						SUM(o.NotEvaluated12Month)			AS 'Not evaluated',
						SUM(o.Unknown12Month)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
						inner join TB_Service s on s.TB_Service_Name = n.Service
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						and Serviceid in (select value from STRING_SPLIT(@Service, ','))
						AND (@Region IS NULL OR n.TreatmentPhec = @Region)
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END

				IF (@TreatmentOutcomeTimePeriodId = '3')
				BEGIN
					SELECT
						n.[Service]							AS 'TB Service',
						SUM(o.TreatmentCompleted24Month)	AS 'Treatment completed',
						SUM(o.Died24Month)					AS 'Died',
						SUM(o.LostToFollowUp24Month)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatment24Month)		AS 'Still on treatment',
						SUM(o.TreatmentStopped24Month)		AS 'Treatment stopped',
						SUM(o.NotEvaluated24Month)			AS 'Not evaluated',
						SUM(o.Unknown24Month)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
						inner join TB_Service s on s.TB_Service_Name = n.Service
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						and Serviceid in (select value from STRING_SPLIT(@Service, ','))
						AND (@Region IS NULL OR n.TreatmentPhec = @Region)
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END

				IF (@TreatmentOutcomeTimePeriodId = '4')
				BEGIN
					SELECT
						n.[Service]							AS 'TB Service',
						SUM(o.TreatmentCompleted36Month)	AS 'Treatment completed',
						SUM(o.Died36Month)					AS 'Died',
						SUM(o.LostToFollowUp36Month)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatment36Month)		AS 'Still on treatment',
						SUM(o.TreatmentStopped36Month)		AS 'Treatment stopped',
						SUM(o.NotEvaluated36Month)			AS 'Not evaluated',
						SUM(o.Unknown36Month)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
						inner join TB_Service s on s.TB_Service_Name = n.Service
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						and Serviceid in (select value from STRING_SPLIT(@Service, ','))
						AND (@Region IS NULL OR n.TreatmentPhec = @Region)
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END
			END
			
			If (@Service = 'All')
			Begin
				IF (@TreatmentOutcomeTimePeriodId = '1')
				BEGIN
					SELECT
						n.[Service]								AS 'TB Service',
						SUM(o.TreatmentCompletedLastOutcome)	AS 'Treatment completed',
						SUM(o.DiedLastOutcome)					AS 'Died',
						SUM(o.LostToFollowUpLastOutcome)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatmentLastOutcome)		AS 'Still on treatment',
						SUM(o.TreatmentStoppedLastOutcome)		AS 'Treatment stopped',
						SUM(o.NotEvaluatedLastOutcome)			AS 'Not evaluated',
						SUM(o.UnknownLastOutcome)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						AND (@Region IS NULL OR n.TreatmentPhec = @Region )
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END

				IF (@TreatmentOutcomeTimePeriodId = '2')
				BEGIN
					SELECT
						n.[Service]							AS 'TB Service',
						SUM(o.TreatmentCompleted12Month)	AS 'Treatment completed',
						SUM(o.Died12Month)					AS 'Died',
						SUM(o.LostToFollowUp12Month)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatment12Month)		AS 'Still on treatment',
						SUM(o.TreatmentStopped12Month)		AS 'Treatment stopped',
						SUM(o.NotEvaluated12Month)			AS 'Not evaluated',
						SUM(o.Unknown12Month)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						AND (@Region IS NULL OR n.TreatmentPhec = @Region )
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END

				IF (@TreatmentOutcomeTimePeriodId = '3')
				BEGIN
					SELECT
						n.[Service]							AS 'TB Service',
						SUM(o.TreatmentCompleted24Month)	AS 'Treatment completed',
						SUM(o.Died24Month)					AS 'Died',
						SUM(o.LostToFollowUp24Month)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatment24Month)		AS 'Still on treatment',
						SUM(o.TreatmentStopped24Month)		AS 'Treatment stopped',
						SUM(o.NotEvaluated24Month)			AS 'Not evaluated',
						SUM(o.Unknown24Month)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						AND (@Region IS NULL OR n.TreatmentPhec = @Region )
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END

				IF (@TreatmentOutcomeTimePeriodId = '4')
				BEGIN
					SELECT
						n.[Service]							AS 'TB Service',
						SUM(o.TreatmentCompleted36Month)	AS 'Treatment completed',
						SUM(o.Died36Month)					AS 'Died',
						SUM(o.LostToFollowUp36Month)		AS 'Lost to follow-up',
						SUM(o.StillOnTreatment36Month)		AS 'Still on treatment',
						SUM(o.TreatmentStopped36Month)		AS 'Treatment stopped',
						SUM(o.NotEvaluated36Month)			AS 'Not evaluated',
						SUM(o.Unknown36Month)				AS 'Unknown'
					FROM dbo.ReusableNotification n WITH (NOLOCK)
						INNER JOIN dbo.OutcomeSummary o ON o.NotificationId = n.NotificationId
						INNER JOIN dbo.DrugResistanceProfile d ON d.DrugResistanceProfile = n.DrugResistanceProfile
						INNER JOIN dbo.Resistant re ON d.ResistantId = re.ResistantId
					WHERE n.NotificationDate BETWEEN @NotificationDateFrom AND @NotificationDateTo
						AND (@Region IS NULL OR n.TreatmentPhec = @Region )
						AND ((@ResistantId IS NULL OR @ResistantId <> 1) OR re.ResistantId IN (2,3))
						AND ((@ResistantId IS NULL OR @ResistantId = 1) OR re.ResistantId = @ResistantId)
						AND	((@DrugResistanceProfile IS NULL OR @DrugResistanceProfile = 'All') OR n.DrugResistanceProfile = @DrugResistanceProfile)
					GROUP BY n.[Service]
					ORDER BY n.[Service]
				END
			END
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspPhec]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns the permission-filtered PHEC regions for each AD group user. It returns the
         records for both the treatment & residence PHEC regions.


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspPhec] (
	@Option VARCHAR(100) -- Legacy: This is unused, but can't just remove, cos reports still pass it through
) AS
	SET NOCOUNT ON
	
	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		DECLARE	@LoginType VARCHAR(1)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT, @LoginType OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @LoginGroups

		IF (@LoginGroups != '###')
		BEGIN
			SELECT PhecCode,
				PhecName,
				SortOrder
			FROM dbo.Phec
			WHERE PhecName != 'Unknown'
				-- Show all regions to national team users
				AND @LoginType = 'N'
			UNION
			SELECT 
				PhecCode, 
				PhecName,
				SortOrder
			FROM dbo.Phec pt
				INNER JOIN dbo.PhecAdGroup pat ON pat.PhecId = pt.PhecId
				INNER JOIN dbo.AdGroup agt ON agt.AdGroupId = pat.AdGroupId
			WHERE PhecName != 'Unknown'
				-- Permission restrictions on logged-in treatment region
				AND CHARINDEX('###' + agt.AdGroupName + '###', @LoginGroups) != 0
			UNION
			SELECT
				PhecCode,
				PhecName,
				SortOrder
			FROM dbo.Phec pr
				INNER JOIN dbo.PhecAdGroup par ON par.PhecId = pr.PhecId
				INNER JOIN dbo.AdGroup agr ON agr.AdGroupId = par.AdGroupId
			WHERE PhecName != 'Unknown'
				-- Permission restrictions on logged-in residence region
				AND CHARINDEX('###' + agr.AdGroupName + '###', @LoginGroups) != 0
			UNION
			SELECT distinct 
				PHEC_Code,
				PhecName,
				SortOrder
			FROM dbo.TB_Service s
				INNER JOIN dbo.ServiceAdGroup sad ON sad.ServiceId = s.Serviceid
				INNER JOIN dbo.AdGroup agt ON agt.AdGroupId = sad.AdGroupId
			WHERE PhecName != 'Unknown'
				-- Permission restrictions on logged-in treatment service
				AND CHARINDEX('###' + agt.AdGroupName + '###', @LoginGroups) != 0
			ORDER BY SortOrder
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspPopulateCalendarTable]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
This proc is intended to be run manually as a one-off job to populate a Calendar table for use in date processing
*/

CREATE PROCEDURE [dbo].[uspPopulateCalendarTable]
AS
    --first delete the existing table if it exists
    IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.tables WHERE table_name = 'Calendar')
			BEGIN
				TRUNCATE TABLE [dbo].Calendar
			END

    --start Calendar from 2000 in case we need to use it for very old data
    DECLARE @StartDate  date = '2000-01-01';
    
    --add 40 years' worth of dates into the table
    DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 40, @StartDate));

    --create sequence of numbers
    WITH seq(n) AS 
    (
      SELECT 0 UNION ALL SELECT n + 1 FROM seq
      WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
    ),
    --then a range of dates
    dateRange(dateField) AS 
    (
        SELECT DATEADD(DAY, n, @StartDate) FROM seq
    ),
    --and finally a formatted set of values for each date in the range
    sourceQuery AS
    (
          SELECT
            DateValue       = CONVERT(date, dateField),
            MonthValue      = DATEPART(MONTH, dateField),
	        PaddedMonthValue = FORMAT(DATEPART(MONTH, dateField), '00'),
	        YearValue         = DATEPART(YEAR, dateField),
	        YearMonthValue = CONCAT(DATEPART(YEAR, dateField), '-', FORMAT(DATEPART(MONTH, dateField), '00')),
            QuarterValue      = DATEPART(Quarter, dateField),
	        TertileValue =	 (CASE WHEN DATEPART(MONTH, dateField) < 5 THEN 1 WHEN DATEPART(MONTH, dateField) < 9 THEN 2 ELSE 3 END),
            FirstOfMonthValue = DATEFROMPARTS(YEAR(dateField), MONTH(dateField), 1),
	        LastOfMonthValue = EOMONTH(dateField),
            LastOfYearValue   = DATEFROMPARTS(YEAR(dateField), 12, 31),
            DayOfYearValue    = DATEPART(DAYOFYEAR, dateField),
	        ISOWeek			= DATEPART(ISO_WEEK,  dateField),
            PaddedISOWeek	= FORMAT(DATEPART(ISO_WEEK,  dateField),'00'),
	        ISOYear			= YEAR(DATEADD(day, 26 - DATEPART(isoww, dateField), dateField)),
	        ISOYearWeek		= CONCAT(YEAR(DATEADD(day, 26 - DATEPART(isoww, dateField), dateField)), '-', FORMAT(DATEPART(ISO_WEEK,  dateField),'00'))
	
          FROM dateRange
)

    --LOAD THIS DATA INTO A TABLE
    INSERT INTO dbo.Calendar SELECT * FROM sourceQuery
    OPTION (MAXRECURSION 0);
    
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspPopulateForestExtract]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPopulateForestExtract]
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.tables WHERE table_name = 'ForestExtract')
			BEGIN
				DELETE FROM [dbo].ForestExtract
			END

		DECLARE @TempDiseaseSites TABLE
		(
		   NotificationId int,
		   description nvarchar(2000)
		);

		INSERT INTO @TempDiseaseSites
		SELECT NotificationId, Description = STRING_AGG(Description, N', ')
			FROM [NTBS_Empty].[dbo].[NotificationSite] notificationSite
			JOIN [NTBS_Empty].[ReferenceData].[Site] sites ON notificationSite.SiteId = sites.SiteId 
			GROUP BY NotificationId

		INSERT INTO ForestExtract (
			-- NotificationId,
			CaseId
			, Casereportdate, Forename, Surname, NHSNumber, DateOfBirth, AddressLine1
			, NoFixedAbode, Postcode, Sex, Hospital, ResidenceLocalAuthority
			--, ResidenceHPU
			, HPAResidenceRegion
			, Occupation, OccupationCategory, EthnicGroup
			, UKBorn, BirthCountry, UKEntryYear
			, SymptomOnset, DatePresented, DateOfDiagnosis, StartOfTreatment
			, DrugUse 
			, DrugUseLast5Years, DrugUseMoreThan5YearsAgo, CurrentDrugUse
			, Homeless 
			, HomelessLast5Years, HomelessMoreThan5YearsAgo, CurrentlyHomeless
			, Prison 
			, PrisonLast5Years, PrisonMoreThan5YearsAgo, CurrentlyInPrisonOrWhenFirstSeen
			, AlcoholUse
			, SmearSample, SmearSampleResult, SpecimenDate, ReferenceLaboratoryNumber
			, ExtractDate
			, Localpatientid, Age
			--, OwnerUserId
			, CaseManager, PatientsConsultant, DiseaseSites
			)
		SELECT
			--reusableNotification.NotificationId,
			CAST(NtbsId AS bigint)																			AS CaseId,
			CONVERT(varchar(10), NotificationDate, 103)														AS CaseReportDate,
			Forename																						AS Forename,
			Surname																							AS Surname,
			reusableNotification.NhsNumber																	AS NhsNumber,
			DateOfBirth																						AS DateOfBirth,
			patient.Address																					AS AddressLine,
			reusableNotification.NoFixedAbode																AS NoFixedAbode,
			reusableNotification.Postcode																	AS Postcode,
			CASE Sex 
				WHEN 'Female' THEN 'F' 
				WHEN 'Male' THEN 'M' 
				WHEN 'Unknown' THEN 'U' 
			END																								AS Sex,
			Hospital																						AS Hospital,
			LocalAuthority																					AS ResidenceLocalAuthority,
			-- rn.PCT as [Hpu],
			phec.Name																						AS Region,
			occupation.[Role]																				AS Occupation,
			occupation.Sector																				AS OccupationCategory,
			EthnicGroup																						AS EthnicGroup,
			reusableNotification.UkBorn																		AS UKBorn,
			BirthCountry																					AS BirthCountry,
			UkEntryYear																						AS UkEntryYear,
			CONVERT(varchar, SymptomOnsetDate, 103)															AS SymptomOnset,
			CONVERT(varchar, PresentedDate, 103)															AS DatePresented,
			CONVERT(varchar, DiagnosisDate, 103)															AS DateOfDiagnosis,
			CONVERT(varchar, StartOfTreatmentDate, 103)														AS StartOfTreatment,
			reusableNotification.DrugMisuse																	AS DrugUse,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(DrugMisuseInLast5Years)					AS DrugMisuseLast5Years,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(DrugMisuseMoreThan5YearsAgo)				AS DrugUseMoreThan5YearsAgo,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(CurrentDrugMisuse)						AS CurrentDrugUse,
			reusableNotification.Homeless																	AS Homeless,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(HomelessInLast5Years)						AS HomelessLast5Years,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(HomelessMoreThan5YearsAgo)				AS HomelessMoreThan5YearsAgo,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(CurrentlyHomeless)						AS CurrentlyHomeless,
			reusableNotification.Prison																		AS Prison,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(InPrisonInLast5Years)						AS InPrisonInLast5Years,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(InPrisonMoreThan5YearsAgo)				AS PrisonMoreThan5YearsAgo,
			dbo.ufnGetFormattedSiteDiseaseDurationStatusForForest(CurrentlyInPrisonOrInPrisonWhenFirstSeen) AS CurrentlyInPrisonOrWhenFirstSeen,
			reusableNotification.AlcoholMisuse																AS AlcoholUse,
			lab.[SpecimenTypeCode]																			AS SmearSample,
			'Positive'																						AS SmearSampleResult,
			lab.SpecimenDate																				AS SpecimenDate,
			lab.ReferenceLaboratoryNumber																	AS ReferenceLaboratoryNumber,
			GETUTCDATE()																					AS ExtractDate,
			patient.LocalPatientId																			AS LocalPatientId,
			Age																								AS Age,
			--hospital.CaseManagerUsername																	AS OwnerUserId,
			CaseManager																						AS CaseManager,
			reusableNotification.Consultant																	AS PatientsConsultant,
			 --ClusterNumber																				AS ClusterNumber,
			diseaseSites.Description																		AS DiseaseSites
		FROM ([dbo].[ReusableNotification] reusableNotification
		INNER JOIN [NTBS_Specimen_Matching].dbo.NotificationSpecimenMatch specimenMatch ON specimenMatch.NotificationID = reusableNotification.NtbsId
		INNER JOIN [dbo].LabSpecimen lab ON lab.ReferenceLaboratoryNumber = specimenMatch.ReferenceLaboratoryNumber)
		LEFT JOIN [NTBS_Empty].[dbo].Patients patient ON patient.NotificationId = reusableNotification.NtbsId
		LEFT JOIN [NTBS_Empty].[dbo].HospitalDetails hospital ON hospital.NotificationId = patient.NotificationId 
		LEFT JOIN [NTBS_Empty].[ReferenceData].Occupation occupation ON occupation.OccupationId = patient.OccupationId
		LEFT JOIN [NTBS_Empty].[ReferenceData].PHEC phec ON phec.Code = TreatmentPhecCode
		LEFT JOIN [NTBS_Empty].[ReferenceData].PostcodeLookup postcode ON postcode.Postcode = REPLACE(reusableNotification.Postcode, ' ', '')
		LEFT JOIN @TempDiseaseSites diseaseSites ON diseaseSites.NotificationId = patient.NotificationId
		WHERE specimenMatch.MatchType = 'Confirmed' 
			AND (TreatmentPhecCode NOT IN ('PHECNI', 'PHECSCOT', 'PHECWAL') OR phec.Code IS NULL) -- Exclude Wales, Scotland and Northern Ireland

		INSERT INTO [dbo].ForestExtract 
		SELECT etsForest.*
		FROM [ETS].dbo.ETSOxfordExtract etsForest
		LEFT JOIN [dbo].[ReusableNotification] reusableNotification ON reusableNotification.EtsId = etsForest.CaseId
		WHERE reusableNotification.NtbsId IS NULL

		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		EXEC dbo.uspHandleException
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[uspPopulateUserLookup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspPopulateUserLookup]
	
AS
	/*
	/*Get all AD Groups*/
	DECLARE @Iteration Integer = 1
	/*Temporary value for testing*/
	DECLARE @MaxVal Integer = 0

	DECLARE @AdGroupName VARCHAR(50) = 'EMPTY'

	DELETE FROM [dbo].UserLookup

	/*Get the highest numbered AD Group to set the number of iterations*/
	SELECT @MaxVal = max(adgroupid) from AdGroup

	WHILE @Iteration <= @MaxVal  
	BEGIN  
		SET @AdGroupName = (SELECT ag.AdGroupName FROM [AdGroup] ag WHERE ag.AdGroupId = @Iteration)

		SELECT @AdGroupName = CONCAT('PHE\', @AdGroupName)
		INSERT INTO [dbo].UserLookup
		( [ACCOUNTNAME], [TYPE],[PRIVILEGE], [MAPPEDLOGINNAME],[PERMISSIONPATH] )
	
		EXEC [$(master)].sys.XP_LOGININFO @AdGroupName, 'members'
		SET @Iteration += 1  
	END;    
	*/

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspProcessMIData]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspProcessMIData]
	
AS

	EXEC [dbo].uspSeedReportLookup

	

	INSERT INTO [dbo].MIReportData

	--fetch new records from the ReportServer database
	SELECT  
		 els.TimeEnd
		,els.UserName
		,Q1.AdGroup
		,c.ISOYearWeek AS WeekNum
		,els.ReportID
		,getUTCDate() AS DateRetrieved 
	FROM [ReportServer].[dbo].[ExecutionLogStorage] els
		INNER JOIN [dbo].[Calendar] c ON c.DateValue = CONVERT(DATE, els.TimeEnd)
	LEFT OUTER JOIN 
		
		(SELECT 
				Username,
				--This selects the final AD group in the list, which means we exclude the 'ADMIN' group, which is not
				--useful for this report
				RIGHT(AdGroups, CHARINDEX(',', REVERSE(AdGroups) + ',') - 1) AS AdGroup
			FROM [dbo].[User]) AS Q1
	ON els.UserName COLLATE DATABASE_DEFAULT = Q1.Username
	WHERE els.TimeEnd > 
	(
	-- the first time this is run, there won't be an existing records in MIReportData, so this CASE
	-- clause allows for an arbitary date to be added which will select all records
		SELECT CASE
			WHEN MAX(md.DateRetrieved) is null THEN '2015-01-01 00:00:00'
			ELSE MAX(md.DateRetrieved)
		END AS 'MaxDate'
		FROM [dbo].MIReportData md)
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspResultMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspResultMapping] AS


	SET NOCOUNT ON

	BEGIN TRY
		DELETE FROM ResultMapping

		INSERT INTO ResultMapping VALUES ('R', 'Resistant', 1)
		INSERT INTO ResultMapping VALUES ('Resistant', 'Resistant', 1)
		INSERT INTO ResultMapping VALUES ('S', 'Sensitive', 2)
		INSERT INTO ResultMapping VALUES ('Sensitive', 'Sensitive', 2)
		--Failed and Unknown are synonymous for our purposes, but are mapped to different ranks
		--in case it is useful for debugging
		INSERT INTO ResultMapping VALUES ('F', 'Unknown', 3)
		INSERT INTO ResultMapping VALUES ('Failed', 'Unknown', 3)
		INSERT INTO ResultMapping VALUES ('U', 'Unknown', 4)
		INSERT INTO ResultMapping VALUES ('Unknown', 'Unknown', 4)
		INSERT INTO ResultMapping VALUES ('Awaiting', 'Awaiting', 5)
		INSERT INTO ResultMapping VALUES ('No Result', 'No result', 6)
		INSERT INTO ResultMapping VALUES ('New', 'New', 7)



	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspReusableNotification]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    Give regional users the ReusableNotification recordset filtered by permissions, i.e. only
		 notifications in their region. This contains the superset of their region's 
		 treatment/residence notification records


         
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspReusableNotification] AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @LoginGroups

		IF (@LoginGroups != '###')
		BEGIN
			SELECT
				-- Primary key
				n.NotificationId                                       AS 'ID',

				-- Demographics
				n.EtsId                                                AS 'ETS ID',
				n.LtbrId                                               AS 'LTBR ID',
				dbo.ufnFormatDateConsistently(n.NotificationDate)      AS 'Notification date',
				n.CaseManager                                          AS 'Case manager',
				n.Consultant                                           AS 'Consultant',
				n.Hospital                                             AS 'Hospital',
				n.[Service]                                            AS 'Service',
				n.NhsNumber                                            AS 'NHS Number',
				n.Forename                                             AS 'Forename',
				n.Surname                                              AS 'Surname',
				dbo.ufnFormatDateConsistently(n.DateOfBirth)           AS 'Date of birth',
				n.Age                                                  AS 'Age',
				n.Sex                                                  AS 'Sex',
				n.UkBorn                                               AS 'UK born',
				n.EthnicGroup                                          AS 'Ethnic group',
				n.BirthCountry                                         AS 'Birth country',
				n.UkEntryYear                                          AS 'UK entry year',
				n.Postcode                                             AS 'Postcode',
				n.NoFixedAbode                                         AS 'No fixed abode',

				-- Geographies
				n.LocalAuthority                                       AS 'Local Authority',
				n.LocalAuthorityCode                                   AS 'Local Authority Code',
				n.ResidencePhec                                        AS 'Residence PHEC',
				n.TreatmentPhec                                        AS 'Treatment PHEC',

				-- Clinical Details
				dbo.ufnFormatDateConsistently(n.SymptomOnsetDate)      AS 'Symptom onset date',
				dbo.ufnFormatDateConsistently(n.PresentedDate)         AS 'Presented date',
				n.OnsetToPresentationDays                              AS 'Onset to presentation days',
				dbo.ufnFormatDateConsistently(n.DiagnosisDate)         AS 'Diagnosis date',
				n.PresentationToDiagnosisDays                          AS 'Presentation to diagnosis days',
				dbo.ufnFormatDateConsistently(n.StartOfTreatmentDate)  AS 'Start of treatment date',
				n.DiagnosisToTreatmentDays                             AS 'Diagnosis to treatment days',
				n.OnsetToTreatmentDays                                 AS 'Onset to treatment days',
				n.HivTestOffered                                       AS 'HIV test offered',
				n.SiteOfDisease                                        AS 'Site of disease',
				n.PreviouslyDiagnosed                                  AS 'Previously diagnosed',
				n.YearsSinceDiagnosis                                  AS 'Years since diagnosis',
				n.PreviouslyTreated                                    AS 'Previously treated',
				n.TreatmentInUk                                        AS 'Treatment in UK',
				n.PreviousId                                           AS 'Previous ID',
				n.BcgVaccinated                                        AS 'BCG vaccinated',

				-- Risk Factors
				n.AnySocialRiskFactor                                  AS 'Any social risk factor',
				n.AlcoholMisuse                                        AS 'Alcohol misuse',
				n.DrugMisuse 							               AS 'Drug misuse',
				n.CurrentDrugMisuse                                    AS 'Current drug misuse',
				n.DrugMisuseInLast5Years                               AS 'Drug misuse in last 5 years',
				n.DrugMisuseMoreThan5YearsAgo                          AS 'Drug misuse more than 5 years ago',
				n.Homeless								               AS 'Homeless',
				n.CurrentlyHomeless                                    AS 'Currently homeless',
				n.HomelessInLast5Years                                 AS 'Homeless in last 5 years',
				n.HomelessMoreThan5YearsAgo                            AS 'Homeless more than 5 years ago',
				n.Prison								               AS 'Prison',
				n.CurrentlyInPrisonOrInPrisonWhenFirstSeen             AS 'Currently in prison or in prison when first seen',
				n.InPrisonInLast5Years                                 AS 'In prison in last 5 years',
				n.InPrisonMoreThan5YearsAgo                            AS 'In prison more than 5 years ago',
				n.TravelledOutsideUk                                   AS 'Travelled outside UK',
				n.ToHowManyCountries                                   AS 'To how many countries',
				n.TravelCountry1                                       AS 'Travel country 1',
				n.MonthsTravelled1                                     AS 'Months travelled 1',
				n.TravelCountry2                                       AS 'Travel country 2',
				n.MonthsTravelled2                                     AS 'Months travelled 2',
				n.TravelCountry3                                       AS 'Travel country 3',
				n.MonthsTravelled3                                     AS 'Months travelled 3',
				n.ReceivedVisitors                                     AS 'Received visitors',
				n.FromHowManyCountries                                 AS 'From how many countries',
				n.VisitorCountry1                                      AS 'Visitor country 1',
				n.DaysVisitorsStayed1                                  AS 'Days visitors stayed 1',
				n.VisitorCountry2                                      AS 'Visitor country 2',
				n.DaysVisitorsStayed2                                  AS 'Days visitors stayed 2',
				n.VisitorCountry3                                      AS 'Visitor country 3',
				n.DaysVisitorsStayed3                                  AS 'Days visitors stayed 3',
				n.Diabetes                                             AS 'Diabetes',
				n.HepatitisB                                           AS 'Hepatitis B',
				n.HepatitisC                                           AS 'Hepatitis C',
				n.ChronicLiverDisease                                  AS 'Chronic liver disease',
				n.ChronicRenalDisease                                  AS 'Chronic renal disease',
				n.ImmunoSuppression                                    AS 'Immunosuppression',
				n.BiologicalTherapy                                    AS 'Biological therapy',
				n.Transplantation                                      AS 'Transplantation',
				n.OtherImmunoSuppression                               AS 'Other immunosuppression',
				n.CurrentSmoker                                        AS 'Current smoker',
			
				-- Treatment
				n.PostMortemDiagnosis                                  AS 'Post-mortem diagnosis',
				n.DidNotStartTreatment                                 AS 'Did not start treatment',
				n.ShortCourse                                          AS 'Short course',
				n.MdrTreatment                                         AS 'MDR treatment',
				dbo.ufnFormatDateConsistently(n.MdrTreatmentDate)      AS 'MDR treatment date',
				n.TreatmentOutcome12months                             AS 'Treatment outcome 12 months',
				n.TreatmentOutcome24months                             AS 'Treatment outcome 24 months',
				n.TreatmentOutcome36months                             AS 'Treatment outcome 36 months',
				n.LastRecordedTreatmentOutcome                         AS 'Last recorded treatment outcome',
				dbo.ufnFormatDateConsistently(n.DateOfDeath)           AS 'Date of death',
				dbo.ufnFormatDateConsistently(n.TreatmentEndDate)      AS 'Treatment end date',

				-- Culture & Resistance
				n.NoSampleTaken                                        AS 'No sample taken',
				n.CulturePositive                                      AS 'Culture positive',
				n.Species                                              AS 'Species',
				dbo.ufnFormatDateConsistently(n.EarliestSpecimenDate)  AS 'Earliest specimen date',
				n.DrugResistanceProfile                                AS 'Drug resistance profile',
				n.INH                                                  AS 'INH',
				n.RIF                                                  AS 'RIF',
				n.EMB                                                  AS 'EMB',
				n.PZA                                                  AS 'PZA',
				n.MDR                                                  AS 'MDR',
				n.XDR                                                  AS 'XDR'
			FROM dbo.ufnAuthorizedReusableNotification(@LoginGroups) n
			ORDER BY n.NotificationDate DESC
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspSampleMapping]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSampleMapping] AS


	SET NOCOUNT ON

	BEGIN TRY
		DELETE FROM SampleMapping

		INSERT INTO SampleMapping VALUES ('Aspirate', 1)
		INSERT INTO SampleMapping VALUES ('Biopsy', 2)
		INSERT INTO SampleMapping VALUES ('Blood', 3)
		INSERT INTO SampleMapping VALUES ('Bone', 4)
		INSERT INTO SampleMapping VALUES ('Bone and joint', 5)
		INSERT INTO SampleMapping VALUES ('Bone Biopsy', 6)
		INSERT INTO SampleMapping VALUES ('Bronchial lavage', 7)
		INSERT INTO SampleMapping VALUES ('Bronchial washings', 8)
		INSERT INTO SampleMapping VALUES ('Bronchoscopy', 9)
		INSERT INTO SampleMapping VALUES ('Bronchoscopy sample', 10)
		INSERT INTO SampleMapping VALUES ('CSF', 11)
		INSERT INTO SampleMapping VALUES ('Faeces', 12)
		INSERT INTO SampleMapping VALUES ('Gastric washings', 13)
		INSERT INTO SampleMapping VALUES ('Gynaecological', 14)
		INSERT INTO SampleMapping VALUES ('Hickman Line Tip', 15)
		INSERT INTO SampleMapping VALUES ('Lung bronchial tree tissue', 16)
		INSERT INTO SampleMapping VALUES ('Lymph node', 17)
		INSERT INTO SampleMapping VALUES ('Lymph tissue', 18)
		INSERT INTO SampleMapping VALUES ('LymphNode', 19)
		INSERT INTO SampleMapping VALUES ('Nasopharyngeal Aspirate', 20)
		INSERT INTO SampleMapping VALUES ('New', 98)
		INSERT INTO SampleMapping VALUES ('Non Directed Bronchial Lavage', 21)
		INSERT INTO SampleMapping VALUES ('Not known', 97)
		INSERT INTO SampleMapping VALUES ('Other tissues', 61)
		INSERT INTO SampleMapping VALUES ('Other tissues / sputum', 60)
		INSERT INTO SampleMapping VALUES ('Peritoneal fluid', 22)
		INSERT INTO SampleMapping VALUES ('Pleural', 23)
		INSERT INTO SampleMapping VALUES ('Pleural fluid or biopsy', 24)
		INSERT INTO SampleMapping VALUES ('PleuralFluidBiopsy', 25)
		INSERT INTO SampleMapping VALUES ('Pus', 26)
		INSERT INTO SampleMapping VALUES ('SKIN', 27)
		INSERT INTO SampleMapping VALUES ('SKIN/WOUND', 28)
		INSERT INTO SampleMapping VALUES ('Sputum', 29)
		INSERT INTO SampleMapping VALUES ('Sputum (induced)', 30)
		INSERT INTO SampleMapping VALUES ('UNKNOWN', 99)
		INSERT INTO SampleMapping VALUES ('Urine', 31)
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspSeed]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
GO
/****** Object:  StoredProcedure [dbo].[uspSeedReportLookup]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSeedReportLookup]
	
AS
	DELETE FROM [dbo].ReportLookup

	INSERT INTO [dbo].ReportLookup (ItemId, ReportName)
		
		SELECT C.ItemID, C.[Name] FROM [ReportServer].[dbo].[Catalog] C 
		WHERE C.[Type] = 2

	UPDATE [dbo].ReportLookup SET ReportGroup = 'Audit' WHERE ReportName like '%Audit%'

	UPDATE [dbo].ReportLookup SET ReportGroup = 'CultureResistance' WHERE ReportName like '%Resistance%'

	UPDATE [dbo].ReportLookup SET ReportGroup = 'DataQuality' WHERE ReportName like '%Quality%'
	
	UPDATE [dbo].ReportLookup SET ReportGroup = 'Notification' WHERE ReportName like '%Notification%'

	UPDATE [dbo].ReportLookup SET ReportGroup = 'Enhanced' WHERE ReportName like '%Enhanced%'

	UPDATE [dbo].ReportLookup SET ReportGroup = 'Outcome' WHERE ReportName like '%Outcome%'

	UPDATE [dbo].ReportLookup SET ReportGroup = 'Cluster' WHERE ReportName like '%Cluster%'


RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[uspService]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns the permission- and region-filtered Services for an AD group user.

Author:  Public Health England
         Adil Mirza    <adil.mirza@phe.gov.uk>
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspService] 
	@Region VARCHAR(1000) = 'AllowAll' -- The regions to narrow down services by. 
	-- The AllowAll default value means we can move reports to use this one by one, rathar than updating them all at once.
	-- The default value (and the condition it satisfies below) can be removed once all service user reports are merged into their base counterparts
AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		DECLARE	@LoginType VARCHAR(1)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT, @LoginType OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @LoginGroups

		IF (@LoginGroups != '###')
		BEGIN
			IF (@LoginType = 'S') 
				-- service user, restrict by selected region and by user access to services
				SELECT distinct 
					s.Serviceid,
					TB_Service_Name
				FROM dbo.TB_Service s
					INNER JOIN dbo.ServiceAdGroup sad ON sad.ServiceId = s.Serviceid
					INNER JOIN dbo.AdGroup agt ON agt.AdGroupId = sad.AdGroupId
				WHERE PhecName != 'Unknown'
					AND (@Region = 'AllowAll' OR PhecName IN (SELECT VALUE FROM STRING_SPLIT(@Region, ',')))
					AND CHARINDEX('###' + agt.AdGroupName + '###', @LoginGroups) != 0
				ORDER BY TB_Service_Name
			ELSE IF (@LoginType = 'R' OR @LoginType = 'N') 
				-- regional user or national team user, only restrict by selected regions
				SELECT Serviceid,TB_Service_Name 
				FROM dbo.TB_Service s
				WHERE PhecName IN (SELECT VALUE FROM STRING_SPLIT(@Region, ','))
				ORDER BY TB_Service_Name
			ELSE
				RAISERROR ('This user does not have a recognized user type', 16, 1) WITH NOWAIT
		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspServicePhec]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Desc:    This returns the permission-filtered PHEC regions for each Service level AD group user. 
		 TODO NTBS-1003: Remove this proc when all reports are merged.

Author:  Public Health England
         Adil Mirza    <adil.mirza@phe.gov.uk>
**************************************************************************************************/

CREATE PROCEDURE [dbo].[uspServicePhec] (
	@Option VARCHAR(100) -- Legacy: This is unused, but can't just remove, cos reports still pass it through
) AS
	SET NOCOUNT ON

	BEGIN TRY
		DECLARE	@LoginGroups VARCHAR(500)
		EXEC dbo.uspGetAuthenticatedLoginGroupsAndType @LoginGroups OUTPUT

		-- Debugging
		-- EXEC master..xp_logevent 60000, @LoginGroups

		IF (@LoginGroups != '###')
		BEGIN
			SELECT distinct 
				PhecName
			FROM dbo.TB_Service s
				INNER JOIN dbo.ServiceAdGroup sad ON sad.ServiceId = s.Serviceid
				INNER JOIN dbo.AdGroup agt ON agt.AdGroupId = sad.AdGroupId
			WHERE PhecName != 'Unknown'
				-- Permission restrictions on logged-in treatment region
				AND CHARINDEX('###' + agt.AdGroupName + '###', @LoginGroups) != 0
				order by PhecName

		END
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspSpecimenMDRXDR]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSpecimenMDRXDR]
	
AS
		--calculate MDR using same rules as R1

		-- 1. Both INH and RIF are set to 'Resistant'
		UPDATE dbo.LabSpecimen SET
			MDR = 'Yes'
		WHERE MDR IS NULL
			AND (INH = 'Resistant' AND RIF = 'Resistant')

		-- 2. One of INH and RIF (or both) is 'Sensitive'
		UPDATE dbo.LabSpecimen SET
			MDR = 'No'
		WHERE MDR IS NULL
			AND (INH = 'Sensitive' OR RIF = 'Sensitive')

		-- 3. One of INH and RIF (or both) is 'No result' or 'Unknown'
		UPDATE dbo.LabSpecimen SET
			MDR = 'No result'
		WHERE MDR IS NULL
			AND (
					   INH = 'No result' 
					OR RIF = 'No result' 
					OR INH = 'Unknown' 
					OR RIF = 'Unknown'
				)

	
		--calculate XDR using same rules as R1

		-- 1. Both QUIN and AMINO are set to 'Resistant'
		UPDATE dbo.LabSpecimen SET
			XDR = 'Yes'
		WHERE XDR IS NULL
			AND (AMINO = 'Resistant' AND QUIN = 'Resistant')

		-- 2. One of QUIN or AMINO (or both) is 'Sensitive'
		UPDATE dbo.LabSpecimen SET
			XDR = 'No'
		WHERE XDR IS NULL
			AND (AMINO = 'Sensitive' OR QUIN = 'Sensitive')

		-- 3. One of AMINO and QUIN (or both) is 'No result' or 'Unknown'
		UPDATE dbo.LabSpecimen SET
			XDR = 'No result'
		WHERE XDR IS NULL
			AND (
					   AMINO = 'No result' 
					OR QUIN = 'No result' 
					OR AMINO = 'Unknown' 
					OR QUIN = 'Unknown'
				)

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[usptmpGetGeographyPhec]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usptmpGetGeographyPhec] as

select * from NTBS_R1_Geography_Staging.dbo.PHEC
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateNotificationClusterMatchWithForestClusterData]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateNotificationClusterMatchWithForestClusterData]
(
	@BuildNumber VARCHAR(10)
)
AS
	BEGIN TRY
		-- Delete Entries from Notification Cluster Match table
		DELETE FROM [dbo].NotificationClusterMatch

		-- Populate Notification Cluster Match table with data from 
		INSERT INTO NotificationClusterMatch (NotificationId, ClusterId) 
		SELECT forestCluster.ETSCaseId_max, 
			forestCluster.smallest_clusterLabel
		FROM [dbo].[ForestEtsCluster] forestCluster
		JOIN (
			SELECT smallest_clusterLabel
			FROM [dbo].[ForestEtsCluster] 
			WHERE smallest_clusterLabel IS NOT NULL AND ETSCaseId_max IS NOT NULL
			GROUP BY smallest_clusterLabel
			HAVING COUNT(*) > 1
		) clusters 
		ON clusters.smallest_clusterLabel = forestCluster.smallest_clusterLabel
		WHERE forestCluster.smallest_clusterLabel IS NOT NULL AND forestCluster.ETSCaseId_max IS NOT NULL

		-- Update build number
		IF EXISTS (SELECT * FROM ForestClusterBuild)
			UPDATE ForestClusterBuild 
			SET BuildNumber = @BuildNumber,
				LastExtractionDate = GETDATE() 
		ELSE
			INSERT INTO ForestClusterBuild (BuildNumber) Values (@BuildNumber);
	END TRY
	BEGIN CATCH
		EXEC dbo.uspHandleException
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateReusableNotificationPostcode]    Script Date: 09/04/2021 15:21:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateReusableNotificationPostcode] AS
	SET NOCOUNT ON

	BEGIN TRY
		

		if object_id('tempdb.dbo.#NotificationPostcodes','U') is not null 
		begin	
			drop table #NotificationPostcodes
		end

		SELECT distinct ReusableNotificationId, postcode,REPLACE(postcode, ' ', '') as CleanedPostcode into #NotificationPostcodes
		  FROM [ReusableNotification] 
  
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
USE [master]
GO
ALTER DATABASE [NTBS_Reporting_Staging] SET  READ_WRITE 
GO
