-- Question: Find the fraction of players who logged in again on the day after their first login, rounded to 2 decimal places.
--Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.


WITH First_Login AS (
    -- Get the first login date for each player
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),
Consecutive_Login AS (
    -- Get players who logged in consecutively (one day after their first login)
    SELECT f.player_id
    FROM First_Login f
    JOIN Activity a
        ON f.player_id = a.player_id
        AND a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
    GROUP BY f.player_id
)
SELECT 
    ROUND(COUNT(DISTINCT c.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Consecutive_Login c;
