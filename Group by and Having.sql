https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1945965890#gid=1945965890
--18th nov

SELECT student_id	
FROM exams	
Where subject in ("Math", "Physics")	
GROUP BY student_id	
Having COUNT(DISTINCT subject_id) = 2 AND COUNT(DISTINCT marks) = 1	

