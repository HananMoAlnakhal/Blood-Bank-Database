# **Blood Bank Database**
This project was made using sqlpluse Oracle, the idea is about a blood donation system that has the following entities:

1. ***BloodBank***(Bank_id *PK*, Bank_name, address, contact_num)
2. ***BloodUnits*** (unit_id *PK*, blood_type, Bank_id *FK*)
3.  ***Donor*** (Donor_id *PK*, Full_name, mobileNum, Blood_type,availability,health_state )
4.  ***Patient***(Patient_id *PK*, FullName, Blood_type)
5.  ***Assistant*** (Assistant_id *PK*, FullName, PhoneNum,HireDate,Bank_id *FK*)
6.  ***Donation_log*** (Donation_id *PK*, Date_time, Assistant_id *FK*,Donor_id *FK*,unit_id *FK*)
7.  ***Consumption_logs*** (con_id *PK*,unit_id, *FK* patient_id *FK*, date_and_time)

## THE ***ERD:***
![Blood Donations](https://github.com/user-attachments/assets/70d20a91-93a1-40d2-9437-3fab4386c6e3)

# *Creating Tables:*

sample example:
```SQL
-- Create table for BloodBank
CREATE TABLE BloodBank (
    Bank_id INT PRIMARY KEY,
    Bank_name VARCHAR2(100) NOT NULL,
    address VARCHAR2(200),
    contact_num VARCHAR2(15)
);
```
> Click [HERE](https://github.com/HananMoAlnakhal/Blood-Bank-Database/blob/main/CREATE%20TABLE%2BSEQUENCES.sql) to see the full code
---
# *Creating Sequences:*
sample example:
```SQL
CREATE SEQUENCE bank_seq
START WITH 1
INCREMENT BY 1 NOCYCLE;

```
> Click [HERE](https://github.com/HananMoAlnakhal/Blood-Bank-Database/blob/main/CREATE%20TABLE%2BSEQUENCES.sql) to see the full code
---
# *Inserting Data to the Tables:*

sample example:
```SQL
-- Insert a row into BloodBank
INSERT INTO BloodBank (Bank_id,Bank_name, address, contact_num) 
VALUES (bank_seq.nextval,'Central Blood Bank', '123 Main St, City A', '123-456-7890');
--added 3 rows using this way but used sql loops to add more dummy data
-- Assistant records
BEGIN
  FOR i IN 4..30 LOOP
    INSERT INTO Assistant (Assistant_id, FullName, phoneNum, HireDate, Bank_id)
    VALUES (assistant_seq.nextval, 'Assistant ' || i, 'Phone ' || i, SYSDATE - i * 10, MOD(i, 2) + 1);
  END LOOP;
END;
/

```
> Click [HERE](https://github.com/HananMoAlnakhal/Blood-Bank-Database/blob/main/INSERT%20INTO.sql) to see the full code

# ***The select statements + views in the project files***
> You can download and run the database using the full SQL in Releases 


