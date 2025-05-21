-- 💬 Question:
-- Table: Logs
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column starting from 1.
--
-- Find all numbers that appear at least three times consecutively.
-- Return the result table in any order.
--
-- Example:
-- Input:
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
--
-- Output:
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+

-- ✅ SQL Query to find numbers that appear at least 3 times in a row

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
-- Join with the next row based on id
JOIN Logs l2 ON l1.id = l2.id - 1
-- Join with the next-to-next row based on id
JOIN Logs l3 ON l1.id = l3.id - 2
-- Check if all three rows have the same number
WHERE l1.num = l2.num
  AND l2.num = l3.num;
