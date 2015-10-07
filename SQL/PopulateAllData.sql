
-- ALL DATA
select *
into AllData
from (
select s.[id]
      ,s.[PlaceholderID]
      ,s.[gndr_flag]
      ,s.[citizenship]
      ,s.[Ethnicity]
      ,s.[First Gen]
      ,s.[undergrad Residency]
      ,s.[major_code]
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
	  --,p.[PlaceholderID]
      ,p.[term_seq_id]
      ,p.[term_code]
      ,p.[subj_code]
      ,p.[crse_code]
      ,p.[sctn_code]
      ,p.[grade_code]
from Students_cleaned as s
left join PhysicsCourses as p
on s.PlaceholderID = p.PlaceholderID

union

select s.[id]
      ,s.[PlaceholderID]
      ,s.[gndr_flag]
      ,s.[citizenship]
      ,s.[Ethnicity]
      ,s.[First Gen]
      ,s.[undergrad Residency]
      ,s.[major_code]
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
	  --,m.[PlaceholderID]
      ,m.[term_seq_id]
      ,m.[term_code]
      ,m.[subj_code]
      ,m.[crse_code]
      ,m.[sctn_code]
      ,m.[grade_code]
from Students_cleaned as s
left join MathCourses as m
on s.PlaceholderID = m.PlaceholderID
) as t
