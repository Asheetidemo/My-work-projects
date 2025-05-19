/*
Write a SQL query to select the product_id, year, quantity, and price for the first year of every product sold.
If any product is bought multiple times in its first year, return all sales separately.

Return the resulting table in any order.

Example:

Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Expected output:
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
*/

SELECT 
    s.product_id, 
    s.year AS first_year, 
    s.quantity, 
    s.price
FROM 
    Sales s
JOIN 
    (
        SELECT 
            product_id, 
            MIN(year) AS first_year
        FROM 
            Sales
        GROUP BY 
            product_id
    ) first_years 
    ON s.product_id = first_years.product_id 
    AND s.year = first_years.first_year;
