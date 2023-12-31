USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_Election_tendance_en_tête]    Script Date: 09/08/2023 11:23:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_Election_tendance_en_tête]
-- =============================================
-- Author:	Alexandre, Favre	
-- Create date: 20230714
-- Description:	WRK -> DRV
--				
-- Mod Date: 
-- =============================================
AS
BEGIN

SELECT [Code du département]
      ,[Libellé du département]
      ,[Inscrits]
      ,[Abstentions]
      ,[% Abs/Ins]
      ,[Votants]
      ,[% Vot/Ins]
      ,[Exprimés]
      ,[% Exp/Ins]
      ,[% Exp/Vot]
      ,[Blancs]
      ,[% Blancs/Ins]
      ,[% Blancs/Vot]
      ,[Nuls]
      ,[% Nuls/Ins]
      ,[% Nuls/Vot]
      ,[Tendance]
      ,[Total_Voix]
      ,[Total_Pourcentage_Voix_Ins]
      ,[Total_Pourcentage_Voix_Exp]
      ,[Année]
into [MSPR_BIGDATA].[dbo].[DRV_Election_tendance_en_tête]
FROM [MSPR_BIGDATA].[dbo].[DRV_ELECTION] AS e1
WHERE [Total_Voix] = (
    SELECT MAX([Total_Voix])
    FROM [MSPR_BIGDATA].[dbo].[DRV_ELECTION] AS e2
    WHERE e1.[Code du département] = e2.[Code du département]
    AND e1.[Année] = e2.[Année]
)
ORDER BY [Code du département], [Année];



/*

*/
END