USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[Vvod_Reklamac]    Script Date: 10/20/2015 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Vvod_Reklamac]
@DataReklam Date,
@N_Dog Int,
@Neisprav Char (80),
@Rezult Char (80),
@SummaUbit Numeric (10,2)
as
INSERT INTO Reklamac (DataReklam, N_Dog, Neisprav, Rezult, SummaUbit)  values  (@DataReklam, @N_Dog, @Neisprav, @Rezult, @SummaUbit)  
