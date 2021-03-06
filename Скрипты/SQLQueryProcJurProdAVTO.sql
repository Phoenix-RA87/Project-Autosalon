USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[JurProdAVTO]    Script Date: 11/12/2015 14:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROC [dbo].[JurProdAVTO]
@Data1 date,
@Data2 date
AS
Begin
Select Dog.N_Dog, FIOPokup, DataZakluch, Marka, Model, BazCena, N_Dvig, N_kuzova, Cena, 
SUM(BazCena + Cena) AS Summa,
COUNT(AVTO.KodTovara) 
from Reklamac, Postavshik, Dog, AVTO
where Reklamac.N_Dog=Dog.N_Dog and Postavshik.N_Post=AVTO.N_Post and AVTO.KodTovara=Dog.KodTovara
GROUP BY  Dog.N_Dog, FIOPokup, DataZakluch, Marka, Model, BazCena, N_Dvig, N_kuzova, Cena;
end
