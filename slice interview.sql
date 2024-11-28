	start_date	end_date		              ----- https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1686544316#gid=1686544316
U1	1-1-2024	1-19-2024		
U2	1-8-2024	1-23-2024		
U3	1-25-2024	1-28-2024		
U4	1-4-2024	1-9-2024		
						
Overlap				
U1	Yes			
U2	Yes			
U3	No			
U4	Yes			


SELECT User,	
	    CASE WHEN b.start_date IS NOT NULL THEN 'Yes' ELSE 'NO' END as overlap	
	
FROM USERS a		
LEFT JOIN USERS b	
	
ON (a.start_date BETWEEN b.start_date AND b.end_date)	
	
OR (a.end_date BETWEEN b.start_date AND b.end_date)	
	
AND a.user != b.user	
