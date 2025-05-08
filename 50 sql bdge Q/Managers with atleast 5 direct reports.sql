-- Find managers with at least 5 direct reports

SELECT 
    e.name
FROM 
    Employee e
WHERE 
    e.id IN (
        SELECT 
            managerId
        FROM 
            Employee
        WHERE 
            managerId IS NOT NULL
        GROUP BY 
            managerId
        HAVING 
            COUNT(*) >= 5
    );
