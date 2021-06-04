/**************************************************************
 This script creates table for database named UMC 
***************************************************************/
USE UMC;

-- Creates tables for database UMC

-- Facility Table
CREATE TABLE Facility
	(
	facilityID           INT 	NOT NULL PRIMARY KEY,
	facilityName         VARCHAR(50)	NOT NULL,
	location  		TEXT NOT NULL,
	hours               VARCHAR(50)	NOT NULL,
	roomCapacity		INT 	NOT NULL,
departmentID		INT 	NOT NULL UNIQUE,
careCapacityLevel	INT 	NOT NULL UNIQUE,
medicalEquipment	TEXT NOT NULL
	);

-- Department Table
CREATE TABLE Department
	(
	departmentID		INT 	NOT NULL REFERENCES Facility(departmentID),
	departmentName      VARCHAR(50) 	NOT NULL
	);

-- CareCapacity Table
CREATE TABLE CareCapacity
	(
	careCapacityLevel	INT 	NOT NULL REFERENCES Facility(careCapacityLevel),
	careCapacityName      VARCHAR(50) 	NOT NULL
	);

-- MedicalStaff Table
CREATE TABLE MedicalStaff
	(
	staffID           INT 	NOT NULL PRIMARY KEY IDENTITY,
	facilityID	     INT 	NOT NULL REFERENCES Facility(facilityID),
	staffType      VARCHAR(50) NOT NULL,
	position       VARCHAR(20) NOT NULL,
	status	        VARCHAR(20) NOT NULL
	);

-- StaffPersonalInfo Table
CREATE TABLE StaffPersonalInfo
	(
	staffID           INT 	NOT NULL REFERENCES MedicalStaff(staffID),
	staffName      VARCHAR(50) NOT NULL,
	staffAddress   NVARCHAR(50) NOT NULL,
	staffPhone      	INT 	 NOT NULL,
	staffEmail      NVARCHAR(50) NOT NULL
	);

-- Employees Table
CREATE TABLE Employees
	(
	employeeID          INT 	NOT NULL PRIMARY KEY IDENTITY,
	staffID	     INT 	NOT NULL REFERENCES MedicalStaff(staffID),
	employeeSalary     MONEY	 NOT NULL,
	benefits       VARCHAR(50)  NOT NULL,
	contractID		INT 	NOT NULL UNIQUE,
	employeeReviewID	INT 	NOT NULL UNIQUE,
	departmentID		INT 	NOT NULL REFERENCES Facility(departmentID),
	officeRoom          INT NOT NULL,
	officePhone	       INT NOT NULL
	);

-- EmployeePersonalInfo Table
CREATE TABLE EmployeePersonalInfo
	(
	employeeID        INT 	NOT NULL REFERENCES Employees(employeeID),
	employeeName      VARCHAR(50) NOT NULL,
	employeeAddress   NVARCHAR(50) NOT NULL,
	employeePhone      	INT 	 NOT NULL,
	employeeEmail      NVARCHAR(50) NOT NULL
	);

-- ContactDetails Table
CREATE TABLE ContractDetails
	(
	contractID		INT 	NOT NULL REFERENCES Employees(contractID),
	contractType      VARCHAR(50) 	NOT NULL,
	contractTerm      	INT 	NOT NULL
	);

-- EmployeeReviewDetails Table
CREATE TABLE EmployeeReviewDetails
	(
	employeeReviewID	INT 	NOT NULL REFERENCES Employees(employeeReviewID),
	employeeReview      VARCHAR(70) 	NOT NULL,
	reviewerName      VARCHAR(20) 	NOT NULL
	);

-- Patient Table
CREATE TABLE Patient
	(
	patientID        INT 	NOT NULL PRIMARY KEY IDENTITY,
	insuranceID      INT 	 NOT NULL UNIQUE,
primaryCareDoctor VARCHAR(50) NOT NULL,
staffID           INT 	NOT NULL REFERENCES MedicalStaff(staffID),
	billingID      	INT 	 NOT NULL UNIQUE
	);

-- PatientPersonalInfo Table
CREATE TABLE PatientPersonalInfo
	(
	patientID           INT 	NOT NULL REFERENCES Patient(patientID),
	patientName      VARCHAR(50) NOT NULL,
	patientAddress   NVARCHAR(50) NOT NULL,
	patientPhone      	BIGINT 	 NOT NULL,
	patientDOB        DATE NOT NULL
	);

-- PatientMedicalRecords Table
CREATE TABLE PatientMedicalRecords
	(
	patientRecordNumber BIGINT NOT NULL PRIMARY KEY IDENTITY,
	patientID		INT 	NOT NULL REFERENCES Patient(patientID),
	testID		INT 	NOT NULL REFERENCES Lab(testID),
	weight		INT NOT NULL,
	height		INT NOT NULL,
	vitals		INT NOT NULL,
	checkIn 	SMALLDATETIME     NOT NULL,
	checkOut  	SMALLDATETIME     NOT NULL,
	symptoms 	NVARCHAR(100) NOT NULL,
	diagnose   	NVARCHAR(50) 	 NOT NULL,
	procedureCode    INT NOT NULL UNIQUE,
	attendingPhysician  VARHCAR(20)  NOT NULL,
	referralDoctor  VARHCAR(20)  NOT NULL,
	medicationID INT NOT NULL UNIQUE
	);

-- Lab Table
CREATE TABLE Lab
	(
	testID        INT 	NOT NULL PRIMARY KEY IDENTITY,
	results      VARCHAR(50) NOT NULL,
	mandatedReportCounty   VARCHAR(20) NOT NULL,
	mandatedReportState    VARCHAR(20) 	 NOT NULL
	);

-- Tests Table
CREATE TABLE Tests
	(
	testID 	   INT NOT NULL REFERENCES Lab(testID),
	testName        VARCHAR(50) NOT NULL
	);

-- Imaging Table
CREATE TABLE Imaging
	(
	testID 	   INT NOT NULL REFERENCES Lab(testID),
	imagingLocation  NVARCHAR(50) NOT NULL
	);

-- Medication Table
CREATE TABLE Medication
	(
	medicationID 	   INT NOT NULL REFERENCES PatientMedicalRecords(medicationID),
	medicineNumber   INT NOT NULL UNIQUE
	);

-- Procedure Table
CREATE TABLE ProcedureInfo
	(
	procedureCode  INT NOT NULL REFERENCES PatientMedicalRecords(procedureCode),
	procedureName   VARCHAR(50) NOT NULL,
	procedureCost   MONEY NOT NULL 
	);
-- Pharmacy Table
CREATE TABLE Pharmacy
	(
	medicineNumber  INT NOT NULL REFERENCES Medication(medicineNumber),
	medicineName   VARCHAR(50) NOT NULL,
	medicationCost   MONEY NOT NULL 
	);

-- Billing Table
CREATE TABLE Billing
	(
	billingID  INT NOT NULL REFERENCES Patient(billingID),
	numberOfVisits  INT NOT NULL,
	medicalBillingCode  VARCHAR(5) NOT NULL,
	payer		  VARCHAR(20) NOT NULL,
	paymentMethod  VARCHAR(20) NOT NULL
	);

-- InsuranceCoverage Table
CREATE TABLE InsuranceCoverage
	(
	insuranceID  INT NOT NULL REFERENCES Patient(insuranceID),
	insuranceCompany  VARCHAR(50) NOT NULL,
	insurancePhone  BIGINT NOT NULL,
	insuranceCoverage  NVARCHAR(20) NOT NULL
	);

-- Visitors Table
CREATE TABLE Visitors
	(
	visitorID        INT 	NOT NULL PRIMARY KEY IDENTITY,
	patientID        INT 	NOT NULL REFERENCES Patient(patientID),
	visitorName      VARCHAR(50) NOT NULL,
	relation   NVARCHAR(50) NOT NULL,
	entryTime      TIMESTAMP 	 NOT NULL,
	exitTime       TIMESTAMP NOT NULL
	);

