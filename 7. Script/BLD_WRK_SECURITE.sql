USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_SECURITE]    Script Date: 09/08/2023 11:20:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_SECURITE]
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
If OBJECT_ID('WRK_SECURITE') IS NOT NULL
Drop Table [dbo].[WRK_SECURITE]

-- =============================================
-- Create Table 
-- =============================================
CREATE TABLE [WRK_SECURITE]
(    [Row_number]	Int identity(1,1)
	,[classe]			VARCHAR(100)
	,[annee]			DATE
	,[Code département]	VARCHAR(3)
	,[Code région]		VARCHAR(3)
	,[unité de compte]	VARCHAR(100)
	,[millPOP]			INT
	,[millLOG]			INT
	,[faits]			INT
	,[POP]				INT
	,[tauxpourmille]	FLOAT
	  )

-- =============================================
-- Truncate Table
-- =============================================
Truncate Table [dbo].[WRK_SECURITE]

-- =============================================
-- Insert Into
-- =============================================
InSERT INTO [dbo].[WRK_SECURITE]
(
	[classe]
	,[annee]
	,[Code département]
	,[Code région]
	,[unité de compte]
	,[millPOP]
	,[millLOG]
	,[faits]
	,[POP]
	,[tauxpourmille]		
)
Select 
	[classe]
	,CONVERT(DATE, CONCAT('20', [annee]), 101) AS [annee]
	,[Code département]
	,[Code région]
	,[unité de compte]
	,[millPOP]
	,[millLOG]
	,[faits]
	,[POP]
	,CASE
        WHEN ISNUMERIC(REPLACE([tauxpourmille], ',', '.')) = 1 THEN TRY_CAST(REPLACE([tauxpourmille], ',', '.') AS FLOAT)
        ELSE NULL
    END AS [tauxpourmille]
FROM [dbo].[Raw_donnee-dep-data.gouv-2022-geographie2022-produit-le2023-02-09]
-- (8484 rows affected)


END
/*
Soucis de convertion pour les colonnes LOG et tauxpourmille à cause de la virgule en séparateur décimale
Pour résourdre il faut effectuer les commande suivante : 

UPDATE [MSPR_BIGDATA].[dbo].[Raw_donnee-dep-data.gouv-2022-geographie2022-produit-le2023-02-09]
SET [LOG] = CASE 
              WHEN ISNUMERIC([LOG]) <> 1 THEN REPLACE([LOG], ',', '.')
              ELSE [LOG]
           END

UPDATE [MSPR_BIGDATA].[dbo].[Raw_donnee-dep-data.gouv-2022-geographie2022-produit-le2023-02-09]
SET [tauxpourmille] = CASE 
              WHEN ISNUMERIC([tauxpourmille]) <> 1 THEN REPLACE([tauxpourmille], ',', '.')
              ELSE [tauxpourmille]
           END
*/
/*
	Select *
	FROM [MSPR_BIGDATA].[dbo].[WRK_SECURITE]
	Select *
	FROM [MSPR_BIGDATA].[dbo].[Raw_donnee-dep-data.gouv-2022-geographie2022-produit-le2023-02-09]

*/
