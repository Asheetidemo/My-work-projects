-- Table: Activity
-- +---------+------------+---------------+---------------+
-- | user_id | session_id | activity_date | activity_type |
-- +---------+------------+---------------+---------------+
-- | int     | int        | date          | varchar       |
-- +---------+------------+---------------+---------------+

-- Question:
-- Write a solution to find the daily active user count for a period of 30 days 
-- ending 2019-07-27 inclusively. 
-- A user was active on a day if they made at least one activity on that day.
-- Return the result table in any order.

-- Example:
-- Input:
-- +---------+------------+---------------+---------------+
-- | user_id | session_id | activity_date | activity_type |
-- +---------+------------+---------------+---------------+
-- | 1       | 1          | 2019-07-20    | open_session  |
-- | 1       | 1          | 2019-07-20    | scroll_down   |
-- | 1       | 1          | 2019-07-20    | end_session   |
-- | 2       | 4          | 2019-07-20    | open_session  |
-- | 2       | 4          | 2019-07-21    | send_message  |
-- | 2       | 4          | 2019-07-21    | end_session   |
-- | 3       | 2          | 2019-07-21    | open_session  |
-- | 3       | 2          | 2019-07-21    | send_message  |
-- | 3       | 2          | 2019-07-21    | end_session   |
-- | 4       | 3          | 2019-06-25    | open_session  |
-- | 4       | 3          | 2019-06-25    | end_session   |
-- +---------+------------+---------------+---------------+

-- Output:
-- +------------+--------------+ 
-- | day        | active_users |
-- +------------+--------------+ 
-- | 2019-07-20 | 2            |
-- | 2019-07-21 | 2            |
-- +------------+--------------+ 

SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE 
    activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY 
    activity_date;
