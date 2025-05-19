/*
Table: Customer

+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| int         | int         |
+-------------+-------------+
This table may contain duplicate rows.
customer_id is not NULL.
product_key is a foreign key referencing Product table.

Table: Product

+-------------+
| product_key |
+-------------+
| int         |
+-------------+
product_key is the primary key for this table.

Question:
Write a query to find all customer_ids from the Customer table
who bought all products listed in the Product table.
Return the result in any order.

Example:
Customer:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+

Product:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+

Output:
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+

Explanation:
Customers 1 and 3 bought both products 5 and 6.
*/

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(DISTINCT product_key)
    FROM Product
);
