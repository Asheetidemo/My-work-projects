-- Table: Customer
-- Columns:
-- customer_id : unique ID of the customer
-- name        : customer's name
-- visited_on  : date of visit
-- amount      : total amount paid by the customer on that day

-- Primary key is (customer_id, visited_on).

-- Goal:
-- For each date in the table (where there's at least one customer),
-- calculate the total amount paid on that date (sum of all customers),
-- and then compute the 7-day moving average of these daily totals.
-- The moving average window is the current day + 6 days before.
-- Round the average_amount to two decimals.

-- Return results ordered by visited_on ascending.
WITH DailyAmount AS (
  SELECT
    visited_on,
    SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
RollingWindow AS (
  SELECT
    d1.visited_on,
    SUM(d2.amount) AS amount,
    ROUND(SUM(d2.amount) / 7, 2) AS average_amount
  FROM DailyAmount d1
  JOIN DailyAmount d2
    ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) AND d1.visited_on
  GROUP BY d1.visited_on
)
SELECT *
FROM RollingWindow
WHERE visited_on >= (SELECT MIN(visited_on) + INTERVAL 6 DAY FROM DailyAmount)
ORDER BY visited_on;
