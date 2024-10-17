WITH some AS
(
  SELECT 1 AS NUM  -- anchor query

  UNION ALL

  SELECT NUM + 1   --- recursive query
  FROM SOME
  WHERE NUM < 7     -- filter to stop recursion
)

  SELECT NUM
  
  FROM SOME

