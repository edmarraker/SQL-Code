
/*
Superstore Dataset @Kaggle.com
Data Cleaning, Manipulate existing data, Creating new fields, Grouping Values.
*/

select * from Superstore


--TRIM, LTRIM & RTRIM functions
--Removing 's' from 'Consumers'

select   count(*) as count
	    ,TRIM('s' from Segment_Clean) as Segmenttrimmed	
from Superstore
group by Segment_Clean
order by count

--Instead of updating the value in column Segment.
--I add new column Segment_clean to show the diffence and keep the Segment column unchange.

Alter table Superstore
Add Segment_Clean nvarchar(55);

Update
	Superstore
Set 
	Segment_Clean = TRIM('s' from Segment_Clean)

--Segment_Clean
select	count(*) as count
		,Segment_Clean
from Superstore
group by Segment_Clean
order by count

--Segment
select	count(*) as count
		,Segment
from Superstore
group by Segment
order by Segment



--LEFT & RIGHT functions
--SUBSTRING function.
-- Breaking out Order_id into Individual Columns.

select   count(*) as count
	    ,TRIM('s' from Segment_Clean) as Segmenttrimmed
		,Order_id
		,LEFT(Order_id,2) as Order_id_Prefix
		,SUBSTRING(Order_id, 4,4) as Order_id_Mid
		,RIGHT(Order_id,6) as Order_id_Suffix
from Superstore
group by Segment_Clean, Order_id



--LEN function

select
		 Customer_name
		,len(customer_name)
from Superstore
		where
		len( Customer_name)> 20



--CHARINDEX function

select
		 Customer_name
		 ,Charindex(' ', Customer_name) as strLocation
from Superstore
order by Customer_name asc


--Spliting Consumer_name into Individuals field (Firstname, Lastname).
--Long method but fun.
select
		 Customer_name
		 ,Charindex(' ', Customer_name) as strLocation
		 ,SUBSTRING(Customer_name, 0, Charindex(' ', Customer_name)) as Firstname
		 ,SUBSTRING(Customer_name, Charindex(' ', Customer_name)+1, len(Customer_name)) as Lastname
from Superstore
order by Customer_name

--Spliting Consumer_name into Individuals field (Firstname, Lastname).
--Easy method.
select
		Customer_name
		,PARSENAME(REPLACE(Customer_name, ' ', '.'),2) as Firstname
		,PARSENAME(REPLACE(Customer_name, ' ', '.'),1) as Lastname
from Superstore
order by Customer_name

--Adding two columns where we can put firstname and lastname.
Alter table Superstore
Add First_name nvarchar(55);

Alter table Superstore
Add Last_name nvarchar(55);
--Inserting values to Firstname and Lastname column.
Update
	Superstore
Set First_name = PARSENAME(REPLACE(Customer_name, ' ', '.'),2)
	,Last_name = PARSENAME(REPLACE(Customer_name, ' ', '.'),1)



--Conditional Expressions
--CASE statements
--Change Utahh to Utah under State column


Select
		count(*) as count
		,State
from Superstore
--where state like 'Utahh'
where state like 'Utah'
group by State



select State
		,case when State = 'Utahh' then 'Utah' 
			 else State
			 end
from Superstore
where state like 'Utahh'

Update Superstore
Set	State = case when State = 'Utahh' then 'Utah'
			 else State
			 end

--Standardize Date Format

select  Order_date
		,Cast(Order_date as Date) as New_Order_date
from Superstore

---
