USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_ELECTION_Evolution_Tx_Chomage_Securite]    Script Date: 09/08/2023 11:23:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_ELECTION_Evolution_Tx_Chomage_Securite]
-- =============================================
-- Author:	Alexandre, Favre	
-- Create date: 20230714
-- Description:	WRK -> DRV
--				
-- Mod Date: 
-- =============================================
AS
BEGIN
SELECT e.[Code du département],
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
       e.[Evolution_Tx_Chomage],
       -- Columns from DRV_Evolution_Securite for year 2017
       CASE e.[Année]
           WHEN 2017 THEN v.[Vols de véhicules_fait_2016_2017]
           WHEN 2022 THEN v.[Vols de véhicules_fait_2022_2017]
           ELSE NULL
       END AS [Vols de véhicules_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Vols de véhicules_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Vols de véhicules_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Vols de véhicules_Tauxpourmille],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Vols d'accessoires sur véhicules_fait_2016_2017]
           WHEN 2022 THEN v.[Vols d'accessoires sur véhicules_fait_2022_2017]
           ELSE NULL
       END AS [Vols d'accessoires sur véhicules_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Vols d'accessoires sur véhicules_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Vols d'accessoires sur véhicules_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Vols d'accessoires sur véhicules_Tauxpourmille],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Coups et blessures volontaires intrafamiliaux_fait_2016_2017]
           WHEN 2022 THEN v.[Coups et blessures volontaires intrafamiliaux_fait_2022_2017]
           ELSE NULL
       END AS [Coups et blessures volontaires intrafamiliaux_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Coups et blessures volontaires intrafamiliaux_Tauxpourmille_2022_2017]
		   ELSE NULL
       END AS [Coups et blessures volontaires intrafamiliaux_Tauxpourmille],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Vols avec armes_fait_2016_2017]
           WHEN 2022 THEN v.[Vols avec armes_fait_2022_2017]
           ELSE NULL
       END AS [Vols avec armes_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Vols avec armes_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Vols avec armes_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Vols avec armes_Tauxpourmille],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Violences sexuelles_fait_2016_2017]
           WHEN 2022 THEN v.[Violences sexuelles_fait_2022_2017]
           ELSE NULL
       END AS [Violences sexuelles_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Violences sexuelles_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Violences sexuelles_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Violences sexuelles_Tauxpourmille],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Destructions et dégradations volontaires_fait_2016_2017]
           WHEN 2022 THEN v.[Destructions et dégradations volontaires_fait_2022_2017]
           ELSE NULL
       END AS [Destructions et dégradations volontaires_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Destructions et dégradations volontaires_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Destructions et dégradations volontaires_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Destructions et dégradations volontaires_Tauxpourmille],
	    CASE e.[Année]
           WHEN 2017 THEN v.[Vols dans les véhicules_fait_2016_2017]
           WHEN 2022 THEN v.[Vols dans les véhicules_fait_2022_2017]
           ELSE NULL
       END AS [Vols dans les véhicules_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Vols dans les véhicules_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Vols dans les véhicules_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Vols dans les véhicules_Tauxpourmille],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Coups et blessures volontaires_fait_2016_2017]
           WHEN 2022 THEN v.[Coups et blessures volontaires_fait_2022_2017]
           ELSE NULL
       END AS [Coups et blessures volontaires_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Coups et blessures volontaires_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Coups et blessures volontaires_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Coups et blessures volontaires_Tauxpourmille],
	    CASE e.[Année]
           WHEN 2017 THEN v.[Vols sans violence contre des personnes_fait_2016_2017]
           WHEN 2022 THEN v.[Vols sans violence contre des personnes_fait_2022_2017]
           ELSE NULL
       END AS [Vols sans violence contre des personnes_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Vols sans violence contre des personnes_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Vols sans violence contre des personnes_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Vols sans violence contre des personnes],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Cambriolages de logement_fait_2016_2017]
           WHEN 2022 THEN v.[Cambriolages de logement_fait_2022_2017]
           ELSE NULL
       END AS [Cambriolages de logement_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Cambriolages de logement_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Cambriolages de logement_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Cambriolages de logement],
	   CASE e.[Année]
           WHEN 2017 THEN v.[Vols violents sans arme_fait_2016_2017]
           WHEN 2022 THEN v.[Vols violents sans arme_fait_2022_2017]
           ELSE NULL
       END AS [Vols violents sans arme_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Vols violents sans arme_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Vols violents sans arme_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Vols violents sans arme],
       CASE e.[Année]
           WHEN 2017 THEN v.[Autres coups et blessures volontaires_fait_2016_2017]
           WHEN 2022 THEN v.[Autres coups et blessures volontaires_fait_2022_2017]
           ELSE NULL
       END AS [Autres coups et blessures volontaires_fait],
       CASE e.[Année]
           WHEN 2017 THEN v.[Autres coups et blessures volontaires_Tauxpourmille_2016_2017]
           WHEN 2022 THEN v.[Autres coups et blessures volontaires_Tauxpourmille_2022_2017]
           ELSE NULL
       END AS [Autres coups et blessures volontaires_Tauxpourmille]
INTO [MSPR_BIGDATA].[dbo].[DRV_ELECTION_Evolution_Tx_Chomage_Securite]	          
FROM [MSPR_BIGDATA].[dbo].[DRV_ELECTION_Evolution_Tx_Chomage] e
INNER JOIN [MSPR_BIGDATA].[dbo].[DRV_Evolution_Securite] v
ON e.[Code du département] = v.[Code département]
AND e.[Année] IN (2017, 2022);

--(1065 rows affected)

/*
select count(*)
from [MSPR_BIGDATA].[dbo].[DRV_ELECTION_Evolution_Tx_Chomage_Securite]
-- 960
select count(*)
from DRV_Evolution_Securite
--101

select count(DISTINCT[Code du département])
from [MSPR_BIGDATA].[dbo].[DRV_ELECTION_Evolution_Tx_Chomage]
-- 1065
*/

END