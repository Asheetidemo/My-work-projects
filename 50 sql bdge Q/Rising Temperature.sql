-- Question:
-- Write a solution to find all dates' id with higher temperatures compared to the previous day (yesterday).
-- Return the result table in any order.

-- Input Table: Weather
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+

-- Expected Output:
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+

-- SQL Solution using self-join:

SELECT w1.id
FROM  Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1  -- join to previous day's row
WHERE w1.temperature > w2.temperature;            
