-- Question:
-- Write a solution to find the IDs of the users who visited without making any transactions
-- and the number of times they made such visits (i.e., visits without any transaction).
-- Return the result table in any order.

-- Input Tables:

-- Visits table:
-- +----------+-------------+
-- | visit_id | customer_id |
-- +----------+-------------+
-- | 1        | 23          |
-- | 2        | 9           |
-- | 4        | 30          |
-- | 5        | 54          |
-- | 6        | 96          |
-- | 7        | 54          |
-- | 8        | 54          |
-- +----------+-------------+

-- Transactions table:
-- +----------------+----------+--------+
-- | transaction_id | visit_id | amount |
-- +----------------+----------+--------+
-- | 2              | 5        | 310    |
-- | 3              | 5        | 300    |
-- | 9              | 5        | 200    |
-- | 12             | 1        | 910    |
-- | 13             | 2        | 970    |
-- +----------------+----------+--------+

-- Expected Output:
-- +-------------+----------------+
-- | customer_id | count_no_trans |
-- +-------------+----------------+
-- | 54          | 2              |
-- | 30          | 1              |
-- | 96          | 1              |
-- +-------------+----------------+

-- SQL Solution:

SELECT v.customer_id,COUNT(*) AS count_no_trans             -- number of visits with no transactions
FROM Visits v
LEFT JOIN Transactions t 
ON v.visit_id = t.visit_id               
WHERE t.transaction_id IS NULL              -- filter out visits that had a transaction
GROUP BY v.customer_id;                        
