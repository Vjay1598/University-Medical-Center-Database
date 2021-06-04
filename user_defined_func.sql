--First user-defined function

CREATE FUNCTION fnInsuranceRange 
 (@MinCOST MONEY, @MaxCost MONEY) 
RETURNS TABLE 
RETURN 
(SELECT p.patientID, c.totalCost AS CostBilled, i.insuranceCoverage AS InsuranceCoverage
FROM Patient as p JOIN InsuranceCoverage as i
ON p.insuranceID = i.insuranceID
JOIN COST as c
ON p.patientID = c.patientID 
WHERE c.totalCost BETWEEN @MinCost AND @MaxCost); 

--Second user-defined function

GO 
CREATE FUNCTION fnContractEmployee() 
RETURNS INT 

BEGIN 
 RETURN 
 (SELECT emp.employeeID 
 FROM Employees AS emp JOIN ContractDetails AS c
 ON emp.contractID = c.contractID
 WHERE c.contractTerm = 
 (SELECT MAX(c.contractTerm) 
 FROM ContractDetails AS c )) 
END;
