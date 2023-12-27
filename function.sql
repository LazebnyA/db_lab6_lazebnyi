-- Функція приймає назву хвороби, й повертає таблицю 
-- з ідентифікаторами і іменами хворих пацієнтів.

DROP FUNCTION IF EXISTS get_patients_by_condition(varchar);

CREATE OR REPLACE FUNCTION get_patients_by_condition(condition_arg varchar)
    RETURNS TABLE (patient_id INT, patient_name varchar)
LANGUAGE plpgsql
AS $$
BEGIN 
    RETURN QUERY
        SELECT patient.patient_id, patient.patient_name
        FROM patient
        WHERE patient.patient_condition = condition_arg;
END;
$$;
