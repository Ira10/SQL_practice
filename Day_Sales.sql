Ankit Bansal recursive yt                    17th Oct                https://www.youtube.com/watch?v=ewmEHQSQYRM&list=PLBTZqjSKn0IfULLRo9Tm4lESxYMAG7fUQ&index=6

---- This is helpful to generate many rows from small number of rows
WITH base AS				
(				
SELECT min(period_start) as min_, max(period_end) AS max_				
FROM sales				
				
UNION ALL				
				
SELECT dateadd(day,1,min_) AS min_, max_				
FROM base				
WHERE min_ < max_				
)				
				
SELECT product_id, YEAR(min_) AS report_year, Sum(average_daily_sales) as sales				
				
FROM base				
INNER JOIN sales ON min_ BETWEEN period_start AND period_end				
GROUP BY product_id,  YEAR(min_)				
ORDER BY product_id, report_year				
option (maxrecursion 1000);				
