USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_Evolution_Securite]    Script Date: 09/08/2023 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_Evolution_Securite]
-- =============================================
-- Author:	Alexandre, Favre	
-- Create date: 20230714
-- Description:	WRK -> DRV
--				
-- Mod Date: 
-- =============================================
AS
BEGIN
-- Créer une table temporaire pour stocker les données de 2016
SELECT 
    [Code département],
    [annee],
    [Vols de véhicules_fait] AS [Vols de véhicules_fait_2016],
    [Vols de véhicules_Tauxpourmille] AS [Vols de véhicules_Tauxpourmille_2016],
    [Vols d'accessoires sur véhicules_fait] AS [Vols d'accessoires sur véhicules_fait_2016],
    [Vols d'accessoires sur véhicules_Tauxpourmille] AS [Vols d'accessoires sur véhicules_Tauxpourmille_2016],
    [Coups et blessures volontaires intrafamiliaux_fait] AS [Coups et blessures volontaires intrafamiliaux_fait_2016],
    [Coups et blessures volontaires intrafamiliaux_Tauxpourmille] AS [Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2016],
    [Vols avec armes_fait] AS [Vols avec armes_fait_2016],
    [Vols avec armes_Tauxpourmille] AS [Vols avec armes_Tauxpourmille_2016],
    [Violences sexuelles_fait] AS [Violences sexuelles_fait_2016],
    [Violences sexuelles_Tauxpourmille] AS [Violences sexuelles_Tauxpourmille_2016],
    [Destructions et dégradations volontaires_fait] AS [Destructions et dégradations volontaires_fait_2016],
    [Destructions et dégradations volontaires_Tauxpourmille] AS [Destructions et dégradations volontaires_Tauxpourmille_2016],
    [Vols dans les véhicules_fait] AS [Vols dans les véhicules_fait_2016],
    [Vols dans les véhicules_Tauxpourmille] AS [Vols dans les véhicules_Tauxpourmille_2016],
    [Coups et blessures volontaires_fait] AS [Coups et blessures volontaires_fait_2016],
    [Coups et blessures volontaires_Tauxpourmille] AS [Coups et blessures volontaires_Tauxpourmille_2016],
    [Vols sans violence contre des personnes_fait] AS [Vols sans violence contre des personnes_fait_2016],
    [Vols sans violence contre des personnes_Tauxpourmille] AS [Vols sans violence contre des personnes_Tauxpourmille_2016],
    [Cambriolages de logement_fait] AS [Cambriolages de logement_fait_2016],
    [Cambriolages de logement_Tauxpourmille] AS [Cambriolages de logement_Tauxpourmille_2016],
    [Vols violents sans arme_fait] AS [Vols violents sans arme_fait_2016],
    [Vols violents sans arme_Tauxpourmille] AS [Vols violents sans arme_Tauxpourmille_2016],
    [Autres coups et blessures volontaires_fait] AS [Autres coups et blessures volontaires_fait_2016],
    [Autres coups et blessures volontaires_Tauxpourmille] AS [Autres coups et blessures volontaires_Tauxpourmille_2016]
INTO #Temp_2016
FROM [MSPR_BIGDATA].[dbo].[DRV_SECURITE]
WHERE [annee] = '2016';

-- Créer une table temporaire pour stocker les données de 2017
SELECT 
    [Code département],
    [annee],
    [Vols de véhicules_fait] AS [Vols de véhicules_fait_2017],
    [Vols de véhicules_Tauxpourmille] AS [Vols de véhicules_Tauxpourmille_2017],
    [Vols d'accessoires sur véhicules_fait] AS [Vols d'accessoires sur véhicules_fait_2017],
    [Vols d'accessoires sur véhicules_Tauxpourmille] AS [Vols d'accessoires sur véhicules_Tauxpourmille_2017],
    [Coups et blessures volontaires intrafamiliaux_fait] AS [Coups et blessures volontaires intrafamiliaux_fait_2017],
    [Coups et blessures volontaires intrafamiliaux_Tauxpourmille] AS [Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2017],
    [Vols avec armes_fait] AS [Vols avec armes_fait_2017],
    [Vols avec armes_Tauxpourmille] AS [Vols avec armes_Tauxpourmille_2017],
    [Violences sexuelles_fait] AS [Violences sexuelles_fait_2017],
    [Violences sexuelles_Tauxpourmille] AS [Violences sexuelles_Tauxpourmille_2017],
    [Destructions et dégradations volontaires_fait] AS [Destructions et dégradations volontaires_fait_2017],
    [Destructions et dégradations volontaires_Tauxpourmille] AS [Destructions et dégradations volontaires_Tauxpourmille_2017],
    [Vols dans les véhicules_fait] AS [Vols dans les véhicules_fait_2017],
    [Vols dans les véhicules_Tauxpourmille] AS [Vols dans les véhicules_Tauxpourmille_2017],
    [Coups et blessures volontaires_fait] AS [Coups et blessures volontaires_fait_2017],
    [Coups et blessures volontaires_Tauxpourmille] AS [Coups et blessures volontaires_Tauxpourmille_2017],
    [Vols sans violence contre des personnes_fait] AS [Vols sans violence contre des personnes_fait_2017],
    [Vols sans violence contre des personnes_Tauxpourmille] AS [Vols sans violence contre des personnes_Tauxpourmille_2017],
    [Cambriolages de logement_fait] AS [Cambriolages de logement_fait_2017],
    [Cambriolages de logement_Tauxpourmille] AS [Cambriolages de logement_Tauxpourmille_2017],
    [Vols violents sans arme_fait] AS [Vols violents sans arme_fait_2017],
    [Vols violents sans arme_Tauxpourmille] AS [Vols violents sans arme_Tauxpourmille_2017],
    [Autres coups et blessures volontaires_fait] AS [Autres coups et blessures volontaires_fait_2017],
    [Autres coups et blessures volontaires_Tauxpourmille] AS [Autres coups et blessures volontaires_Tauxpourmille_2017]
INTO #Temp_2017
FROM [MSPR_BIGDATA].[dbo].[DRV_SECURITE]
WHERE [annee] = '2017';

-- Créer une table temporaire pour stocker les données de 2022
SELECT 
    [Code département],
    [annee],
    [Vols de véhicules_fait] AS [Vols de véhicules_fait_2022],
    [Vols de véhicules_Tauxpourmille] AS [Vols de véhicules_Tauxpourmille_2022],
    [Vols d'accessoires sur véhicules_fait] AS [Vols d'accessoires sur véhicules_fait_2022],
    [Vols d'accessoires sur véhicules_Tauxpourmille] AS [Vols d'accessoires sur véhicules_Tauxpourmille_2022],
    [Coups et blessures volontaires intrafamiliaux_fait] AS [Coups et blessures volontaires intrafamiliaux_fait_2022],
    [Coups et blessures volontaires intrafamiliaux_Tauxpourmille] AS [Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2022],
    [Vols avec armes_fait] AS [Vols avec armes_fait_2022],
    [Vols avec armes_Tauxpourmille] AS [Vols avec armes_Tauxpourmille_2022],
    [Violences sexuelles_fait] AS [Violences sexuelles_fait_2022],
    [Violences sexuelles_Tauxpourmille] AS [Violences sexuelles_Tauxpourmille_2022],
    [Destructions et dégradations volontaires_fait] AS [Destructions et dégradations volontaires_fait_2022],
    [Destructions et dégradations volontaires_Tauxpourmille] AS [Destructions et dégradations volontaires_Tauxpourmille_2022],
    [Vols dans les véhicules_fait] AS [Vols dans les véhicules_fait_2022],
    [Vols dans les véhicules_Tauxpourmille] AS [Vols dans les véhicules_Tauxpourmille_2022],
    [Coups et blessures volontaires_fait] AS [Coups et blessures volontaires_fait_2022],
    [Coups et blessures volontaires_Tauxpourmille] AS [Coups et blessures volontaires_Tauxpourmille_2022],
    [Vols sans violence contre des personnes_fait] AS [Vols sans violence contre des personnes_fait_2022],
    [Vols sans violence contre des personnes_Tauxpourmille] AS [Vols sans violence contre des personnes_Tauxpourmille_2022],
    [Cambriolages de logement_fait] AS [Cambriolages de logement_fait_2022],
    [Cambriolages de logement_Tauxpourmille] AS [Cambriolages de logement_Tauxpourmille_2022],
    [Vols violents sans arme_fait] AS [Vols violents sans arme_fait_2022],
    [Vols violents sans arme_Tauxpourmille] AS [Vols violents sans arme_Tauxpourmille_2022],
    [Autres coups et blessures volontaires_fait] AS [Autres coups et blessures volontaires_fait_2022],
    [Autres coups et blessures volontaires_Tauxpourmille] AS [Autres coups et blessures volontaires_Tauxpourmille_2022]
INTO #Temp_2022
FROM [MSPR_BIGDATA].[dbo].[DRV_SECURITE]
WHERE [annee] = '2022';

-- Créer une table pour stocker les résultats finaux
CREATE TABLE [MSPR_BIGDATA].[dbo].[DRV_Evolution_2016_2017]
(
    [Code département] [varchar](3),
	[Vols de véhicules_fait_2016_2017] [int] ,
	[Vols de véhicules_Tauxpourmille_2016_2017] [float] ,
	[Vols d'accessoires sur véhicules_fait_2016_2017] [int] ,
	[Vols d'accessoires sur véhicules_Tauxpourmille_2016_2017] [float] ,
	[Coups et blessures volontaires intrafamiliaux_fait_2016_2017] [int] ,
	[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2016_2017] [float] ,
	[Vols avec armes_fait_2016_2017] [int] ,
	[Vols avec armes_Tauxpourmille_2016_2017] [float] ,
	[Violences sexuelles_fait_2016_2017] [int] ,
	[Violences sexuelles_Tauxpourmille_2016_2017] [float] NULL,
	[Destructions et dégradations volontaires_fait_2016_2017] [int] NULL,
	[Destructions et dégradations volontaires_Tauxpourmille_2016_2017] [float] NULL,
	[Vols dans les véhicules_fait_2016_2017] [int] NULL,
	[Vols dans les véhicules_Tauxpourmille_2016_2017] [float] NULL,
	[Coups et blessures volontaires_fait_2016_2017] [int] NULL,
	[Coups et blessures volontaires_Tauxpourmille_2016_2017] [float] NULL,
	[Vols sans violence contre des personnes_fait_2016_2017] [int] NULL,
	[Vols sans violence contre des personnes_Tauxpourmille_2016_2017] [float] NULL,
	[Cambriolages de logement_fait_2016_2017] [int] NULL,
	[Cambriolages de logement_Tauxpourmille_2016_2017] [float] NULL,
	[Vols violents sans arme_fait_2016_2017] [int] NULL,
	[Vols violents sans arme_Tauxpourmille_2016_2017] [float] NULL,
	[Autres coups et blessures volontaires_fait_2016_2017] [int] NULL,
	[Autres coups et blessures volontaires_Tauxpourmille_2016_2017] [float] NULL
);
CREATE TABLE [MSPR_BIGDATA].[dbo].[DRV_Evolution_2022_2017]
(
    [Code département] [varchar](3),
	[Vols de véhicules_fait_2022_2017] [int] ,
	[Vols de véhicules_Tauxpourmille_2022_2017] [float] ,
	[Vols d'accessoires sur véhicules_fait_2022_2017] [int] ,
	[Vols d'accessoires sur véhicules_Tauxpourmille_2022_2017] [float] ,
	[Coups et blessures volontaires intrafamiliaux_fait_2022_2017] [int] ,
	[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2022_2017] [float] ,
	[Vols avec armes_fait_2022_2017] [int] ,
	[Vols avec armes_Tauxpourmille_2022_2017] [float] ,
	[Violences sexuelles_fait_2022_2017] [int] ,
	[Violences sexuelles_Tauxpourmille_2022_2017] [float] NULL,
	[Destructions et dégradations volontaires_fait_2022_2017] [int] NULL,
	[Destructions et dégradations volontaires_Tauxpourmille_2022_2017] [float] NULL,
	[Vols dans les véhicules_fait_2022_2017] [int] NULL,
	[Vols dans les véhicules_Tauxpourmille_2022_2017] [float] NULL,
	[Coups et blessures volontaires_fait_2022_2017] [int] NULL,
	[Coups et blessures volontaires_Tauxpourmille_2022_2017] [float] NULL,
	[Vols sans violence contre des personnes_fait_2022_2017] [int] NULL,
	[Vols sans violence contre des personnes_Tauxpourmille_2022_2017] [float] NULL,
	[Cambriolages de logement_fait_2022_2017] [int] NULL,
	[Cambriolages de logement_Tauxpourmille_2022_2017] [float] NULL,
	[Vols violents sans arme_fait_2022_2017] [int] NULL,
	[Vols violents sans arme_Tauxpourmille_2022_2017] [float] NULL,
	[Autres coups et blessures volontaires_fait_2022_2017] [int] NULL,
	[Autres coups et blessures volontaires_Tauxpourmille_2022_2017] [float] NULL
);
-- Insérer les données des différences entre 2016 et 2017 dans la table finale
INSERT INTO [MSPR_BIGDATA].[dbo].[DRV_Evolution_2016_2017]
SELECT 
    t16.[Code département],
    t17.[Vols de véhicules_fait_2017] - t16.[Vols de véhicules_fait_2016] AS [Vols de véhicules_fait_2016_2017],
    t17.[Vols de véhicules_Tauxpourmille_2017] - t16.[Vols de véhicules_Tauxpourmille_2016] AS [Vols de véhicules_Tauxpourmille_2016_2017],
    t17.[Vols d'accessoires sur véhicules_fait_2017] - t16.[Vols d'accessoires sur véhicules_fait_2016] AS [Vols d'accessoires sur véhicules_fait_2016_2017],
    t17.[Vols d'accessoires sur véhicules_Tauxpourmille_2017] - t16.[Vols d'accessoires sur véhicules_Tauxpourmille_2016] AS [Vols d'accessoires sur véhicules_Tauxpourmille_2016_2017],
    t17.[Coups et blessures volontaires intrafamiliaux_fait_2017] - t16.[Coups et blessures volontaires intrafamiliaux_fait_2016] AS [Coups et blessures volontaires intrafamiliaux_fait_2016_2017],
    t17.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2017] - t16.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2016] AS [Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2016_2017],
    t17.[Vols avec armes_fait_2017] - t16.[Vols avec armes_fait_2016] AS [Vols avec armes_fait_2016_2017],
    t17.[Vols avec armes_Tauxpourmille_2017] - t16.[Vols avec armes_Tauxpourmille_2016] AS [Vols avec armes_Tauxpourmille_2016_2017],
    t17.[Violences sexuelles_fait_2017] - t16.[Violences sexuelles_fait_2016] AS [Violences sexuelles_fait_2016_2017],
    t17.[Violences sexuelles_Tauxpourmille_2017] - t16.[Violences sexuelles_Tauxpourmille_2016] AS [Violences sexuelles_Tauxpourmille_2016_2017],
    t17.[Destructions et dégradations volontaires_fait_2017] - t16.[Destructions et dégradations volontaires_fait_2016] AS [Destructions et dégradations volontaires_fait_2016_2017],
    t17.[Destructions et dégradations volontaires_Tauxpourmille_2017] - t16.[Destructions et dégradations volontaires_Tauxpourmille_2016] AS [Destructions et dégradations volontaires_Tauxpourmille_2016_2017],
    t17.[Vols dans les véhicules_fait_2017] - t16.[Vols dans les véhicules_fait_2016] AS [Vols dans les véhicules_fait_2016_2017],
    t17.[Vols dans les véhicules_Tauxpourmille_2017] - t16.[Vols dans les véhicules_Tauxpourmille_2016] AS [Vols dans les véhicules_Tauxpourmille_2016_2017],
    t17.[Coups et blessures volontaires_fait_2017] - t16.[Coups et blessures volontaires_fait_2016] AS [Coups et blessures volontaires_fait_2016_2017],
    t17.[Coups et blessures volontaires_Tauxpourmille_2017] - t16.[Coups et blessures volontaires_Tauxpourmille_2016] AS [Coups et blessures volontaires_Tauxpourmille_2016_2017],
    t17.[Vols sans violence contre des personnes_fait_2017] - t16.[Vols sans violence contre des personnes_fait_2016] AS [Vols sans violence contre des personnes_fait_2016_2017],
    t17.[Vols sans violence contre des personnes_Tauxpourmille_2017] - t16.[Vols sans violence contre des personnes_Tauxpourmille_2016] AS [Vols sans violence contre des personnes_Tauxpourmille_2016_2017],
    t17.[Cambriolages de logement_fait_2017] - t16.[Cambriolages de logement_fait_2016] AS [Cambriolages de logement_fait_2016_2017],
    t17.[Cambriolages de logement_Tauxpourmille_2017] - t16.[Cambriolages de logement_Tauxpourmille_2016] AS [Cambriolages de logement_Tauxpourmille_2016_2017],
    t17.[Vols violents sans arme_fait_2017] - t16.[Vols violents sans arme_fait_2016] AS [Vols violents sans arme_fait_2016_2017],
    t17.[Vols violents sans arme_Tauxpourmille_2017] - t16.[Vols violents sans arme_Tauxpourmille_2016] AS [Vols violents sans arme_Tauxpourmille_2016_2017],
    t17.[Autres coups et blessures volontaires_fait_2017] - t16.[Autres coups et blessures volontaires_fait_2016] AS [Autres coups et blessures volontaires_fait_2016_2017],
    t17.[Autres coups et blessures volontaires_Tauxpourmille_2017] - t16.[Autres coups et blessures volontaires_Tauxpourmille_2016] AS [Autres coups et blessures volontaires_Tauxpourmille_2016_2017]
FROM #Temp_2016 t16
JOIN #Temp_2017 t17 ON t16.[Code département] = t17.[Code département];

INSERT INTO [MSPR_BIGDATA].[dbo].[DRV_Evolution_2022_2017]
SELECT 
    t22.[Code département],
    t22.[Vols de véhicules_fait_2022] - t17.[Vols de véhicules_fait_2017] AS [Vols de véhicules_fait_2022_2017],
    t22.[Vols de véhicules_Tauxpourmille_2022] - t17.[Vols de véhicules_Tauxpourmille_2017] AS [Vols de véhicules_Tauxpourmille_2022_2017],
    t22.[Vols d'accessoires sur véhicules_fait_2022] - t17.[Vols d'accessoires sur véhicules_fait_2017] AS [Vols d'accessoires sur véhicules_fait_2022_2017],
    t22.[Vols d'accessoires sur véhicules_Tauxpourmille_2022] - t17.[Vols d'accessoires sur véhicules_Tauxpourmille_2017] AS [Vols d'accessoires sur véhicules_Tauxpourmille_2022_2017],
    t22.[Coups et blessures volontaires intrafamiliaux_fait_2022] - t17.[Coups et blessures volontaires intrafamiliaux_fait_2017] AS [Coups et blessures volontaires intrafamiliaux_fait_2022_2017],
    t22.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2022] - t17.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2017] AS [Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2022_2017],
    t22.[Vols avec armes_fait_2022] - t17.[Vols avec armes_fait_2017] AS [Vols avec armes_fait_2022_2017],
    t22.[Vols avec armes_Tauxpourmille_2022] - t17.[Vols avec armes_Tauxpourmille_2017] AS [Vols avec armes_Tauxpourmille_2022_2017],
    t22.[Violences sexuelles_fait_2022] - t17.[Violences sexuelles_fait_2017] AS [Violences sexuelles_fait_2022_2017],
    t22.[Violences sexuelles_Tauxpourmille_2022] - t17.[Violences sexuelles_Tauxpourmille_2017] AS [Violences sexuelles_Tauxpourmille_2022_2017],
    t22.[Destructions et dégradations volontaires_fait_2022] - t17.[Destructions et dégradations volontaires_fait_2017] AS [Destructions et dégradations volontaires_fait_2022_2017],
    t22.[Destructions et dégradations volontaires_Tauxpourmille_2022] - t17.[Destructions et dégradations volontaires_Tauxpourmille_2017] AS [Destructions et dégradations volontaires_Tauxpourmille_2022_2017],
    t22.[Vols dans les véhicules_fait_2022] - t17.[Vols dans les véhicules_fait_2017] AS [Vols dans les véhicules_fait_2022_2017],
    t22.[Vols dans les véhicules_Tauxpourmille_2022] - t17.[Vols dans les véhicules_Tauxpourmille_2017] AS [Vols dans les véhicules_Tauxpourmille_2022_2017],
    t22.[Coups et blessures volontaires_fait_2022] - t17.[Coups et blessures volontaires_fait_2017] AS [Coups et blessures volontaires_fait_2022_2017],
    t22.[Coups et blessures volontaires_Tauxpourmille_2022] - t17.[Coups et blessures volontaires_Tauxpourmille_2017] AS [Coups et blessures volontaires_Tauxpourmille_2022_2017],
    t22.[Vols sans violence contre des personnes_fait_2022] - t17.[Vols sans violence contre des personnes_fait_2017] AS [Vols sans violence contre des personnes_fait_2022_2017],
    t22.[Vols sans violence contre des personnes_Tauxpourmille_2022] - t17.[Vols sans violence contre des personnes_Tauxpourmille_2017] AS [Vols sans violence contre des personnes_Tauxpourmille_2022_2017],
    t22.[Cambriolages de logement_fait_2022] - t17.[Cambriolages de logement_fait_2017] AS [Cambriolages de logement_fait_2022_2017],
    t22.[Cambriolages de logement_Tauxpourmille_2022] - t17.[Cambriolages de logement_Tauxpourmille_2017] AS [Cambriolages de logement_Tauxpourmille_2022_2017],
    t22.[Vols violents sans arme_fait_2022] - t17.[Vols violents sans arme_fait_2017] AS [Vols violents sans arme_fait_2022_2017],
    t22.[Vols violents sans arme_Tauxpourmille_2022] - t17.[Vols violents sans arme_Tauxpourmille_2017] AS [Vols violents sans arme_Tauxpourmille_2022_2017],
    t22.[Autres coups et blessures volontaires_fait_2022] - t17.[Autres coups et blessures volontaires_fait_2017] AS [Autres coups et blessures volontaires_fait_2022_2017],
    t22.[Autres coups et blessures volontaires_Tauxpourmille_2022] - t17.[Autres coups et blessures volontaires_Tauxpourmille_2017] AS [Autres coups et blessures volontaires_Tauxpourmille_2022_2017]
FROM #Temp_2017 t17
JOIN #Temp_2022 t22 ON t17.[Code département] = t22.[Code département];

SELECT t1.[Code département],
       t1.[Vols de véhicules_fait_2016_2017],
       t1.[Vols de véhicules_Tauxpourmille_2016_2017],
       t1.[Vols d'accessoires sur véhicules_fait_2016_2017],
       t1.[Vols d'accessoires sur véhicules_Tauxpourmille_2016_2017],
       t1.[Coups et blessures volontaires intrafamiliaux_fait_2016_2017],
       t1.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2016_2017],
       t1.[Vols avec armes_fait_2016_2017],
       t1.[Vols avec armes_Tauxpourmille_2016_2017],
       t1.[Violences sexuelles_fait_2016_2017],
       t1.[Violences sexuelles_Tauxpourmille_2016_2017],
       t1.[Destructions et dégradations volontaires_fait_2016_2017],
       t1.[Destructions et dégradations volontaires_Tauxpourmille_2016_2017],
       t1.[Vols dans les véhicules_fait_2016_2017],
       t1.[Vols dans les véhicules_Tauxpourmille_2016_2017],
       t1.[Coups et blessures volontaires_fait_2016_2017],
       t1.[Coups et blessures volontaires_Tauxpourmille_2016_2017],
       t1.[Vols sans violence contre des personnes_fait_2016_2017],
       t1.[Vols sans violence contre des personnes_Tauxpourmille_2016_2017],
       t1.[Cambriolages de logement_fait_2016_2017],
       t1.[Cambriolages de logement_Tauxpourmille_2016_2017],
       t1.[Vols violents sans arme_fait_2016_2017],
       t1.[Vols violents sans arme_Tauxpourmille_2016_2017],
       t1.[Autres coups et blessures volontaires_fait_2016_2017],
       t1.[Autres coups et blessures volontaires_Tauxpourmille_2016_2017],
       t2.[Vols de véhicules_fait_2022_2017],
       t2.[Vols de véhicules_Tauxpourmille_2022_2017],
       t2.[Vols d'accessoires sur véhicules_fait_2022_2017],
       t2.[Vols d'accessoires sur véhicules_Tauxpourmille_2022_2017],
       t2.[Coups et blessures volontaires intrafamiliaux_fait_2022_2017],
       t2.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2022_2017],
       t2.[Vols avec armes_fait_2022_2017],
       t2.[Vols avec armes_Tauxpourmille_2022_2017],
       t2.[Violences sexuelles_fait_2022_2017],
       t2.[Violences sexuelles_Tauxpourmille_2022_2017],
       t2.[Destructions et dégradations volontaires_fait_2022_2017],
       t2.[Destructions et dégradations volontaires_Tauxpourmille_2022_2017],
       t2.[Vols dans les véhicules_fait_2022_2017],
       t2.[Vols dans les véhicules_Tauxpourmille_2022_2017],
       t2.[Coups et blessures volontaires_fait_2022_2017],
       t2.[Coups et blessures volontaires_Tauxpourmille_2022_2017],
       t2.[Vols sans violence contre des personnes_fait_2022_2017],
       t2.[Vols sans violence contre des personnes_Tauxpourmille_2022_2017],
       t2.[Cambriolages de logement_fait_2022_2017],
       t2.[Cambriolages de logement_Tauxpourmille_2022_2017],
       t2.[Vols violents sans arme_fait_2022_2017],
       t2.[Vols violents sans arme_Tauxpourmille_2022_2017],
       t2.[Autres coups et blessures volontaires_fait_2022_2017],
       t2.[Autres coups et blessures volontaires_Tauxpourmille_2022_2017]
INTO [MSPR_BIGDATA].[dbo].[DRV_Evolution_Securite]
FROM [MSPR_BIGDATA].[dbo].[DRV_Evolution_2016_2017] t1
INNER JOIN [MSPR_BIGDATA].[dbo].[DRV_Evolution_2022_2017] t2
ON t1.[Code département] = t2.[Code département];
--(101 rows affected)

Drop table #Temp_2017
Drop table #Temp_2022
Drop table #Temp_2016
Drop table [DRV_Evolution_2022_2017]
Drop table [DRV_Evolution_2016_2017]



END