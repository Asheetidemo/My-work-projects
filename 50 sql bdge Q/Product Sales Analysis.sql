-- Question:
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
-- Return the resulting table in any order.

-- Tables:
-- Sales table:
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+

-- Product table:
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+


select Sales.year,Sales.price,Product.product_name
from Sales
Left Join product
ON Sales.product_id=Product.product_id