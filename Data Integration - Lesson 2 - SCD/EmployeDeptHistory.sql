USE info7370_output
GO
drop TABLE if exists EmployeeDepartmentHistory
go
CREATE TABLE EmployeeDepartmentHistory(
	[EmployeeID] int NOT NULL,
	[DepartmentID] int NOT NULL,
	[ShiftID] int NOT NULL,
	[DeptStartDate] date NOT NULL
) 
GO


