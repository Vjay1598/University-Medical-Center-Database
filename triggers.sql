--Trigger 1

CREATE TRIGGER Billing_INSERT_UPDATE
	ON Billing
	AFTER INSERT, UPDATE
AS
	UPDATE Billing
	SET medicalBillingCode = UPPER(medicalBillingCode) 
	WHERE medicalBillingCode IN (SELECT medicalBillingCode FROM INSERTED);

--Trigger 2

DROP TRIGGER IF EXISTS t_lab_insert;
GO
CREATE TRIGGER t_lab_insert ON Lab INSTEAD OF INSERT
AS BEGIN
    DECLARE @testID CHAR(8);
    DECLARE @results VARCHAR(50);
    DECLARE @mandatedReportCounty  VARCHAR(50);
    DECLARE @mandatedReportState   VARCHAR(50);
    SELECT @testID = testID, @results = results, @mandatedReportCounty = mandatedReportCounty, @mandatedReportState = mandatedReportState FROM INSERTED;
    IF @mandatedReportState = ' ' SET @mandatedReportState = @mandatedReportCounty;
    IF @mandatedReportCounty = ' ' SET @mandatedReportCounty = @mandatedReportState;
    INSERT INTO Lab (testID, results, mandatedReportCounty, mandatedReportState) VALUES (@testID, @results, @mandatedReportCounty, @mandatedReportState);
END;
