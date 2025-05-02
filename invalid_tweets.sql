-- 💬 Question:
-- Table: Tweets
--
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | tweet_id       | int     |
-- | content        | varchar |
-- +----------------+---------+
-- tweet_id is the primary key (column with unique values) for this table.
-- content consists of alphanumeric characters, '!', or ' ' and no other special characters.
-- This table contains all the tweets in a social media app.
--
-- ❓ Write a solution to find the IDs of the invalid tweets.
-- A tweet is invalid if the number of characters in content is strictly greater than 15.
-- 🔁 Return the result table in any order.

-- ✅ MySQL Solution:
-- LeetCode SQL Problem: Invalid Tweets
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
