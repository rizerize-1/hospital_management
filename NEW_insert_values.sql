use HospitalManagementSystem;

-- Insert sample departments
INSERT INTO Departments (DepartmentName) 
VALUES 
('Cardiology'), ('Neurology'), ('Orthopedics'), ('Pediatrics'), ('General Surgery');

-- Insert sample doctors
INSERT INTO Doctors (D_firstname, D_lastname, Department_id, Specialty) 
VALUES 
('Dr. John', 'Smith', 1, 'Cardiac Surgery'),
('Dr. Mary', 'Johnson', 2, 'Neurological Disorders'),
('Dr. Robert', 'Williams', 3, 'Joint Replacement'),
('Dr. Lisa', 'Brown', 4, 'Child Healthcare'),
('Dr. Michael', 'Davis', 5, 'General Surgery');

-- Insert sample patients
INSERT INTO Patients (P_firstname, P_lastname, Dob, Gender, Blood_type, Address, PhoneNumber, Admission_date, Discharge_date) 
VALUES 
('John', 'Doe', '1980-05-15', 'M', 'O+', '123 Main St, Anytown', '555-0101', '2023-01-10', NULL),
('Jane', 'Smith', '1975-08-22', 'F', 'A-', '456 Oak Ave, Somewhere', '555-0102', '2023-02-15', '2023-02-20'),
('Robert', 'Johnson', '1990-03-10', 'M', 'B+', '789 Pine Rd, Nowhere', '555-0103', '2023-03-05', NULL),
('Emily', 'Davis', '1988-11-30', 'F', 'AB+', '321 Elm Blvd, Anycity', '555-0104', '2023-04-12', '2023-04-18'),
('Michael', 'Wilson', '1972-07-18', 'M', 'O-', '654 Maple Ln, Yourtown', '555-0105', '2023-05-01', NULL);

-- Insert sample appointments
INSERT INTO Appointment (Doctor_id, Patient_id, AppointmentDate, AppointmentTime, Purpose) 
VALUES 
(1, 1, '2023-06-15', '09:00:00', 'General Checkup'),
(2, 2, '2023-06-15', '10:30:00', 'Neurology Consultation'),
(3, 3, '2023-06-16', '14:00:00', 'Joint Pain Evaluation'),
(4, 4, '2023-06-17', '11:15:00', 'Pediatric Checkup'),
(5, 5, '2023-06-18', '15:45:00', 'Post-Surgery Follow-up');

-- Insert sample rooms
INSERT INTO Rooms (Room_type, Room_cost, Status, Patient_id, Department_id) 
VALUES 
('General', 100.00, 'Occupied', 1, 1), 
('General', 100.00, 'Available', NULL, 1),  
('Private', 200.00, 'Maintenance', NULL, 2),  
('Private', 200.00, 'Occupied', 2, 2),
('ICU', 500.00, 'Occupied', 3, 3),
('ICU', 500.00, 'Available', NULL, 3), 
('Operating', 300.00, 'Cleaning', NULL, 4),  
('Operating', 300.00, 'Occupied', NULL, 4),
('Pediatric', 150.00, 'Occupied', 4, 5),  
('Pediatric', 150.00, 'Available', NULL, 5);  

-- Insert sample Medical_history 
INSERT INTO Medical_history (Allergies, Pre_condition, Previous_surgeries,Patient_id) 
VALUES
('Penicillin, Peanuts', 'Hypertension', 'Appendectomy (2010)', 1),
('None', 'Type 2 Diabetes', 'C-section (2018)', 2),
('Shellfish', 'Asthma', 'Knee arthroscopy (2021)', 3),
('Latex, Iodine', 'None', 'Tonsillectomy (1995)', 4),
('Sulfa drugs', 'High cholesterol', 'Coronary bypass (2019)', 5),
('Pollen, Dust mites', 'Arthritis, GERD', 'Hip replacement (2020), Gallbladder removal (2015)', 3);

-- Insert sample Emergency_contact 
INSERT INTO Emergency_contact (Contact_name, PhoneNumber,Relation,Patient_id) 
VALUES
-- Contacts for Patient 1
('Sarah Doe', '555-0201', 'Spouse', 1),
('James Doe', '555-0202', 'Son', 1),
-- Contacts for Patient 2
('David Smith', '555-0301', 'Husband', 2),
-- Contacts for Patient 3
('Lisa Johnson', '555-0401', 'Sister', 3),
('Thomas Johnson', '555-0402', 'Brother', 3),
-- Contacts for Patient 4
('Richard Davis', '555-0501', 'Father', 4),
-- Contacts for Patient 5
('Anna Wilson', '555-0601', 'Wife', 5),
('Robert Wilson Jr.', '555-0602', 'Son', 5);

-- Insert sample Services  
INSERT INTO Services (Service_name,Service_cost,Patient_id) VALUES
('X-Ray Chest', 120.00, 1),
('MRI Scan', 450.00, 2),
('Blood Test', 35.00, 3),
('CT Scan', 380.00, 5),
('Physical Therapy', 85.00, 1),
('Dialysis', 220.00, 3),
('Chemotherapy', 650.00, 2),
('Minor Surgery', 420.00, 4),
('Vaccination', 25.00, 5),
('ICU Daily Care', 300.00, 1);

-- Insert sample Insurance 
INSERT INTO Insurance (End_date,Med_coverage,Patient_id) VALUES
('2024-12-31', 'Full Coverage', 1),
('2023-12-31', '80% Coverage', 2),
('2023-06-30', 'Basic Coverage', 3),
('2023-09-30', 'Limited Coverage', 4),
('2023-07-15', 'Full Coverage', 5);

-- Insert sample Medicine
INSERT INTO Medicine (M_name, M_quantity, M_cost) VALUES
('Amoxicillin', 500, 12.50),
('Ibuprofen', 1000, 5.75),
('Lisinopril', 300, 22.80),
('Metformin', 450, 8.90),
('Albuterol', 200, 32.40),
('Omeprazole', 600, 9.45),
('Hydrochlorothiazide', 400, 7.30);

-- Insert sample Inventory
INSERT INTO Inventory (Item_name, Quantity, Status, Department_id) VALUES
('Surgical Gloves', 500, 'In Stock', 1),
('Syringes 10ml', 300, 'In Stock', 1),
('Bandages', 1000, 'In Stock', 2),
('Defibrillator', 5, 'In Stock', 3),
('X-Ray Film', 200, 'Ordered', 4),
('IV Bags', 150, 'In Stock', 1),
('Catheters', 75, 'Out of Stock', 5);

-- Insert sample Prescription
INSERT INTO Prescription (Dosage, Duration, Doctor_id, Patient_id, Medicine_id) VALUES
('500mg 3x/day', '10 days', 1, 1, 1),
('200mg as needed', '30 days', 2, 2, 2),
('20mg daily', '90 days', 3, 3, 3),
('500mg 2x/day', '60 days', 4, 4, 4),
('40mg at bedtime', '30 days', 5, 5, 5);
