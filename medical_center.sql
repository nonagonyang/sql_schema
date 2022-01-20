-- from the terminal run:
-- psql < medical_center.sql
DROP DATABASE IF EXISTS medical_centers;
CREATE DATABASE medical_centers;
\c medical_centers 


CREATE TABLE medical_centers (
    medical_center_id SERIAL PRIMARY KEY,
    name TEXT
);
CREATE TABLE doctors(
    doctor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    medical_center_id INTEGER REFERENCES medical_centers ON DELETE SET NULL 
);

CREATE TABLE patients(
    patient_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE diseases(
    disease_id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL 
);

CREATE TABLE doctor_patient(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL
);

CREATE TABLE diagnoses(
    diagnose_id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    disease_id INTEGER REFERENCES patients ON DELETE SET NULL,
    diagnosed_date DATE,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL
);
