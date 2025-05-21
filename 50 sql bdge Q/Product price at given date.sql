-- 💬 Question:
-- Table: Products
--
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
--
-- (product_id, change_date) is the primary key.
-- Each row indicates that the price of a product was changed on a date.
--
-- ✅ Goal: Find the price of each product on date '2019-08-16'.
-- If no change was made before this date, the default price is 10.
--
-- Example Input:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+
--
-- ✅ Output:
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+

-- ✅ SQL Solution:

SELECT
  p.product_id,
  COALESCE(
    (
      SELECT new_price
      FROM Products p2
      WHERE p2.product_id = p.product_id
        AND p2.change_date <= '2019-08-16'
      ORDER BY p2.change_date DESC
      LIMIT 1
    ),
    10 -- default price
  ) AS price
FROM (
  SELECT DISTINCT product_id
  FROM Products
) p;
