-- 🔍 Find employees who:
-- 1. Earn less than 30000
-- 2. Have a manager
-- 3. But their manager has LEFT the company
--    (i.e., manager_id exists in their row, but not in the Employees table)

SELECT e.employee_id
FROM Employees e
WHERE e.salary < 30000                     -- Only consider employees with salary less than 30000
  AND e.manager_id IS NOT NULL            -- Ignore employees with no manager (manager_id is NULL)
  

  AND NOT EXISTS (
    SELECT 1
    FROM Employees m
    WHERE m.employee_id = e.manager_id    -- If this returns a row, manager is still present
  )
  
ORDER BY e.employee_id;                   -- Sort the result by employee_id in ascending order
