USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[Vvod_Postavshik]    Script Date: 10/25/2015 20:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Vvod_Postavshik]
@NaimPost Char (30)
as
INSERT INTO Postavshik(NaimPost) values  (@NaimPost)

