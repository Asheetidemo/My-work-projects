-- Tables: Employees
-- Columns: employee_id (int), name (varchar), reports_to (int), age (int)

-- Goal: Find managers, number of direct reports, and average age of their reports (rounded)

SELECT 
    e.employee_id,
    e.name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age)) AS average_age
FROM 
    Employees e
JOIN 
    Employees r ON e.employee_id = r.reports_to
GROUP BY 
    e.employee_id,
    e.name
ORDER BY 
    e.employee_id;
