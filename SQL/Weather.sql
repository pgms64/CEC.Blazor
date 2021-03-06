USE [master]
GO
/****** Object:  Database [Weather]    Script Date: 15/09/2020 14:59:04 ******/
CREATE DATABASE [Weather]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WeatherForecast', FILENAME = N'C:\Users\Shaun.Obsidian\WeatherForecast.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WeatherForecast_log', FILENAME = N'C:\Users\Shaun.Obsidian\WeatherForecast_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Weather] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Weather].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Weather] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Weather] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Weather] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Weather] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Weather] SET ARITHABORT OFF 
GO
ALTER DATABASE [Weather] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Weather] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Weather] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Weather] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Weather] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Weather] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Weather] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Weather] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Weather] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Weather] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Weather] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Weather] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Weather] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Weather] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Weather] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Weather] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Weather] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Weather] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Weather] SET  MULTI_USER 
GO
ALTER DATABASE [Weather] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Weather] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Weather] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Weather] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Weather] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Weather] SET QUERY_STORE = OFF
GO
USE [Weather]
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
USE [Weather]
GO
/****** Object:  Table [dbo].[WeatherForecast]    Script Date: 15/09/2020 14:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeatherForecast](
	[WeatherForecastID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [smalldatetime] NOT NULL,
	[TemperatureC] [decimal](4, 1) NOT NULL,
	[Frost] [bit] NOT NULL,
	[SummaryValue] [int] NOT NULL,
	[OutlookValue] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[PostCode] [varchar](50) NULL,
	[Detail] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_WeatherForecast]    Script Date: 15/09/2020 14:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_WeatherForecast]
AS
SELECT        WeatherForecastID AS ID, Date, TemperatureC, Frost, Description, PostCode, Detail, SummaryValue, OutlookValue, 'Forecast For ' + CONVERT(VARCHAR(50), Date, 106) AS DisplayName
FROM            dbo.WeatherForecast
GO
SET IDENTITY_INSERT [dbo].[WeatherForecast] ON 

INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1, CAST(N'2020-05-08T00:00:00' AS SmallDateTime), CAST(31.0 AS Decimal(4, 1)), 0, 10, 1, N'The Weather forecast for Friday 08 May 2020 is mostly Wet and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (2, CAST(N'2020-05-09T00:00:00' AS SmallDateTime), CAST(23.0 AS Decimal(4, 1)), 1, 9, 2, N'The Weather forecast for Saturday 09 May 2020 is mostly Wet and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (3, CAST(N'2020-12-12T00:00:00' AS SmallDateTime), CAST(21.0 AS Decimal(4, 1)), 1, 3, 1, N'ghgfhgfhgghhgfhf', N'GL2 8LJ', N'fgdgfd')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (4, CAST(N'2020-05-11T00:00:00' AS SmallDateTime), CAST(6.0 AS Decimal(4, 1)), 0, 5, 0, N'The Weather forecast for Monday 11 May 2020 is mostly Sunny and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (5, CAST(N'2020-05-12T00:00:00' AS SmallDateTime), CAST(17.0 AS Decimal(4, 1)), 1, 0, 1, N'The Weather forecast for Tuesday 12 May 2020 is mostly Cloudy and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (6, CAST(N'2020-05-13T00:00:00' AS SmallDateTime), CAST(19.0 AS Decimal(4, 1)), 1, 6, 0, N'The Weather forecast for Wednesday 13 May 2020 is mostly Sunny and Warm', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (7, CAST(N'2020-05-14T00:00:00' AS SmallDateTime), CAST(-1.0 AS Decimal(4, 1)), 1, 9, 2, N'The Weather forecast for Thursday 14 May 2020 is mostly Wet and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (8, CAST(N'2020-05-15T00:00:00' AS SmallDateTime), CAST(30.0 AS Decimal(4, 1)), 0, 3, 2, N'The Weather forecast for Friday 15 May 2020 is mostly Wet and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (9, CAST(N'2020-05-16T00:00:00' AS SmallDateTime), CAST(11.0 AS Decimal(4, 1)), 0, 9, 1, N'The Weather forecast for Saturday 16 May 2020 is mostly Wet and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (10, CAST(N'2020-05-17T00:00:00' AS SmallDateTime), CAST(29.0 AS Decimal(4, 1)), 1, 7, 2, N'The Weather forecast for Sunday 17 May 2020 is mostly Cloudy and Balmy', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (11, CAST(N'2020-05-18T00:00:00' AS SmallDateTime), CAST(28.0 AS Decimal(4, 1)), 0, 2, 1, N'The Weather forecast for Monday 18 May 2020 is mostly Cloudy and Bracing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (12, CAST(N'2020-05-19T00:00:00' AS SmallDateTime), CAST(17.0 AS Decimal(4, 1)), 0, 3, 0, N'The Weather forecast for Tuesday 19 May 2020 is mostly Sunny and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (13, CAST(N'2020-05-20T00:00:00' AS SmallDateTime), CAST(32.0 AS Decimal(4, 1)), 0, 1, 0, N'The Weather forecast for Wednesday 20 May 2020 is mostly Sunny and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (14, CAST(N'2020-05-21T00:00:00' AS SmallDateTime), CAST(-4.0 AS Decimal(4, 1)), 1, 4, 2, N'The Weather forecast for Thursday 21 May 2020 is mostly Wet and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (15, CAST(N'2020-05-22T00:00:00' AS SmallDateTime), CAST(2.0 AS Decimal(4, 1)), 0, 0, 2, N'The Weather forecast for Friday 22 May 2020 is mostly Wet and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (16, CAST(N'2020-05-23T00:00:00' AS SmallDateTime), CAST(13.0 AS Decimal(4, 1)), 0, 5, 1, N'The Weather forecast for Saturday 23 May 2020 is mostly Cloudy and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (17, CAST(N'2020-05-24T00:00:00' AS SmallDateTime), CAST(-1.0 AS Decimal(4, 1)), 1, 10, 0, N'The Weather forecast for Sunday 24 May 2020 is mostly Sunny and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (18, CAST(N'2020-05-25T00:00:00' AS SmallDateTime), CAST(11.0 AS Decimal(4, 1)), 0, 5, 0, N'The Weather forecast for Monday 25 May 2020 is mostly Sunny and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (19, CAST(N'2020-05-26T00:00:00' AS SmallDateTime), CAST(-2.0 AS Decimal(4, 1)), 1, 4, 1, N'The Weather forecast for Tuesday 26 May 2020 is mostly Cloudy and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (20, CAST(N'2020-05-27T00:00:00' AS SmallDateTime), CAST(12.0 AS Decimal(4, 1)), 0, 0, 1, N'The Weather forecast for Wednesday 27 May 2020 is mostly Cloudy and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (21, CAST(N'2020-05-28T00:00:00' AS SmallDateTime), CAST(32.0 AS Decimal(4, 1)), 0, 4, 0, N'The Weather forecast for Thursday 28 May 2020 is mostly Sunny and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (22, CAST(N'2020-05-29T00:00:00' AS SmallDateTime), CAST(17.0 AS Decimal(4, 1)), 0, 8, 2, N'The Weather forecast for Friday 29 May 2020 is mostly Wet and Hot', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (23, CAST(N'2020-05-30T00:00:00' AS SmallDateTime), CAST(23.0 AS Decimal(4, 1)), 0, 9, 1, N'The Weather forecast for Saturday 30 May 2020 is mostly Cloudy and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (24, CAST(N'2020-05-31T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 10, 2, N'The Weather forecast for Sunday 31 May 2020 is mostly Wet and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (25, CAST(N'2020-06-01T00:00:00' AS SmallDateTime), CAST(17.0 AS Decimal(4, 1)), 0, 5, 2, N'The Weather forecast for Monday 01 June 2020 is mostly Wet and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (26, CAST(N'2020-06-02T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 3, 2, N'The Weather forecast for Tuesday 02 June 2020 is mostly Wet and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (27, CAST(N'2020-06-03T00:00:00' AS SmallDateTime), CAST(1.0 AS Decimal(4, 1)), 0, 6, 2, N'The Weather forecast for Wednesday 03 June 2020 is mostly Wet and Warm', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (28, CAST(N'2020-06-04T00:00:00' AS SmallDateTime), CAST(11.0 AS Decimal(4, 1)), 0, 9, 0, N'The Weather forecast for Thursday 04 June 2020 is mostly Sunny and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (29, CAST(N'2020-06-05T00:00:00' AS SmallDateTime), CAST(26.0 AS Decimal(4, 1)), 0, 9, 2, N'The Weather forecast for Friday 05 June 2020 is mostly Wet and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (30, CAST(N'2020-06-06T00:00:00' AS SmallDateTime), CAST(22.0 AS Decimal(4, 1)), 0, 2, 1, N'The Weather forecast for Saturday 06 June 2020 is mostly Cloudy and Bracing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (31, CAST(N'2020-06-07T00:00:00' AS SmallDateTime), CAST(-2.0 AS Decimal(4, 1)), 1, 9, 2, N'The Weather forecast for Sunday 07 June 2020 is mostly Wet and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (32, CAST(N'2020-06-08T00:00:00' AS SmallDateTime), CAST(19.0 AS Decimal(4, 1)), 0, 0, 0, N'The Weather forecast for Monday 08 June 2020 is mostly Sunny and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (33, CAST(N'2020-06-09T00:00:00' AS SmallDateTime), CAST(10.0 AS Decimal(4, 1)), 0, 6, 2, N'The Weather forecast for Tuesday 09 June 2020 is mostly Wet and Warm', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (34, CAST(N'2020-06-10T00:00:00' AS SmallDateTime), CAST(9.0 AS Decimal(4, 1)), 0, 7, 0, N'The Weather forecast for Wednesday 10 June 2020 is mostly Sunny and Balmy', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (35, CAST(N'2020-06-11T00:00:00' AS SmallDateTime), CAST(24.0 AS Decimal(4, 1)), 0, 3, 0, N'The Weather forecast for Thursday 11 June 2020 is mostly Sunny and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (36, CAST(N'2020-06-12T00:00:00' AS SmallDateTime), CAST(2.0 AS Decimal(4, 1)), 0, 4, 1, N'The Weather forecast for Friday 12 June 2020 is mostly Cloudy and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (37, CAST(N'2020-06-13T00:00:00' AS SmallDateTime), CAST(7.0 AS Decimal(4, 1)), 0, 10, 2, N'The Weather forecast for Saturday 13 June 2020 is mostly Wet and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (38, CAST(N'2020-06-14T00:00:00' AS SmallDateTime), CAST(16.0 AS Decimal(4, 1)), 0, 1, 0, N'The Weather forecast for Sunday 14 June 2020 is mostly Sunny and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (39, CAST(N'2020-06-15T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 4, 1, N'The Weather forecast for Monday 15 June 2020 is mostly Cloudy and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (40, CAST(N'2020-06-16T00:00:00' AS SmallDateTime), CAST(33.0 AS Decimal(4, 1)), 0, 1, 2, N'The Weather forecast for Tuesday 16 June 2020 is mostly Wet and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (41, CAST(N'2020-06-17T00:00:00' AS SmallDateTime), CAST(24.0 AS Decimal(4, 1)), 0, 1, 2, N'The Weather forecast for Wednesday 17 June 2020 is mostly Wet and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (42, CAST(N'2020-06-18T00:00:00' AS SmallDateTime), CAST(6.0 AS Decimal(4, 1)), 0, 4, 0, N'The Weather forecast for Thursday 18 June 2020 is mostly Sunny and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (43, CAST(N'2020-06-19T00:00:00' AS SmallDateTime), CAST(34.0 AS Decimal(4, 1)), 0, 6, 2, N'The Weather forecast for Friday 19 June 2020 is mostly Wet and Warm', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (44, CAST(N'2020-06-20T00:00:00' AS SmallDateTime), CAST(9.0 AS Decimal(4, 1)), 0, 3, 1, N'The Weather forecast for Saturday 20 June 2020 is mostly Cloudy and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (45, CAST(N'2020-06-21T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 0, 0, N'The Weather forecast for Sunday 21 June 2020 is mostly Sunny and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (46, CAST(N'2020-06-22T00:00:00' AS SmallDateTime), CAST(9.0 AS Decimal(4, 1)), 0, 4, 0, N'The Weather forecast for Monday 22 June 2020 is mostly Sunny and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (47, CAST(N'2020-06-23T00:00:00' AS SmallDateTime), CAST(31.0 AS Decimal(4, 1)), 0, 1, 1, N'The Weather forecast for Tuesday 23 June 2020 is mostly Cloudy and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (48, CAST(N'2020-06-24T00:00:00' AS SmallDateTime), CAST(5.0 AS Decimal(4, 1)), 0, 5, 1, N'The Weather forecast for Wednesday 24 June 2020 is mostly Cloudy and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (49, CAST(N'2020-06-25T00:00:00' AS SmallDateTime), CAST(1.0 AS Decimal(4, 1)), 0, 7, 2, N'The Weather forecast for Thursday 25 June 2020 is mostly Wet and Balmy', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (50, CAST(N'2020-06-26T00:00:00' AS SmallDateTime), CAST(25.0 AS Decimal(4, 1)), 0, 3, 2, N'The Weather forecast for Friday 26 June 2020 is mostly Wet and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (51, CAST(N'2020-06-27T00:00:00' AS SmallDateTime), CAST(-2.0 AS Decimal(4, 1)), 1, 10, 1, N'The Weather forecast for Saturday 27 June 2020 is mostly Cloudy and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (52, CAST(N'2020-06-28T00:00:00' AS SmallDateTime), CAST(-5.0 AS Decimal(4, 1)), 1, 3, 0, N'The Weather forecast for Sunday 28 June 2020 is mostly Sunny and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (53, CAST(N'2020-06-29T00:00:00' AS SmallDateTime), CAST(30.0 AS Decimal(4, 1)), 0, 5, 1, N'The Weather forecast for Monday 29 June 2020 is mostly Cloudy and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (54, CAST(N'2020-06-30T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 10, 0, N'The Weather forecast for Tuesday 30 June 2020 is mostly Sunny and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (55, CAST(N'2020-07-01T00:00:00' AS SmallDateTime), CAST(9.0 AS Decimal(4, 1)), 0, 2, 0, N'The Weather forecast for Wednesday 01 July 2020 is mostly Sunny and Bracing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (56, CAST(N'2020-07-02T00:00:00' AS SmallDateTime), CAST(32.0 AS Decimal(4, 1)), 0, 9, 1, N'The Weather forecast for Thursday 02 July 2020 is mostly Cloudy and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (57, CAST(N'2020-07-03T00:00:00' AS SmallDateTime), CAST(26.0 AS Decimal(4, 1)), 0, 8, 1, N'The Weather forecast for Friday 03 July 2020 is mostly Cloudy and Hot', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (58, CAST(N'2020-07-04T00:00:00' AS SmallDateTime), CAST(-1.0 AS Decimal(4, 1)), 1, 0, 0, N'The Weather forecast for Saturday 04 July 2020 is mostly Sunny and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (59, CAST(N'2020-07-05T00:00:00' AS SmallDateTime), CAST(6.0 AS Decimal(4, 1)), 0, 6, 2, N'The Weather forecast for Sunday 05 July 2020 is mostly Wet and Warm', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (60, CAST(N'2020-07-06T00:00:00' AS SmallDateTime), CAST(2.0 AS Decimal(4, 1)), 0, 8, 0, N'The Weather forecast for Monday 06 July 2020 is mostly Sunny and Hot', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (61, CAST(N'2020-07-07T00:00:00' AS SmallDateTime), CAST(7.0 AS Decimal(4, 1)), 0, 7, 0, N'The Weather forecast for Tuesday 07 July 2020 is mostly Sunny and Balmy', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (62, CAST(N'2020-07-08T00:00:00' AS SmallDateTime), CAST(13.0 AS Decimal(4, 1)), 0, 9, 1, N'The Weather forecast for Wednesday 08 July 2020 is mostly Cloudy and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (63, CAST(N'2020-07-09T00:00:00' AS SmallDateTime), CAST(30.0 AS Decimal(4, 1)), 0, 5, 1, N'The Weather forecast for Thursday 09 July 2020 is mostly Cloudy and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (64, CAST(N'2020-07-10T00:00:00' AS SmallDateTime), CAST(19.0 AS Decimal(4, 1)), 0, 1, 0, N'The Weather forecast for Friday 10 July 2020 is mostly Sunny and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (65, CAST(N'2020-07-11T00:00:00' AS SmallDateTime), CAST(9.0 AS Decimal(4, 1)), 0, 2, 0, N'The Weather forecast for Saturday 11 July 2020 is mostly Sunny and Bracing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (66, CAST(N'2020-07-12T00:00:00' AS SmallDateTime), CAST(0.0 AS Decimal(4, 1)), 0, 10, 1, N'The Weather forecast for Sunday 12 July 2020 is mostly Cloudy and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (2301, CAST(N'2020-09-04T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 1, 0, 0, N'kjllkjl;kj', N'GL2 9LJ', N' l;kjl;kj')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (67, CAST(N'2020-07-13T00:00:00' AS SmallDateTime), CAST(21.0 AS Decimal(4, 1)), 0, 5, 0, N'The Weather forecast for Monday 13 July 2020 is mostly Sunny and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (68, CAST(N'2020-07-14T00:00:00' AS SmallDateTime), CAST(27.0 AS Decimal(4, 1)), 0, 6, 2, N'The Weather forecast for Tuesday 14 July 2020 is mostly Wet and Warm', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (69, CAST(N'2020-07-15T00:00:00' AS SmallDateTime), CAST(23.0 AS Decimal(4, 1)), 0, 0, 2, N'The Weather forecast for Wednesday 15 July 2020 is mostly Wet and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (70, CAST(N'2020-07-16T00:00:00' AS SmallDateTime), CAST(26.0 AS Decimal(4, 1)), 0, 9, 1, N'The Weather forecast for Thursday 16 July 2020 is mostly Cloudy and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (71, CAST(N'2020-07-17T00:00:00' AS SmallDateTime), CAST(30.0 AS Decimal(4, 1)), 0, 2, 2, N'The Weather forecast for Friday 17 July 2020 is mostly Wet and Bracing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (72, CAST(N'2020-07-18T00:00:00' AS SmallDateTime), CAST(22.0 AS Decimal(4, 1)), 0, 0, 2, N'The Weather forecast for Saturday 18 July 2020 is mostly Wet and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (73, CAST(N'2020-07-19T00:00:00' AS SmallDateTime), CAST(5.0 AS Decimal(4, 1)), 0, 7, 2, N'The Weather forecast for Sunday 19 July 2020 is mostly Wet and Balmy', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (74, CAST(N'2020-07-20T00:00:00' AS SmallDateTime), CAST(9.0 AS Decimal(4, 1)), 0, 2, 2, N'The Weather forecast for Monday 20 July 2020 is mostly Wet and Bracing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (75, CAST(N'2020-07-21T00:00:00' AS SmallDateTime), CAST(2.0 AS Decimal(4, 1)), 0, 3, 0, N'The Weather forecast for Tuesday 21 July 2020 is mostly Sunny and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (76, CAST(N'2020-07-22T00:00:00' AS SmallDateTime), CAST(2.0 AS Decimal(4, 1)), 0, 4, 2, N'The Weather forecast for Wednesday 22 July 2020 is mostly Wet and Cool', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (77, CAST(N'2020-07-23T00:00:00' AS SmallDateTime), CAST(29.0 AS Decimal(4, 1)), 0, 1, 2, N'The Weather forecast for Thursday 23 July 2020 is mostly Wet and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (78, CAST(N'2020-07-24T00:00:00' AS SmallDateTime), CAST(22.0 AS Decimal(4, 1)), 0, 3, 2, N'The Weather forecast for Friday 24 July 2020 is mostly Wet and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (79, CAST(N'2020-07-25T00:00:00' AS SmallDateTime), CAST(19.0 AS Decimal(4, 1)), 0, 3, 0, N'The Weather forecast for Saturday 25 July 2020 is mostly Sunny and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (80, CAST(N'2020-07-26T00:00:00' AS SmallDateTime), CAST(8.0 AS Decimal(4, 1)), 0, 8, 1, N'The Weather forecast for Sunday 26 July 2020 is mostly Cloudy and Hot', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (81, CAST(N'2020-07-27T00:00:00' AS SmallDateTime), CAST(31.0 AS Decimal(4, 1)), 0, 9, 0, N'The Weather forecast for Monday 27 July 2020 is mostly Sunny and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (82, CAST(N'2020-07-28T00:00:00' AS SmallDateTime), CAST(25.0 AS Decimal(4, 1)), 0, 1, 0, N'The Weather forecast for Tuesday 28 July 2020 is mostly Sunny and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (83, CAST(N'2020-07-29T00:00:00' AS SmallDateTime), CAST(23.0 AS Decimal(4, 1)), 0, 3, 2, N'The Weather forecast for Wednesday 29 July 2020 is mostly Wet and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (84, CAST(N'2020-07-30T00:00:00' AS SmallDateTime), CAST(8.0 AS Decimal(4, 1)), 0, 10, 0, N'The Weather forecast for Thursday 30 July 2020 is mostly Sunny and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (85, CAST(N'2020-07-31T00:00:00' AS SmallDateTime), CAST(-2.0 AS Decimal(4, 1)), 1, 10, 1, N'The Weather forecast for Friday 31 July 2020 is mostly Cloudy and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (86, CAST(N'2020-08-01T00:00:00' AS SmallDateTime), CAST(33.0 AS Decimal(4, 1)), 0, 9, 1, N'The Weather forecast for Saturday 01 August 2020 is mostly Cloudy and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (87, CAST(N'2020-08-02T00:00:00' AS SmallDateTime), CAST(16.0 AS Decimal(4, 1)), 0, 0, 1, N'The Weather forecast for Sunday 02 August 2020 is mostly Cloudy and Unknown', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (88, CAST(N'2020-08-03T00:00:00' AS SmallDateTime), CAST(27.0 AS Decimal(4, 1)), 0, 8, 2, N'The Weather forecast for Monday 03 August 2020 is mostly Wet and Hot', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (89, CAST(N'2020-08-04T00:00:00' AS SmallDateTime), CAST(23.0 AS Decimal(4, 1)), 0, 1, 0, N'The Weather forecast for Tuesday 04 August 2020 is mostly Sunny and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (90, CAST(N'2020-08-05T00:00:00' AS SmallDateTime), CAST(5.0 AS Decimal(4, 1)), 0, 2, 1, N'The Weather forecast for Wednesday 05 August 2020 is mostly Cloudy and Bracing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (91, CAST(N'2020-08-06T00:00:00' AS SmallDateTime), CAST(14.0 AS Decimal(4, 1)), 0, 8, 2, N'The Weather forecast for Thursday 06 August 2020 is mostly Wet and Hot', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (92, CAST(N'2020-08-07T00:00:00' AS SmallDateTime), CAST(5.0 AS Decimal(4, 1)), 0, 3, 2, N'The Weather forecast for Friday 07 August 2020 is mostly Wet and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (93, CAST(N'2020-08-08T00:00:00' AS SmallDateTime), CAST(31.0 AS Decimal(4, 1)), 0, 7, 1, N'The Weather forecast for Saturday 08 August 2020 is mostly Cloudy and Balmy', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (94, CAST(N'2020-08-09T00:00:00' AS SmallDateTime), CAST(22.0 AS Decimal(4, 1)), 0, 1, 1, N'The Weather forecast for Sunday 09 August 2020 is mostly Cloudy and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (95, CAST(N'2020-08-10T00:00:00' AS SmallDateTime), CAST(10.0 AS Decimal(4, 1)), 0, 10, 0, N'The Weather forecast for Monday 10 August 2020 is mostly Sunny and Scorching', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (96, CAST(N'2020-08-11T00:00:00' AS SmallDateTime), CAST(24.0 AS Decimal(4, 1)), 0, 9, 0, N'The Weather forecast for Tuesday 11 August 2020 is mostly Sunny and Sweltering', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (97, CAST(N'2020-08-12T00:00:00' AS SmallDateTime), CAST(-4.0 AS Decimal(4, 1)), 1, 5, 0, N'The Weather forecast for Wednesday 12 August 2020 is mostly Sunny and Mild', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (98, CAST(N'2020-08-13T00:00:00' AS SmallDateTime), CAST(-5.0 AS Decimal(4, 1)), 1, 3, 2, N'The Weather forecast for Thursday 13 August 2020 is mostly Wet and Chilly', N'GL2 5TP', N'')
GO
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (99, CAST(N'2020-08-14T00:00:00' AS SmallDateTime), CAST(30.0 AS Decimal(4, 1)), 0, 1, 2, N'The Weather forecast for Friday 14 August 2020 is mostly Wet and Freezing', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (100, CAST(N'2020-08-15T00:00:00' AS SmallDateTime), CAST(24.0 AS Decimal(4, 1)), 0, 3, 1, N'The Weather forecast for Saturday 15 August 2020 is mostly Cloudy and Chilly', N'GL2 5TP', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (301, CAST(N'2020-08-18T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 2, 0, N'kjh kjh kjhkjh kj h', N'GL2 9LJ', N' kjhkjh')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1301, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'hjgjhgjhg jhg jh gjh g', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1302, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'hjgjhgjhg jhg jh gjh g', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1303, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'hjgjhgjhg jhg jh gjh g', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1304, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'hjgjhgjhg jhg jh gjh g', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1306, CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(10.0 AS Decimal(4, 1)), 0, 1, 1, NULL, N'GL2 8KK', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1307, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'hjgjhgjhg jhg jh gjh g', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1310, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'm,m,m,n ,mn ,m,m n,mn ', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1311, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 3, 0, N'jhjkhjkh', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (2302, CAST(N'2020-09-04T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 1, 0, 0, N'klkjlkjlkjlkjlkj', N'GL2 7LJ', N' lkjlkjlkjlkj')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1308, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'jhjkjkjkh kjkjhkjhkjh', N'GL2 9LJ', N'')
INSERT [dbo].[WeatherForecast] ([WeatherForecastID], [Date], [TemperatureC], [Frost], [SummaryValue], [OutlookValue], [Description], [PostCode], [Detail]) VALUES (1309, CAST(N'2020-09-03T00:00:00' AS SmallDateTime), CAST(20.0 AS Decimal(4, 1)), 0, 1, 0, N'jhjkjkjkh kjkjhkjhkjh', N'GL2 9LJ', N'')
SET IDENTITY_INSERT [dbo].[WeatherForecast] OFF
ALTER TABLE [dbo].[WeatherForecast] ADD  CONSTRAINT [DF_WeatherForecast_Frost]  DEFAULT ((0)) FOR [Frost]
GO
/****** Object:  StoredProcedure [dbo].[sp_Create_WeatherForecast]    Script Date: 15/09/2020 14:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shaun Curtis
-- Create date: 10 Aug-2020
-- Description:	Adds a new WeatherForecast Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_Create_WeatherForecast]
	@ID int output
	,@Date smalldatetime
    ,@TemperatureC decimal(4,1)
    ,@Frost bit
    ,@SummaryValue int
    ,@OutlookValue int
    ,@Description varchar(max)
    ,@PostCode varchar(50)
    ,@Detail varchar(max)
AS
BEGIN
INSERT INTO [dbo].[WeatherForecast]
           ([Date]
           ,[TemperatureC]
           ,[Frost]
           ,[SummaryValue]
           ,[OutlookValue]
           ,[Description]
           ,[PostCode]
           ,[Detail])
     VALUES (
			@Date
           ,@TemperatureC
           ,@Frost
           ,@SummaryValue
           ,@OutlookValue
           ,@Description
           ,@PostCode
           ,@Detail
		   )

SELECT @ID  = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_WeatherForecast]    Script Date: 15/09/2020 14:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shaun Curtis
-- Create date: 10 Aug-2020
-- Description:	Deletes a WeatherForecast Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_Delete_WeatherForecast]
	@ID int
AS
BEGIN
DELETE FROM 
	WeatherForecast
 WHERE 
	WeatherForecastID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_WeatherForecast]    Script Date: 15/09/2020 14:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shaun Curtis
-- Create date: 10 Aug-2020
-- Description:	Updates a WeatherForecast Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_Update_WeatherForecast]
	@ID int
	,@Date smalldatetime
    ,@TemperatureC decimal(4,1)
    ,@Frost bit
    ,@SummaryValue int
    ,@OutlookValue int
    ,@Description varchar(max)
    ,@PostCode varchar(50)
    ,@Detail varchar(max)
AS
BEGIN
UPDATE WeatherForecast
   SET [Date] = @Date
      ,[TemperatureC] = @TemperatureC
      ,[Frost] = @Frost
      ,[SummaryValue] = @SummaryValue
      ,[OutlookValue] = @OutlookValue
      ,[Description] = @Description
      ,[PostCode] = @PostCode
      ,[Detail] = @Detail
 WHERE 
	WeatherForecastID = @ID
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "WeatherForecast"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1905
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_WeatherForecast'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_WeatherForecast'
GO
USE [master]
GO
ALTER DATABASE [Weather] SET  READ_WRITE 
GO
