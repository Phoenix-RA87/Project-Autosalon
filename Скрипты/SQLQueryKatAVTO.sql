USE [Roman_Kursovoy]
GO
/****** Object:  StoredProcedure [dbo].[KatAVTO]    Script Date: 11/13/2015 08:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROC [dbo].[KatAVTO]
@Data1 date
AS
select * from AVTO  

