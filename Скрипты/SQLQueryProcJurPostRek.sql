USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[JurPostRek]    Script Date: 11/06/2015 11:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROC [dbo].[JurPostRek]
@D1 date,
@D2 date
AS
Begin
Select  N_Reklam, DataReklam, Dog.N_Dog, FIOPokup, Postavshik.N_Post, NaimPost, Marka, Model, Neisprav, Rezult, SummaUbit 
from Reklamac, Postavshik, Dog, AVTO
where Reklamac.N_Dog=Dog.N_Dog and Postavshik.N_Post=AVTO.N_Post and AVTO.KodTovara=Dog.KodTovara and  DataReklam>=@D1 and DataReklam<=@D2
GROUP BY Dog.N_Dog, N_Reklam, DataReklam, Dog.N_Dog, FIOPokup, Postavshik.N_Post, NaimPost, Marka, Model, Neisprav, Rezult, SummaUbit;
end

