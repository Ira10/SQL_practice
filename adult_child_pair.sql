https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=157731624#gid=157731624



with adult AS (		
		
SELECT *		
FROM family		
WHERE type = 'Adult'		
)		
		
, child AS (		
		
SELECT *		
FROM family		
WHERE type = 'Child'		
)		
		
SELECT *		
		
FROM adult a		
LEFT JOIN child c		
ON RIGHT(a.person,1) = RIGHT(c.person,1)		
		
