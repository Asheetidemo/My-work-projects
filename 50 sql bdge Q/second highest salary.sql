-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (unique).
-- Each row contains an employee's salary.

-- 🔹 Task: 
-- Write a query to find the **second highest distinct salary**.
-- If no second highest salary exists, return NULL.
SELECT 
    -- Select second highest salary, or NULL if not found
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    ) AS SecondHighestSalary;
