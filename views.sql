/** VIEW 1
 * We are going to create a view, Top3PaidEmployees, that returns the top 3 employees that get paid the highest. For each employee, the view will return employeeID, employeeName and employeeSalary. Return only 3 employees with the highest salaries. Then we are using a select statement to show the results.
**/

CREATE VIEW Top3PaidEmployees
AS 
SELECT TOP 3 e.employeeName AS Name, ep.employeeSalary AS Salary
FROM Employees AS e JOIN EmployeePersonalInfo AS ep
 ON e.employeeID = ep.employeeID  
ORDER BY employeeSalary DESC;

SELECT *
FROM Top3PaidEmployees

/** VIEW 2
 * We are going to create a view, PatientNames, that returns the name of patients as their first name and last name separately. The view should also return their visitors and the relationship between the patient and the visitor.  The rows should be ordered by the patient's first name alphabetically. Then we are using a select statement to show the results.
**/

CREATE VIEW PatientNames
AS 
SELECT p.patientID, left(p.patientName, CHARINDEX(' ', p.patientName)) AS FirstName,
substring(p.patientName, CHARINDEX(' ', p.patientName)+1, len(p.patientName)-(CHARINDEX(' ', p.patientName)-1)) AS LastName, v.visitorName AS Visitor, v.relation AS Relationship 
FROM PatientPersonalInfo AS p JOIN Visitors AS v
 ON p.patientID = v.patientID  
ORDER BY FirstName;

SELECT *
FROM PatientNames
ORDER BY FirstName

/** VIEW 3
 * We are going to create a view that returns how many total days each patient was checked in to the hospital. The view should return two columns, the patient name and the days they were at the hospital. The rows should be ordered in with more to less number of days. Then we are using a select statement to show the results.
**/

CREATE VIEW PatientDays
AS 
SELECT p.patientName AS Name, DATEDIFF(day, pm.checkIn, pm.checkOut) AS NumberOfDays 
FROM PatientPersonalInfo AS p JOIN PatientMedicalRecords AS pm
 ON p.patientID = pm.patientID;

SELECT  *
FROM  PatientDays
ORDER BY NumberOfDays DESC;

/** VIEW 4
 * We will create a view that gives the total cost charged to every patient for their medications and procedures. Here, we are using 5 tables as they have been normalized to 3NF and have incorporated various JOINS. The final result gives the total cost.
**/

CREATE VIEW COST
AS
SELECT p.patientID as PatientID, pharm.medicationCost AS MedicationCost, procc.procedureCost AS ProcedureCost, 
(pharm.medicationCost+procc.procedureCost) AS TotalCost
FROM Patient AS p INNER JOIN PatientMedicalRecords AS pat
ON p.patientID = pat.patientID
JOIN Medication AS med
ON med.medicationID = pat.medicationID
JOIN Pharmacy AS pharm
ON pharm.medicineNumber = med.medicineNumber
JOIN ProcedureInfo AS procc
ON procc.procedureCode = pat.procedureCode

SELECT *
FROM COST


