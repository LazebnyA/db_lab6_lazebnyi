-- Виклик і демонстрація функції

SELECT * FROM get_patients_by_condition('Obesity');

-- Виклик і демонстрація процедури

SELECT * FROM Doctor left join patient_doctor using(doctor_id);

CALL delete_doctors_without_patients();
SELECT * FROM Doctor;

-- Виклик тригера

INSERT INTO Patient(patient_id, patient_name, patient_age, patient_gender, patient_blood_type, patient_condition)
VALUES(10009, 'Patient_test_name', 55, 'Male', 'ab+', 'Obesity');

SELECT * FROM PATIENT;
