ALTER Procedure DeleteEmployeeReviewTransaction
@employeeReviewID       INT
AS
BEGIN TRY
   BEGIN TRANSACTION
       DELETE FROM EmployeeReviewDetails WHERE employeeReviewID=@employeeReviewID
       RAISERROR('Cannot delete review',16,1)
       COMMIT
END TRY
BEGIN CATCH
   ROLLBACK
END CATCH
