/****** Script for SelectTopNRows command from SSMS  ******/
SELECT s.[PlaceholderID]
      ,CASE
	  WHEN [gndr_flag] = 'M' THEN 0
	  ELSE 1
	  END AS gndr_flag
      ,CASE
	  WHEN [Ethnicity] = 'Black or African American  (non-Hispanic)' THEN 0
	  WHEN Ethnicity = 'International' THEN 1
	  WHEN Ethnicity = 'Two or more races (non-Hispanic)' THEN 2
	  WHEN Ethnicity = 'American Indian/Alaskan Native (non-Hispanic)' THEN 3
	  WHEN Ethnicity = 'Hawaiian / Pacific Islander (non-Hispanic)' THEN 4
	  WHEN Ethnicity = 'Asian / Pacific Islander' THEN 5
	  WHEN Ethnicity = 'Asian (non-Hispanic)' THEN 6
	  WHEN Ethnicity = 'White (non-Hispanic)' THEN 7
	  WHEN Ethnicity = 'Hispanic Ethnicity' THEN 8
	  WHEN Ethnicity = 'Not Reported' THEN 9
	  END AS Ethnicity
      ,CASE
	  WHEN [First Gen] = 'N' THEN 0
	  ELSE 1
	  END as first_gen
      , CASE
	  WHEN mc.category = 'Engineering' THEN 0
	  WHEN mc.category = 'Other Non-STEM' THEN 1
	  WHEN mc.category = 'Other STEM' THEN 2
	  WHEN mc.category = 'Physics' THEN 3
	  ELSE ISNULL(mc.category, 4) 
	  END as graduated_category
	  ,CASE
	  WHEN [pre-major class level] = '1 - FR' THEN 0
	  WHEN [pre-major class level] = '2 - SO' THEN 1
	  WHEN [pre-major class level] = '3 - JR' THEN 2
	  WHEN [pre-major class level] = '4 - SR' THEN 3
	  END as [pre-major class level]
	  , ISNULL(lm.cnt, 0) AS lower_math_count
	  , ISNULL(lm.mathGPA, 0) AS lower_math_avg
	  , ISNULL(lm.mathSTD, 0) AS lower_math_std
	  , ISNULL(um.cnt, 0) AS upper_math_count
	  , ISNULL(um.mathGPA, 0) AS upper_math_avg
	  , ISNULL(um.mathSTD, 0) AS upper_math_std
	  , ISNULL(lp.cnt, 0) AS lower_physics_count
	  , ISNULL(lp.mathGPA, 0) AS lower_physics_avg
	  , ISNULL(lp.mathSTD, 0) AS lower_physics_std
	  , ISNULL(up.cnt, 0) AS upper_physics_count
	  , ISNULL(up.mathGPA, 0) AS upper_physics_avg
	  , ISNULL(up.mathSTD, 0) AS upper_physics_std

INTO student_vector
  FROM [MSU_ProjectPathways].[dbo].[Students_cleaned] as s
  LEFT JOIN MajorCategories AS mc
  on mc.[graduated MSU primary major] = s.[graduated MSU primary major]
  LEFT JOIN lower_math_courses lm
  ON s.PlaceholderID = lm.PlaceholderID
  LEFT JOIN upper_math_courses um
  ON s.PlaceholderID = um.PlaceholderID
  LEFT JOIN lower_physics_courses lp
  ON s.PlaceholderID = lp.PlaceholderID
  LEFT JOIN upper_physics_courses up
  ON s.PlaceholderID = up.PlaceholderID

  GROUP BY s.PlaceholderID
  , s.gndr_flag
  , s.Ethnicity
  , s.[First Gen]
  , mc.category
  , s.[pre-major class level]
  	  , lm.cnt
	  , lm.mathGPA
	  , lm.mathSTD
	  , um.cnt
	  , um.mathGPA
	  , um.mathSTD
	  , lp.cnt
	  , lp.mathGPA
	  , lp.mathSTD
	  , up.cnt
	  , up.mathGPA
	  , up.mathSTD
