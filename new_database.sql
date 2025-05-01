USE hospitalmanagementsystem;

DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS users;

-- Patients table
CREATE TABLE Patients (
  Patient_id INT AUTO_INCREMENT PRIMARY KEY,
  P_firstname VARCHAR(100) NOT NULL,
  P_lastname VARCHAR(100) NOT NULL,
  Gender CHAR(1),
  Dob DATE,
  Blood_type VARCHAR(5),
  Address VARCHAR(200),
  PhoneNumber VARCHAR(15),
  Admission_date DATE,
  Discharge_date DATE
);

-- Departments table
CREATE TABLE Departments (
  Department_id INT AUTO_INCREMENT PRIMARY KEY,
  Department_name VARCHAR(20)
);

-- Billing table
CREATE TABLE Billing (
  Bill_id INT AUTO_INCREMENT PRIMARY KEY,
  Bill_date DATE NOT NULL,
  Service_cost DECIMAL(10,2),
  Room_cost DECIMAL(10,2),
  M_cost DECIMAL(10,2),
  Total_amount DECIMAL(10,2), 
  Payment_status INT NOT NULL,
  Patient_id INT NOT NULL,
  FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id)
);

-- Rooms table
CREATE TABLE Rooms (
  Room_id INT AUTO_INCREMENT PRIMARY KEY,
  Room_type VARCHAR(15),
  Room_cost DECIMAL(10,2),
  Status VARCHAR(20),
  Patient_id INT,
  Department_id INT,
  FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
  FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

-- Medical History table
CREATE TABLE Medical_history (
  Record_id INT AUTO_INCREMENT PRIMARY KEY,
  Allergies VARCHAR(40),
  Pre_condition VARCHAR(50),
  Previous_surgeries VARCHAR(50),
  Patient_id INT NOT NULL,
  FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id)
);

-- Emergency contact table
CREATE TABLE Emergency_contact (
  Contact_id INT AUTO_INCREMENT PRIMARY KEY,
  Contact_name VARCHAR(20),
  PhoneNumber VARCHAR(15),
  Relation VARCHAR(20),
  patient_id INT NOT NULL,
  FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id)
);

-- Services table
CREATE TABLE Services (
  Service_id INT AUTO_INCREMENT PRIMARY KEY,
  Service_cost DECIMAL(10,2),
  Service_name VARCHAR(20),
  Patient_id INT,
  FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id)
);

-- Insurance table
CREATE TABLE Insurance (
  Insurance_id INT AUTO_INCREMENT PRIMARY KEY,
  End_date DATE NOT NULL,
  Med_coverage VARCHAR(20),
  Patient_id INT,
  FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id)
);

-- Medicine table
CREATE TABLE Medicine (
  Medicine_id INT AUTO_INCREMENT PRIMARY KEY,
  M_name VARCHAR(20),
  M_quantity INT NOT NULL,
  M_cost DECIMAL(10,2) NOT NULL
);

-- Inventory table
CREATE TABLE Inventory (
  Inventory_id INT AUTO_INCREMENT PRIMARY KEY,
  Item_name VARCHAR(20) NOT NULL,
  Quantity INT NOT NULL DEFAULT 0,
  Status VARCHAR(20) CHECK (Status IN ('In Stock','Out of Stock','Ordered')),
  Department_id INT NOT NULL,
  FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

-- Doctors table
CREATE TABLE Doctors (
  Doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  D_firstname VARCHAR(15),
  D_lastname VARCHAR(15),
  Specialty VARCHAR(15),
  Department_id INT,
  FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);

-- Appointments table
CREATE TABLE Appointment (
    Appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Purpose VARCHAR(50),
    Patient_id INT,
    Doctor_id INT,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_id) REFERENCES Patients (Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctors (Doctor_id)
);

-- Prescription table
CREATE TABLE Prescription (
  Prescription_id INT AUTO_INCREMENT PRIMARY KEY,
  Dosage VARCHAR(20),
  Duration VARCHAR(20),
  Doctor_id INT,
  Patient_id INT,
  Medicine_id INT,
  FOREIGN KEY (Doctor_id) REFERENCES Doctors(Doctor_id),
  FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
  FOREIGN KEY (Medicine_id) REFERENCES Medicine(Medicine_id)
);

-- Users table
CREATE TABLE Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    Role ENUM('admin', 'doctor', 'receptionist', 'accountant') NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Billing
ADD COLUMN Service_id INT,
ADD COLUMN Room_id INT,
ADD COLUMN Medicine_id INT,
ADD FOREIGN KEY (Service_id) REFERENCES Services(Service_id),
ADD FOREIGN KEY (Room_id) REFERENCES Rooms(Room_id),
ADD FOREIGN KEY (Medicine_id) REFERENCES Medicine(Medicine_id);
