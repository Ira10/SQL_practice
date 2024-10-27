Find the new customer added in each month	
	
WITH base AS (	
SELECT customer, min(order_date) AS first_order	
FROM sales	
GROUP BY customer	
)	
	
SELECT first_order, COUNT(customer) AS new_cust	
FROM base	
GROUP BY first_order	



https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1388912625#gid=1388912625
