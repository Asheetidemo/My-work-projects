-- ❓ Question:
-- Table: Queue
-- +-----------+-------------+--------+------+
-- | person_id | person_name | weight | turn |
-- +-----------+-------------+--------+------+
-- Each person boards one by one based on their turn.
-- The bus can carry a maximum of 1000 kg.
-- Find the person_name of the **last person** who can board
-- without the total weight exceeding 1000 kg.
-- If adding the next person exceeds the limit, they can't board.

-- ✅ Solution:
-- Step 1: Calculate cumulative weight using SUM() OVER (ORDER BY turn)
-- Step 2: Keep only those where total weight is ≤ 1000
-- Step 3: Pick the last person who fits (highest turn)

SELECT person_name
FROM (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS total_weight,
        turn
    FROM Queue
) AS sub
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
