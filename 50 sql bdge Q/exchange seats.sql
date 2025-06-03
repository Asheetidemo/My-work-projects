-- 🎯 Problem:
-- You are given a table called 'Seat' that stores student IDs and their names.
-- The ID starts from 1 and increases continuously (1, 2, 3, ...).
-- Write a SQL query to swap the seat (id) of every two consecutive students.
-- If the number of students is odd, leave the last student as it is.

-- 🔢 Table: Seat
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Abbot   |
-- | 2  | Doris   |
-- | 3  | Emerson |
-- | 4  | Green   |
-- | 5  | Jeames  |
-- +----+---------+

-- ✅ Expected Output:
-- +----+---------+
-- | id | student |
-- +----+---------+
-- | 1  | Doris   |
-- | 2  | Abbot   |
-- | 3  | Green   |
-- | 4  | Emerson |
-- | 5  | Jeames  |
-- +----+---------+

-- 💡 Logic:
-- - If id is odd → swap with next (id + 1), but only if next exists
-- - If id is even → swap with previous (id - 1)
-- - If odd and no next → stay in place

SELECT
    -- 👇 Swap id logic
    CASE
        WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1  
        WHEN id % 2 = 0 THEN id - 1                                           
        ELSE id                                                             
    END AS id,

    student
FROM Seat
ORDER BY id;  