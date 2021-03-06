USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[SvodOTCH]    Script Date: 11/12/2015 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROC [dbo].[SvodOTCH]
@Data1 date,
@Data2 date
AS
Begin
Select Postavshik.N_Post, NaimPost, Marka, Model, 
SUM(BazCena + Cena) AS Summa,
COUNT(AVTO.KodTovara) AS KolProdano, 
COUNT(N_Reklam) AS KolReklamac
from Postavshik, AVTO, Dog, Reklamac
where Postavshik.N_Post=AVTO.N_Post and AVTO.KodTovara=Dog.KodTovara and Dog.N_Dog=Reklamac.N_Dog and (Dog.DataZakluch>=@Data1 and Dog.DataZakluch<=@Data2)
GROUP BY  Postavshik.N_Post, NaimPost,  AVTO.KodTovara, Marka, Model;
End
