USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_ELECTION_tendance_en_tete_Evolution_Tx_Chomage]    Script Date: 09/08/2023 11:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_ELECTION_tendance_en_tete_Evolution_Tx_Chomage]
-- =============================================
-- Author:	Alexandre, Favre	
-- Create date: 20230714
-- Description:	WRK -> DRV
--				
-- Mod Date: 
-- =============================================
AS
BEGIN

SELECT 
    CAST(e.[Code du département] as NVARCHAR) as [Code du département],
    e.[Libellé du département],
    e.[Inscrits],
    e.[Abstentions],
    e.[% Abs/Ins],
    e.[Votants],
    e.[% Vot/Ins],
    e.[Exprimés],
    e.[% Exp/Ins],
    e.[% Exp/Vot],
    e.[Blancs],
    e.[% Blancs/Ins],
    e.[% Blancs/Vot],
    e.[Nuls],
    e.[% Nuls/Ins],
    e.[% Nuls/Vot],
    e.[Tendance],
    e.[Total_Voix],
    e.[Total_Pourcentage_Voix_Ins],
    e.[Total_Pourcentage_Voix_Exp],
    e.[Année],
    CASE 
        WHEN e.[Année] = '2017' THEN c.[Évolution_2012_2017]
        WHEN e.[Année] = '2022' THEN c.[Évolution_2017_2022]
        --ELSE NULL
    END AS Evolution_Tx_Chomage
INTO [MSPR_BIGDATA].[dbo].[DRV_ELECTION_tendance_en_tete_Evolution_Tx_Chomage]
FROM [dbo].[DRV_Election_tendance_en_tête] e
LEFT JOIN [MSPR_BIGDATA].[dbo].[DRV_Evolution_TX_Chomage] c
ON e.[Code du département] = c.[Code département]

-- 213 rows
  

/*


*/

END