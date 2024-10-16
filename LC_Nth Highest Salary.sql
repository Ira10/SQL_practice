Nth Highest Salary							16th Oct																		
																									
Write a solution to find the nth highest salary from the Employee table. If there is no nth highest salary, return null.																									


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS					
BEGIN					
DECLARE @result INT;					
WITH RankedSalaries AS (					
SELECT salary,					
RANK() OVER (ORDER BY salary DESC) AS RankSalary					
FROM Employee					
GROUP BY salary					
)					
SELECT @result = max(salary)					
FROM RankedSalaries					
WHERE RankSalary = @N;					
RETURN @result;					
END;					
