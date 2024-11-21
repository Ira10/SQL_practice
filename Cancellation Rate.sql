https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=393484086#gid=393484086

-- 21st Nov


  
SELECT request_at,	
count(case when status in ('cancelled_by_client', 'cancelled_by_driver') then 1 else null end) as cancelled_trip_count,	
count(1) as total_trips,	
(1.0*count(case when status in ('cancelled_by_client', 'cancelled_by_driver') then 1 else null end)/count(1)) * 100 as cancel_rate	
	
from Trips t	
JOIN Users c   ON t.client_id = c.users_id	
JOIN Users d   ON t.driver_id = d.users_id	
	
WHERE c.banned = 'No'	
AND d.banned = 'No'	
	
group by request_at	
	
