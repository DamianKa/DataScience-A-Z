USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_OfficeSupplies_TransactionalData]    Script Date: 17/02/2018 20:20:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[BLD_WRK_OfficeSupplies_TransactionalData]
-- =============================================
-- Author:		Damian Kasztelan
-- Create date: 20180217
-- Description:	RAW -> WRK
-- Mod date: 
-- =============================================

AS
BEGIN

-- =============================================
-- DROP TABLE
-- =============================================
IF OBJECT_ID('WRK_OfficeSupplies_TransactionalData') IS NOT NULL
DROP TABLE [WRK_OfficeSupplies_TransactionalData]


-- =============================================
-- CREATE TABLE
-- =============================================
CREATE TABLE [WRK_OfficeSupplies_TransactionalData]
(
	[RowNumber]		INT IDENTITY(1,1)
	,[Order ID]		VARCHAR(100)
	,[Order Date]	DATE
	,[Customer ID]	VARCHAR(100)
	,[Region]		VARCHAR(1)
	,[Rep]			VARCHAR(100)
	,[Item]			VARCHAR(1000)
	,[Units]		INT
	,[Unit Price]	FLOAT

)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [WRK_OfficeSupplies_TransactionalData]


-- =============================================
-- INSERT INTO
-- =============================================
INSERT INTO [WRK_OfficeSupplies_TransactionalData]
(
	
	[Order ID]		
	,[Order Date]	
	,[Customer ID]	
	,[Region]		
	,[Rep]			
	,[Item]			
	,[Units]		
	,[Unit Price]	

)
SELECT 
	[Order ID]
	,[Order Date]
	,[Customer ID]
	,[Region]
	,[Rep]
	,[Item]
	,[Units]
	,[Unit Price]




FROM [TransactionalData]
-- (x row(s) affected)


END



/*
	SELECT * 
	FROM [dbo].[WRK_OfficeSupplies_TransactionalData]

	SELECT * 
	FROM [dbo].[RAW_OfficeSupplies_TransactionalData_20180217]


*/