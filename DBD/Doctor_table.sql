USE [Proforma]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 10/18/2012 15:52:32 ******/
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
