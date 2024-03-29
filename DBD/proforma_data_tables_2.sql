﻿USE [Proforma]
GO
/****** Object:  Table [dbo].[Application_user]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Application_user]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Application_user](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[Tenant_id] [int] NOT NULL,
	[Username] [nvarchar](255) NULL,
	[Passwrod] [nvarchar](255) NULL,
	[Email_id] [nvarchar](255) NULL,
	[Lastlogin] [datetime] NULL,
	[Failedlogin] [datetime] NULL,
	[Createdby] [nvarchar](255) NULL,
	[Createdtime] [datetime] NULL,
	[Updatedby] [nvarchar](255) NULL,
	[Updatedtime] [datetime] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Application_role]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Application_role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Application_role](
	[Role_id] [int] IDENTITY(1,1) NOT NULL,
	[Tenant_id] [int] NOT NULL,
	[Super_admin] [nvarchar](255) NOT NULL,
	[Tetant_admin] [nvarchar](255) NOT NULL,
	[Doctor] [nvarchar](255) NOT NULL,
	[Staff] [nvarchar](255) NOT NULL,
	[Nurse] [nvarchar](255) NOT NULL,
	[Patient] [nvarchar](255) NULL,
	[Ideleted] [bit] NULL,
 CONSTRAINT [PK__Applicat__D80BB09333D4B598] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tenantxfeatures]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tenantxfeatures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tenantxfeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tenant_id] [int] NOT NULL,
	[Feature_id] [int] NOT NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Tenant_id] ASC,
	[Feature_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tenantxcategories]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tenantxcategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tenantxcategories](
	[Id] [int] NOT NULL,
	[Tenant_id] [int] NOT NULL,
	[Category_id] [int] NOT NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Tenant_id] ASC,
	[Category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tenant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tenant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Parent_id] [int] NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Contactperson] [nvarchar](255) NOT NULL,
	[Contact_email] [nvarchar](255) NULL,
	[Telephone_1] [nvarchar](255) NULL,
	[Telephone_2] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Zipcode] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[Clinic_regno] [nvarchar](255) NULL,
	[logo_image] [image] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Rolexfeatures]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rolexfeatures]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rolexfeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_id] [int] NOT NULL,
	[Feature_id] [int] NOT NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC,
	[Feature_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[Person_id] [int] IDENTITY(1,1) NOT NULL,
	[Tenant_id] [int] NULL,
	[Firstname] [nvarchar](255) NULL,
	[Lastname] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Email_id] [nvarchar](255) NULL,
	[Contact] [nvarchar](255) NULL,
	[Personal_number] [nvarchar](255) NULL,
	[Isdeleted] [bit] NULL,
 CONSTRAINT [PK__Person__7EA6E7A32E1BDC42] PRIMARY KEY CLUSTERED 
(
	[Person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GroupCategory]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupCategory](
	[Group_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/16/2012 17:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Isdeleted] [bit] NULL,
	[Group_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK__Category__Group___5535A963]    Script Date: 10/16/2012 17:51:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Category__Group___5535A963]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([Group_id])
REFERENCES [dbo].[GroupCategory] ([Group_id])
GO

/*New change added here*/