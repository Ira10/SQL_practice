For each exp level, count the total number of candidates and how many of them got a perfect score in each category which they requested to solve tasks

---- 17th Nov


WITH BASE AS (	
	
SELECT *,	
coalesce(sql,0)+ coalesce(algo,0) + coalesce(bug_fixing,0) AS full_score	
	
FROM assessments	
	
)	
	
SELECT experience,	
COUNT(1) AS total_students,	
COUNT(CASE WHEN full_score != 0 AND full_score % 100 = 0 THEN id END) AS max_score_students	
	
FROM BASE	
	
GROUP BY experience	

https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1885249087#gid=1885249087
