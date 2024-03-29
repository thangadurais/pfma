﻿USE [Proforma]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/22/2012 17:00:42 ******/
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
	[Order] [int] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[InterestMaster]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InterestMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InterestMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CategoryGroupMaster]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CategoryGroupMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CategoryGroupMaster](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nchar](10) NULL,
 CONSTRAINT [PK_GroupCategory] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tenant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tenant](
	[TenantId] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ContactPerson] [nvarchar](100) NOT NULL,
	[EmailId] [nvarchar](50) NULL,
	[Telephone1] [nvarchar](20) NULL,
	[Telephone2] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Address] [nvarchar](500) NULL,
	[Zipcode] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Language] [nvarchar](100) NULL,
	[ClinicRegNo] [nvarchar](100) NULL,
	[LogoImage] [image] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Tenant__3214EC072A4B4B5E] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sms]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sms]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](15) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[MobileNumber] [nvarchar](20) NOT NULL,
	[SmsText] [nvarchar](500) NULL,
	[BirthdaySms] [nvarchar](500) NULL,
	[SmsTime] [time](7) NULL,
	[IsActive] [bit] NOT NULL,
	[SmsDelivery] [datetime] NOT NULL,
	[IsDeteted] [bit] NULL,
 CONSTRAINT [PK_Sms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RoleXFeature]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleXFeature]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoleXFeature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleIid] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleIid] ASC,
	[FeatureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ResourceType]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResourceType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ResourceType](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsDefault] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationFeature]    Script Date: 10/22/2012 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationFeature]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationFeature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ApplicationFeature] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TenantXFeature]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TenantXFeature]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TenantXFeature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[FeatureId] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC,
	[FeatureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TenantXCategory]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TenantXCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TenantXCategory](
	[Id] [int] NOT NULL,
	[TenantId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TenantThemeNight]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TenantThemeNight]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TenantThemeNight](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Date] [date] NULL,
	[Minutes] [int] NULL,
	[StratTime] [time](7) NOT NULL,
	[EndTime] [time](7) NULL,
	[Cave] [nvarchar](500) NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[VisitingLecturer] [nvarchar](500) NULL,
	[WorkingStaff] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__ThemeNig__3214EC0702084FDA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TenantXResourceType]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TenantXResourceType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TenantXResourceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[ResourceTypeId] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_TenantXResourceType] PRIMARY KEY NONCLUSTERED 
(
	[TenantId] ASC,
	[ResourceTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TenantXInterest]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TenantXInterest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TenantXInterest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[InterestId] [int] NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC,
	[InterestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Resource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[IsAvailable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[MoblieNumber] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[Country] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[Contact] [nvarchar](20) NULL,
	[PersonalNumber] [nvarchar](20) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Person__7EA6E7A32E1BDC42] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10/22/2012 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nchar](100) NOT NULL,
	[Gender] [nchar](15) NOT NULL,
	[DoctorName] [nvarchar](100) NOT NULL,
	[Categories] [nvarchar](255) NOT NULL,
	[TotalMinute] [int] NULL,
	[Date] [date] NOT NULL,
	[SartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NULL,
	[Price] [decimal](12, 2) NULL,
	[IsFree] [bit] NULL,
	[IsCourse] [bit] NULL,
	[RelativeName] [nchar](100) NULL,
	[ReasonForFree] [nvarchar](1000) NULL,
	[Comment] [nvarchar](1000) NULL,
	[Text] [nvarchar](500) NULL,
	[SmsRemainder] [bit] NULL,
	[SendImmediateSms] [bit] NULL,
	[Resources] [nvarchar](250) NULL,
	[Status] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[MainDoctorId] [int] NULL,
	[MainCategoryId] [int] NULL,
	[MainDoctorName] [nvarchar](100) NULL,
	[MainCategoryName] [nvarchar](100) NULL,
	[IsAccountPayment] [bit] NULL,
	[IsCashPayment] [bit] NULL,
	[IsCardPayment] [bit] NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 10/22/2012 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](15) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[LastLogin] [datetime] NULL,
	[FailedLogin] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedTime] [datetime] NULL,
	[IsAccountLocked] [bit] NULL,
	[FailedCount] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ApplicationUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 10/22/2012 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[RoleDesignation] [nvarchar](150) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ApplicationRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[IsDefault] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Category__3214EC0721B6055D] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[PersonId] [int] NOT NULL,
	[ResponsibleDoctorId] [int] NOT NULL,
	[ListComments] [nvarchar](1000) NULL,
	[Comment] [nvarchar](500) NULL,
	[HomePhone] [nvarchar](20) NULL,
	[OfficePhone] [nvarchar](20) NULL,
	[PasswordId] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[AlternateEmailId] [nvarchar](50) NULL,
	[Gender] [nvarchar](15) NULL,
	[Relative] [nvarchar](255) NULL,
	[WarningMessage] [nvarchar](500) NULL,
	[Cave] [nvarchar](500) NULL,
	[SMS] [bit] NOT NULL,
	[ThemeEveningSMS] [bit] NOT NULL,
	[Deceased] [bit] NOT NULL,
	[OPShortNotice] [bit] NOT NULL,
	[AddedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Doctor](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[PersonId] [int] NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[HomePhone] [nvarchar](20) NULL,
	[OfficePhone] [nvarchar](20) NULL,
	[MobilePhone] [nvarchar](20) NULL,
	[EmailId] [nvarchar](50) NULL,
	[AddedBy] [int] NOT NULL,
	[UpdatedBy] [int] NULL,
	[AddedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BookingResource]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookingResource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookingResource](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[BookingId] [int] NOT NULL,
	[ResourceId] [int] NOT NULL,
	[Comments] [nvarchar](255) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BookingCategory]    Script Date: 10/22/2012 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookingCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookingCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[CategoryId] [int] NULL,
	[IsMainCategory] [bit] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/22/2012 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[PatientId] [int] NULL,
	[BookingId] [int] NULL,
	[DateTime] [datetime] NOT NULL,
	[Category] [nvarchar](255) NOT NULL,
	[Price] [decimal](12, 2) NOT NULL,
	[Paid] [decimal](12, 2) NULL,
	[Credit] [decimal](12, 2) NULL,
	[Debit] [decimal](12, 2) NULL,
	[Comments] [nvarchar](500) NULL,
	[PostedBy] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientJournal]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientJournal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientJournal](
	[JournalId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Content] [nvarchar](2000) NOT NULL,
	[SignedBy] [int] NULL,
	[SignedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[JournalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientInterest]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientInterest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientInterest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientContact]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientContact]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PersonId] [int] NULL,
	[RelativeType] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BookingDoctor]    Script Date: 10/22/2012 17:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookingDoctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookingDoctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[DoctorId] [int] NULL,
	[Comments] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL,
	[Isdeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientPIP]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientPIP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientPIP](
	[PIPId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[TenantId] [int] NOT NULL,
	[HasReceivedPIP] [bit] NULL,
	[PIPDate] [datetime] NULL,
	[PIPMethod] [nvarchar](100) NULL,
	[BeforeManufacturer] [nvarchar](255) NULL,
	[BeforeLeftSize] [nvarchar](10) NULL,
	[BeforeLeftSerialNumber] [nvarchar](50) NULL,
	[BeforeLeftPlacement] [nvarchar](50) NULL,
	[BeforeRightSize] [nvarchar](10) NULL,
	[BeforeRightSerialNumber] [nvarchar](50) NULL,
	[BeforeRightPlacement] [nvarchar](50) NULL,
	[WishingLeftSize] [nvarchar](10) NULL,
	[WishingLeftPlacement] [nvarchar](50) NULL,
	[WishingRightSize] [nvarchar](10) NULL,
	[WishingRightPlacement] [nvarchar](50) NULL,
	[WishingPrice] [decimal](12, 2) NULL,
	[WishingAdditionalEngagement] [nvarchar](255) NULL,
	[WishingAdditionalPrice] [decimal](12, 2) NULL,
	[WishingTotalPrice] [decimal](12, 2) NULL,
	[AfterHasPIP] [bit] NULL,
	[AfterPIPChanged] [bit] NULL,
	[AfterManufacturer] [nvarchar](255) NULL,
	[AfterLeftSize] [nvarchar](10) NULL,
	[AfterLeftSerialNumber] [nvarchar](50) NULL,
	[AfterLeftPlacement] [nvarchar](50) NULL,
	[AfterRightSize] [nvarchar](10) NULL,
	[AfterRightSerialNumber] [nvarchar](50) NULL,
	[AfterRightPlacement] [nvarchar](50) NULL,
	[ExchangeDate] [datetime] NULL,
	[ExchangePrice] [decimal](12, 2) NULL,
	[ExchnageOfferMode] [nvarchar](100) NULL,
	[AdditionalExchangeMeasure] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PIPId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PatientJournalImage]    Script Date: 10/22/2012 17:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PatientJournalImage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PatientJournalImage](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[JournalId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[ImageType] [char](1) NULL,
	[ImagePath] [varchar](500) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__Resources__IsAva__3A81B327]    Script Date: 10/22/2012 17:00:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Resources__IsAva__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resource]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Resources__IsAva__3A81B327]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Resource] ADD  DEFAULT ('true') FOR [IsAvailable]
END


End
GO
/****** Object:  Default [DF__TenantXRe__IsAct__34C8D9D1]    Script Date: 10/22/2012 17:00:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__TenantXRe__IsAct__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TenantXResourceType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__TenantXRe__IsAct__34C8D9D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TenantXResourceType] ADD  DEFAULT ('True') FOR [IsActive]
END


End
GO
/****** Object:  ForeignKey [FK__Account__Patient__44CA3770]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Account__Patient__44CA3770]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
/****** Object:  ForeignKey [FK__Account__TenantI__45BE5BA9]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Account__TenantI__45BE5BA9]') AND parent_object_id = OBJECT_ID(N'[dbo].[Account]'))
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__Applicati__Tenan__24927208]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Applicati__Tenan__24927208]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationRole]'))
ALTER TABLE [dbo].[ApplicationRole]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__Applicati__Tenan__25869641]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Applicati__Tenan__25869641]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationUser]'))
ALTER TABLE [dbo].[ApplicationUser]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__Bookings__Tenant__14270015]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__Tenant__14270015]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking]'))
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Bookings__Tenant__14270015] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Bookings__Tenant__14270015]') AND parent_object_id = OBJECT_ID(N'[dbo].[Booking]'))
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Bookings__Tenant__14270015]
GO
/****** Object:  ForeignKey [FK__BookingCa__Booki__60A75C0F]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingCa__Booki__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingCategory]'))
ALTER TABLE [dbo].[BookingCategory]  WITH CHECK ADD  CONSTRAINT [FK__BookingCa__Booki__60A75C0F] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingCa__Booki__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingCategory]'))
ALTER TABLE [dbo].[BookingCategory] CHECK CONSTRAINT [FK__BookingCa__Booki__60A75C0F]
GO
/****** Object:  ForeignKey [FK__BookingCa__Categ__619B8048]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingCa__Categ__619B8048]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingCategory]'))
ALTER TABLE [dbo].[BookingCategory]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
/****** Object:  ForeignKey [FK__BookingDo__Booki__236943A5]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingDo__Booki__236943A5]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingDoctor]'))
ALTER TABLE [dbo].[BookingDoctor]  WITH CHECK ADD  CONSTRAINT [FK__BookingDo__Booki__236943A5] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingDo__Booki__236943A5]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingDoctor]'))
ALTER TABLE [dbo].[BookingDoctor] CHECK CONSTRAINT [FK__BookingDo__Booki__236943A5]
GO
/****** Object:  ForeignKey [FK__BookingDo__Docto__05D8E0BE]    Script Date: 10/22/2012 17:00:41 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingDo__Docto__05D8E0BE]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingDoctor]'))
ALTER TABLE [dbo].[BookingDoctor]  WITH CHECK ADD  CONSTRAINT [FK__BookingDo__Docto__05D8E0BE] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingDo__Docto__05D8E0BE]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingDoctor]'))
ALTER TABLE [dbo].[BookingDoctor] CHECK CONSTRAINT [FK__BookingDo__Docto__05D8E0BE]
GO
/****** Object:  ForeignKey [FK__BookingRe__Booki__4F7CD00D]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingRe__Booki__4F7CD00D]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingResource]'))
ALTER TABLE [dbo].[BookingResource]  WITH CHECK ADD  CONSTRAINT [FK__BookingRe__Booki__4F7CD00D] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingRe__Booki__4F7CD00D]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingResource]'))
ALTER TABLE [dbo].[BookingResource] CHECK CONSTRAINT [FK__BookingRe__Booki__4F7CD00D]
GO
/****** Object:  ForeignKey [FK__BookingRe__Resou__5070F446]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingRe__Resou__5070F446]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingResource]'))
ALTER TABLE [dbo].[BookingResource]  WITH CHECK ADD FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resource] ([Id])
GO
/****** Object:  ForeignKey [FK__BookingRe__Tenan__4E88ABD4]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__BookingRe__Tenan__4E88ABD4]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookingResource]'))
ALTER TABLE [dbo].[BookingResource]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__Category__GroupI__276EDEB3]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Category__GroupI__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK__Category__GroupI__276EDEB3] FOREIGN KEY([GroupId])
REFERENCES [dbo].[CategoryGroupMaster] ([GroupId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Category__GroupI__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Category]'))
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK__Category__GroupI__276EDEB3]
GO
/****** Object:  ForeignKey [FK__Doctor__PersonId__1DB06A4F]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Doctor__PersonId__1DB06A4F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Doctor]'))
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
/****** Object:  ForeignKey [FK__Doctor__TenantId__29572725]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Doctor__TenantId__29572725]') AND parent_object_id = OBJECT_ID(N'[dbo].[Doctor]'))
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK__Doctor__TenantId__29572725] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Doctor__TenantId__29572725]') AND parent_object_id = OBJECT_ID(N'[dbo].[Doctor]'))
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK__Doctor__TenantId__29572725]
GO
/****** Object:  ForeignKey [FK__Patient__PersonI__571DF1D5]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Patient__PersonI__571DF1D5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]'))
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
/****** Object:  ForeignKey [FK__Patient__TenantI__2A4B4B5E]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Patient__TenantI__2A4B4B5E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]'))
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK__Patient__TenantI__2A4B4B5E] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Patient__TenantI__2A4B4B5E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Patient]'))
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK__Patient__TenantI__2A4B4B5E]
GO
/****** Object:  ForeignKey [FK__PatientCo__Patie__29221CFB]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientCo__Patie__29221CFB]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientContact]'))
ALTER TABLE [dbo].[PatientContact]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
/****** Object:  ForeignKey [FK__PatientCo__Perso__2A164134]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientCo__Perso__2A164134]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientContact]'))
ALTER TABLE [dbo].[PatientContact]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
/****** Object:  ForeignKey [FK__PatientIn__Patie__73BA3083]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientIn__Patie__73BA3083]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientInterest]'))
ALTER TABLE [dbo].[PatientInterest]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
/****** Object:  ForeignKey [FK__PatientIn__Tenan__72C60C4A]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientIn__Tenan__72C60C4A]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientInterest]'))
ALTER TABLE [dbo].[PatientInterest]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__PatientJo__Patie__0A9D95DB]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientJo__Patie__0A9D95DB]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientJournal]'))
ALTER TABLE [dbo].[PatientJournal]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
/****** Object:  ForeignKey [FK__PatientJo__Journ__19DFD96B]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientJo__Journ__19DFD96B]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientJournalImage]'))
ALTER TABLE [dbo].[PatientJournalImage]  WITH CHECK ADD FOREIGN KEY([JournalId])
REFERENCES [dbo].[PatientJournal] ([JournalId])
GO
/****** Object:  ForeignKey [FK__PatientJo__Patie__1AD3FDA4]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientJo__Patie__1AD3FDA4]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientJournalImage]'))
ALTER TABLE [dbo].[PatientJournalImage]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
/****** Object:  ForeignKey [FK__PatientPI__Patie__3864608B]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientPI__Patie__3864608B]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPIP]'))
ALTER TABLE [dbo].[PatientPIP]  WITH CHECK ADD FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
/****** Object:  ForeignKey [FK__PatientPI__Tenan__395884C4]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PatientPI__Tenan__395884C4]') AND parent_object_id = OBJECT_ID(N'[dbo].[PatientPIP]'))
ALTER TABLE [dbo].[PatientPIP]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__Person__TenantId__29221CFB]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Person__TenantId__29221CFB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK__Person__TenantId__29221CFB] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Person__TenantId__29221CFB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK__Person__TenantId__29221CFB]
GO
/****** Object:  ForeignKey [FK__Resources__Tenan__398D8EEE]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Resources__Tenan__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resource]'))
ALTER TABLE [dbo].[Resource]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__ThemeNigh__Tenan__2BFE89A6]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ThemeNigh__Tenan__2BFE89A6]') AND parent_object_id = OBJECT_ID(N'[dbo].[TenantThemeNight]'))
ALTER TABLE [dbo].[TenantThemeNight]  WITH CHECK ADD  CONSTRAINT [FK__ThemeNigh__Tenan__2BFE89A6] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ThemeNigh__Tenan__2BFE89A6]') AND parent_object_id = OBJECT_ID(N'[dbo].[TenantThemeNight]'))
ALTER TABLE [dbo].[TenantThemeNight] CHECK CONSTRAINT [FK__ThemeNigh__Tenan__2BFE89A6]
GO
/****** Object:  ForeignKey [FK__TenantXIn__Inter__6D0D32F4]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TenantXIn__Inter__6D0D32F4]') AND parent_object_id = OBJECT_ID(N'[dbo].[TenantXInterest]'))
ALTER TABLE [dbo].[TenantXInterest]  WITH CHECK ADD FOREIGN KEY([InterestId])
REFERENCES [dbo].[InterestMaster] ([Id])
GO
/****** Object:  ForeignKey [FK__TenantXIn__Tenan__6C190EBB]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TenantXIn__Tenan__6C190EBB]') AND parent_object_id = OBJECT_ID(N'[dbo].[TenantXInterest]'))
ALTER TABLE [dbo].[TenantXInterest]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
/****** Object:  ForeignKey [FK__TenantXRe__Resou__33D4B598]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TenantXRe__Resou__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[TenantXResourceType]'))
ALTER TABLE [dbo].[TenantXResourceType]  WITH CHECK ADD FOREIGN KEY([ResourceTypeId])
REFERENCES [dbo].[ResourceType] ([TypeId])
GO
/****** Object:  ForeignKey [FK__TenantXRe__Tenan__32E0915F]    Script Date: 10/22/2012 17:00:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TenantXRe__Tenan__32E0915F]') AND parent_object_id = OBJECT_ID(N'[dbo].[TenantXResourceType]'))
ALTER TABLE [dbo].[TenantXResourceType]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenant] ([TenantId])
GO
