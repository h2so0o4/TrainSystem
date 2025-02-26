USE [master]
GO
/****** Object:  Database [TrainSystem]    Script Date: 11/25/2020 18:07:29 ******/
CREATE DATABASE [TrainSystem] ON  PRIMARY 
( NAME = N'TrainSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TrainSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrainSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TrainSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrainSystem] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrainSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrainSystem] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TrainSystem] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TrainSystem] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TrainSystem] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TrainSystem] SET ARITHABORT OFF
GO
ALTER DATABASE [TrainSystem] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TrainSystem] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TrainSystem] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TrainSystem] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TrainSystem] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TrainSystem] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TrainSystem] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TrainSystem] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TrainSystem] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TrainSystem] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TrainSystem] SET  DISABLE_BROKER
GO
ALTER DATABASE [TrainSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TrainSystem] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TrainSystem] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TrainSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TrainSystem] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TrainSystem] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TrainSystem] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TrainSystem] SET  READ_WRITE
GO
ALTER DATABASE [TrainSystem] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TrainSystem] SET  MULTI_USER
GO
ALTER DATABASE [TrainSystem] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TrainSystem] SET DB_CHAINING OFF
GO
USE [TrainSystem]
GO
/****** Object:  Table [dbo].[Site]    Script Date: 11/25/2020 18:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Site](
	[Site_Number] [int] IDENTITY(1,1) NOT NULL,
	[Site_Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY NONCLUSTERED 
(
	[Site_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Site_name] ON [dbo].[Site] 
(
	[Site_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Site] ON
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (1, N'安阳东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (2, N'鹤壁东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (3, N'新乡东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (4, N'郑州东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (5, N'兰考南')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (6, N'商丘')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (7, N'萧县北')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (8, N'徐州东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (9, N'宿州东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (10, N'南京南')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (11, N'镇江南')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (12, N'无锡东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (13, N'苏州北')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (14, N'上海虹桥')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (15, N'常州北')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (17, N'昆山南')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (18, N'嘉兴南')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (19, N'杭州东')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (20, N'绍兴北')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (21, N'余姚北')
INSERT [dbo].[Site] ([Site_Number], [Site_Name]) VALUES (22, N'宁波')
SET IDENTITY_INSERT [dbo].[Site] OFF
/****** Object:  Table [dbo].[Passenger]    Script Date: 11/25/2020 18:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger](
	[Id] [varchar](20) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Telephone] [varchar](11) NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Passenger] ([Id], [Name], [Telephone]) VALUES (N'340823200105300011', N'王诗剑', N'18856270152')
INSERT [dbo].[Passenger] ([Id], [Name], [Telephone]) VALUES (N'410711199912179010', N'刘天启', N'17637381104')
/****** Object:  Table [dbo].[Train]    Script Date: 11/25/2020 18:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Train](
	[Train_Number] [varchar](10) NOT NULL,
	[Train_Type] [varchar](4) NOT NULL,
	[Start_Location] [varchar](10) NOT NULL,
	[End_Location] [varchar](10) NOT NULL,
	[Start_Time] [time](7) NOT NULL,
	[Arrive_Time] [time](7) NOT NULL,
	[Train_Duration] [time](7) NOT NULL,
 CONSTRAINT [PK_Train] PRIMARY KEY CLUSTERED 
(
	[Train_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Train] ([Train_Number], [Train_Type], [Start_Location], [End_Location], [Start_Time], [Arrive_Time], [Train_Duration]) VALUES (N'G1813', N'高铁', N'安阳东', N'上海虹桥', CAST(0x070006B8224C0000 AS Time), CAST(0x0700620DF1800000 AS Time), CAST(0x07005C55CE340000 AS Time))
INSERT [dbo].[Train] ([Train_Number], [Train_Type], [Start_Location], [End_Location], [Start_Time], [Arrive_Time], [Train_Duration]) VALUES (N'G7505', N'高铁', N'镇江南', N'宁波', CAST(0x070098C7243F0000 AS Time), CAST(0x070032AD0F5C0000 AS Time), CAST(0x07009AE5EA1C0000 AS Time))
/****** Object:  Table [dbo].[Ticket]    Script Date: 11/25/2020 18:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[Ticket_Number] [char](12) NOT NULL,
	[Train_Number] [varchar](10) NOT NULL,
	[Car_Number] [int] NOT NULL,
	[Seat_Number] [char](3) NOT NULL,
	[Seat_Type] [int] NOT NULL,
	[Train_date] [date] NOT NULL,
	[IsSell] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Ticket_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250001', N'G1813', 8, N'01E', 2, CAST(0xD9410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250002', N'G1813', 7, N'01E', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250003', N'G1813', 9, N'01E', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250004', N'G1813', 5, N'08A', 1, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250005', N'G7505', 5, N'01C', 1, CAST(0xD9410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250006', N'G1813', 5, N'08C', 1, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250007', N'G7505', 1, N'01A', 1, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250008', N'G7505', 10, N'05E', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250009', N'G1813', 1, N'01E', 1, CAST(0xD9410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250010', N'G1813', 2, N'01E', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250011', N'G1813', 3, N'01E', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250012', N'G1813', 4, N'08A', 1, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250013', N'G7505', 5, N'01A', 2, CAST(0xD9410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250014', N'G1813', 5, N'04C', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250015', N'G7505', 1, N'01B', 1, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250016', N'G7505', 9, N'05E', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250017', N'G1813', 7, N'09B', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011250018', N'G1813', 7, N'09A', 2, CAST(0xD9410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260001', N'G1813', 8, N'01E', 2, CAST(0xDA410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260002', N'G1813', 7, N'01E', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260003', N'G1813', 9, N'01E', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260004', N'G1813', 5, N'08A', 1, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260005', N'G7505', 5, N'01C', 1, CAST(0xDA410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260006', N'G1813', 5, N'08C', 1, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260007', N'G7505', 1, N'01A', 1, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260008', N'G7505', 10, N'05E', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260009', N'G1813', 1, N'01E', 1, CAST(0xDA410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260010', N'G1813', 2, N'01E', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260011', N'G1813', 3, N'01E', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260012', N'G1813', 4, N'08A', 1, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260013', N'G7505', 5, N'01A', 2, CAST(0xDA410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260014', N'G1813', 5, N'04C', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260015', N'G7505', 1, N'01B', 1, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260016', N'G7505', 9, N'05E', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260017', N'G1813', 7, N'09B', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011260018', N'G1813', 7, N'09A', 2, CAST(0xDA410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270001', N'G1813', 8, N'01E', 2, CAST(0xDB410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270002', N'G1813', 7, N'01E', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270003', N'G1813', 9, N'01E', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270004', N'G1813', 5, N'08A', 1, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270005', N'G7505', 5, N'01C', 1, CAST(0xDB410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270006', N'G1813', 5, N'08C', 1, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270007', N'G7505', 1, N'01A', 1, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270008', N'G7505', 10, N'05E', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270009', N'G1813', 1, N'01E', 1, CAST(0xDB410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270010', N'G1813', 2, N'01E', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270011', N'G1813', 3, N'01E', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270012', N'G1813', 4, N'08A', 1, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270013', N'G7505', 5, N'01A', 2, CAST(0xDB410B00 AS Date), 1)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270014', N'G1813', 5, N'04C', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270015', N'G7505', 1, N'01B', 1, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270016', N'G7505', 9, N'05E', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270017', N'G1813', 7, N'09B', 2, CAST(0xDB410B00 AS Date), 0)
INSERT [dbo].[Ticket] ([Ticket_Number], [Train_Number], [Car_Number], [Seat_Number], [Seat_Type], [Train_date], [IsSell]) VALUES (N'202011270018', N'G1813', 7, N'09A', 2, CAST(0xDB410B00 AS Date), 0)
/****** Object:  Table [dbo].[Through]    Script Date: 11/25/2020 18:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Through](
	[Train_Number] [varchar](10) NOT NULL,
	[Site_Number] [int] NOT NULL,
	[Arrive_Time] [time](0) NOT NULL,
	[Start_Time] [time](0) NOT NULL,
	[Mileage] [int] NOT NULL,
 CONSTRAINT [PK_Through] PRIMARY KEY CLUSTERED 
(
	[Train_Number] ASC,
	[Site_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 1, CAST(0x00BC7F0000000000 AS Time), CAST(0x00BC7F0000000000 AS Time), 0)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 2, CAST(0x007C830000000000 AS Time), CAST(0x007C830000000000 AS Time), 20)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 3, CAST(0x0078870000000000 AS Time), CAST(0x00F0870000000000 AS Time), 43)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 4, CAST(0x00548D0000000000 AS Time), CAST(0x0004920000000000 AS Time), 80)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 5, CAST(0x00C0990000000000 AS Time), CAST(0x00389A0000000000 AS Time), 105)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 6, CAST(0x00D89F0000000000 AS Time), CAST(0x006CA20000000000 AS Time), 130)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 7, CAST(0x00B0A90000000000 AS Time), CAST(0x0028AA0000000000 AS Time), 160)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 8, CAST(0x009CAE0000000000 AS Time), CAST(0x0014AF0000000000 AS Time), 193)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 9, CAST(0x004CB30000000000 AS Time), CAST(0x0078B40000000000 AS Time), 211)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 10, CAST(0x004CC20000000000 AS Time), CAST(0x0000C30000000000 AS Time), 245)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 11, CAST(0x0074C70000000000 AS Time), CAST(0x00ECC70000000000 AS Time), 277)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 12, CAST(0x00F4CE0000000000 AS Time), CAST(0x006CCF0000000000 AS Time), 301)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 13, CAST(0x0000D20000000000 AS Time), CAST(0x0078D20000000000 AS Time), 342)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G1813', 14, CAST(0x0054D80000000000 AS Time), CAST(0x0054D80000000000 AS Time), 390)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 10, CAST(0x007C650000000000 AS Time), CAST(0x007C650000000000 AS Time), 0)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 11, CAST(0x00F0690000000000 AS Time), CAST(0x00686A0000000000 AS Time), 20)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 12, CAST(0x00D8720000000000 AS Time), CAST(0x0050730000000000 AS Time), 70)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 13, CAST(0x00E4750000000000 AS Time), CAST(0x005C760000000000 AS Time), 97)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 14, CAST(0x00647D0000000000 AS Time), CAST(0x00907E0000000000 AS Time), 137)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 15, CAST(0x00646E0000000000 AS Time), CAST(0x00DC6E0000000000 AS Time), 58)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 17, CAST(0x00F0780000000000 AS Time), CAST(0x0068790000000000 AS Time), 110)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 18, CAST(0x00E4840000000000 AS Time), CAST(0x005C850000000000 AS Time), 150)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 19, CAST(0x00388B0000000000 AS Time), CAST(0x00288C0000000000 AS Time), 164)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 20, CAST(0x009C900000000000 AS Time), CAST(0x0014910000000000 AS Time), 196)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 21, CAST(0x004C950000000000 AS Time), CAST(0x0000960000000000 AS Time), 212)
INSERT [dbo].[Through] ([Train_Number], [Site_Number], [Arrive_Time], [Start_Time], [Mileage]) VALUES (N'G7505', 22, CAST(0x00749A0000000000 AS Time), CAST(0x00749A0000000000 AS Time), 230)
/****** Object:  Table [dbo].[Seat]    Script Date: 11/25/2020 18:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seat](
	[Train_Number] [varchar](10) NOT NULL,
	[Car_Number] [int] NOT NULL,
	[Seat_Number] [char](3) NOT NULL,
	[Seat_Level] [int] NOT NULL,
 CONSTRAINT [PK_Seat] PRIMARY KEY CLUSTERED 
(
	[Train_Number] ASC,
	[Car_Number] ASC,
	[Seat_Number] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Seat] ([Train_Number], [Car_Number], [Seat_Number], [Seat_Level]) VALUES (N'G1813', 5, N'01C', 1)
INSERT [dbo].[Seat] ([Train_Number], [Car_Number], [Seat_Number], [Seat_Level]) VALUES (N'G1813', 5, N'09A', 2)
INSERT [dbo].[Seat] ([Train_Number], [Car_Number], [Seat_Number], [Seat_Level]) VALUES (N'G1813', 5, N'09E', 2)
/****** Object:  Table [dbo].[Purchase]    Script Date: 11/25/2020 18:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchase](
	[Ticket_Number] [char](12) NOT NULL,
	[Id] [varchar](20) NOT NULL,
	[Start_Location] [varchar](10) NOT NULL,
	[End_Location] [varchar](10) NOT NULL,
	[Purchase_date] [datetime] NOT NULL,
	[Purchase_Location] [varchar](20) NOT NULL,
	[Ticket_price] [float] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[Ticket_Number] ASC,
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[pro_select]    Script Date: 11/25/2020 18:07:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pro_select]
@name1 varchar(10),@name2 varchar(10)
as
begin
declare @num1 int,@num2 int
select @num1=Site_Number 
from Site
where Site_Name=@name1

select @num2=Site_Number 
from Site
where Site_Name=@name2

declare @table table(Train_Number varchar(10),Site_Number int,Arrive_Time time(0),Start_Time time(0),Mileage int)
insert into @table (Train_Number,Site_Number,Arrive_Time,Start_Time,Mileage)
     (select *
      from Through
      where Train_Number in 
                       (select Train_Number
                        from Through
                        where Site_Number=@num1
                        intersect 
                        select Train_Number
                        from Through
                        where Site_Number=@num2
                        )
      and 
      (Site_Number=@num1 or Site_Number=@num2)
      )



select distinct A.Train_Number,A.Start_Time,B.Arrive_Time,B.Mileage-A.Mileage Mile
from @table A,@table B
where A.Train_Number=B.Train_Number
    and B.Site_Number=@num2
    and A.Site_Number=@num1
return 0

end
GO
/****** Object:  StoredProcedure [dbo].[pro_seat_number]    Script Date: 11/25/2020 18:07:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pro_seat_number]
@number varchar(10),@level int,@count int output
as
    select @count=COUNT(*)
    from Train,Seat
    where Train.Train_Number=Seat.Train_Number
        and Seat.Train_Number=@number
        and Seat_Level=@level
GO
/****** Object:  StoredProcedure [dbo].[pro_rest]    Script Date: 11/25/2020 18:07:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pro_rest]
@tnum varchar(10),@tdate date,@type varchar(4),@rest int output
as
    select @rest=COUNT(*) 
    from Ticket
    where Train_Number=@tnum
        and Train_date=@tdate
        and Seat_Type=@type
        and IsSell=0
GO
/****** Object:  View [dbo].[view_purchase]    Script Date: 11/25/2020 18:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_purchase]
as
select A.*,B.Id,B.Purchase_date from Ticket A,Purchase B
where A.Ticket_Number=B.Ticket_Number
GO
/****** Object:  StoredProcedure [dbo].[pro_refund]    Script Date: 11/25/2020 18:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pro_refund]
@id varchar(20),
@Train_Number varchar(10),
@Train_date date
as
declare @Ticket_Number char(12) 
select @Ticket_Number=A.Ticket_Number
from Ticket A,Purchase B
where A.Ticket_Number=B.Ticket_Number 
and B.Id=@id 
and A.Train_Number=@Train_Number 
and A.Train_date=@Train_date

select @Ticket_Number

delete from Purchase where Ticket_Number=@Ticket_Number

update Ticket
set IsSell=0
where Ticket_Number=@Ticket_Number
GO
/****** Object:  StoredProcedure [dbo].[pro_purchase]    Script Date: 11/25/2020 18:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pro_purchase]
@Train_Number varchar(10),@date date,@Id varchar(20),@Start_Location varchar(10),@End_Location varchar(10),@Purchase_Location varchar(20),@Ticket_price float,@Seat_Type int
as
declare @Ticket_Number char(12),@Car_Number int,@Seat_Number char(3),@id1 varchar(20)


select @id1=Id from Purchase where Ticket_Number in 
    (
    select Ticket_Number
    from Ticket
    where Train_Number=@Train_Number
        and Train_date=@date
        and IsSell=1
    )
    and
    Id=@Id

if @Id=@Id1
    select 0,0,0
else
begin
    select top 1 @Ticket_Number=Ticket_Number,@Car_Number=Car_Number,@Seat_Number=Seat_Number,@Seat_Type=Seat_Type
    from Ticket
    where Train_Number=@Train_Number
        and Train_date=@date
        and Seat_Type=@Seat_Type
        and IsSell=0
        
insert into Purchase(Ticket_Number,Id,Start_Location,End_Location,Purchase_Location,Ticket_price) values (@Ticket_Number,@Id,@Start_Location,@End_Location,@Purchase_Location,@Ticket_price)
select @Seat_Type 座位等级,@Car_Number 车厢号,@Seat_Number 座位号
end
GO
/****** Object:  StoredProcedure [dbo].[pro_order]    Script Date: 11/25/2020 18:07:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[pro_order]
@id varchar(20)
as

declare 
@table table(Train_Number varchar(10),Train_date date,Start_Location varchar(10),End_Location varchar(10),Car_Number int,Seat_Number char(3),Purchase_Location varchar(20))

insert into @table (Train_Number,Train_date,Start_Location,End_Location,Car_Number,Seat_Number,Purchase_Location) 
(select A.Train_Number,Train_date,Start_Location,End_Location,Car_Number,Seat_Number,Purchase_Location
from Ticket A,Purchase B
where A.Ticket_Number=B.Ticket_Number and B.Id=@id)

select * from @table
GO
/****** Object:  Default [DF_Ticket_Ticket_Number]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_Ticket_Number]  DEFAULT ((0)) FOR [Ticket_Number]
GO
/****** Object:  Default [default_purchase_time]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [default_purchase_time]  DEFAULT (getdate()) FOR [Purchase_date]
GO
/****** Object:  Check [CK_Train_Type]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Train]  WITH CHECK ADD  CONSTRAINT [CK_Train_Type] CHECK  (([Train_Type]='高铁' OR [Train_Type]='动车'))
GO
ALTER TABLE [dbo].[Train] CHECK CONSTRAINT [CK_Train_Type]
GO
/****** Object:  Check [CK_Through_Time]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Through]  WITH CHECK ADD  CONSTRAINT [CK_Through_Time] CHECK  (([Arrive_time]<=[Start_Time]))
GO
ALTER TABLE [dbo].[Through] CHECK CONSTRAINT [CK_Through_Time]
GO
/****** Object:  ForeignKey [FK_Ticket_Train_Number]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Train_Number] FOREIGN KEY([Train_Number])
REFERENCES [dbo].[Train] ([Train_Number])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Train_Number]
GO
/****** Object:  ForeignKey [FK_Through_Site_Number]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Through]  WITH CHECK ADD  CONSTRAINT [FK_Through_Site_Number] FOREIGN KEY([Site_Number])
REFERENCES [dbo].[Site] ([Site_Number])
GO
ALTER TABLE [dbo].[Through] CHECK CONSTRAINT [FK_Through_Site_Number]
GO
/****** Object:  ForeignKey [FK_Through_Train_Number]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Through]  WITH CHECK ADD  CONSTRAINT [FK_Through_Train_Number] FOREIGN KEY([Train_Number])
REFERENCES [dbo].[Train] ([Train_Number])
GO
ALTER TABLE [dbo].[Through] CHECK CONSTRAINT [FK_Through_Train_Number]
GO
/****** Object:  ForeignKey [FK_Seat_Train]    Script Date: 11/25/2020 18:07:31 ******/
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK_Seat_Train] FOREIGN KEY([Train_Number])
REFERENCES [dbo].[Train] ([Train_Number])
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK_Seat_Train]
GO
