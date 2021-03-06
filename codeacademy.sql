/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [CodeAcademy]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2/26/2019 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](100) NULL,
	[Lastname] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[GroupId] [int] NULL,
	[CityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2/26/2019 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2/26/2019 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CountryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentsFullInfo]    Script Date: 2/26/2019 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[StudentsFullInfo] as
select
	 Students.Id 'StudentId',
	 Students.GroupId 'GroupId',
	 Students.Firstname, 
	 Students.Lastname, 
	 Students.Email,
	 Cities.Name 'City',
	 Countries.Name 'Country'
from Students
join Cities on Students.CityId = Cities.Id
join Countries on Cities.CountryId = Countries.Id
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 2/26/2019 9:36:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (1, N'Baku', 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (2, N'Sheki', 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (3, N'Sumgayit', 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (4, N'Istanbul', 2)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (5, N'Izmir', 2)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (6, N'Ankara', 2)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (7, N'Vashington', 3)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId]) VALUES (8, N'New York', 3)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name]) VALUES (1, N'Azerbaijan')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (2, N'Turkey')
INSERT [dbo].[Countries] ([Id], [Name]) VALUES (3, N'USA')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name]) VALUES (1, N'P308')
INSERT [dbo].[Groups] ([Id], [Name]) VALUES (2, N'P309')
INSERT [dbo].[Groups] ([Id], [Name]) VALUES (3, N'P101')
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Firstname], [Lastname], [Email], [GroupId], [CityId]) VALUES (1, N'Elsen', N'Eliyev', N'elsen@code.az', 1, 1)
INSERT [dbo].[Students] ([Id], [Firstname], [Lastname], [Email], [GroupId], [CityId]) VALUES (2, N'Nadir', N'Veliyev', N'nadir@code.az', 2, 2)
INSERT [dbo].[Students] ([Id], [Firstname], [Lastname], [Email], [GroupId], [CityId]) VALUES (5, N'Elxan', N'Veliyev', N'elxan@code.az', 2, 1)
INSERT [dbo].[Students] ([Id], [Firstname], [Lastname], [Email], [GroupId], [CityId]) VALUES (6, N'Vaqif', N'Nadirov', N'vaqif@code.az', 1, 4)
INSERT [dbo].[Students] ([Id], [Firstname], [Lastname], [Email], [GroupId], [CityId]) VALUES (7, N'Vaqif 2', N'Nadirov 2', N'vaqif2@code.az', 3, 3)
INSERT [dbo].[Students] ([Id], [Firstname], [Lastname], [Email], [GroupId], [CityId]) VALUES (8, N'Vaqif 3', N'Nadirov 3', N'vaqif3@code.az', 3, 6)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__A9D1053467CFE0E6]    Script Date: 2/26/2019 9:36:30 PM ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
