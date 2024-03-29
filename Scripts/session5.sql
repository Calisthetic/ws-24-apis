USE [WS24Session5]
GO
/****** Object:  Table [dbo].[IssueRequests]    Script Date: 26.02.2024 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Completed] [bit] NOT NULL,
 CONSTRAINT [PK_IssueRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 26.02.2024 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineWriteoffs]    Script Date: 26.02.2024 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineWriteoffs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Reason] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MedicineWriteoffs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 26.02.2024 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 26.02.2024 17:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
	[Adress] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_Warehouses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[IssueRequests] ON 

INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (1, 9, 89, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (2, 20, 26, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (3, 8, 79, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (4, 12, 43, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (5, 12, 31, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (6, 6, 70, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (7, 14, 4, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (8, 12, 94, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (9, 15, 48, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (10, 10, 79, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (11, 5, 94, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (12, 8, 54, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (13, 2, 16, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (14, 4, 77, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (15, 5, 50, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (16, 10, 91, 0)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (17, 13, 34, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (18, 1, 84, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (19, 16, 92, 1)
INSERT [dbo].[IssueRequests] ([Id], [MedicineId], [Quantity], [Completed]) VALUES (20, 8, 16, 0)
SET IDENTITY_INSERT [dbo].[IssueRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicines] ON 

INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (1, N'Luminaxin', 6, 1, 2379.0000, 680, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (2, N'Serotonix', 1, 2, 1106.0000, 976, CAST(N'2024-03-20' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (3, N'Neurotran', 9, 3, 2219.0000, 818, CAST(N'2024-03-04' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (4, N'VitaliVit', 7, 4, 5609.0000, 427, CAST(N'2024-03-03' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (5, N'Cardiolite', 10, 5, 1615.0000, 982, CAST(N'2024-03-07' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (6, N'SleepEase', 3, 6, 1790.0000, 472, CAST(N'2024-03-05' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (7, N'EnzymeBoost', 1, 7, 5048.0000, 428, CAST(N'2024-03-07' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (8, N'StemCel', 9, 8, 7384.0000, 936, CAST(N'2024-03-02' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (9, N'ImmuneFort', 10, 9, 5490.0000, 271, CAST(N'2024-03-17' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (10, N'BoneRegen', 1, 10, 200.0000, 75, CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (11, N'BrainWave', 3, 11, 8025.0000, 970, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (12, N'VitaVigor', 7, 12, 3556.0000, 212, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (13, N'CalmAdept', 7, 13, 6853.0000, 159, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (14, N'EnergizeMax', 1, 14, 3860.0000, 554, CAST(N'2024-03-09' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (15, N'RegenVital', 5, 15, 7116.0000, 919, CAST(N'2024-03-19' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (16, N'ClarityMind', 2, 16, 5215.0000, 876, CAST(N'2024-03-05' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (17, N'PainPulse', 8, 17, 4942.0000, 121, CAST(N'2024-03-11' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (18, N'HealthHarmony', 1, 18, 6516.0000, 151, CAST(N'2024-02-29' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (19, N'FocusFlow', 1, 19, 8555.0000, 289, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[Medicines] ([Id], [Name], [WarehouseId], [ProviderId], [Price], [Quantity], [ExpirationDate]) VALUES (20, N'WellnessWave', 8, 20, 6072.0000, 555, CAST(N'2024-03-19' AS Date))
SET IDENTITY_INSERT [dbo].[Medicines] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicineWriteoffs] ON 

INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (1, CAST(N'2024-02-23T00:00:00.000' AS DateTime), 7, 158, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (2, CAST(N'2024-02-25T00:00:00.000' AS DateTime), 4, 324, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (3, CAST(N'2024-01-27T00:00:00.000' AS DateTime), 18, 366, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (4, CAST(N'2024-02-14T00:00:00.000' AS DateTime), 8, 82, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (5, CAST(N'2024-02-05T00:00:00.000' AS DateTime), 11, 882, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (6, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 2, 310, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (7, CAST(N'2024-01-27T00:00:00.000' AS DateTime), 14, 840, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (8, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 20, 310, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (9, CAST(N'2024-02-11T00:00:00.000' AS DateTime), 17, 507, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (10, CAST(N'2024-02-04T00:00:00.000' AS DateTime), 18, 154, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (11, CAST(N'2024-02-07T00:00:00.000' AS DateTime), 19, 447, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (12, CAST(N'2024-02-19T00:00:00.000' AS DateTime), 20, 775, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (13, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 14, 913, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (14, CAST(N'2024-02-12T00:00:00.000' AS DateTime), 13, 314, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (15, CAST(N'2024-02-15T00:00:00.000' AS DateTime), 16, 32, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (16, CAST(N'2024-02-20T00:00:00.000' AS DateTime), 1, 365, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (17, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 10, 674, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (18, CAST(N'2024-01-29T00:00:00.000' AS DateTime), 4, 548, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (19, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 10, 238, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (20, CAST(N'2024-02-23T00:00:00.000' AS DateTime), 13, 533, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (21, CAST(N'2024-02-23T00:00:00.000' AS DateTime), 7, 158, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (22, CAST(N'2024-02-25T00:00:00.000' AS DateTime), 4, 324, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (23, CAST(N'2024-01-27T00:00:00.000' AS DateTime), 18, 366, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (24, CAST(N'2024-02-14T00:00:00.000' AS DateTime), 8, 82, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (25, CAST(N'2024-02-05T00:00:00.000' AS DateTime), 11, 882, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (26, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 2, 310, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (27, CAST(N'2024-01-27T00:00:00.000' AS DateTime), 14, 840, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (28, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 20, 310, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (29, CAST(N'2024-02-11T00:00:00.000' AS DateTime), 17, 507, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (30, CAST(N'2024-02-04T00:00:00.000' AS DateTime), 18, 154, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (31, CAST(N'2024-02-07T00:00:00.000' AS DateTime), 19, 447, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (32, CAST(N'2024-02-19T00:00:00.000' AS DateTime), 20, 775, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (33, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 14, 913, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (34, CAST(N'2024-02-12T00:00:00.000' AS DateTime), 13, 314, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (35, CAST(N'2024-02-15T00:00:00.000' AS DateTime), 16, 32, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (36, CAST(N'2024-02-20T00:00:00.000' AS DateTime), 1, 365, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (37, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 10, 674, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (38, CAST(N'2024-01-29T00:00:00.000' AS DateTime), 4, 548, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (39, CAST(N'2024-01-30T00:00:00.000' AS DateTime), 10, 238, N'expired')
INSERT [dbo].[MedicineWriteoffs] ([Id], [CreatedAt], [MedicineId], [Quantity], [Reason]) VALUES (40, CAST(N'2024-02-23T00:00:00.000' AS DateTime), 13, 533, N'expired')
SET IDENTITY_INSERT [dbo].[MedicineWriteoffs] OFF
GO
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([Id], [Name]) VALUES (1, N'PharmaCorp')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (2, N'MedHealth Inc.')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (3, N'BioPharma Solutions')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (4, N'MedTech Pharmaceuticals')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (5, N'HealthCare Pharma')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (6, N'BioPharma Innovations')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (7, N'PharmaGenix')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (8, N'MedLife Pharma')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (9, N'PharmaTech Solutions')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (10, N'PharmaCare Global')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (11, N'BioHealth Pharma')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (12, N'PharmaSci')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (13, N'MedPharma International')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (14, N'HealthPharma Group')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (15, N'PharmaMax')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (16, N'PharmaGlobal Solutions')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (17, N'BioPharma Systems')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (18, N'PharmaLink')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (19, N'PharmaVision')
INSERT [dbo].[Providers] ([Id], [Name]) VALUES (20, N'PharmaCare Pharmaceuticals')
SET IDENTITY_INSERT [dbo].[Providers] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (1, N'Сибирский', N'ул. Ленина, 10, Москва')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (2, N'Уральский', N'пр. Мира, 25, Екатеринбург')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (3, N'Дальневосточный', N'ул. Набережная реки, 1, Владивосток')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (4, N'Поволжский', N'ул. Индустриальная, 15, Самара')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (5, N'Сибирский3', N'ул. Ленина, 10, Новосибирск')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (6, N'Уральский2', N'пр. Мира, 25, Челябинск')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (7, N'Дальневосточный2', N'ул. Набережная реки, 1, Хабаровск')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (8, N'Поволжский2', N'ул. Индустриальная, 15, Волгоград')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (9, N'Сибирский2', N'ул. Ленина, 10, Омск')
INSERT [dbo].[Warehouses] ([Id], [Name], [Adress]) VALUES (10, N'Уральский3', N'пр. Мира, 25, Пермь')
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
ALTER TABLE [dbo].[IssueRequests]  WITH CHECK ADD  CONSTRAINT [FK_IssueRequests_Medicines] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([Id])
GO
ALTER TABLE [dbo].[IssueRequests] CHECK CONSTRAINT [FK_IssueRequests_Medicines]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Providers] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Providers] ([Id])
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicine_Providers]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Warehouses] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouses] ([Id])
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicine_Warehouses]
GO
ALTER TABLE [dbo].[MedicineWriteoffs]  WITH CHECK ADD  CONSTRAINT [FK_MedicineWriteoffs_Medicines] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicineWriteoffs] CHECK CONSTRAINT [FK_MedicineWriteoffs_Medicines]
GO
