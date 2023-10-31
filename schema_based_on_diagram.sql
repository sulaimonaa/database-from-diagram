CREATE DATABASE clinic;
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);
CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    status VARCHAR(255),
    patient_id INT REFERENCES patients(id)
);
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL(10, 2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);
CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255),
    medical_history_id INT REFERENCES medical_histories(id)
);
CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);
ALTER TABLE medical_histories
ADD COLUMN treatment_id INT REFERENCES treatments(id);
CREATE INDEX idx_patients ON patients(id ASC);
CREATE INDEX idx_medical_histories ON medical_histories(id ASC);
CREATE INDEX idx_invoices ON invoices(id ASC);
CREATE INDEX idx_treatments ON treatments(id ASC);
CREATE INDEX idx_invoice_items ON invoice_items(id ASC);