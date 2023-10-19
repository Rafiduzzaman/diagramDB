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

-- -- Create the Invoice Items table
-- CREATE TABLE InvoiceItems (
--     id INT PRIMARY KEY,
--     unit_price DECIMAL(10, 2),
--     quantity INT,
--     total_price DECIMAL(10, 2),
--     invoice_id INT,
--     treatment_id INT,
--     FOREIGN KEY (invoice_id) REFERENCES Invoices(id),
--     FOREIGN KEY (treatment_id) REFERENCES Treatments(id)
-- );