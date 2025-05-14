/* 
📝 SQL Question:
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

Example 1:

Input: 
Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+

Output: 
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+

Explanation: 
- Customer 1's first order is scheduled.
- Customer 2's first order is immediate.
- Customer 3's first order is scheduled.
- Customer 4's first order is immediate.
- Half the customers (2 out of 4) have immediate first orders.
*/

SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 
        2
    ) AS immediate_percentage
FROM 
    (SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
     FROM 
        Delivery
     GROUP BY 
        customer_id
    ) AS FirstOrders
JOIN 
    Delivery d 
ON 
    FirstOrders.customer_id = d.customer_id 
AND 
    FirstOrders.first_order_date = d.order_date;
