-- Create table for BloodBank
CREATE TABLE BloodBank (
    Bank_id INT PRIMARY KEY,
    Bank_name VARCHAR2(100) NOT NULL,
    address VARCHAR2(200),
    contact_num VARCHAR2(15)
);

-- Create table for Assistant
CREATE TABLE Assistant (
    Assistant_id INT PRIMARY KEY,
    FullName VARCHAR2(100) NOT NULL,
    phoneNum VARCHAR2(15),
    HireDate DATE,
    Bank_id INT,
    FOREIGN KEY (Bank_id) REFERENCES BloodBank(Bank_id)
);


-- Create table for BloodUnits
CREATE TABLE BloodUnits (
    unit_id INT PRIMARY KEY,
    blood_type VARCHAR2(5) NOT NULL,
    Bank_id INT NOT NULL,
    FOREIGN KEY (Bank_id) REFERENCES BloodBank(Bank_id)
);

-- Create table for Donor
CREATE TABLE Donor (
    Donor_id INT PRIMARY KEY,
    FullName VARCHAR2(100) NOT NULL,
    mobileNum VARCHAR2(15),
    blood_type VARCHAR2(5) NOT NULL,
    availability NUMBER(1) DEFAULT 1 CHECK (availability IN (0, 1)),
    health_state VARCHAR2(50)
);

-- Create table for Donations_log
CREATE TABLE Donations_log (
    donation_id INT PRIMARY KEY,
    date_time TIMESTAMP NOT NULL,
    Assistant_id INT NOT NULL,
    Donor_id INT NOT NULL,
    unit_id INT NOT NULL,
    FOREIGN KEY (Assistant_id) REFERENCES Assistant(Assistant_id),
    FOREIGN KEY (Donor_id) REFERENCES Donor(Donor_id),
    FOREIGN KEY (unit_id) REFERENCES BloodUnits(unit_id)
);

-- Create table for Consumption_logs
CREATE TABLE Consumption_logs (
    con_id INT PRIMARY KEY,
    unit_id INT NOT NULL,
    patient_id INT NOT NULL,
    date_and_time TIMESTAMP NOT NULL,
    FOREIGN KEY (unit_id) REFERENCES BloodUnits(unit_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(Patient_id)
);

-- Create table for Patient
CREATE TABLE Patient (
    Patient_id INT PRIMARY KEY,
    FullName VARCHAR2(100) NOT NULL,
    blood_type VARCHAR2(5) NOT NULL
);
/*------------------------------------------------------------------------------------------------------------*/

-- Create sequences for incrementing primary keys
CREATE SEQUENCE bank_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE assistant_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE donor_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE unit_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE donation_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE patient_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE consumption_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
