USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_OfficeSupplies_CustomerList]    Script Date: 17/02/2018 18:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[BLD_WRK_OfficeSupplies_CustomerList]
-- =============================================
-- Author:		Damian Kasztelan
-- Create date: 20180217
-- Description:	RAW -> WRK
-- Mod date: 
-- =============================================

AS
BEGIN
-- =============================================
-- CREATE TABLE
-- =============================================
CREATE TABLE [WRK_OfficeSupplies_CustomerList]
(
	[RowNumber]		INT IDENTITY(1,1)
	,[Customer ID]	VARCHAR(100)
	,[City]			VARCHAR(1000)
	,[ZipCode]		VARCHAR(5)
	,[Gender]		VARCHAR(1)
	,[Age]			FLOAT
)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [WRK_OfficeSupplies_CustomerList]





-- =============================================
-- INSERT INTO
-- =============================================
INSERT INTO [WRK_OfficeSupplies_CustomerList]
(
		
	[Customer ID]	
	,[City]			
	,[ZipCode]		
	,[Gender]		
	,[Age]			
)
SELECT 
	[Customer ID]	
	,[City]			
	,[ZipCode]		
	,[Gender]		
	,[Age]	
FROM [CustomerList]
-- (43 row(s) affected)


END



/*
	SELECT * 
	FROM [dbo].[RAW_CustomerList]
*/