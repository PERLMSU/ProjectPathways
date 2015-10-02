INSERT INTO MSU_ProjectPathways.dbo.AllData
SELECT *
FROM
(
SELECT  s.[PlaceholderID]
      ,s.[gndr_flag]
      ,s.[citizenship]
      ,s.[Ethnicity]
      ,s.[First Gen]
      ,s.[undergrad Residency]
      --,s.[major_code]
      ,s.[primary major]
      ,s.[degree conferred for this major]
      ,s.[graduated MSU]
      ,s.[graduated MSU primary major]
      ,s.[startTermSeqID]
      ,s.[EndTermSeqID]
      ,s.[first term in major]
      ,s.[most recent term in major]
      ,s.[pre-major class level]
      ,s.[most recent term in major class level]
      ,p.[term_seq_id] AS PhysicsTermSeqID
      ,p.[term_code] AS PhysicsTermCode
      ,p.[subj_code] AS SubjectCode
      ,p.[crse_code]
      ,p.[sctn_code]
      ,p.[grade_code]
	  ,mj.[long_desc] AS Major
      ,mj.[coll_code]
      ,mj.[college]
      --,mj.[dept_code]
      ,mj.[department]
      ,mj.[award_type]
      ,mj.[degree type]
      ,mj.[first primary bachelor degree]
FROM [MSU_ProjectPathways].[dbo].[Students] AS s
JOIN [MSU_ProjectPathways].[dbo].[PhysicsCourses] AS p
ON s.PlaceholderID = p.PlaceholderID
JOIN MSU_ProjectPathways.dbo.MajorCodes AS mj
ON mj.major_code = s.major_code

UNION

SELECT s.[PlaceholderID]
      ,s.[gndr_flag]
      ,s.[citizenship]
      ,s.[Ethnicity]
      ,s.[First Gen]
      ,s.[undergrad Residency]
      --,s.[major_code]
      ,s.[primary major]
      ,s.[degree conferred for this major]
      ,s.[graduated MSU]
      ,s.[graduated MSU primary major]
      ,s.[startTermSeqID]
      ,s.[EndTermSeqID]
      ,s.[first term in major]
      ,s.[most recent term in major]
      ,s.[pre-major class level]
      ,s.[most recent term in major class level]
      ,m.[term_seq_id]
      ,m.[term_code]
      ,m.[subj_code]
      ,m.[crse_code]
      ,m.[sctn_code]
      ,m.[grade_code]
	  --,mj.[major_code]
      ,mj.[long_desc] AS Major
      ,mj.[coll_code]
      ,mj.[college]
      --,mj.[dept_code]
      ,mj.[department]
      ,mj.[award_type]
      ,mj.[degree type]
      ,mj.[first primary bachelor degree]

FROM [MSU_ProjectPathways].[dbo].[Students] AS s
JOIN MSU_ProjectPathways.dbo.MathCourses AS m
ON s.PlaceholderID = m.PlaceholderID
JOIN MSU_ProjectPathways.dbo.MajorCodes AS mj
ON mj.major_code = s.major_code
) AS t
