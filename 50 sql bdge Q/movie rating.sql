-- 🎯 Problem:
-- From the given Movies, Users, and MovieRating tables:
-- 1️⃣ Find the name of the user who rated the most movies.
--    - If there's a tie, return the user whose name is lexicographically smaller.
-- 2️⃣ Find the name of the movie with the highest average rating in February 2020.
--    - If there's a tie, return the movie whose title is lexicographically smaller.

-- 📌 Input Tables:
-- Movies(movie_id, title)
-- Users(user_id, name)
-- MovieRating(movie_id, user_id, rating, created_at)

-- ✅ Output format:
-- +--------------+
-- | results      |
-- +--------------+
-- | Daniel       |
-- | Frozen 2     |
-- +--------------+

-- Daniel and Monica both rated 3 movies, but Daniel comes first alphabetically.
-- Frozen 2 and Joker both have avg rating 3.5 in Feb 2020, but Frozen 2 is smaller lexicographically.
-- 👇 Part 1: Get user with most ratings
WITH MostActiveUser AS (
    SELECT u.name
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
),

-- 👇 Part 2: Get movie with highest average rating in Feb 2020
TopRatedMovie AS (
    SELECT m.title
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
)

-- 👇 Combine both results
SELECT name AS results FROM MostActiveUser
UNION ALL
SELECT title FROM TopRatedMovie;
