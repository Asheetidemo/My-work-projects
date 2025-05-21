-- Calculate number of bank accounts in each salary category:
-- "Low Salary" (< 20000)
-- "Average Salary" (20000 to 50000 inclusive)
-- "High Salary" (> 50000)

SELECT 'Low Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION ALL

SELECT 'Average Salary',
       COUNT(*)
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION ALL

SELECT 'High Salary',
       COUNT(*)
FROM Accounts
WHERE income > 50000;
