Leetcode Hard  ---- 12th Nov   ------    https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1149023351#gid=1149023351

WITH BASE AS (		
SELECT *,		
ROW_NUMBER() OVER(ORDER BY visit_date) AS ROW_,		
ID-ROW_NUMBER() OVER(ORDER BY visit_date) AS check_		
FROM stadium		
WHERE no_of_people >= 100		
)		
		
, summary AS (		
SELECT check_, count(1) AS something		
FROM BASE		
GROUP BY check_		
Having count(1) >= 3		
)		
		
SELECT *		
FROM base		
WHERE check_ = (SELECT check_ from summary)		


Input		
row	visit date	no of people
1	2017-07-01	10
2	2017-07-02	109
3	2017-07-03	150
4	2017-07-04	99
5	2017-07-05	145
6	2017-07-06	1455
7	2017-07-07	199
8	2017-07-08	188


