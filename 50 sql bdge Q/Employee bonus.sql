-- Question:
-- Write a solution to report the name and bonus amount of each employee 
-- with a bonus less than 1000.
-- Return the result table in any order.

-- Tables:
-- Employee table:
-- +-------+--------+------------+--------+
-- | empId | name   | supervisor | salary |
-- +-------+--------+------------+--------+
-- | 3     | Brad   | null       | 4000   |
-- | 1     | John   | 3          | 1000   |
-- | 2     | Dan    | 3          | 2000   |
-- | 4     | Thomas | 3          | 4000   |
-- +-------+--------+------------+--------+

-- Bonus table:
-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+

-- Expected Output:
-- +------+-------+
-- | name | bonus |
-- +------+-------+
-- | Brad | null  |
-- | John | null  |
-- | Dan  | 500   |
-- +------+-------+

-- SQL Query:
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
