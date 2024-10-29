https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1772935096#gid=1772935096


WITH base AS (
select *,
       row_number() over(partition by state order by population asc) as mi, 
       row_number() over(partition by state order by population desc) as max

from city_population
)
 
 SELECT state,
        max(case when max = 1 then city end) as max_,
        min(case when mi = 1 then city end) as min_
 
 FROM Base b 
 
 GROUP BY state
