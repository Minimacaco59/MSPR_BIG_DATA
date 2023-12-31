USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_Evolution_TX_Chomage]    Script Date: 09/08/2023 11:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_DRV_Evolution_TX_Chomage]
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
    Right('000'+SUBSTRING([Libellé], 1, CHARINDEX(' ', [Libellé]) - 1),3) AS [Code département],
    ([Moyenne_2017] - [Moyenne_2012]) AS [Évolution_2012_2017],
    ([Moyenne_2022] - [Moyenne_2017]) AS [Évolution_2017_2022]
INTO [MSPR_BIGDATA].[dbo].[DRV_Evolution_TX_Chomage]
FROM [MSPR_BIGDATA].[dbo].[WRK_Taux_Chomage]
-- (100 rows affected)


END