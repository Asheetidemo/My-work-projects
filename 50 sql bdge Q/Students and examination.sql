-- Question:
-- Write a solution to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.

-- Expected Output Columns:
-- student_id | student_name | subject_name | attended_exams

-- SQL Query:
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sub
LEFT JOIN 
    Examinations e 
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, sub.subject_name
ORDER BY 
    s.student_id, sub.subject_name;
