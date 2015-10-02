USE [MSU_ProjectPathways]
GO

/****** Object:  Table [dbo].[AllData]    Script Date: 02-Oct-15 15:58:27 ******/
DROP TABLE [dbo].[AllData]
GO

/****** Object:  Table [dbo].[AllData]    Script Date: 02-Oct-15 15:58:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AllData](
	ID int IDENTITY(1,1) PRIMARY KEY,
	[PlaceholderID] [varchar](50) NULL,
	[gndr_flag] [varchar](50) NULL,
	[citizenship] [varchar](50) NULL,
	[Ethnicity] [varchar](50) NULL,
	[First Gen] [varchar](50) NULL,
	[undergrad Residency] [varchar](50) NULL,
	[primary major] [varchar](50) NULL,
	[degree conferred for this major] [varchar](50) NULL,
	[graduated MSU] [varchar](50) NULL,
	[graduated MSU primary major] [varchar](50) NULL,
	[startTermSeqID] [varchar](50) NULL,
	[EndTermSeqID] [varchar](50) NULL,
	[first term in major] [varchar](50) NULL,
	[most recent term in major] [varchar](50) NULL,
	[pre-major class level] [varchar](50) NULL,
	[most recent term in major class level] [varchar](50) NULL,
	[PhysicsTermSeqID] [varchar](50) NULL,
	[PhysicsTermCode] [varchar](50) NULL,
	[SubjectCode] [varchar](50) NULL,
	[crse_code] [varchar](50) NULL,
	[sctn_code] [varchar](50) NULL,
	[grade_code] [varchar](50) NULL,
	[Major] [varchar](50) NULL,
	[coll_code] [varchar](50) NULL,
	[college] [varchar](50) NULL,
	[department] [varchar](50) NULL,
	[award_type] [varchar](50) NULL,
	[degree type] [varchar](50) NULL,
	[first primary bachelor degree] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


