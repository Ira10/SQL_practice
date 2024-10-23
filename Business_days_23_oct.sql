https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=652132541#gid=652132541


WITH holiday_cte AS			
(			
SELECT ticket_id, tickets.create_date, resolved_date, count(DISTINCT holidays.reason) AS holidays_			
FROM tickets			
LEFT JOIN holidays			
ON holiday_date BETWEEN tickets.create_date AND tickets.resolved_date			
GROUP BY ticket_id, tickets.create_date, resolved_date			
)			
			
SELECT t.ticket_id			
--  , hc.holidays_			
--  , Datepart(WEEK, t.create_date) AS WEEK_create			
-- , Datepart(WEEK, t.resolved_date) AS WEEK_resolve			
--  , DATEDIFF(DAY, t.create_date, t.resolved_date) AS DAYS_diff			
--  , DATEDIFF(WEEK, t.create_date, t.resolved_date) AS week_diff			
			
, DATEDIFF(DAY, t.create_date, t.resolved_date)  - 2 * DATEDIFF(WEEK, t.create_date, t.resolved_date) - hc.holidays_ AS excluding_holiday_n_weekend			
			
FROM tickets t			
LEFT JOIN holiday_cte hc			
ON t.ticket_id = hc.ticket_id			
			
