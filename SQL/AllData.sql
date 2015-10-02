
SELECT *
FROM [MSU_ProjectPathways].[dbo].[Students] AS s
JOIN [MSU_ProjectPathways].[dbo].[PhysicsCourses] AS p
ON s.PlaceholderID = p.PlaceholderID
JOIN MSU_ProjectPathways.dbo.MajorCodes AS mj
ON mj.major_code = s.major_code

UNION

SELECT *
FROM [MSU_ProjectPathways].[dbo].[Students] AS s
JOIN MSU_ProjectPathways.dbo.MathCourses AS m
ON s.PlaceholderID = m.PlaceholderID
JOIN MSU_ProjectPathways.dbo.MajorCodes AS mj
ON mj.major_code = s.major_code
