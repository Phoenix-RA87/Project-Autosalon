USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[Vvod_Dog]    Script Date: 10/25/2015 20:49:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Vvod_Dog]
@FIOPokup Char (30),
@AdresKlienta Char (50),
@Cena Numeric(10,2),
@DataZakluch Date,
@N_Dvig Int,
@KodTovara Int,
@N_kuzova Int
as
INSERT INTO Dog(FIOPokup, AdresKlienta, Cena, DataZakluch, N_Dvig, KodTovara, N_kuzova) values (@FIOPokup, @AdresKlienta, @Cena, @DataZakluch, @N_Dvig, @KodTovara, @N_kuzova)

