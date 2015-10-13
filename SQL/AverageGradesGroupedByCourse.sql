/****** Script for SelectTopNRows command from SSMS  ******/
DECLARE @cleaned TABLE (id INT IDENTITY(1,1) NOT NULL PRIMARY KEY
						, PlaceholderID VARCHAR(50) NOT NULL
						, term_seq_id VARCHAR(50)
						, term_code VARCHAR(50)
						, subj_crse_code VARCHAR(50)
						, grade_code FLOAT--VARCHAR(50)
						, UNIQUE(id))

INSERT INTO @cleaned
SELECT PlaceholderID
, term_seq_id
, term_code
--, subj_code + '_' + crse_code
, CASE 
	WHEN crse_code LIKE '%A%' THEN subj_code + '_' + LEFT(crse_code, LEN(crse_code) - 1)
	WHEN crse_code LIKE '%B%' THEN subj_code + '_' + LEFT(crse_code, LEN(crse_code) - 1)
	WHEN crse_code LIKE '%C%' THEN subj_code + '_' + LEFT(crse_code, LEN(crse_code) - 1)
	WHEN crse_code LIKE '%E%' THEN subj_code + '_' + LEFT(crse_code, LEN(crse_code) - 1)
	ELSE subj_code + '_' + crse_code
END
, CASE 
	WHEN grade_code = 'DF' THEN 5.0
	WHEN grade_code = 'I' THEN 6.0
	WHEN grade_code = 'N' THEN 7.0
	WHEN grade_code = 'P' THEN 8.0
	WHEN grade_code = 'U' THEN 9.0
	WHEN grade_code = 'V' THEN 10.0
	WHEN grade_code = 'W' THEN 11.0
	ELSE grade_code
END
  FROM [MSU_ProjectPathways].[dbo].[AllCourses]
  WHERE subj_code != '' -- REMOVE BLANKS
  AND crse_code NOT LIKE '%Q%' -- REMOVE COURSES FROM QUARTER SYSTEM
  AND subj_code NOT LIKE '%LB%' -- REMOVE LYMAN BRIGGS COURSES
  AND term_code NOT IN ('US96','US97','US99','FS94','FS95','FS96','FS97','FS98','FS99','SS95','SS96','SS97','SS98','SS99') -- REMOVE SEMESTERS WITH LOW UNIQUE STUDENT COUNTS BEFORE 2000
 AND crse_code NOT IN ('499','899','999') -- REMOVE RESEARCH HOURS 

 /****** EVERYONE ******/
--SELECT subj_crse_code
--, COUNT(DISTINCT PlaceholderID)
--, AVG(grade_code)
--, STDEV(grade_code)
--FROM @cleaned
--WHERE grade_code <= 4.0
--GROUP BY subj_crse_code
--HAVING COUNT(DISTINCT PlaceholderID) > 20

/****** GRADUATES ******/
SELECT c.subj_crse_code
, COUNT(DISTINCT c.PlaceholderID)
, AVG(c.grade_code)
, STDEV(c.grade_code)
FROM Students_cleaned AS s
LEFT JOIN @cleaned AS c
ON s.PlaceholderID = c.PlaceholderID
WHERE s.[graduated MSU] = 'Y'
GROUP BY subj_crse_code
HAVING COUNT(DISTINCT c.PlaceholderID) > 20
