https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=67391091#gid=67391091

UPDATE seats		
SET seats.id = s1.new		
FROM		
(SELECT *,		
CASE  WHEN ID%2=0 THEN LAG(ID,1) OVER(ORDER BY ID)		
ELSE LEAD(ID,1, ID) OVER(ORDER BY ID)		
END AS NEW		
		
FROM seats) s1		
where seats.id = s1.id		


------------------------------------------------------------------------------
ANKIT 2.O			
SELECT *,			
CASE WHEN ID%2=0 THEN LAG(ID,1) OVER(ORDER BY ID)			
ELSE LEAD(ID,1, ID) OVER(ORDER BY ID)			
END AS NEW			
			
FROM seats			
