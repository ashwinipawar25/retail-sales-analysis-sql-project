# 🛍️ Retail Sales Analysis - SQL Project

## 📌Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**database**:sql_project

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## 🎯Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## 🗂️Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sql_project`.
- **Table Creation**: A table named `retail_sale` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE sql_project;

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
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
-- Darta Exploration
-- how many sales we have?
select count(*) as total_sale from retail_sale;

-- how many unique customer we have
 select count(distinct customer_id) as total_sale from retail_sale;
 
 select distinct category as total_sale from retail_sale;

select * from retail_sale
where  transaction_id is null or sale_date is null or sale_time is null
or customer_id is null or gender is null or age is null or category is null 
or quantity is null or price_per_unit is null or cogs is null or total_sale is null;

delete from retail_sale
where sale_date is null or customer_id is null or gender is null
or age is null or category is null or quantity is null
or price_per_unit is null or cogs is null or total_sale is null;
```

### 3.📊 Data Analysis & Business Questions

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
select * 
 from retail_sale
 where sale_date = '2022-11-05';
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
select * from retail_sale
 where category = 'clothing' 
 and 
 date_format(sale_date,'%y-%m') = '2022-11' 
 and 
 quantity >= 4;
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
select category,
 sum(total_sale) as net_sale,
 count(*) as total_orders 
 from retail_sale
 group by 1;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select round(avg(age),2) as avg_age 
from retail_sale 
where category = 'beauty';

```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
select * from retail_sale 
where total_sale > 1000;
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
select category,
gender,
count(*) as total_trans
from retail_sale 
group by category,gender
order by 1;
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
select 
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sale,
rank() over(partition by extract(year from sale_date) order by avg(total_sale)desc) as rank_sale
from retail_sale group by 1,2 ;

```

8. **Write a SQL query to find the top 5 customers based on the highest total sales**:
```sql
select customer_id,
sum(total_sale) as total_sales 
from retail_sale 
group by 1 
order by 2 desc 
limit 5;

```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
select category,
count(distinct customer_id) as count_of_unique_customer 
from retail_sale 
group by category ;

```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
select *,
case 
when extract( hour from sale_time) < 12 then 'morning'
when extract( hour from sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from retail_sale; 
```

## 🔍 key insights

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## 📈 Reports

Sales Summary Report

Category-wise Performance Analysis

Customer Demographics Insights

Shift-based Sales Trends 

## 🧠 Skills Demonstrated

SQL Aggregations

Data Cleaning & Validation

Window Functions

Exploratory Data Analysis (EDA)

Business Insight Generation

## 🧰 Tools Used

MySQL
GitHub

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## Author

**Ashwini Pawar**<br>

This project is part of my portfolio,showcasing the sql skills essential for data analsyt role.if you have any questions,feedback,or would like to collaborate,feel free to get in touch!

**Email**: [2005ashwinipawar@gmail.com](mailto:2005ashwinipawar@gmail.com)</a><br>
**Github**: [ashwinipawar25](https://github.com/ashwinipawar25)
