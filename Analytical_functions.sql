-- ANALYTICAL FUNCTIONS (WINDOW FUNCTIONS) – 20 Questions


-- 1.Assign row numbers to each order.
select order_id, row_number() over(order by order_id) from orders;

-- 2.Rank products by price.
select product_name, unit_price, rank() over( order by unit_price desc) 
as rank_price from orders;

-- 3.Dense rank products by sales.
select quantity*unit_price, dense_rank() over(order by quantity*unit_price desc) as dense_rank_sales
from orders;

-- 4.Find running total of sales.
select order_id, product_name, quantity*unit_price as total_sales, 
sum(quantity*unit_price) over(order by order_id rows between unbounded preceding and current row)
as running_total_sales from orders;

-- 5.Calculate cumulative sum by month.
select extract(month from order_date) as month, 
sum(sum(quantity*unit_price)) over(order by extract(month from order_date)) as cumulative_sales
from orders 
group by extract(month from order_date)
order by month;

-- 6.Find moving average of last 3 days.
select order_date, (quantity*unit_price) as sales, 
avg(quantity*unit_price) over(order by order_date rows between 2 preceding and current row)
as moving_avg from orders order by order_date;

-- 7.Calculate lag of previous day sales.
select order_date, quantity*unit_price as sales,
lag(quantity*unit_price) over(order by order_date) as lag_of_sales
from orders;

-- 8.Calculate lead of next day sales.
select order_date, quantity*unit_price as sales,
lead(quantity*unit_price) over(order by order_date) as lead_of_sales
from orders;

-- 9.Find difference between current and previous sale.
select quantity*unit_price as sales,
(quantity*unit_price) - lag(quantity*unit_price) over(order by order_date) as difference
from ORDERS;

-- 10.Partition sales by region.
select order_date, Store_Location, 
sum(quantity*unit_price) over(partition by store_location order by order_date) as cumulative_sales
from orders
order by order_date;

-- 11.Find top 3 products per category.
select *
from(
    select product_name, product_category, sum(quantity*unit_price) as total_sales,
    row_number() over(partition by product_category order by sum(quantity*unit_price) desc) as rn
    from orders
    group by product_category, product_name
)
where rn<=3
order by product_category;

-- 12.Find bottom 2 customers by sales.
select * from (
    select customer_id, sum(quantity*unit_price) as total_sales,
    row_number() over(order by sum(quantity*unit_price) asc) as rn
    from ORDERS
    group by customer_id
)
where rn<=2
order by total_sales;

-- 13.Calculate percentage of total sales.
select customer_id, sum(quantity*unit_price) as total_sales,
round(sum(quantity*unit_price)/sum(sum(quantity*unit_price)) over() *100,2) as percent_sales
from orders
group by customer_id
order by total_sales;

-- 14.Calculate NTILE distribution of customers.
select customer_id, customer_name,
NTILE(4) over(order by customer_id) as customer_quartile
from orders;

-- 15.Find first order per customer.
select customer_id, order_date, order_id, product_name,
first_value(order_date) over(partition by customer_id order by order_date) as first_order
from orders
order by customer_id, order_date;

-- 16.Find last order per customer.
select customer_id, order_date, order_id, product_name,
last_value(order_date) over(partition by customer_id order by order_date) as first_order
from orders
order by customer_id, order_date;

-- 17.Calculate average salary within department.
select employee_id, department_id, salary,
avg(salary) over(partition by department_id) as dept_avg_salary
from hr.employees
order by department_id, employee_id;

-- 18.Compare current row with max value in partition.
select employee_id, department_id,salary, 
salary - max(salary) over(partition by department_id) as difference_salary
from hr.EMPLOYEES
order by department_id;

-- 19.Identify duplicate records using ROW_NUMBER.
select * from (
    select employee_id, first_name, last_name, email,
    row_number() over(partition by first_name order by employee_id) as rn
    from hr.employees
)
where rn>1;

-- 20.Find cumulative distinct count.