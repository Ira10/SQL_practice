https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=222852350#gid=222852350
  
  1  my solution	
	
SELECT s.phone_number,	
s.start_time,	
min(e.end_time) AS end_time,	
DATEDIFF(minute, s.start_time, min(e.end_time)) AS duration	
	
FROM call_start_logs s	
JOIN call_end_logs e	
ON s.phone_number = e.phone_number	
AND s.start_time < e.end_time	
	
GROUP BY  s.phone_number,	
	s.start_time
	
ORDER BY s.start_time	


2 Union and Row and Group by			
			
WITH base AS (			
SELECT phone_number,			
start_time AS call_time,			
	row_number() OVER(partition by phone_number order by start_time) AS rn		
			
FROM call_start_logs			
			
UNION ALL			
			
SELECT *,			
	row_number() OVER(partition by phone_number order by end_time) AS rn		
FROM call_end_logs			
)			
			
SELECT phone_number,			
rn,			
min(call_time) AS start_time_,			
max(call_time) AS end_time_,			
DATEDIFF(minute, min(call_time), max(call_time)) AS duration			
			
FROM base			
			
GROUP BY  phone_number, rn			
			
ORDER BY phone_number			
			
