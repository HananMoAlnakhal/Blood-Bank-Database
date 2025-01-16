

-- Insert rows into BloodBank
INSERT INTO BloodBank (Bank_id,Bank_name, address, contact_num) 
VALUES (bank_seq.nextval,'Central Blood Bank', '123 Main St, City A', '123-456-7890');
INSERT INTO BloodBank (Bank_id,Bank_name, address, contact_num) 
VALUES (bank_seq.nextval,'East Side Blood Bank', '456 Elm St, City B', '234-567-8901');
INSERT INTO BloodBank (Bank_id,Bank_name, address, contact_num) 
VALUES (bank_seq.nextval,'West Side Blood Bank', '789 Pine St, City C', '345-678-9012');

-- Insert rows into Assistant
INSERT INTO Assistant (Assistant_id,FullName, phoneNum, HireDate, Bank_id) 
VALUES (assistant_seq.nextval,'Alice Johnson', '111-222-3333', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1);
INSERT INTO Assistant (Assistant_id,FullName, phoneNum, HireDate, Bank_id) 
VALUES (assistant_seq.nextval,'Bob Smith', '222-333-4444', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 2);
INSERT INTO Assistant (Assistant_id,FullName, phoneNum, HireDate, Bank_id) 
VALUES (assistant_seq.nextval,'Carol White', '333-444-5555', TO_DATE('2021-03-10', 'YYYY-MM-DD'), 3);

-- Insert rows into Donor
INSERT INTO Donor (Donor_id,FullName, mobileNum, blood_type, availability, health_state)
VALUES (donor_seq.nextval,'John Doe', '1234567890', 'O+', 1, 'Healthy');
INSERT INTO Donor (Donor_id,FullName, mobileNum, blood_type, availability, health_state)
VALUES (donor_seq.nextval,'Jane Smith', '9876543210', 'A-', 1, 'Healthy');
INSERT INTO Donor (Donor_id,FullName, mobileNum, blood_type, availability, health_state)
VALUES (donor_seq.nextval,'Sam Green', '5678901234', 'B+', 0, 'Recovered from illness');

-- Insert rows into Patient
INSERT INTO Patient (Patient_id ,FullName, blood_type) 
VALUES (patient_seq.nextval, 'Michael Scott', 'O+');
INSERT INTO Patient (Patient_id ,FullName, blood_type) 
VALUES (patient_seq.nextval,'Dwight Schrute', 'A-');
INSERT INTO Patient (Patient_id ,FullName, blood_type) 
VALUES (patient_seq.nextval,'Jim Halpert', 'B+');

-- Insert rows into Donations_log
INSERT INTO Donations_log (donation_id,date_time, Assistant_id, Donor_id, unit_id)
VALUES (donation_seq.nextval, SYSTIMESTAMP, 1, 1, 1);
INSERT INTO Donations_log (donation_id ,date_time, Assistant_id, Donor_id, unit_id)
VALUES (donation_seq.nextval,SYSTIMESTAMP, 2, 2, 2);
INSERT INTO Donations_log (donation_id ,date_time, Assistant_id, Donor_id, unit_id)
VALUES (donation_seq.nextval,SYSTIMESTAMP, 3, 3, 3);

-- Insert rows into Consumption_logs
INSERT INTO Consumption_logs (con_id, unit_id, patient_id, date_and_time)
VALUES (consumption_seq.nextval,1, 1, SYSTIMESTAMP);
INSERT INTO Consumption_logs (con_id,unit_id, patient_id, date_and_time)
VALUES (consumption_seq.nextval,2, 2, SYSTIMESTAMP);
INSERT INTO Consumption_logs (con_id,unit_id, patient_id, date_and_time)
VALUES (consumption_seq.nextval,3, 3, SYSTIMESTAMP);

-- Insert rows into BloodUnits
INSERT INTO BloodUnits (unit_id ,blood_type, Bank_id)
VALUES (unit_seq.nextval,'O+', 1);
INSERT INTO BloodUnits (unit_id ,blood_type, Bank_id)
VALUES (unit_seq.nextval,'A-', 2);
INSERT INTO BloodUnits (unit_id ,blood_type, Bank_id)
VALUES (unit_seq.nextval,'B+', 3);

--------------------------------------------------adding fake data using Loops--------------------------------------------------
-- Assistant records
BEGIN
  FOR i IN 4..30 LOOP
    INSERT INTO Assistant (Assistant_id, FullName, phoneNum, HireDate, Bank_id)
    VALUES (assistant_seq.nextval, 'Assistant ' || i, 'Phone ' || i, SYSDATE - i * 10, MOD(i, 2) + 1);
  END LOOP;
END;
/

--Donor records
BEGIN
  FOR i IN 4..30 LOOP
    INSERT INTO Donor (Donor_id, FullName, mobileNum, blood_type, availability, health_state)
    VALUES (i, 'Donor ' || i, 'Mobile ' || i, DECODE(MOD(i, 4), 0, 'O+', 1, 'A-', 2, 'B+', 'AB-'), MOD(i, 2), 'Healthy');
  END LOOP;
END;
/

--Patient records
BEGIN
  FOR i IN 4..30 LOOP
    INSERT INTO Patient (Patient_id, FullName, blood_type)
    VALUES (patient_seq.nextval, 'Patient ' || i, DECODE(MOD(i, 4), 0, 'O+', 1, 'A-', 2, 'B+', 'AB-'));
  END LOOP;
END;
/

--Donations_log records
BEGIN
  FOR i IN 4..30 LOOP
    INSERT INTO Donations_log (donation_id, date_time, Assistant_id, Donor_id, unit_id)
    VALUES (donation_seq.nextval, SYSTIMESTAMP - i, MOD(i, 30) + 1, MOD(i, 30) + 1, MOD(i, 30) + 1);
  END LOOP;
END;
/

--Consumption_logs records
BEGIN
  FOR i IN 4..30 LOOP
    INSERT INTO Consumption_logs (con_id, unit_id, patient_id, date_and_time)
    VALUES (consumption_seq.nextval, MOD(i, 30) + 1, MOD(i, 30) + 1, SYSTIMESTAMP - i * 2);
  END LOOP;
END;
/

--BloodUnits records
BEGIN
  FOR i IN 4..30 LOOP
    INSERT INTO BloodUnits (unit_id, blood_type, Bank_id)
    VALUES (unit_seq.nextval, DECODE(MOD(i, 4), 0, 'O+', 1, 'A-', 2, 'B+', 'AB-'), MOD(i, 2) + 1);
  END LOOP;
END;
/
