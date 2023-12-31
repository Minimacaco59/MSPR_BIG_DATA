USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_SECURITE]    Script Date: 09/08/2023 11:21:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_SECURITE]
-- =============================================
-- Author:	Alexandre, Favre	
-- Create date: 20230714
-- Description:	WRK -> DRV
--				
-- Mod Date: 
-- =============================================
AS
BEGIN

CREATE TABLE [DRV_SECURITE] (
    [Code département] VARCHAR(3),
    [annee] DATE,
    [Vols de véhicules_fait] INT,
    [Vols de véhicules_Tauxpourmille] FLOAT,
    [Vols d'accessoires sur véhicules_fait] INT,
    [Vols d'accessoires sur véhicules_Tauxpourmille] FLOAT,
    [Coups et blessures volontaires intrafamiliaux_fait] INT,
    [Coups et blessures volontaires intrafamiliaux_Tauxpourmille] FLOAT,
    [Vols avec armes_fait] INT,
    [Vols avec armes_Tauxpourmille] FLOAT,
    [Violences sexuelles_fait] INT,
    [Violences sexuelles_Tauxpourmille] FLOAT,
    [Destructions et dégradations volontaires_fait] INT,
    [Destructions et dégradations volontaires_Tauxpourmille] FLOAT,
    [Vols dans les véhicules_fait] INT,
    [Vols dans les véhicules_Tauxpourmille] FLOAT,
    [Coups et blessures volontaires_fait] INT,
    [Coups et blessures volontaires_Tauxpourmille] FLOAT,
    [Vols sans violence contre des personnes_fait] INT,
    [Vols sans violence contre des personnes_Tauxpourmille] FLOAT,
    [Cambriolages de logement_fait] INT,
    [Cambriolages de logement_Tauxpourmille] FLOAT,
    [Vols violents sans arme_fait] INT,
    [Vols violents sans arme_Tauxpourmille] FLOAT,
    [Autres coups et blessures volontaires_fait] INT,
    [Autres coups et blessures volontaires_Tauxpourmille] FLOAT
);

-- Remplissage de la table de résultat
INSERT INTO [DRV_SECURITE]
SELECT 
	Right('000'+[Code département],3),
	[annee],
    MAX(CASE WHEN classe = 'Vols de véhicules' THEN faits END) AS [Vols de véhicules_fait],
    MAX(CASE WHEN classe = 'Vols de véhicules' THEN tauxpourmille END) AS [Vols de véhicules_Tauxpourmille],
    MAX(CASE WHEN classe = 'Vols d''accessoires sur véhicules' THEN faits END) AS [Vols d'accessoires sur véhicules_fait],
    MAX(CASE WHEN classe = 'Vols d''accessoires sur véhicules' THEN tauxpourmille END) AS [Vols d'accessoires sur véhicules_Tauxpourmille],
    MAX(CASE WHEN classe = 'Coups et blessures volontaires intrafamiliaux' THEN faits END) AS [Coups et blessures volontaires intrafamiliaux_fait],
    MAX(CASE WHEN classe = 'Coups et blessures volontaires intrafamiliaux' THEN tauxpourmille END) AS [Coups et blessures volontaires intrafamiliaux_Tauxpourmille],
    MAX(CASE WHEN classe = 'Vols avec armes' THEN faits END) AS [Vols avec armes_fait],
    MAX(CASE WHEN classe = 'Vols avec armes' THEN tauxpourmille END) AS [Vols avec armes_Tauxpourmille],
    MAX(CASE WHEN classe = 'Violences sexuelles' THEN faits END) AS [Violences sexuelles_fait],
    MAX(CASE WHEN classe = 'Violences sexuelles' THEN tauxpourmille END) AS [Violences sexuelles_Tauxpourmille],
    MAX(CASE WHEN classe = 'Destructions et dégradations volontaires' THEN faits END) AS [Destructions et dégradations volontaires_fait],
    MAX(CASE WHEN classe = 'Destructions et dégradations volontaires' THEN tauxpourmille END) AS [Destructions et dégradations volontaires_Tauxpourmille],
    MAX(CASE WHEN classe = 'Vols dans les véhicules' THEN faits END) AS [Vols dans les véhicules_fait],
    MAX(CASE WHEN classe = 'Vols dans les véhicules' THEN tauxpourmille END) AS [Vols dans les véhicules_Tauxpourmille],
    MAX(CASE WHEN classe = 'Coups et blessures volontaires' THEN faits END) AS [Coups et blessures volontaires_fait],
    MAX(CASE WHEN classe = 'Coups et blessures volontaires' THEN tauxpourmille END) AS [Coups et blessures volontaires_Tauxpourmille],
    MAX(CASE WHEN classe = 'Vols sans violence contre des personnes' THEN faits END) AS [Vols sans violence contre des personnes_fait],
    MAX(CASE WHEN classe = 'Vols sans violence contre des personnes' THEN tauxpourmille END) AS [Vols sans violence contre des personnes_Tauxpourmille],
    MAX(CASE WHEN classe = 'Cambriolages de logement' THEN faits END) AS [Cambriolages de logement_fait],
    MAX(CASE WHEN classe = 'Cambriolages de logement' THEN tauxpourmille END) AS [Cambriolages de logement_Tauxpourmille],
    MAX(CASE WHEN classe = 'Vols violents sans arme' THEN faits END) AS [Vols violents sans arme_fait],
    MAX(CASE WHEN classe = 'Vols violents sans arme' THEN tauxpourmille END) AS [Vols violents sans arme_Tauxpourmille],
    MAX(CASE WHEN classe = 'Autres coups et blessures volontaires' THEN faits END) AS [Autres coups et blessures volontaires_fait],
    MAX(CASE WHEN classe = 'Autres coups et blessures volontaires' THEN tauxpourmille END) AS [Autres coups et blessures volontaires_Tauxpourmille]
FROM [MSPR_BIGDATA].[dbo].[WRK_SECURITE]
GROUP BY [Code département], [annee];

-- (707 rows affected)
-- 101 departement * 7 année 

-- Affichage du contenu de la table de résultat
SELECT * FROM [DRV_SECURITE];

END