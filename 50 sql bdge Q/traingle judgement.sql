-- 📘 Question:
-- Table: Triangle
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- (x, y, z) is the primary key.
-- Each row has 3 line segment lengths.
-- Return whether each set can form a triangle.
-- A triangle is valid if: 
--     x + y > z AND x + z > y AND y + z > x
SELECT 
    x, 
    y, 
    z,
    -- Check triangle inequality condition
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;
