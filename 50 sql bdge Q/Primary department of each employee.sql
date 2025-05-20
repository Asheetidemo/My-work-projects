-- 👇 Question:
-- Table: Employee
-- +-------------+---------------+--------------+
-- | employee_id | department_id | primary_flag |
-- +-------------+---------------+--------------+
-- | int         | int           | varchar      |
-- (employee_id, department_id) is the primary key.
-- primary_flag is either 'Y' (primary department) or 'N' (not primary).
--
-- Some employees belong to multiple departments. 
-- If they belong to one department only, it will have 'N' but still should be treated as primary.
--
-- 👉 Goal: Return each employee's primary department.


SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION


SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id, department_id
HAVING COUNT(*) = 1;
