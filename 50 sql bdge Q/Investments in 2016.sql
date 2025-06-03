/*
Table: Insurance

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |  -- policy ID, primary key
| tiv_2015    | float |  -- total investment value in 2015
| tiv_2016    | float |  -- total investment value in 2016
| lat         | float |  -- latitude of policy holder's city, not NULL
| lon         | float |  -- longitude of policy holder's city, not NULL
+-------------+-------+

Requirements:
1) Find policyholders who have the same tiv_2015 value as at least one other policyholder.
2) Among these, select only those whose location (lat, lon) is unique (no other policyholder has the same lat and lon).
3) Sum the tiv_2016 values of those policyholders and round the result to two decimal places.
4) Return the sum as the output.

Note:
- tiv_2015 must be duplicated (shared by 2 or more policyholders).
- Location (lat, lon) must be unique (only one policyholder per city).
- Output is a single value representing the sum of tiv_2016 for the filtered policyholders.
*/
SELECT 
    -- Sum the tiv_2016 values of the filtered records and round to 2 decimal places
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM 
    Insurance
WHERE 
    -- Condition 1: tiv_2015 value appears more than once in the table
    tiv_2015 IN (
        SELECT tiv_2015
        FROM Insurance
        GROUP BY tiv_2015
        HAVING COUNT(*) > 1  -- Only tiv_2015 values shared by multiple records
    )
    AND
    -- Condition 2: location (lat, lon) is unique (no other record has same lat and lon)
    (lat, lon) IN (
        SELECT lat, lon
        FROM Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) = 1  -- Unique location pairs only
    );
