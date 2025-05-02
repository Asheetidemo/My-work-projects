-- 💬 Question:
-- Table: Views
--
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | article_id    | int     |
-- | author_id     | int     |
-- | viewer_id     | int     |
-- | view_date     | date    |
-- +---------------+---------+
-- There is no primary key for this table; it may contain duplicate rows.
-- Each row indicates that some viewer viewed an article (written by some author) on some date.
-- Note: Equal author_id and viewer_id means the author viewed their own article.
--
-- ❓ Write a solution to find all the authors that viewed at least one of their own articles.
-- 🔁 Return the result table sorted by id in ascending order.

-- ✅ MySQL Solution:
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
