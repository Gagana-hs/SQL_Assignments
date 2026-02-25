-- NULL VALUE FUNCTIONS – 20 Questions


-- 1.Replace NULL price with 0.
select nvl(unit_price, 0) as price from orders;

-- 2.Replace NULL Customer_Name with 'Unknown'.
select nvl(customer_name, 'unknown') as name from orders;

-- 3.Count NULL values in Product_Name.
select count(*) - count(product_name) as null_values from orders;

-- 4.Find rows where Order_Date is NULL.
select order_date from orders where order_date is null;

-- 5.Use COALESCE to return first non-null value.
select coalesce(null, null, 10, null, 30, 20) as non_null_value from dual;

-- 6.Use NVL to replace NULL values.
select nvl(customer_name, 'unknown') as name from orders;

-- 7.Use IFNULL function.

-- 8.Check if column is NULL.
select * from orders where unit_price is null;

-- 9.Check if column is NOT NULL.
select * from orders where unit_price is not null;

-- 10.Use NULLIF between two columns.
select nullif(substr(order_id,2), substr(customer_id,2)) as result from orders;

-- 11.Replace blank values with NULL.
select nullif(trim(product_name),'') as new_product_name from orders;

-- 12.Count non-null values.
select count(product_name) as non_value_values from orders;

-- 13.Filter records where price is NULL or 0.
select unit_price from orders where unit_price is null or unit_price = 0;

-- 14.Use CASE to handle NULL values.
select product_name,
      case
        when unit_price is null then 0
        else unit_price
    end as price
from orders;

-- 15.Compare NULL values properly.
select * from orders where unit_price is not null;

-- 16.Handle NULL in aggregation.
select sum(nvl(unit_price,0)) as total_unit_price from orders;

-- 17.Find average excluding NULL values.
select avg(unit_price) as avg_unit_price from orders; -- average ignores null values

-- 18.Find sum ignoring NULL values.
select sum(unit_price) as total_price from orders; -- sum ignores null values

-- 19.Identify columns containing NULL using metadata.
--USER_TAB_COLUMNS
--  This is a data dictionary view.
--  It stores metadata about columns in tables owned by the current user.

select column_name,
       nullable
from user_tab_columns
where table_name = 'ORDERS'
  and nullable = 'Y';

-- 20.Convert NULL to default system date.
select nvl(order_date, sysdate) as updated_date from orders;