https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=931581704#gid=931581704


1. Join		
		
WITH intime AS (		
SELECT emp_id, MAX(time) AS latest_in_time		
		
FROM hospital h1		
WHERE h1.action = 'in'		
		
GROUP BY emp_id		
)		
		
, outtime AS (		
SELECT emp_id, MAX(time) AS latest_OUT_time		
		
FROM hospital h1		
WHERE h1.action = 'out'		
		
GROUP BY emp_id		
)		
		
SELECT  intime.emp_id		
		
FROM intime		
FULL OUTER JOIN outtime		
ON intime.emp_id = outtime.emp_id		
		
WHERE latest_in_time > latest_out_time 		
       OR latest_out_time IS NULL		

