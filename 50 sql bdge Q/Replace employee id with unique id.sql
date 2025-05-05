-- Question:
-- Write a solution to show the unique ID of each user.
-- If a user does not have a unique ID, just show NULL.
-- Return the result table in any order.

-- Example Input:
-- Employees table:
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 7  | Bob      |
-- | 11 | Meir     |
-- | 90 | Winston  |
-- | 3  | Jonathan |
-- +----+----------+

-- EmployeeUNI table:
-- +----+-----------+
-- | id | unique_id |
-- +----+-----------+
-- | 3  | 1         |
-- | 11 | 2         |
-- | 90 | 3         |
-- +----+-----------+

-- Expected Output:
-- +-----------+----------+
-- | unique_id | name     |
-- +-----------+----------+
-- | null      | Alice    |
-- | null      | Bob      |
-- | 2         | Meir     |
-- | 3         | Winston  |
-- | 1         | Jonathan |
-- +-----------+----------+

-- Solution:

SELECT 
    euni.unique_id,   -- Unique ID from EmployeeUNI, or NULL if not found
    e.name            
FROM 
    Employees e       
LEFT JOIN 
    EmployeeUNI euni 
ON 
    e.id = euni.id;   
