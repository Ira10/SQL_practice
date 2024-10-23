https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1461418529#gid=1461418529

1. STACKOVERFLOW	
  
WITH Base AS (					
SELECT * , filter_room_types.Value AS Split_filter_room_types					
FROM airbnb_searches					
cross apply STRING_SPLIT (filter_room_types, ',') filter_room_types					
)					
					
SELECT Split_filter_room_types, COUNT(1) AS occu									
FROM Base										
GROUP BY Split_filter_room_types					
ORDER BY occu DESC;					



2. Ankit Bansal	
  
SELECT VALUE AS room_type, COUNT(1) AS occu					
FROM airbnb_searches					
cross apply STRING_SPLIT (filter_room_types, ',')					
GROUP BY  VALUE  -- room_type --  Invalid column name 'room_type'.					
ORDER BY occu DESC;					
					
