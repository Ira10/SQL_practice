https://docs.google.com/spreadsheets/d/1_Y46EL4nvmdzsGFqQLecMkhBNPWKt2rL-Neto4NU6Ek/edit?gid=913048588#gid=913048588


with base as (			
			
SELECT			
*,			
ROW_NUMBER() OVER ( PARTITION BY player_id ORDER BY match_day) as a,			
ROW_NUMBER() OVER ( PARTITION BY player_id, result ORDER BY match_day) as b,			
ROW_NUMBER() OVER (			
PARTITION BY player_id			
ORDER BY match_day			
) - ROW_NUMBER() OVER (			
PARTITION BY player_id, result			
ORDER BY match_day			
) AS rk			
FROM Player_Match_Results			
			
--order by player_id, match_day			
)			
			
, summary AS (			
select player_id, rk, count(1) as streaks, rank() over(partition by player_id order by count(1) desc) as rank_			
			
from base			
			
where result = 'Win'			
			
group by player_id, rk			
)			
			
SELECT player_id, streaks			
			
FROM summary			
			
WHERE rank_ = 1			
