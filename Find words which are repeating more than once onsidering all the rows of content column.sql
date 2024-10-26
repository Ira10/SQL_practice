https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1511253319#gid=1511253319

  

SELECT value, count(1) AS occ	
	
from namaste_python	
	
cross apply string_split(content,' ')	
	
GROUP BY value	
	
HAVING count(1) > 1;	
