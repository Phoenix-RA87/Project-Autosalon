USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[Vvod_AVTO]    Script Date: 10/25/2015 20:48:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Vvod_AVTO]
@Marka Char (30),
@Model Char (30),
@DataPostav Date,
@N_Sertif Int,
@BazCena Numeric(10,2),
@Moshnost Int,
@N_Post Int,
@RashodTopliva Int,
@TipKorobki Char (30),
@Proizvod Char (50),
@Obem Int
as
INSERT INTO  AVTO (Marka, Model, DataPostav, N_Sertif, BazCena, Moshnost, N_Post, RashodTopliva, TipKorobki, Proizvod, Obem) values (@Marka, @Model, @DataPostav, @N_Sertif, @BazCena, @Moshnost, @N_Post, @RashodTopliva, @TipKorobki, @Proizvod, @Obem)
