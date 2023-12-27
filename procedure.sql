-- Видаляє лікарів з таблиці doctor, у яких немає пацієнтів


DROP PROCEDURE IF EXISTS delete_doctors_without_patients();

CREATE OR REPLACE PROCEDURE delete_doctors_without_patients()
LANGUAGE plpgsql
AS $$
BEGIN 
	DELETE FROM doctor 
	WHERE doctor_id NOT IN (SELECT doctor_id FROM patient_doctor);
END;
$$;

