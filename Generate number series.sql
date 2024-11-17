Generate series of numbers as many as this number	      ---- https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=2140395987#gid=2140395987
1	                                                      ---- 17th Nov
2	
3	
4	
5	
9	

1. select n	
from numbers	
cross apply generate_series(1, n)	


2. WITH base AS (
SELECT *,
row_number() OVER(Order by (select null)) as n
FROM sys.all_columns
)

SELECT b.n
FROM base a
JOIN numbers b
ON a.n <= b.n
order by b.n
