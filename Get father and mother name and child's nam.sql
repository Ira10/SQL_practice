1		https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1161081440#gid=1161081440

  
WITH father_name AS (			
SELECT b.c_id, p.name AS father_name			
			
FROM relations b			
JOIN people p			
	ON b.p_id = p.id AND p.gender = 'M' )		
			
, mother_name AS (			
SELECT b.c_id, p.name AS mother_name			
			
FROM relations b			
JOIN people p			
	ON b.p_id = p.id AND p.gender = 'F' )		
			
SELECT father_name, mother_name, p.name AS child_name			
			
FROM father_name f			
JOIN mother_name m			
ON f.c_id = m.c_id			
			
JOIN people p			
ON f.c_id = p.id			
