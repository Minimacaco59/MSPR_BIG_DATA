USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[__tmpl__BLD_WRK_TableName]    Script Date: 09/08/2023 11:25:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[__tmpl__BLD_WRK_TableName]
-- =============================================
-- Author:		
-- Create date: 
-- Description:	Raw -> WRK
-- Mod Date: 
-- =============================================
AS
BEGIN

-- =============================================
-- Drop Table
-- =============================================
If OBJECT_ID('WRK_TableName') IS NOT NULL
Drop Table [dbo].[WRK_Transactional_Data]

-- =============================================
-- Create Table 
-- =============================================
CREATE TABLE [WRK_TableName]
(    [Row_number]	Int identity(1,1)
	,[AAA]		VARCHAR(100)
	,[DDD]		DATE
	,[CCC]		VARCHAR(1)
	,[BBB]		VARCHAR(1000)
	,[EEE]		INT
	,[FFF]		FLOAT
	  )

-- =============================================
-- Truncate Table
-- =============================================
Truncate Table [dbo].[WRK_TableName]

-- =============================================
-- Insert Into
-- =============================================
InSERT INTO [dbo].[WRK_TableName]
(
	[AAA]		
	,[DDD]		
	,[CCC]		
	,[BBB]		
	,[EEE]		
	,[FFF]		
)
Select 
	[XAAA]		
	,CONVERT(Date,[XZZZ],20)		
	,[XCCC]		
	,[XBBB]		
	,[XEEE]		
	,[XFFF]		
	
FROM [DSTRAINING].[dbo].[Raw_TableName_YYYYMMDD]
-- (X rows affected)


END


/*
	Select *
	FROM [DSTRAINING].[dbo].[WRK_TableName]
	Select *
	FROM [DSTRAINING].[dbo].[Raw_TableName_YYYYMMD]

*/
