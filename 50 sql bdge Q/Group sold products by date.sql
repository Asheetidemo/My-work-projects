-- Table: Activities
-- Columns:
-- sell_date (date): The date when the product was sold
-- product (varchar): Name of the product

-- Goal:
-- For each sell_date, return:
-- 1. The number of **distinct products** sold (num_sold)
-- 2. The **list of those products**, sorted lexicographically and separated by commas (products)
-- Order the result by sell_date
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,   -- count unique products sold on that date
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
    -- combine unique product names, sorted lexicographically, separated by commas
FROM 
    Activities
GROUP BY 
    sell_date         -- group the results by each sell_date
ORDER BY 
    sell_date;        -- sort final result by date
