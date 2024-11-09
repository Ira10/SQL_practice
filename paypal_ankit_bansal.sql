https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?pli=1&gid=1174050110#gid=1174050110          9th Nov


WITH base AS (					                                          my solution
SELECT p.poll_id,					
pa.correct_option_id,					
SUM(CASE WHEN p.poll_option_id != pa.correct_option_id THEN amount END) as sum_to_get,					
SUM(CASE WHEN p.poll_option_id = pa.correct_option_id THEN amount END) as invested_sum					
					
FROM polls p					
join poll_answers pa					
on p.poll_id = pa.poll_id					
					
GROUP by p.poll_id, pa.correct_option_id					
)					
					
SELECT a.user_id,					
(amount * sum_to_get)/invested_sum AS Earned					
					
FROM polls a					
JOIN base b					
ON a.poll_id = b.poll_id					
					
WHERE a.poll_option_id = b.correct_option_id					
