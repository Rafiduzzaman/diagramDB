-- Create the Patients table
CREATE TABLE Patients (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);

-- Create the Medical Histories table
CREATE TABLE MedicalHistories (
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(id)
);

