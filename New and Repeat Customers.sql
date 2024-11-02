https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=1459964623#gid=1459964623


--------------   add flags


with base as (		
select customer_id, min(order_date) as first_order		
from customer_orders		
group by customer_id		
)		
		
select co.order_date,		
sum(case when co.order_date = b.first_order then 1 end) as NEW,		
COALESCE(sum(case when co.order_date != b.first_order then 1 end),0) as REPEAT		
from customer_orders co		
join base b		
on co.customer_id = b.customer_id		
		
GROUP BY co.order_date		
