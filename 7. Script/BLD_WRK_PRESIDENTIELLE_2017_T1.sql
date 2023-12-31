USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_PRESIDENTIELLE_2017_T1]    Script Date: 09/08/2023 11:21:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_PRESIDENTIELLE_2017_T1]
-- =============================================
-- Author: Alexandre Favre
-- Create date: 07/07/2023
-- Description:	Raw -> WRK
-- Mod Date: 
-- =============================================
AS
BEGIN

-- =============================================
-- Drop Table
-- =============================================
If OBJECT_ID('WRK_PRESIDENTIELLE_2017_T1') IS NOT NULL
Drop Table [dbo].[WRK_PRESIDENTIELLE_2017_T1]

-- =============================================
-- Create Table 
-- =============================================
CREATE TABLE [WRK_PRESIDENTIELLE_2017_T1]
(    [Code du département]		VARCHAR(3)	
     , [Libellé du département]	VARCHAR(100)
     , [Inscrits]				INT
     , [Abstentions]			INT
     , [% Abs/Ins]				FLOAT
     , [Votants]				INT
     , [% Vot/Ins]				FLOAT
     , [Exprimés]				INT
     , [% Exp/Ins]				FLOAT
     , [% Exp/Vot]				FLOAT
     , [Sexe]					VARCHAR(1)
     , [Nom]					VARCHAR(50)
     , [Prénom]					VARCHAR(50)
     , [Voix]					INT
     , [% Voix/Ins]				FLOAT
     , [% Voix/Exp]				FLOAT
     , [Blancs]					INT
     , [% Blancs/Ins]			FLOAT
     , [% Blancs/Vot]			FLOAT
     , [Nuls]					INT
     , [% Nuls/Ins]				FLOAT
     , [% Nuls/Vot]				FLOAT
	 , [Tendance]				VARCHAR(50)
	  )

-- =============================================
-- Truncate Table
-- =============================================
Truncate Table [dbo].[WRK_PRESIDENTIELLE_2017_T1]

-- =============================================
-- Insert Into
-- =============================================
INSERT INTO [MSPR_BIGDATA].[dbo].[WRK_PRESIDENTIELLE_2017_T1]
SELECT 
	Right('000'+[Code du département],3) AS [Code du département]
     , [Libellé du département]
     , [Inscrits]
     , [Abstentions]
     , [% Abs/Ins]
     , [Votants]
     , [% Vot/Ins]
     , [Exprimés]
     , [% Exp/Ins]
     , [% Exp/Vot]
     , [Candidat].[Sexe]
     , [Candidat].[Nom]
     , [Candidat].[Prénom]
     , [Candidat].[Voix]
     , [Candidat].[% Voix/Ins]
     , [Candidat].[% Voix/Exp]
     , [Blancs]
     , [% Blancs/Ins]
     , [% Blancs/Vot]
     , [Nuls]
     , [% Nuls/Ins]
     , [% Nuls/Vot]
	 , [Tendance] 
FROM [MSPR_BIGDATA].[dbo].[Raw_Presidentielle_2017_T1]
CROSS APPLY (
   VALUES 
	 (1, [Sexe], [Nom], [Prénom], [Voix], [% Voix/Ins], [% Voix/Exp]),
     (2, [Sexe1], [Nom1], [Prénom1], [Voix1], [% Voix/Ins1], [% Voix/Exp1]),
     (3, [Sexe2], [Nom2], [Prénom2], [Voix2], [% Voix/Ins2], [% Voix/Exp2]),
     (4, [Sexe3], [Nom3], [Prénom3], [Voix3], [% Voix/Ins3], [% Voix/Exp3]),
	 (5, [Sexe4], [Nom4], [Prénom4], [Voix4], [% Voix/Ins4], [% Voix/Exp4]),
	 (6, [Sexe5], [Nom5], [Prénom5], [Voix5], [% Voix/Ins5], [% Voix/Exp5]),
	 (7, [Sexe6], [Nom6], [Prénom6], [Voix6], [% Voix/Ins6], [% Voix/Exp6]),
	 (8, [Sexe7], [Nom7], [Prénom7], [Voix7], [% Voix/Ins7], [% Voix/Exp7]),
	 (9, [Sexe8], [Nom8], [Prénom8], [Voix8], [% Voix/Ins8], [% Voix/Exp8]),
	 (10, [Sexe9], [Nom9], [Prénom9], [Voix9], [% Voix/Ins9], [% Voix/Exp9]),
	 (10, [Sexe10], [Nom10], [Prénom10], [Voix10], [% Voix/Ins10], [% Voix/Exp10])
) AS [Candidat] ([CandidatID], [Sexe], [Nom], [Prénom], [Voix], [% Voix/Ins], [% Voix/Exp])
JOIN [MSPR_BIGDATA].[dbo].[Tendance] TC ON [Candidat].[Nom] = TC.[Nom]
-- (1166 rows affected)



END


/*
	Select *
	FROM [MSPR_BIGDATA].[dbo].[WRK_PRESIDENTIELLE_2017_T1]
	Select *
	FROM [MSPR_BIGDATA].[dbo].[Raw_Presidentielle_2017_T1]

*/
