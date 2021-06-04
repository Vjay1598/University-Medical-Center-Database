--First stored procedure

GO 
CREATE PROC patientsStay 
 @DateMin varchar(50) = NULL, 
 @DateMax varchar(50) = NULL 
AS 
IF @DateMin IS NULL OR @DateMax IS NULL 
THROW 50001, 'The DateMin and DateMax parameters are required.', 1; 
IF NOT (ISDATE(@DateMin) = 1 AND ISDATE(@DateMax) = 1) 
THROW 50001, 'The date format is not valid. Please use yyyy-mm-dd.', 1; 
IF CAST(@DateMin AS datetime) > CAST(@DateMax AS datetime) 
THROW 50001, 'The DateMin parameter must be earlier than DateMax', 1; 
SELECT p.patientName, pat.checkIn 
FROM PatientMedicalRecords AS pat JOIN PatientPersonalInfo AS p
ON pat.patientID = p.patientID
WHERE pat.checkIn BETWEEN @DateMin AND @DateMax 
ORDER BY pat.checkIn;

--Second stored procedure

GO 
CREATE PROC spPositionSalary 
 @SalaryMin money = 0, 
 @SalaryMax money = 0 
AS 
IF @SalaryMin IS NULL OR @SalaryMax IS NULL 
THROW 50001, 'The SalaryMin and SalaryMax  parameters are required.', 1; 
IF NOT (ISNUMERIC(@SalaryMin) = 1 AND ISNUMERIC(@SalaryMax) = 1) 
THROW 50001, 'The salary format is not valid. Please use xx,xxx.xx.', 1; 
IF CAST(@SalaryMin AS MONEY) > CAST(@SalaryMax AS MONEY) 
THROW 50001, 'The SalaryMin parameter must be earlier than SalaryMax', 1; 

 SELECT med.position AS Position, emp.employeeSalary AS Salary, 
 FROM MedicalStaff AS med JOIN Employees AS emp 
 ON med.staffID = emp.staffID 
 WHERE emp.employeeSalary
 BETWEEN @SalaryMin AND @SalaryMax

ORDER BY emp.employeeSalary ASC; 
    END;
