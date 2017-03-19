USE [MSU_ProjectPathways]
GO

/****** Object:  Table [dbo].[StudentVector]    Script Date: 02-Oct-15 18:58:04 ******/
DROP TABLE [dbo].[StudentVector]
GO

/****** Object:  Table [dbo].[StudentVector]    Script Date: 02-Oct-15 18:58:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[StudentVector](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceholderID] [varchar](50) NULL,
	[citizenship] [varchar](50) NULL,
	[degree conferred for this major] [varchar](50) NULL,
	[EndTermSeqID] [varchar](50) NULL,
	[Ethnicity] [varchar](50) NULL,
	[First Gen] [varchar](50) NULL,
	[first term in major] [varchar](50) NULL,
	[gndr_flag] [varchar](50) NULL,
	[graduated MSU] [varchar](50) NULL,
	[graduated MSU primary major] [varchar](50) NULL,
	[major_code] [varchar](50) NULL,
	[most recent term in major] [varchar](50) NULL,
	[pre-major class level] [varchar](50) NULL,
	[primary major] [varchar](50) NULL,
	[startTermSeqID] [varchar](50) NULL,
	[undergrad Residency] [varchar](50) NULL,
	[PhysicsAverage] [float] NULL,
	[PhysicsCount] [float] NULL,
	[MathAverage] [float] NULL,
	[MathCount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



DECLARE @physics TABLE (id varchar(50)
				, PhysicsCount FLOAT
				, PhysicsAverage FLOAT
				)

DECLARE @math TABLE (id varchar(50)
				, MathCount FLOAT
				, MathAverage FLOAT
				)

INSERT INTO @physics
select p.PlaceholderID
, COUNT(p.PlaceholderID) AS PhysicsCount
, AVG(p.grade_code) AS PhysicsAverage
from AllData AS p
where p.grade_code <= 4.0
AND p.SubjectCode = 'PHY'
GROUP BY p.PlaceholderID

INSERT INTO @math
select p.PlaceholderID
, COUNT(p.PlaceholderID) AS MathCount
, AVG(p.grade_code) AS MathAverage
from AllData AS p
where p.grade_code <= 4.0
AND p.SubjectCode = 'MTH'
GROUP BY p.PlaceholderID

INSERT INTO StudentVector
SELECT s.PlaceholderID
, s.citizenship
, s.[degree conferred for this major]
, s.EndTermSeqID
, s.Ethnicity
, s.[First Gen]
, s.[first term in major]
, s.gndr_flag
, s.[graduated MSU]
, s.[graduated MSU primary major]
, s.major_code
, s.[most recent term in major]
, s.[pre-major class level]
, s.[primary major]
, s.startTermSeqID
, s.[undergrad Residency]
, CASE
	WHEN p.PhysicsAverage IS NULL THEN 0
	ELSE p.PhysicsAverage
  END AS PhysicsAverage
, CASE
	WHEN  p.PhysicsCount IS NULL THEN 0
	ELSE  p.PhysicsCount
  END AS PhysicsCount
, CASE
	WHEN  m.MathAverage IS NULL THEN 0
	ELSE  m.MathAverage
  END AS MathAverage
, CASE
	WHEN  m.MathCount IS NULL THEN 0
	ELSE  m.MathCount
  END AS MathCount
  FROM [MSU_ProjectPathways].[dbo].[Students_cleaned] AS s
  LEFT JOIN @physics AS p
  ON s.PlaceholderID = p.id
  LEFT JOIN @math AS m
  ON s.PlaceholderID = m.id
