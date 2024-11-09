https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?pli=1&gid=177312339#gid=177312339

  
9th Nov

    WITH BASE AS (			
SELECT department_id,			
avg(salary) as dep_avg_salary			
			
FROM emp			
GROUP by department_id			
)			
			
select a.department_id,			
avg(a.dep_avg_salary) AS dep_avg_salary_,			
AVG(b.salary) as all_avg			
			
from base a			
join emp b			
ON a.department_id != b.department_id			
			
GROUP by a.department_id			
			
HAVING avg(a.dep_avg_salary) <= AVG(b.salary)			
