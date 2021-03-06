USE [master]
GO
/****** Object:  Database [Globomantics]    Script Date: 5/4/2020 11:38:05 AM ******/
CREATE DATABASE [Globomantics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Globomantics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Globomantics.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Globomantics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Globomantics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Globomantics] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Globomantics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Globomantics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Globomantics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Globomantics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Globomantics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Globomantics] SET ARITHABORT OFF 
GO
ALTER DATABASE [Globomantics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Globomantics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Globomantics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Globomantics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Globomantics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Globomantics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Globomantics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Globomantics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Globomantics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Globomantics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Globomantics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Globomantics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Globomantics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Globomantics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Globomantics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Globomantics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Globomantics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Globomantics] SET RECOVERY FULL 
GO
ALTER DATABASE [Globomantics] SET  MULTI_USER 
GO
ALTER DATABASE [Globomantics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Globomantics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Globomantics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Globomantics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Globomantics] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Globomantics', N'ON'
GO
ALTER DATABASE [Globomantics] SET QUERY_STORE = OFF
GO
USE [Globomantics]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Globomantics]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 5/4/2020 11:38:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 5/4/2020 11:38:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [varchar](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Birthday] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesActivities]    Script Date: 5/4/2020 11:38:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesActivities](
	[EmployeeID] [varchar](8) NOT NULL,
	[ActivityId] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Activities] ([Id], [Title], [Description], [Points]) VALUES (1, N'Daily Steps', N'...', 10)
INSERT [dbo].[Activities] ([Id], [Title], [Description], [Points]) VALUES (2, N'Daily Meditation', N'...', 5)
INSERT [dbo].[Activities] ([Id], [Title], [Description], [Points]) VALUES (3, N'Biometric Screening', N'...', 50)
INSERT [dbo].[Activities] ([Id], [Title], [Description], [Points]) VALUES (4, N'Lose 10% Weight', N'...', 1000)
ALTER TABLE [dbo].[EmployeesActivities]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesActivities_Activities] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activities] ([Id])
GO
ALTER TABLE [dbo].[EmployeesActivities] CHECK CONSTRAINT [FK_EmployeesActivities_Activities]
GO
ALTER TABLE [dbo].[EmployeesActivities]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesActivities_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmployeesActivities] CHECK CONSTRAINT [FK_EmployeesActivities_Employees]
GO
USE [master]
GO
ALTER DATABASE [Globomantics] SET  READ_WRITE 
GO

CREATE TABLE TEMP_Activities ([Id] varchar(4) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Points] varchar(5) NOT NULL)
	GO
CREATE View vw_tempActivities AS
SELECT CONVERT(int, ID) As ID, CONVERT(nvarchar(50), Title) AS Title, CONVERT(nvarchar(max), Description) as Description, CONVERT(int, Points) as Points FROM TEMP_Activities
GO
CREATE PROCEDURE InsertNewActivities
 AS
INSERT INTO Activities (Id, Title, Description, Points)
SELECT TA.ID, TA.Title, TA.Description, TA.Points from vw_TempActivities TA
LEFT JOIN Activities A ON TA.Id = A.ID WHERE A.ID IS NULL
GO