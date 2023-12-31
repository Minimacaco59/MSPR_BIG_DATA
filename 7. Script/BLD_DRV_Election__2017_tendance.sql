USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_Election__2017_tendance]    Script Date: 09/08/2023 11:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_Election__2017_tendance]
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
    [Code du département],
    [Libellé du département],
    [Inscrits],
    [Abstentions],
    [% Abs/Ins],
    [Votants],
    [% Vot/Ins],
    [Exprimés],
    [% Exp/Ins],
    [% Exp/Vot],
    [Blancs],
    [% Blancs/Ins],
    [% Blancs/Vot],
    [Nuls],
    [% Nuls/Ins],
    [% Nuls/Vot],
    [Tendance],
    SUM([Voix]) AS Total_Voix,
    SUM([% Voix/Ins]) AS Total_Pourcentage_Voix_Ins,
    SUM([% Voix/Exp]) AS Total_Pourcentage_Voix_Exp
Into [MSPR_BIGDATA].[dbo].[DRV_Election__2017_tendance]
FROM [MSPR_BIGDATA].[dbo].[WRK_PRESIDENTIELLE_2017_T1]
GROUP BY
    [Code du département],
    [Libellé du département],
    [Inscrits],
    [Abstentions],
    [% Abs/Ins],
    [Votants],
    [% Vot/Ins],
    [Exprimés],
    [% Exp/Ins],
    [% Exp/Vot],
    [Blancs],
    [% Blancs/Ins],
    [% Blancs/Vot],
    [Nuls],
    [% Nuls/Ins],
    [% Nuls/Vot],
    [Tendance]

-- (530 rows affected)
-- 106*5

/*
select count(Distinct[code du département])
from [MSPR_BIGDATA].[dbo].[WRK_PRESIDENTIELLE_2022_T1]
*/
END