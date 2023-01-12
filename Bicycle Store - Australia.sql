
/*
	Bicycle Store - Australia--
*/

--Looking at all tables to see the data that we can use.
Use BicycleStoreDataset

select * from CustomerAddress

select * from CustomerDemographic

select * from Transactions

--Looking at Total cost, sales and profits.

select	 sum(cast(standard_cost_2 as int)) as Total_cost
		,sum(cast(list_price as int)) as Total_sales
		,sum(cast(list_price as int)) - sum(cast(standard_cost_2 as int)) as Profits
from Transactions


-- Creating Query for Data Viz.
-- Cast, Concat, Date and Joins different tables.
select 
		 trans.transaction_id
		,trans.product_id
		,trans.customer_id
		,cast(trans.transaction_date as date) as 'order_date'
		,trans.brand
		,trans.product_line
		,trans.product_class
		,trans.product_size
		,trans.list_price
		,trans.standard_cost_2
		,cadd.state
		,cadd.country
		,concat(cdemo.first_name, ' ', cdemo.last_name) as 'customer_name'
		,cast(cdemo.DOB as date) as 'date_of_birth'
		,DATEDIFF(year, cdemo.DOB, GETDATE()) as 'Age'
		,cdemo.Gender_new
		,cdemo.job_industry_category
from Transactions trans
Join CustomerAddress cadd
on  trans.customer_id = cadd.customer_id
Join CustomerDemographic cdemo
on trans.customer_id = cdemo.customer_id
Group by
		trans.transaction_id
		,trans.product_id
		,trans.customer_id
		,CAST(trans.transaction_date as date)
		,trans.brand
		,trans.product_line
		,trans.product_class
		,trans.product_size
		,trans.list_price
		,trans.standard_cost_2
		,cadd.state
		,cadd.country
		,concat(cdemo.first_name, ' ', cdemo.last_name)
		,cast(cdemo.DOB as date)
		,DATEDIFF(year, cdemo.DOB, GETDATE())
		,cdemo.Gender_new
		,cdemo.job_industry_category


-- Change F to Female, M to Male , Femal to Female.

select distinct(gender), count(gender) as total
from CustomerDemographic
group by gender
order by total desc

select customer_id, gender
from CustomerDemographic
where gender <> 'Male'
order by gender asc

select customer_id, gender
	,CASE When gender = 'F' Then 'Female'
		  When gender = 'M' Then 'Male'
		  When gender = 'Femal' Then 'Female'
		  Else gender
		  End
from CustomerDemographic
order by customer_id

-- I choose to add a new column to show the difference and keep the Gender column unchanged.

Alter Table CustomerDemographic
Add Gender_new nvarchar(255);

Update CustomerDemographic
Set Gender_new = CASE When gender = 'F' Then 'Female'
		     When gender = 'M' Then 'Male'
		     When gender = 'Femal' Then 'Female'
		     Else gender
		     End


-- Computing the age of customers--
select customer_id, DOB, DATEDIFF(year, DOB, GETDATE()) as Age
from CustomerDemographic
order by DOB desc


select distinct(job_industry_category), count(job_industry_category) as TotalJobCat
from CustomerDemographic
group by job_industry_category
order by TotalJobCat desc

---
