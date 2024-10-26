https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1522020406#gid=1522020406


WITH base AS (	
SELECT *,	
COALESCE(lag(year) over(partition by company order by year),0) as last_year,	
COALESCE(lag(revenue) over(partition by company order by year),0) as last_revenue	
	
from company_revenue	
)	
	
SELECT company,	
COUNT(case when revenue > last_revenue then year end) as growth_year_count,	
count(year) AS year_count	
	
FROM base	
	
GROUP BY company	
	
HAVING COUNT(case when revenue > last_revenue then year end) = count(year)	
	
