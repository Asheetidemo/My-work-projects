/*
Table: MyNumbers

A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null.

Example 1:
Input: 
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+

Output: 
+-----+
| num |
+-----+
| 6   |
+-----+

Example 2:
Input: 
+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+

Output: 
+------+
| num  |
+------+
| null |
+------+
*/

SELECT 
    MAX(num) AS num
FROM 
    MyNumbers
WHERE 
    num IN (
        SELECT 
            num
        FROM 
            MyNumbers
        GROUP BY 
            num
        HAVING 
            COUNT(*) = 1
    );
