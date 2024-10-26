https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1226838458#gid=1226838458


Condition 1 : Both conditions should have 'Y'
ans Condition 2 : Min 2 team member should qualify



  
WITH base AS (	
select *,	
CASE WHEN criteria1 = 'Y' AND criteria2 = 'Y' THEN 'Y' ELSE 'N' END as eligible	
	
from Ameriprise_LLC	
)	
	
SELECT *,	
COUNT(CASE WHEN eligible = 'Y' THEN 1 END) OVER(PARTITION BY teamid) as eligb_team_members,	
CASE WHEN eligible = 'Y' AND (COUNT(CASE WHEN eligible = 'Y' THEN 1 END) OVER(PARTITION BY teamid)) >= 2 THEN 'Y' ELSE 'N' END AS output	
	
FROM base	
