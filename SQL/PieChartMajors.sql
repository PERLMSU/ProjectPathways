/****** Script for SelectTopNRows command from SSMS  ******/
DECLARE @total FLOAT

SET @total = (
SELECT COUNT(*)
  FROM [MSU_ProjectPathways].[dbo].[MajorCategories] AS mc
  LEFT JOIN MSU_ProjectPathways.dbo.Students_cleaned AS s
  ON mc.[graduated MSU primary major] = s.[graduated MSU primary major]
  )

SELECT mc.category
, COUNT(mc.category)/@total
  FROM [MSU_ProjectPathways].[dbo].[MajorCategories] AS mc
  LEFT JOIN MSU_ProjectPathways.dbo.Students_cleaned AS s
  ON mc.[graduated MSU primary major] = s.[graduated MSU primary major]
  GROUP BY mc.category
