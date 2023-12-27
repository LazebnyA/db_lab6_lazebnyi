-- При вставці нового рядку до таблиці patient записує групу крові у верхньому регістрі 

DROP TRIGGER IF EXISTS patient_blood_type_insert ON patient;

CREATE OR REPLACE FUNCTION upper_pbt() RETURNS trigger
LANGUAGE 'plpgsql' 
AS 
$$ 
BEGIN
	UPDATE Patient SET patient_blood_type = upper(patient_blood_type)
	WHERE Patient.patient_id = NEW.patient_id;
	RETURN NULL;
END;
$$;


CREATE TRIGGER patient_blood_type_insert
AFTER INSERT ON patient
FOR EACH ROW EXECUTE FUNCTION upper_pbt();

INSERT INTO Patient(patient_id, patient_name, patient_age, patient_gender, patient_blood_type, patient_condition)
VALUES(10009, 'Patient_test_name', 55, 'Male', 'ab+', 'Obesity');
