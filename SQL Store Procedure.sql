/*
	Stored Procedures 

	A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.
    So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.
    You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.
*/

Use EmployeeDB

select *
from EmployeeData

select *
from EmployeeSalary


--This stored procedure will execute the following:
--1. Create temp table, 
--2. Insert some column from EmployeeData table and EmployeeSalary TO temp table and then
--3. Select everything from temp table,
CREATE PROCEDURE StoredProcedure_1
AS
Drop Table if exists #Temp_Employee
Create Table #Temp_Employee
(
	 JobTitle nvarchar(55)
	,EmployeesPerJob int
	,AvgAge int
	,AvgSalary int
)

Insert Into #Temp_Employee
Select   sal.Jobtitle
		,count(emp.Department)
		,Avg(emp.Age)
		,Avg(sal.Salary)
From EmployeeData emp
	 Join EmployeeSalary sal
	 On emp.EmployeeId = sal.EmployeeId
Group by JobTitle

Select * from #Temp_Employee

--Execute our stored procedure 1.
EXEC StoredProcedure_1



-- Store Procedure with Multiple Parameter.

CREATE PROCEDURE StoredProcedure_2
	@Jobtitle nvarchar(55), @Department nvarchar(25)
AS
Drop Table if exists #Temp_Employee2
Create Table #Temp_Employee2
(
	 JobTitle nvarchar(55)
	,Department nvarchar(25)
	,Age int
	,Salary int
)

Insert Into #Temp_Employee2
Select   sal.Jobtitle
		,emp.Department
		,emp.Age
		,sal.Salary
From EmployeeData emp
	 Join EmployeeSalary sal
	 On emp.EmployeeId = sal.EmployeeId
Where Jobtitle = @Jobtitle and Department = @Department
Order by Salary

Select * 
From #Temp_Employee2

--Execute our stored procedure 2 with parameters.
EXEC StoredProcedure_2 @Jobtitle = 'Data Analyst',  @Department = 'IT';

