id	formula	value	new_value
1	1+4	10	30
2	2+1	5	15
3	3-2	40	35
4	4-1	20	10


WITH base AS (	
	
SELECT *, LEFT(formula,1) AS D1,  RIGHT(formula,1) AS D2, SUBSTRING(formula,2,1) AS O	
	
FROM input	
)	
select b1.*, b2.value , b3.value,	
case when b1.o = '+' then b2.value + b3.value	
when b1.o = '-' and b2.value < b3.value then  b3.value - b2.value	
when b1.o = '-' and b3.value < b2.value then  b2.value - b3.value	
end as result	
	
from base b1	
join base b2	
on b1.d1 = b2.id	
	
join base b3	
on b1.d2 = b3.id	
	
