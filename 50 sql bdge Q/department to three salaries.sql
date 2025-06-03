-- Table: Employee
-- Columns: id (PK), name, salary, departmentId (FK to Department.id)

-- Table: Department
-- Columns: id (PK), name

-- Find employees who are high earners in their departments.
-- A "high earner" is someone whose salary is in the top 3 unique salaries within that department.
-- Return Department name, Employee name, and Salary.
-- Output order does not matter.

SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM 
    Employee e
JOIN 
    Department d ON e.departmentId = d.id
WHERE 
    -- Select employees whose salary ranks in top 3 unique salaries in their department
    e.salary >= (
        SELECT MIN(top_salaries.salary)
        FROM (
            SELECT DISTINCT salary
            FROM Employee
            WHERE departmentId = e.departmentId
            ORDER BY salary DESC
            LIMIT 3
        ) AS top_salaries
    );
