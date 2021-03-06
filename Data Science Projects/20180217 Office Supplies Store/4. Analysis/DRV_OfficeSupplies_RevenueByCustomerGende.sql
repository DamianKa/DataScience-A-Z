USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_OfficeSupplies_RevenueByCustomerGender]    Script Date: 17/02/2018 20:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[BLD_DRV_OfficeSupplies_RevenueByCustomerGender]
-- =============================================
-- Author:		
-- Create date: 
-- Description:	WRK -> DRV
--			COMBINING TABLES:	[WRK_OfficeSupplies_CustomerList]
--						[WRK_OfficeSupplies_TransactionalData]
--			TO UNDERSTAND REVENUE SPLIT BY GENDER
-- Mod date: 
-- =============================================

AS
BEGIN


/*
DROP TABLE

*/

SELECT 
	A.[Customer ID]
	,A.[Gender]
	,B.[Units] * B.[Unit Price] AS Revenue
FROM [dbo].[WRK_OfficeSupplies_CustomerList] A
LEFT JOIN [dbo].[WRK_OfficeSupplies_TransactionalData] B
ON A.[Customer ID] = B.[Customer ID]


END