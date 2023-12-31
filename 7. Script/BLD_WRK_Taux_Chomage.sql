USE [MSPR_BIGDATA]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_Taux_Chomage]    Script Date: 09/08/2023 11:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[BLD_WRK_Taux_Chomage]
-- =============================================
-- Author:		
-- Create date: 
-- Description:	Raw -> WRK
-- Mod Date: 
-- =============================================
AS
BEGIN

-- =============================================
-- Drop Table
-- =============================================
If OBJECT_ID('WRK_Taux_Chomage') IS NOT NULL
Drop Table [dbo].[WRK_Taux_Chomage]

-- =============================================
-- Truncate Table
-- =============================================
Truncate Table [dbo].[WRK_Taux_Chomage]

-- =============================================
-- Insert Into
-- =============================================
SELECT
    [Libellé],
    [idBank],
    [Dernière mise à jour],
    [Période],
    AVG([1982-T1] + [1982-T2] + [1982-T3] + [1982-T4]) / 4 AS [Moyenne_1982],
    AVG([1983-T1] + [1983-T2] + [1983-T3] + [1983-T4]) / 4 AS [Moyenne_1983],
    AVG([1984-T1] + [1984-T2] + [1984-T3] + [1984-T4]) / 4 AS [Moyenne_1984],
    AVG([1985-T1] + [1985-T2] + [1985-T3] + [1985-T4]) / 4 AS [Moyenne_1985],
    AVG([1986-T1] + [1986-T2] + [1986-T3] + [1986-T4]) / 4 AS [Moyenne_1986],
    AVG([1987-T1] + [1987-T2] + [1987-T3] + [1987-T4]) / 4 AS [Moyenne_1987],
    AVG([1988-T1] + [1988-T2] + [1988-T3] + [1988-T4]) / 4 AS [Moyenne_1988],
    AVG([1989-T1] + [1989-T2] + [1989-T3] + [1989-T4]) / 4 AS [Moyenne_1989],
    AVG([1990-T1] + [1990-T2] + [1990-T3] + [1990-T4]) / 4 AS [Moyenne_1990],
    AVG([1991-T1] + [1991-T2] + [1991-T3] + [1991-T4]) / 4 AS [Moyenne_1991],
    AVG([1992-T1] + [1992-T2] + [1992-T3] + [1992-T4]) / 4 AS [Moyenne_1992],
    AVG([1993-T1] + [1993-T2] + [1993-T3] + [1993-T4]) / 4 AS [Moyenne_1993],
    AVG([1994-T1] + [1994-T2] + [1994-T3] + [1994-T4]) / 4 AS [Moyenne_1994],
    AVG([1995-T1] + [1995-T2] + [1995-T3] + [1995-T4]) / 4 AS [Moyenne_1995],
    AVG([1996-T1] + [1996-T2] + [1996-T3] + [1996-T4]) / 4 AS [Moyenne_1996],
    AVG([1997-T1] + [1997-T2] + [1997-T3] + [1997-T4]) / 4 AS [Moyenne_1997],
    AVG([1998-T1] + [1998-T2] + [1998-T3] + [1998-T4]) / 4 AS [Moyenne_1998],
    AVG([1999-T1] + [1999-T2] + [1999-T3] + [1999-T4]) / 4 AS [Moyenne_1999],
    AVG([2000-T1] + [2000-T2] + [2000-T3] + [2000-T4]) / 4 AS [Moyenne_2000],
    AVG([2001-T1] + [2001-T2] + [2001-T3] + [2001-T4]) / 4 AS [Moyenne_2001],
    AVG([2002-T1] + [2002-T2] + [2002-T3] + [2002-T4]) / 4 AS [Moyenne_2002],
    AVG([2003-T1] + [2003-T2] + [2003-T3] + [2003-T4]) / 4 AS [Moyenne_2003],
    AVG([2004-T1] + [2004-T2] + [2004-T3] + [2004-T4]) / 4 AS [Moyenne_2004],
    AVG([2005-T1] + [2005-T2] + [2005-T3] + [2005-T4]) / 4 AS [Moyenne_2005],
    AVG([2006-T1] + [2006-T2] + [2006-T3] + [2006-T4]) / 4 AS [Moyenne_2006],
    AVG([2007-T1] + [2007-T2] + [2007-T3] + [2007-T4]) / 4 AS [Moyenne_2007],
    AVG([2008-T1] + [2008-T2] + [2008-T3] + [2008-T4]) / 4 AS [Moyenne_2008],
    AVG([2009-T1] + [2009-T2] + [2009-T3] + [2009-T4]) / 4 AS [Moyenne_2009],
    AVG([2010-T1] + [2010-T2] + [2010-T3] + [2010-T4]) / 4 AS [Moyenne_2010],
    AVG([2011-T1] + [2011-T2] + [2011-T3] + [2011-T4]) / 4 AS [Moyenne_2011],
    AVG([2012-T1] + [2012-T2] + [2012-T3] + [2012-T4]) / 4 AS [Moyenne_2012],
    AVG([2013-T1] + [2013-T2] + [2013-T3] + [2013-T4]) / 4 AS [Moyenne_2013],
    AVG([2014-T1] + [2014-T2] + [2014-T3] + [2014-T4]) / 4 AS [Moyenne_2014],
    AVG([2015-T1] + [2015-T2] + [2015-T3] + [2015-T4]) / 4 AS [Moyenne_2015],
    AVG([2016-T1] + [2016-T2] + [2016-T3] + [2016-T4]) / 4 AS [Moyenne_2016],
    AVG([2017-T1] + [2017-T2] + [2017-T3] + [2017-T4]) / 4 AS [Moyenne_2017],
    AVG([2018-T1] + [2018-T2] + [2018-T3] + [2018-T4]) / 4 AS [Moyenne_2018],
    AVG([2019-T1] + [2019-T2] + [2019-T3] + [2019-T4]) / 4 AS [Moyenne_2019],
    AVG([2020-T1] + [2020-T2] + [2020-T3] + [2020-T4]) / 4 AS [Moyenne_2020],
    AVG([2021-T1] + [2021-T2] + [2021-T3] + [2021-T4]) / 4 AS [Moyenne_2021],
    AVG([2022-T1] + [2022-T2] + [2022-T3] + [2022-T4]) / 4 AS [Moyenne_2022],
    AVG([2023-T1]) AS [Moyenne_2023]
Into [MSPR_BIGDATA].[dbo].[WRK_Taux_Chomage]
FROM [MSPR_BIGDATA].[dbo].[Raw_Taux_de_chomage_20230718]
GROUP BY
    [Libellé],
    [idBank],
    [Dernière mise à jour],
    [Période]
-- (Avertissement : la valeur NULL est éliminée par un agrégat ou par une autre opération SET.)
-- (100 rows affected)


END


/*
	Select *
	FROM [DSTRAINING].[dbo].[WRK_Taux_Chomage]
	Select *
	FROM [DSTRAINING].[dbo].[Raw_Taux_de_chomage_20230718]

*/
