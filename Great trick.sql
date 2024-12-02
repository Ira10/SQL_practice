https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1097481233#gid=1097481233


WITH Base AS (	
SELECT *,	
row_number() OVER(partition by state order by date_value) as rn,	
dateadd(day, -1 * row_number() OVER(partition by state order by date_value), date_value) as group_date	
	
FROM tasks	
)	
	
SELECT group_date	
, state	
, min(date_value) AS start_date	
, max(date_value) AS end_date	
	
FROM Base	
	
GROUP BY group_date	
, state	
