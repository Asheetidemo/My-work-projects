-- Question:
-- Given a Patients table with patient_id, patient_name, and conditions (space-separated codes),
-- find all patients who have Type I Diabetes.
-- Type I Diabetes codes always start with the prefix 'DIAB1'.
-- Return patient_id, patient_name, and conditions for these patients.

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE
    conditions LIKE 'DIAB1%' OR        -- starts with DIAB1
    conditions LIKE '% DIAB1%'         -- DIAB1 after a space
;
