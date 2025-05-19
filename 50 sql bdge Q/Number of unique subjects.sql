-- Table: Teacher
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | teacher_id  | int  |
-- | subject_id  | int  |
-- | dept_id     | int  |
-- +-------------+------+
-- (subject_id, dept_id) is the primary key.
-- Each row indicates that a teacher teaches a subject in a department.

-- Question:
-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.
-- Return the result table in any order.

-- Example:
-- Input: 
-- Teacher table:
-- +------------+------------+---------+
-- | teacher_id | subject_id | dept_id |
-- +------------+------------+---------+
-- | 1          | 2          | 3       |
-- | 1          | 2          | 4       |
-- | 1          | 3          | 3       |
-- | 2          | 1          | 1       |
-- | 2          | 2          | 1       |
-- | 2          | 3          | 1       |
-- | 2          | 4          | 1       |
-- +------------+------------+---------+
-- Output:
-- +------------+-----+
-- | teacher_id | cnt |
-- +------------+-----+
-- | 1          | 2   |
-- | 2          | 4   |
-- +------------+-----+

-- Explanation: 
-- Teacher 1 teaches subject 2 (in two departments) and subject 3.
-- Teacher 2 teaches subjects 1, 2, 3, and 4.

SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM 
    Teacher
GROUP BY 
    teacher_id;
