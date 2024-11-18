https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=196169489#gid=196169489


declare @today_date date;				
declare @n int;				
set @today_date = '2024-11-18';				
set @n = 3;				
				
--SELECT @today_date as today__;				
				
SELECT datepart(weekday, @today_date); ---- 2				
				
				
SELECT dateadd(day, 8-datepart(weekday, @today_date), @today_date)  --- 2024-11-24				
				
--Sunday = 1				
--Monday = 2				
--Tuesday = 3				
--...,				
--Saturday = 7				
				
				
SELECT dateadd(week, @n-1, dateadd(day, 8-datepart(weekday, @today_date), @today_date))  --- 2024-12-08				
				
