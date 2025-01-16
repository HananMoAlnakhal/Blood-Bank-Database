--1  كم مخزون عينات الدم لكل بنك دم للفصيلة 
-- O+
SELECT bb.Bank_name, COUNT(bu.unit_id) AS Total_Units
FROM BloodBank bb
INNER JOIN BloodUnits bu ON bb.Bank_id = bu.Bank_id
where bu.blood_type='O+'
GROUP BY bb.Bank_name;

--2 available donors full name and mobile number
SELECT FullName, mobileNum 
FROM Donor 
WHERE availability = 1;

--3 how many donated blood unit for each blood_type?
SELECT blood_type, COUNT(*) AS unit_count
 FROM BloodUnits 
 GROUP BY blood_type;

 --4 date of donation and who donated the unit
 SELECT * 
 from BloodUnits bu
 INNER JOIN Donations_log dl ON bu.unit_id=dl.unit_id;

 --5 the donation in a specific date
 SELECT * 
 FROM Donations_log 
 WHERE TRUNC(date_time) = TO_DATE('2025-01-01', 'YYYY-MM-DD');

 --6 Count the number of donations by each assistant 
SELECT Assistant_id, COUNT(*) AS donation_count 
FROM Donations_log 
GROUP BY Assistant_id;

--7 to know the donor name who donated unit num 1
SELECT d.FullName FROM Donor d
INNER JOIN Donations_log dl ON d.Donor_id = dl.Donor_id
WHERE dl.unit_id = 1;

-- 8 Find all patients who received a specific blood type
SELECT DISTINCT p.FullName FROM Patient p
INNER JOIN Consumption_logs cl ON p.Patient_id = cl.patient_id
INNER JOIN BloodUnits bu ON cl.unit_id = bu.unit_id
WHERE bu.blood_type = 'O+';

-- 9 Find all patients who donated a specific blood type
SELECT DISTINCT d.FullName FROM Donor d
INNER JOIN Donations_log dl ON d.Donor_id = dl.Donor_id
INNER JOIN BloodUnits bu ON dl.unit_id = bu.unit_id
WHERE bu.blood_type = 'O+'; --I could change the blood type

-- 10 Count the number of blood units consumed by each patient
SELECT patient_id, COUNT(*) AS units_consumed
FROM Consumption_logs 
GROUP BY patient_id;

-- 11 names of donors with good health
SELECT FullName, mobileNum 
FROM Donor 
WHERE health_state = 'Healthy';

--12 Count the number of blood units donated by each donor
SELECT donor_id, COUNT(*) AS units_donated
FROM Donations_log 
GROUP BY donor_id; 

--13 blood units consimed in a specific date
SELECT * FROM Consumption_logs 
WHERE TRUNC(date_time) = TO_DATE('2025-01-01', 'YYYY-MM-DD');

-- 14 the average number of donations per assistant
SELECT AVG(donation_count) FROM (
    SELECT Assistant_id, COUNT(*) AS donation_count
    FROM Donations_log
    GROUP BY Assistant_id
);

-- 15 all assistants and their corresponding blood banks
SELECT a.FullName AS AssistantName, bb.Bank_name AS BloodBankName
FROM Assistant a
INNER JOIN BloodBank bb ON a.Bank_id = bb.Bank_id;

--16 blood units count for each type in each blood bank
SELECT bb.Bank_name,bu.blood_type,COUNT(bu.unit_id) AS Total_Units
FROM BloodBank bb
INNER JOIN BloodUnits bu ON bb.Bank_id = bu.Bank_id
GROUP BY bb.Bank_name, bu.blood_type;

--17 donation history
SELECT dl.donation_id, dl.date_time, d.FullName AS DonorName, a.FullName AS AssistantName, bu.blood_type
FROM Donations_log dl
INNER JOIN Donor d ON dl.Donor_id = d.Donor_id
INNER JOIN Assistant a ON dl.Assistant_id = a.Assistant_id
INNER JOIN BloodUnits bu ON dl.unit_id = bu.unit_id;

--18 Hpw many patient in the sys?
SELECT Count(*)
FROM patient;

--19 the most recently donated blood units
SELECT * FROM Donations_log ORDER BY date_time DESC;

--20 the oldest consumption_logs
SELECT * FROM Consumption_logs ORDER BY date_and_time ASC;

