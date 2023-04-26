USE HR_DATABASE
SELECT *
FROM HR_DATA

SELECT * 
FROM Position
SELECT * 
FROM Department


--- Checking if there are duplicate records
SELECT count(distinct(EmpID))
FROM HR_Data


--Data Cleaning and Manipulation

SELECT 
		EmpID
		,CONCAT(FirstName, ' ', MiddleInitial,'.', ' ' , LastName) as FullName
		,DepartmentID
		,PositionID
		,Manager
		,DateofHire
		,DATEDIFF(year, DateofHire, CURRENT_TIMESTAMP) as Year_of_Service
		,Salary
		,Sex
		,DOB
		,DATEDIFF(year, DOB, CURRENT_TIMESTAMP) as Age
		,MaritalDesc
		,RaceDesc
		,State
		,Zip
		,DateofTermination
		,EmploymentStatus
		,RecruitmentSource
		,EmpSatisfaction
		,Absences	
FROM HR_DATA

--Converting DepartmentID, tinyint to nvarchar

Alter Table HR_Data
Alter Column DepartmentID nvarchar(50)


--Add column for Department 

Alter Table HR_Data
Add  Department nvarchar(55)

--Insert value for Department column
Update HR_Data
Set Department	=	Case	When DepartmentID = '6' Then 'Admin Offices'
							When DepartmentID = '5' Then 'Production'
							When DepartmentID = '4' Then 'Sales'
							When DepartmentID = '3' Then 'Software Engineering'
							When DepartmentID = '2' Then 'IT/IS'
							When DepartmentID = '1' Then 'Executive Ofice'
					Else DepartmentID
					End	



--Converting PositonID, tinyint to nvarchar
Alter Table HR_Data
Alter Column PositonID nvarchar(55)

--Add column for Position

Alter Table HR_Data
Add  Position nvarchar(55)

--Insert value for Position column
Update HR_Data
Set Position = 
CASE
When PositionID = '1'	Then 'President & CEO'
When PositionID = '2'	Then 'CIO'
When PositionID = '3'	Then 'Director of Operations'
When PositionID = '4'	Then 'IT Director'
When PositionID = '5'	Then 'Director of Sales'
When PositionID = '6'	Then 'BI Director'
When PositionID = '7'	Then 'Production Manager'
When PositionID = '8'	Then 'Area Sales Manager'
When PositionID = '9'	Then 'Software Engineering Manager'
When PositionID = '10'  Then 'Sales Manager'
When PositionID = '11'  Then 'IT Manager - Support'
When PositionID = '12'  Then 'Shared Services Manager'
When PositionID = '13'  Then 'IT Manager - Infra'
When PositionID = '14'	Then 'IT Manager - DB'
When PositionID = '15'	Then 'Sr. DBA'
When PositionID = '16'	Then 'Sr. Accountant'
When PositionID = '17'	Then 'Sr. Network Engineer'
When PositionID = '18'	Then 'Senior BI Developer'
When PositionID = '19'	Then 'Principal Data Architect'
When PositionID = '20'	Then 'Data Architect'
When PositionID = '21'	Then 'Data Analyst'
When PositionID = '22'	Then 'BI Developer'
When PositionID = '23'	Then 'Software Engineer'
When PositionID = '24'	Then 'Network Engineer'
When PositionID = '25'	Then 'Enterprise Architect'
When PositionID = '26'	Then 'Database Administrator'
When PositionID = '27'	Then 'Accountant I'
When PositionID = '28'	Then 'IT Support'
When PositionID = '29'	Then 'Administrative Assistant'
When PositionID = '30'	Then 'Production Technician I'
When PositionID = '31'	Then 'Production Technician II'

ELSE PositionID
END

--QUERY BELOW IS CLEAN AND READY FOR DATA VIZUALIZATION
SELECT 
		EmpID
		,CONCAT(FirstName, ' ', MiddleInitial,'.', ' ' , LastName) as FullName
		,Department
		,Position
		,Manager
		,DateofHire
		,DATEDIFF(year, DateofHire, CURRENT_TIMESTAMP) as Year_of_Service
		,Salary
		,Sex
		,DOB
		,DATEDIFF(year, DOB, CURRENT_TIMESTAMP) as Age
		,MaritalDesc
		,RaceDesc
		,State
		,Zip
		,DateofTermination
		,EmploymentStatus
		,RecruitmentSource
		,EmpSatisfaction
		,Absences	
FROM HR_DATA

Select LastName, FirstName
From HR_Data

Update HR_Data
Set Sex = 
CASE
When Sex = 'male'	Then 'MALE'
When Sex = 'female'	Then 'FEMALE'
Else Sex
End

Update HR_Data
Set LastName = Upper(LastName)

Update HR_Data
Set FirstName = Upper(FirstName)
