https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1532069312#gid=1532069312      --- 7th Dec


WITH base AS (			
SELECT name			
, floor			
, count(1) as floor_max			
, rank() Over(partition by name order by count(1) desc) as rnk			
			
FROM entries e			
			
group by name, floor			
)			
			
SELECT * --,  STRING_AGG( resources, ',') as so			
			
FROM base			
			
WHERE rnk = 1			
			
SELECT name			
, STRING_AGG( resources, ',') as so			
			
FROM entries e			
			
group by name			
