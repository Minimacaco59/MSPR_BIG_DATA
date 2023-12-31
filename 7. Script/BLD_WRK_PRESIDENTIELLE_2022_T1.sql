USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_PRESIDENTIELLE_2022_T1]    Script Date: 09/08/2023 11:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_PRESIDENTIELLE_2022_T1]
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
If OBJECT_ID('WRK_PRESIDENTIELLE_2022_T1') IS NOT NULL
Drop Table [dbo].[WRK_PRESIDENTIELLE_2022_T1]

-- =============================================
-- Create Table 
-- =============================================
CREATE TABLE [WRK_PRESIDENTIELLE_2022_T1]
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
Truncate Table [dbo].[WRK_PRESIDENTIELLE_2022_T1]

-- =============================================
-- Insert Into
-- =============================================
INSERT INTO [MSPR_BIGDATA].[dbo].[WRK_PRESIDENTIELLE_2022_T1]
SELECT Right('000' + [Code du département],3)
     , [Libellé du département]
     , [Inscrits]
     , [Abstentions]
     , [% Abs Ins]
     , [Votants]
     , [% Vot Ins]
     , [Exprimés]
     , [% Exp Ins]
     , [% Exp Vot]
     , [Candidat].[Sexe]
     , [Candidat].[Nom]
     , [Candidat].[Prénom]
     , [Candidat].[Voix]
     , [Candidat].[% Voix Ins]
     , [Candidat].[% Voix Exp]
     , [Blancs]
     , [% Blancs Ins]
     , [% Blancs Vot]
     , [Nuls]
     , [% Nuls Ins]
     , [% Nuls Vot]
	 , [Tendance] 
FROM [MSPR_BIGDATA].[dbo].[Raw_2022resultats-par-niveau-dpt-t1-france-entiere]
CROSS APPLY (
   VALUES 
	 (1, [Sexe], [Nom], [Prénom], [Voix], [% Voix Ins], [% Voix Exp]),
     (2, [Column1], [_1], [_2], [_3], [_4], [_5]),
     (3, [_6], [_7], [_8], [_9], [_10], [_11]),
     (4, [_12], [_13], [_14], [_15], [_16], [_17]),
	 (5, [_18], [_19], [_20], [_21], [_22], [_23]),
	 (6, [_24], [_25], [_26], [_27], [_28], [_29]),
	 (7, [_30], [_31], [_32], [_33], [_34], [_35]),
	 (8, [_36], [_37], [_38], [_39], [_40], [_41]),
	 (9, [_42], [_43], [_44], [_45], [_46], [_47]),
	 (10, [_48], [_49], [_50], [_51], [_52], [_53]),
	 (11, [_54], [_55], [_56], [_57], [_58], [_59]),
	 (12, [_60], [_61], [_62], [_63], [_64], [_65])
) AS [Candidat] ([CandidatID], [Sexe], [Nom], [Prénom], [Voix], [% Voix Ins], [% Voix Exp])
JOIN [MSPR_BIGDATA].[dbo].[Tendance] TC ON [Candidat].[Nom] = TC.[Nom]
-- (1284 rows affected)



END


/*
	Select *
	FROM [DSTRAINING].[dbo].[WRK_PRESIDENTIELLE_2022_T1]
	Select *
	FROM [DSTRAINING].[dbo].[Raw_2022resultats-par-niveau-dpt-t1-france-entiere]

*/
