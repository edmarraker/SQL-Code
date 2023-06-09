use SUBSCRIPTION_DATA
select * from customer_cases
select * from customer_info
select * from customer_product
select * from product_info


--Checking for duplicates

select count(distinct case_id)
from customer_cases
group by case_id
order by case_id desc


select count(distinct customer_id)
from customer_info
group by customer_id
order by customer_id desc

select count(distinct customer_id)
from customer_product
group by customer_id
order by customer_id desc

--Joins Tables
select *
from customer_cases a left join customer_info b
		on a.customer_id = b.customer_id left join customer_product c
		on a.customer_id = c.customer_id left join product_info d
		on c.product = d.product_id
		order by a.date_time asc
		

select count(gender) as gendercount
from customer_info
group by gender

select * from customer_cases
order by date_time desc

select * from customer_product
order by signup_date_time desc

--Active and Cancelled Subscription
select  customer_id, product, cancel_date_time,
		Case when cancel_date_time <> 'NA' then 'Cancelled'
			 when cancel_date_time = 'NA' then 'Active'
				else
				cancel_date_time
				end 
from customer_product


--Adding column for Subscription Status
Alter table customer_product
add [status] nvarchar(50)
-- Filling the new column with subscription status

Update customer_product
Set [status] = Case when cancel_date_time <> 'NA' then 'Cancelled'
			 when cancel_date_time = 'NA' then 'Active'
				else
				cancel_date_time
				end 


---Type of Subscription prd_1 = annual subscription, prd_2 = monthly_subcription

select customer_id, product,
		CASE WHEN product = 'prd_1' THEN 'ANNUAL SUBSCRIPTION'
			 WHEN product = 'prd_2' THEN 'MONTHLY SUBSCRIPTION'
			 ELSE product
			 END
from customer_product

--Adding column for Type of Subscription
Alter table customer_product
add subscription_type nvarchar(55)

-- Filling the new column with subscription type
Update customer_product
Set subscription_type = CASE WHEN product = 'prd_1' THEN 'ANNUAL SUBSCRIPTION'
							 WHEN product = 'prd_2' THEN 'MONTHLY SUBSCRIPTION'
							 ELSE product
						END


select	customer_id,
		signup_date_time,
		convert(date, signup_date_time, 102) as shortdate
from customer_product















