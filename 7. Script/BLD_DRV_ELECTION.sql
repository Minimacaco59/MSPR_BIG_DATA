USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_ELECTION]    Script Date: 09/08/2023 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_ELECTION]
-- =============================================
-- Author:	Alexandre, Favre	
-- Create date: 20230714
-- Description:	WRK -> DRV
--				
-- Mod Date: 
-- =============================================
AS
BEGIN

-- =============================================
-- Drop Table
-- =============================================
If OBJECT_ID('DRV_ELECTION') IS NOT NULL
Drop Table [dbo].[DRV_ELECTION]

-- =============================================
-- Créer la table DRV_ELECTION 
-- =============================================
CREATE TABLE [dbo].[DRV_ELECTION]
(
    [Code du département] NVARCHAR(3),
    [Libellé du département] NVARCHAR(100),
    [Inscrits] INT,
    [Abstentions] INT,
    [% Abs/Ins] FLOAT,
    [Votants] INT,
    [% Vot/Ins] FLOAT,
    [Exprimés] INT,
    [% Exp/Ins] FLOAT,
    [% Exp/Vot] FLOAT,
    [Blancs] INT,
    [% Blancs/Ins] FLOAT,
    [% Blancs/Vot] FLOAT,
    [Nuls] INT,
    [% Nuls/Ins] FLOAT,
    [% Nuls/Vot] FLOAT,
    [Tendance] NVARCHAR(50),
    [Total_Voix] INT,
    [Total_Pourcentage_Voix_Ins] FLOAT,
    [Total_Pourcentage_Voix_Exp] FLOAT,
    [Année] NVARCHAR(4)
)


-- =============================================
-- Truncate Table
-- =============================================
Truncate Table [dbo].[DRV_ELECTION]

-- =============================================
-- Insert Into
-- =============================================
-- Insérer les données dans la table DRV_ELECTION en utilisant UNION ALL
INSERT INTO [dbo].[DRV_ELECTION]
(
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
    [Total_Voix],
    [Total_Pourcentage_Voix_Ins],
    [Total_Pourcentage_Voix_Exp],
    [Année]
)
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
    [Total_Voix],
    [Total_Pourcentage_Voix_Ins],
    [Total_Pourcentage_Voix_Exp],
    '2017' AS Année
FROM [MSPR_BIGDATA].[dbo].[DRV_Election__2017_tendance]

UNION ALL

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
    [Total_Voix],
    [Total_Pourcentage_Voix_Ins],
    [Total_Pourcentage_Voix_Exp],
    '2022' AS Année
FROM [MSPR_BIGDATA].[dbo].[DRV_Election__2022_tendance]
-- (1065 rows affected)
-- Attention verifier pourquoi on a 1065 Row 
--106*5 + 107*5 = 530 + 535 = 1065


END