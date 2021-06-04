/*The script shows the source code for the insertion of values in the tables. */
-- Insert data into the tables

--Facility Table
SET IDENTITY_INSERT Facility ON;

INSERT INTO Facility (facilityID, facilityName, location, hours, roomCapacity, departmentID, careCapacityLevel, medicalEquipment) VALUES
(1, 'Surgical Center', 'West wing', 'flexible hours', 59, 01, 3, 'Surgical instruments'),
(2, 'Maternity Center', 'East wing', '8:00AM - 10:00PM', 121, 03, 2, 'birthing equipment'),
(3, 'Trauma Center', 'Floor 1', '24/7', 100, 02, 1, 'defibrillator'),
(4, 'Orthopedic Center', 'South wing', '9:00AM - 6:00PM', 78, 04, 2, 'knee braces');

SET IDENTITY_INSERT Facility OFF;

--Department Table
SET IDENTITY_INSERT Department ON;

INSERT INTO Department (departmentID, departmentName) VALUES
(01, 'General Surgery'),
(02, 'Emergency Department'),
(03, 'Gynecology'),
(04, 'Orthopedics');

SET IDENTITY_INSERT Department OFF;

--CareCapacity Table
SET IDENTITY_INSERT CareCapacity ON;

INSERT INTO CareCapacity (careCapacityLevel, careCapacityName) VALUES
(1, 'Flexible'),
(2, '<25%'),
(3, '50%'),
(4, '75%'),
(5, 'Maxed out');

SET IDENTITY_INSERT CareCapacity OFF;

--MedicalStaff Table
SET IDENTITY_INSERT MedicalStaff ON;

INSERT INTO MedicalStaff (staffID, facilityID, staffType, position, status) VALUES
(111, 1, 'Doctor', 'Attending', 'Permanent'),
(112, 1, 'Doctor', 'Resident', 'Contract'),
(121, 2, 'Nurse', 'Intern', 'Temporary'),
(122, 2, 'Doctor', 'Resident', 'Temporary'),
(123, 2, 'Administration', 'Data Entry Operator', 'Contract'),
(131, 3, 'Doctor', 'Chief', 'Permanent'),
(132, 3, ‘Administration’, 'Clerk', 'Permanent'),
(141, 4, 'Anesthesiologist', 'Attending', 'Permanent'),
(142, 4, 'Administration', 'Receptionist', 'Temporary');

SET IDENTITY_INSERT MedicalStaff OFF;

--StaffPersonalInfo Table
SET IDENTITY_INSERT StaffPersonalInfo ON;

INSERT INTO StaffPersonalInfo (staffID, staffName, staffAddress, staffPhone, staffEmail) VALUES
(123, 'Jim Collins', '800 Redford, Syracuse', ‘2486963775’, 'jc@umc.com'),
(132, 'Pam Sherpa', '547 Columbus, Syracuse', ‘3486763661’, 'ps@umc.com'),
(142, 'Maya Braze', '242 Euclid, Syracuse', ‘3612030002’, 'mb@umc.com');


SET IDENTITY_INSERT StaffPersonalInfo OFF;

--Employees Table
SET IDENTITY_INSERT Employees ON;

INSERT INTO Employees (employeeID, staffID, employeeSalary, benefits, contractID, employeeReviewID, departmentID, officeRoom, officePhone) VALUES
(31, 111, '100,000.00', '401K, paid vacation', 21, 71, 01, 105, ‘2486663775’),
(32, 112, '75,000.00', '401K, paid vacation', 22, 72, 01, 106, ‘3486763711’),
(33, 121, '50,000.00', 'paid vacation', 23, 73, 03, 211, ‘3654030002’),
(34, 122, '75,000.00', '401K, paid vacation', 24, 74, 03, 212, ‘7772395510’),
(35, 131, '90,000.00', '401K, paid vacation', 25, 75, 02, 311, ‘9126180331’),
(36, 141, '60,000.00', '401K', 26, 76, 04, 412, ‘2478440012’);

SET IDENTITY_INSERT Employees OFF;

--EmployeePersonalInfo Table
SET IDENTITY_INSERT EmployeePersonalInfo ON;

INSERT INTO EmployeePersonalInfo (employeeID, staffID, employeeName, employeeAddress, employeePhone, employeeEmail) VALUES
(31, 111, 'Derek Shepherd', '814 Maryland, Syracuse', 2486663775, 'ds@umc.com'),
(32, 112, 'Meredith Grey', '437 Columbus, Syracuse', 3486763711, 'mg@umc.com'),
(33, 121, 'Jackson Avery', '227 Euclid, Syracuse', 3654030002, 'ja@umc.com'),
(34, 122, 'April Ludgard', '077 Westcott, Syracuse', 7772395510, 'al@umc.com'),
(35, 131, 'Zack Hall', '221 Baker, Syracuse', 9126180331, 'zh@umc.com'),
(36, 141, 'Lexie Sharma', '812 Maryland, Syracuse', 2478440012, 'ls@umc.com');

SET IDENTITY_INSERT EmployeePersonalInfo OFF;

--ContractDetails Table
INSERT INTO ContractDetails (contractID, contractType, contractTerm) VALUES
(21, '6year', 5),
(22, '2year', 1),
(23, '5year', 4),
(24, '5year', 2),
(25, '3year', 3),
(26, '1year', 1);


--EmployeeReviewDetails Table
INSERT INTO EmployeeReviewDetails(employeeReviewID, employeeReview, reviewerName) VALUES
(71, 'Great surgeon', 'Michael'),
(72, 'Attentive and helpful', 'Dwight'),
(73, 'helped give birth to our beautiful baby', 'Zoya'),
(74, 'Direct and professional', 'Chris'),
(75, 'very professional', 'Layla'),
(76, 'Surgery went well', 'Cameron');

--Patient Table
SET IDENTITY_INSERT Patient ON;

INSERT INTO Patient (patientID, insuranceID, primaryCareDoctor, staffID, billingID) VALUES
(91, 811, 'Derek Shepherd', 111, 901),
(92, 812, 'Meredith Grey', 112, 902),
(93, 813, 'Zack Hall', 131, 903),
(94, 814, 'April Ludgard', 122, 904);

SET IDENTITY_INSERT Patient OFF;

--PatientPersonalInfo Table

INSERT INTO PatientPersonalInfo (patientID, patientName, patientAddress, patientPhone, patientDOB) VALUES
(91, 'Luci Moon', '926 Ellison St, Syracuse', 5541663775, '1969-04-27'),
(92, 'Alfred Hopper', '333 McConnell Ave, Syracuse', 3412345711, '1994-12-06'),
(93, 'Joyce Bender', '227 Comstock, Syracuse', 3654002789, '1981-07-13'),
(94, 'Claire Buckley', '159 Redford, Syracuse', 7678905510, '1971-06-15');



--PatientMedicalRecords Table

SET IDENTITY_INSERT PatientMedicalRecords ON;

INSERT INTO PatientMedicalRecords (patientRecordNumber, patientID, testID, weight, height, vitals, checkIn, checkOut, symptoms, diagnose, procedureCode, attendingPhysician, referralDoctor, medicationID) 
VALUES
(111594954,91,61, 140, 166,151,'2019-01-23 10:44:21','2019-01-28 08:21:11','severe headache, nose bleed','head trauma', 201, 'Derek Shepherd', 'Kade Haley',345),
(213145615, 92,62, 178, 171, 152,'2019-02-10 11:00:08','2019-02-12 07:30:20','heart ache, pain in left arm','heart attack', 202, 'Meredith Grey', 'Yash Patil',346),
(489516156,93,63,113.2,142,153,'2019-09-29 12:00:00','2019-09-30 10:29:21','can’t walk, swelling in leg','bone fracture', 203, 'Zack Hall', 'Sean Ryan',347),
(465654151, 94,64, 156.1,131,154,'2019-08-09 03:21:00','2019-08-12 04:15:15','missed period, nausea','pregnancy', 204, 'April Ludgard', 'Amiyah beech',348);

SET IDENTITY_INSERT PatientMedicalRecords OFF;

--Lab Table
SET IDENTITY_INSERT Lab ON;

INSERT INTO Lab (testID, results, mandatedReportCounty, mandatedReportState) VALUES
(61, 'internal bleeding present', 'Bronx County', 'NY'),
(62, 'lower heart damaged', 'Onondaga County', 'NY'),
(63, 'hairline fracture', 'Suffolk', 'NY'),
(64, 'fetus present', 'Saratoga', 'NY');

SET IDENTITY_INSERT Lab OFF;

--Tests Table
INSERT INTO Tests (testID, testName) VALUES
(61, 'CT scan'),
(62, 'ECG Scan'),
(63, 'X-Ray'),
(64, 'Ultrasound');

--Imaging Table
INSERT INTO Imaging (testID, imagingLocation) VALUES
(61, 'Head'),
(62, 'chest'),
(63, 'Left Leg'),
(64, 'Abdomen/Uterus');

--Medication Table
INSERT INTO Medication (medicationID, medicineNumber) VALUES
(345, 243),
(346, 244),
(347, 245),
(348, 246);

--Procedure Table
INSERT INTO ProcedureInfo (procedureCode, procedureName, procedureCost) VALUES
(201, 'Craniotomy', '30,990.00'),
(202, 'Coronary Bypass Surgery', '40,000.00'),
(203, 'Orthopaedic Surgery', '15,000.00'),
(204, 'Cesarean Section', '22,000.00');

--Pharmacy Table
INSERT INTO Pharmacy (medicineNumber, medicineName, medicationCost) VALUES
(243, 'Propofol', '27.00'),
(244, 'Dual Antiplatelet therapy', '500.00'),
(245, 'Acetaminophen', '3.40'),
(246, 'Antimicrobial prophylaxis', '13.10');

--Billing Table
INSERT INTO Billing (billingID, numberOfVisits, medicalBillingCode, payer, paymentMethod) VALUES
(901, 5,  'CP01', 'Patient', 'Credit'),
(902, 2,  'CA02', 'Insurance Company', 'Insurance Coverage'),
(903, 4,  'OP23', 'Benefactor', 'Credit'),
(904, 7,  'CS09', 'Patient', 'Debit');

--InsuranceCoverage Table
INSERT INTO InsuranceCoverage (insuranceID, insuranceCompany, insurancePhone, insuranceCoverage) VALUES
(811, 'Aetna', 2247891300, 'Full coverage'),
(812, 'Anthem Blue Cross', 3147891300, 'Only surgery'),
(813, 'United Health', 7247451300, 'Only Pharmacy'),
(814, 'Aetna', 2247891234, '50% coverage');

 --Visitors Table
SET IDENTITY_INSERT Visitors ON;

INSERT INTO Visitors (visitorID, patientID, visitorName, relation, entryTime, exitTime) VALUES
(31, 91, 'Gail Cain', 'Husband', '2019-01-24 10:44:21','2019-01-24 11:44:11'),
(32, 92, 'Kendall Kent', 'Sister', '2019-02-10 03:26:13','2019-02-10 03:59:45'),
(33, 93, 'Kylie Jenner', 'Mother', '2019-09-29 08:00:00','2019-09-29 09:00:00'),
(34, 94, 'Samantha Anderson', 'Wife', '2019-08-11 06:30:30','2019-08-11 07:31:22');

SET IDENTITY_INSERT Visitors OFF;
