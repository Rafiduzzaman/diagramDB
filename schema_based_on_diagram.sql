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

-- Create the Invoice Items table
CREATE TABLE InvoiceItems (
    id INT PRIMARY KEY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES Invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(id)
);

-- Create the table treatments
CREATE TABLE Treatments (
    id INT PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255),
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES MedicalHistories(id)
);

-- Create the Invoices table
CREATE TABLE Invoices (
    id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES MedicalHistories(id)
);

-- Create the join table for the many-to-many relationship between medical_histories and treatments
CREATE TABLE MedicalHistoriesHasTreatments (
    medical_history_id INT,
    treatment_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES MedicalHistories(id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(id)
);

-- Create the necessary indexes
CREATE INDEX ON MedicalHistories (patient_id);
CREATE INDEX ON Invoices (medical_history_id);
CREATE INDEX ON InvoiceItems (invoice_id);
CREATE INDEX ON InvoiceItems (treatment_id);
CREATE INDEX ON MedicalHistoriesHasTreatments (medical_history_id);
CREATE INDEX ON MedicalHistoriesHasTreatments (treatment_id);