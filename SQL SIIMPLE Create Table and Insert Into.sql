
/*
	SQL and Database
	Creating Database, Tables, Data types, Primary Key, Default, Constraint, Auto Increment
	Insert Into
*/

--Create Database
Create Database EmployeeDB


--Create Table for employees

Use EmployeeDB
Create Table EmployeeData
(
	EmployeeId int identity(100,1) primary key,
	Firstname varchar(55) CONSTRAINT Fname_validator not null,
	Lastname varchar(55) CONSTRAINT Lname_validator not null,
	Age int,
	Department varchar(55),
	--Salary int CONSTRAINT Sal_validator not null,
	City_Province varchar(55) default 'Manila',
	Country varchar(255)  default 'Philippines',
	CONSTRAINT AgeMin check(Age >= 17)
)	



--Create Table for Salary

Create table EmployeeSalary
(
	EmployeeId int primary key,
	JobTitle varchar(55),
	Salary int
)


SELECT * FROM EmployeeData
SELECT * FROM EmployeeSalary
drop table EmployeeData


-- Insert EmployeeData

Insert Into EmployeeData (Firstname, Lastname, Age, Department)
	Values
			('Vincent','Soriano', 29, 'IT'),
			('Jhunlee','Maneclang', 27, 'IT'),
			('Jowenard','Castro', 28, 'HR'),
			('Albert','Banaag', 31, 'Finance'),
			('Hasley','Carino', 31, 'Marketing'),
			('Jean','Maneclang', 24, 'Audit'),
			('Jazzmin','Sibayan', 24, 'Audit'),
			('Bongbong','Marcos', 60, 'CEO'),
			('Sarah','Duterte', 48, 'Regional Manager')

--Insert EmployeeSalary 

Insert Into EmployeeSalary (EmployeeId, JobTitle, Salary)
	Values
			(100,'Data Analyst', 60000),
			(101,'Network Administrator', 70000),
			(102,'Technical Support', 45000),
			(103,'Recruiter', 35000),
			(104,'Accountant', 50000),
			(105,'Graphics Designer', 55000),
			(106,'Auditor',48000),
			(107,'Senior Auditor',60000),
			(108,'CEO', 200000),
			(109,'Regional Manager', 96000)

---



		


