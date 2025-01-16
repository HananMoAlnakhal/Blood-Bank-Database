-- 1. View of available donors
CREATE OR REPLACE VIEW Available_Donors AS
SELECT Donor_id, FullName, blood_type, mobileNum
FROM Donor
WHERE availability = 1;
-- Purpose: Quickly access the list of donors who are currently available for donation.

--2 BloodBank_Inventory
CREATE OR REPLACE VIEW BloodBank_Inventory AS
SELECT bb.Bank_name,bu.blood_type,COUNT(bu.unit_id) AS Total_Units
FROM BloodBank bb
INNER JOIN BloodUnits bu ON bb.Bank_id = bu.Bank_id
GROUP BY bb.Bank_name, bu.blood_type;
-- Purpose: Summarizes the current blood inventory in each blood bank, grouped by blood type.

-- Unconsumed_BloodUnits
CREATE OR REPLACE VIEW Unconsumed_BloodUnits AS
SELECT unit_id, blood_type, Bank_id
FROM BloodUnits
WHERE NOT unit_id IN (SELECT unit_id FROM Consumption_logs);
-- Purpose: Helps track blood units that are still available for use.

--Patient_Consumption_History
CREATE OR REPLACE VIEW Patient_Consumption_History AS
SELECT cl.con_id, cl.date_and_time, p.FullName AS PatientName, bu.blood_type
FROM Consumption_logs cl
INNER JOIN Patient p ON cl.patient_id = p.Patient_id
INNER JOIN BloodUnits bu ON cl.unit_id = bu.unit_id;
-- Purpose: Enables quick review of patients' blood consumption history by linking consumption logs with blood units and patients.

--donation history
CREATE OR REPLACE VIEW Donation_History AS
SELECT dl.donation_id, dl.date_time, d.FullName AS DonorName, a.FullName AS AssistantName, bu.blood_type
FROM Donations_log dl
INNER JOIN Donor d ON dl.Donor_id = d.Donor_id
INNER JOIN Assistant a ON dl.Assistant_id = a.Assistant_id
INNER JOIN BloodUnits bu ON dl.unit_id = bu.unit_id;
-- Purpose: Provides a detailed log of donations, including donor and assistant names and blood type.




