/*
	Temporary Tables

	Temporary Tables are Created in TempDB and are automatically deleted as soon as the last connection is terminated. 
	Temporary Tables helps us to store and process intermediate results.
	Temporary tables are very useful when we need to store temporary data.
*/

Use EmployeeDB

select *
from EmployeeData
select *
from EmployeeSalary


--Creating Temporary table
Drop Table if exists #Temp_Employee
Create Table #Temp_Employee
(
	 JobTitle nvarchar(55)
	,EmployeesPerJob int
	,AvgAge int
	,AvgSalary int
)


-- Now that we have tempory table, I created the query that we need then insert this in our temporary table (#Temp_Employee).

Insert Into #Temp_Employee
Select   sal.Jobtitle
		,count(emp.Department)
		,Avg(emp.Age)
		,Avg(sal.Salary)
From EmployeeData emp
	 Join EmployeeSalary sal
	 On emp.EmployeeId = sal.EmployeeId
Group by JobTitle


Select * 
From #Temp_Employee

---
