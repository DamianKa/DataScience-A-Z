USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[__tmpl__BLD_WRK_TableName]    Script Date: 18/02/2018 08:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[BLD_WRK_FakeNamesCanada]
-- =============================================
-- Author:			Damian Kasztelan
-- Create date:		20180218
-- Description:	RAW -> WRK
-- Mod date: 
-- =============================================

AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================
IF OBJECT_ID('WRK_FakeNamesCanada') IS NOT NULL
DROP TABLE [WRK_FakeNamesCanada]


-- =============================================
-- CREATE TABLE
-- =============================================
CREATE TABLE [WRK_FakeNamesCanada]
(
	[RowNumber]			INT IDENTITY(1,1)
	,[Number]			VARCHAR(100)
	,[Gender]			VARCHAR(10)
	,[GivenName]		VARCHAR(1000)
	,[Surname]			VARCHAR(1000)
	,[StreetAddress]	VARCHAR(1000)
	,[City]				VARCHAR(1000)
	,[ZipCode]			VARCHAR(7)
	,[CountryFull]		VARCHAR(100)
	,[Birthday]			DATE
	,[Balance]			FLOAT
	,[InterestRate]		FLOAT

)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [WRK_FakeNamesCanada]


-- =============================================
-- INSERT INTO
-- =============================================
INSERT INTO [WRK_FakeNamesCanada]
(
	
	[Number]		
	,[Gender]
	,[GivenName]
	,[Surname]
	,[StreetAddress]
	,[City]
	,[ZipCode]
	,[CountryFull]
	,[Birthday]
	,[Balance]
	,[InterestRate]


)
SELECT 
	[Number]		
	,[Gender]
	,[GivenName]
	,[Surname]
	,[StreetAddress]
	,[City]
	,[ZipCode]
	,[CountryFull]
	,[Birthday]
	,[Balance]
	,[InterestRate]



FROM [RAW_FakeNamesCanada_20180218]
-- (x row(s) affected)

--FILTERS:
WHERE ISNUMERIC ([Balance]) = 1 -- 10 ROWS EXLUDED
AND	LEN([ZipCode]) <= 7			-- 2 ROWS EXLUDED
AND ISDATE([Birthday]) = 1		-- 1 ROW EXLUDED


-- (199987 row(s) affected)
-- 199987 + 10 + 2 + 1 = 200000 VERIFIED


-- =============================================
-- ADDITIONAL EXCLUSIONS
-- =============================================

--SELECT *
DELETE
FROM [WRK_FakeNamesCanada]
WHERE [Balance] < 0
-- (1 row(s) affected)


--SELECT *
DELETE
FROM [WRK_FakeNamesCanada]
WHERE [ZipCode] NOT LIKE '___ ___'
-- (4 row(s) affected)



--SELECT *
DELETE
FROM [WRK_FakeNamesCanada]
WHERE [Birthday] < '1915-08-13'
-- N/A


SELECT *
FROM [WRK_FakeNamesCanada]
WHERE [Birthday] > '2005-08-13'





END



/*

	SELECT COUNT(*) 
	FROM [dbo].[WRK_FakeNamesCanada]


	SELECT * 
	FROM [dbo].[WRK_FakeNamesCanada]


	SELECT COUNT(*) 
	FROM [dbo].[RAW_FakeNamesCanada_20180218]

	SELECT * 
	FROM [dbo].[RAW_FakeNamesCanada_20180218]
*/