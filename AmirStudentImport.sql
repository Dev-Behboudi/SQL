USE [master]
GO
/****** Object:  Database [AmirStudents]    Script Date: 1/25/2024 9:36:30 PM ******/
CREATE DATABASE [AmirStudents]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AmirStudents', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AmirStudents.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AmirStudents_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AmirStudents_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AmirStudents] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AmirStudents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AmirStudents] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AmirStudents] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AmirStudents] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AmirStudents] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AmirStudents] SET ARITHABORT OFF 
GO
ALTER DATABASE [AmirStudents] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AmirStudents] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AmirStudents] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AmirStudents] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AmirStudents] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AmirStudents] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AmirStudents] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AmirStudents] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AmirStudents] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AmirStudents] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AmirStudents] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AmirStudents] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AmirStudents] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AmirStudents] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AmirStudents] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AmirStudents] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AmirStudents] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AmirStudents] SET RECOVERY FULL 
GO
ALTER DATABASE [AmirStudents] SET  MULTI_USER 
GO
ALTER DATABASE [AmirStudents] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AmirStudents] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AmirStudents] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AmirStudents] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AmirStudents] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AmirStudents] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AmirStudents', N'ON'
GO
ALTER DATABASE [AmirStudents] SET QUERY_STORE = ON
GO
ALTER DATABASE [AmirStudents] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AmirStudents]
GO
/****** Object:  Table [dbo].[StudentsInfo]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsInfo](
	[student_id] [smallint] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](50) NOT NULL,
	[lname] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentsInfo] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentsUnits]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsUnits](
	[student_id] [smallint] NOT NULL,
	[unit_id] [smallint] NOT NULL,
 CONSTRAINT [PK_StudentsUnits] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitsInfo]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitsInfo](
	[unit_id] [smallint] IDENTITY(1,1) NOT NULL,
	[unit_name] [nvarchar](50) NOT NULL,
	[teacher_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UnitsInfo] PRIMARY KEY CLUSTERED 
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentsUnits]  WITH CHECK ADD  CONSTRAINT [FK_StudentsUnits_StudentsInfo] FOREIGN KEY([student_id])
REFERENCES [dbo].[StudentsInfo] ([student_id])
GO
ALTER TABLE [dbo].[StudentsUnits] CHECK CONSTRAINT [FK_StudentsUnits_StudentsInfo]
GO
ALTER TABLE [dbo].[StudentsUnits]  WITH CHECK ADD  CONSTRAINT [FK_StudentsUnits_UnitsInfo] FOREIGN KEY([unit_id])
REFERENCES [dbo].[UnitsInfo] ([unit_id])
GO
ALTER TABLE [dbo].[StudentsUnits] CHECK CONSTRAINT [FK_StudentsUnits_UnitsInfo]
GO
/****** Object:  StoredProcedure [dbo].[addStudent]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addStudent] @fname nvarchar(50), @lname nvarchar(50)
as
INSERT INTO StudentsInfo (fname, lname)
VALUES (@fname, @lname)
GO
/****** Object:  StoredProcedure [dbo].[addUnit]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[addUnit] @name nvarchar(50)
as
INSERT INTO UnitsInfo (unit_name)
VALUES (@name)
GO
/****** Object:  StoredProcedure [dbo].[deleteStudentByID]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteStudentByID] @ID smallint
as
DELETE FROM StudentsInfo WHERE student_id = @ID
GO
/****** Object:  StoredProcedure [dbo].[deleteUnitByID]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteUnitByID] @ID smallint
as
DELETE FROM UnitsInfo WHERE unit_id = @ID
GO
/****** Object:  StoredProcedure [dbo].[getAllStudents]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getAllStudents]
as
SELECT * FROM StudentsInfo
GO
/****** Object:  StoredProcedure [dbo].[getAllStudentsUnits]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllStudentsUnits]
AS
SELECT StudentsInfo.student_id AS [Student ID], StudentsInfo.fname + ' ' + StudentsInfo.lname As [Student's Name], StudentsUnits.unit_id AS [Unit ID],UnitsInfo.unit_name as [Unit Name] FROM StudentsInfo
LEFT JOIN StudentsUnits ON StudentsInfo.student_id = StudentsUnits.student_id
LEFT JOIN UnitsInfo ON StudentsUnits.unit_id = UnitsInfo.unit_id
GO
/****** Object:  StoredProcedure [dbo].[getAllUnits]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getAllUnits]
as
SELECT * FROM UnitsInfo
GO
/****** Object:  StoredProcedure [dbo].[getStudentByID]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getStudentByID] @ID smallint
as
SELECT * FROM StudentsInfo WHERE student_id = @ID
GO
/****** Object:  StoredProcedure [dbo].[getUnitByID]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getUnitByID] @ID smallint
as
SELECT * FROM UnitsInfo WHERE unit_id = @ID
GO
/****** Object:  StoredProcedure [dbo].[updateStudentInfoByID]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateStudentInfoByID] @ID smallint, @FNAME NVARCHAR(50), @LNAME NVARCHAR(50)
as
UPDATE StudentsInfo
SET fname = @FNAME , lname = @LNAME
WHERE student_id = @ID
GO
/****** Object:  StoredProcedure [dbo].[updateUnitInfoByID]    Script Date: 1/25/2024 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateUnitInfoByID] @ID smallint, @NAME NVARCHAR(50)
as
UPDATE UnitsInfo
SET unit_name = @NAME
WHERE unit_id = @ID
GO
USE [master]
GO
ALTER DATABASE [AmirStudents] SET  READ_WRITE 
GO
