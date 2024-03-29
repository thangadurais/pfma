﻿USE [Proforma]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 10/18/2012 15:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[PersonalNumber] [nvarchar](225) NULL,
	[ResponsibleDoctorId] [int] NOT NULL,
	[ListComments] [nvarchar](225) NULL,
	[Comment] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[PostalNumber] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[HomePhone] [nvarchar](255) NULL,
	[OfficePhone] [nvarchar](255) NULL,
	[MobilePhone] [nvarchar](255) NULL,
	[PasswordId] [nvarchar](255) NULL,
	[Email1] [nvarchar](255) NULL,
	[Email2] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Relative] [nvarchar](255) NULL,
	[WarningMessage] [nvarchar](255) NULL,
	[Cave] [nvarchar](255) NULL,
	[SMS] [bit] NOT NULL,
	[ThemeEveningSMS] [bit] NOT NULL,
	[Deceased] [bit] NOT NULL,
	[OPShortNotice] [bit] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[Isdeleted] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/18/2012 15:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[DisplayImageUrl] [nvarchar](255) NULL,
	[ToolTip] [nvarchar](255) NULL,
	[NavigateURL] [nvarchar](255) NULL,
	[ParentMenuId] [int] NULL,
	[Order] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 10/18/2012 15:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [nvarchar](255) NOT NULL,
	[Last_name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[HomePhone] [nvarchar](20) NULL,
	[OfficePhone] [nvarchar](255) NULL,
	[MobilePhone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[AddedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL
) ON [PRIMARY]
END
GO
