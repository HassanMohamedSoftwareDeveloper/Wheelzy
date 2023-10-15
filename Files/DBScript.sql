USE [master]
GO
/****** Object:  Database [WheelzyDB]    Script Date: 10/9/2023 11:02:40 PM ******/
CREATE DATABASE [WheelzyDB]
GO

USE [WheelzyDB]
GO
/****** Object:  Table [dbo].[Buyers]    Script Date: 10/9/2023 11:02:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Buyer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferAmounts]    Script Date: 10/9/2023 11:02:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferAmounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfferId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[BuyerId] [int] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK_OfferAmount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 10/9/2023 11:02:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfferDate] [date] NOT NULL,
 CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferStatuses]    Script Date: 10/9/2023 11:02:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfferId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[StatusDate] [date] NULL,
	[IsCurrent] [bit] NOT NULL,
 CONSTRAINT [PK_OfferStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 10/9/2023 11:02:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buyers] ON 
GO
INSERT [dbo].[Buyers] ([Id], [Name], [ZipCode]) VALUES (1, N'Buyer1', N'5555')
GO
INSERT [dbo].[Buyers] ([Id], [Name], [ZipCode]) VALUES (2, N'Buyer2', N'6666')
GO
SET IDENTITY_INSERT [dbo].[Buyers] OFF
GO
SET IDENTITY_INSERT [dbo].[OfferAmounts] ON 
GO
INSERT [dbo].[OfferAmounts] ([Id], [OfferId], [Amount], [BuyerId], [IsCurrent]) VALUES (1, 1, CAST(1000.00 AS Decimal(18, 2)), 1, 1)
GO
INSERT [dbo].[OfferAmounts] ([Id], [OfferId], [Amount], [BuyerId], [IsCurrent]) VALUES (2, 1, CAST(2000.00 AS Decimal(18, 2)), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[OfferAmounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Offers] ON 
GO
INSERT [dbo].[Offers] ([Id], [OfferDate]) VALUES (1, CAST(N'2023-10-09' AS Date))
GO
INSERT [dbo].[Offers] ([Id], [OfferDate]) VALUES (2, CAST(N'2022-10-09' AS Date))
GO
INSERT [dbo].[Offers] ([Id], [OfferDate]) VALUES (3, CAST(N'2021-10-09' AS Date))
GO
INSERT [dbo].[Offers] ([Id], [OfferDate]) VALUES (4, CAST(N'2024-10-09' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Offers] OFF
GO
SET IDENTITY_INSERT [dbo].[OfferStatuses] ON 
GO
INSERT [dbo].[OfferStatuses] ([Id], [OfferId], [StatusId], [StatusDate], [IsCurrent]) VALUES (1, 1, 1, CAST(N'2023-10-09' AS Date), 1)
GO
INSERT [dbo].[OfferStatuses] ([Id], [OfferId], [StatusId], [StatusDate], [IsCurrent]) VALUES (3, 1, 2, CAST(N'2023-10-05' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[OfferStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Statuses] ON 
GO
INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (1, N'New')
GO
INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (2, N'Approved')
GO
INSERT [dbo].[Statuses] ([Id], [Name]) VALUES (3, N'Finished')
GO
SET IDENTITY_INSERT [dbo].[Statuses] OFF
GO
/****** Object:  Index [NonClusteredIndex-20231009-140117]    Script Date: 10/9/2023 11:02:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20231009-140117] ON [dbo].[OfferStatuses]
(
	[OfferId] ASC,
	[IsCurrent] ASC
)
WHERE ([IsCurrent]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20231009-140307]    Script Date: 10/9/2023 11:02:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20231009-140307] ON [dbo].[OfferStatuses]
(
	[OfferId] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OfferAmounts]  WITH CHECK ADD  CONSTRAINT [FK_OfferAmounts_Buyers] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[Buyers] ([Id])
GO
ALTER TABLE [dbo].[OfferAmounts] CHECK CONSTRAINT [FK_OfferAmounts_Buyers]
GO
ALTER TABLE [dbo].[OfferAmounts]  WITH CHECK ADD  CONSTRAINT [FK_OfferAmounts_Offers] FOREIGN KEY([OfferId])
REFERENCES [dbo].[Offers] ([Id])
GO
ALTER TABLE [dbo].[OfferAmounts] CHECK CONSTRAINT [FK_OfferAmounts_Offers]
GO
ALTER TABLE [dbo].[OfferStatuses]  WITH CHECK ADD  CONSTRAINT [FK_OfferStatuses_Offers] FOREIGN KEY([OfferId])
REFERENCES [dbo].[Offers] ([Id])
GO
ALTER TABLE [dbo].[OfferStatuses] CHECK CONSTRAINT [FK_OfferStatuses_Offers]
GO
ALTER TABLE [dbo].[OfferStatuses]  WITH CHECK ADD  CONSTRAINT [FK_OfferStatuses_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[OfferStatuses] CHECK CONSTRAINT [FK_OfferStatuses_Statuses]
GO
USE [master]
GO
ALTER DATABASE [WheelzyDB] SET  READ_WRITE 
GO
