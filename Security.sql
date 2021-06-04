--First script for Security

USE UMC; 
CREATE ROLE MainAdmin; 
CREATE ROLE Accountant;
CREATE ROLE HR;

GRANT CREATE TABLE  
TO MainAdmin; 

GRANT INSERT, DELETE, UPDATE 
ON Facility
TO MainAdmin; 

GRANT INSERT, DELETE, UPDATE 
ON Department 
TO MainAdmin;

GRANT INSERT,UPDATE 
ON Billing
TO Accountant;

GRANT INSERT,UPDATE 
ON Cost
TO Accountant; 

GRANT INSERT, DELETE, UPDATE 
ON EmployeePersonalInfo
TO HR;

GRANT INSERT, DELETE, UPDATE 
ON EmployeeReviewDetails
TO HR;

ALTER ROLE db_datareader ADD MEMBER MainAdmin;
ALTER ROLE db_datareader ADD MEMBER Accountant;
ALTER ROLE db_datareader ADD MEMBER HR;

--Second script for Security

CREATE LOGIN Admin15 WITH PASSWORD = 'Any password', 
 DEFAULT_DATABASE = UMC; 
CREATE USER username FOR LOGIN Admin15; 
ALTER ROLE MainAdmin ADD MEMBER username;
