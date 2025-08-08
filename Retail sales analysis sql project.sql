-- SQL Retail Sales Analysis project using SQL
create database sql_project;
use sql_project;

-- Create TABLE
drop table if exists retail_sale;
create table retail_sale(
transactions_id int primary key,	
sale_date date,
sale_time time,
customer_id int,	
gender varchar(10),
age int,
category varchar(15),
quantity int,
price_per_unit float,	
cogs float,
total_sale float
);

select * from retail_sale;

select count(*) from retail_sale;

-- Darta Exploration
-- how many sales we have?
select count(*) as total_sale from retail_sale;

-- how many unique customer we have
select count(distinct customer_id) as total_sale from retail_sale;
 
select distinct category as total_sale from retail_sale;

-- check the any null value in column
select * from retail_sale where  transaction_id is null 
or sale_date is null or sale_time is null or customer_id is null
or gender is null or age is null or category is null 
or quantity is null or price_per_unit is null or cogs is null
or total_sale is null;

delete from retail_sale where
sale_date is null or customer_id is null
or gender is null or age is null or category is null 
or quantity is null or price_per_unit is null or cogs is null
or total_sale is null;
 

-- Data Analysis & Business key problem and answer
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


 -- Q1. write a SQL query to retrive all columns for sales mode on '2022-11-05'
 select * from retail_sale
 where sale_date = '2022-11-05';
 
 -- Q2 write a SQL query to retrive all transaction where the category is 'clothing' and the quantity sold is more than 10 in the month of nov-2022
 select * from retail_sale
 where category = 'clothing' 
 and 
 date_format(sale_date,'%y-%m') = '2022-11' 
 and 
 quantity >= 4;

 -- Q3.write a 	SQL query to calculate the toatl sales (total_sale) for each category
 select category,
 sum(total_sale) as net_sale,
 count(*) as total_orders 
 from retail_sale
 group by 1;
 
 -- Q4 write a SQL query to find the average age of customers who purchased items from 'Beauty' category
select round(avg(age),2) as avg_age 
from retail_sale 
where category = 'beauty';

-- Q5 write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sale 
where total_sale > 1000;

-- Q6 write a SQL query to find the total number of transaction (tansaction_id) made by each gender in each category.
select category,
gender,
count(*) as total_trans
from retail_sale 
group by category,gender
order by 1;

-- Q7 write a SQL query to calculate the average sale for each month.find out best selling month in each year.
select 
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sale,
rank() over(partition by extract(year from sale_date) order by avg(total_sale)desc) as rank_sale
from retail_sale group by 1,2 ;

-- Q8 write a SQL query to find the top 5 customer based on the highest total sales
select customer_id,
sum(total_sale) as total_sales 
from retail_sale 
group by 1 
order by 2 desc 
limit 5;

-- Q9 write a SQL query to find the number of unique customers who purchased items from each category
select category,
count(distinct customer_id) as count_of_unique_customer 
from retail_sale 
group by category ;

-- Q10. write a SQL query to crete each shift and number of orders (Example morning <=12,afternoon between 12  & 17,evening >17)
select *,
case 
when extract( hour from sale_time) < 12 then 'morning'
when extract( hour from sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from retail_sale; 





