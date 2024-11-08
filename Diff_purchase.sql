Write a SQL query to find users who purchased diff products on diff days								8th Nov																	
i.e. products purchased on any given day are not repeated on any other day																									

https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?pli=1&gid=1420792428#gid=1420792428

select userid,		
count(DISTINCT productid) as cnt_dis_prod,		
count(distinct purchasedate) as no_of_days,		
count(productid) as cnt_prod		
		
from purchase_history		
		
GROUP BY userid		
		
HAVING  count(distinct purchasedate) > 1		
AND count(DISTINCT productid) = count(productid)	
  

userid	productid	purchasedate
1	1	2012-01-23
1	2	2012-01-23
1	3	2012-01-25
2	1	2012-01-23
2	2	2012-01-23
2	2	2012-01-25
2	4	2012-01-25
3	4	2012-01-23
3	1	2012-01-23
4	1	2012-01-23
4	2	2012-01-25


