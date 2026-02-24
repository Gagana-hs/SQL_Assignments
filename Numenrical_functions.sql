-- NUMERICAL FUNCTIONS – 20 Questions

-- 1.Round Unit_Price to 2 decimal places.
select order_id, unit_price, round(unit_price,2) as rounded_unit_price from orders;

-- 2.Find total sales per order.
select quantity, unit_price, quantity*unit_price as total_sales from orders;

-- 3.Calculate average order value.
select avg(quantity*unit_price) as average_order_value from orders;

-- 4.Find highest product price.
select max(unit_price) as highest_price from orders;

-- 5.Find lowest product price.
select min(unit_price) as lowest_price from orders;

-- 6.Calculate percentage discount applied.
round(((original_price - final_price)/original_price) *100,2)
select ((100-80)/100)*100 as discount_percentage from dual;

-- 7.Find modulus of Quantity divided by 2.
select quantity, mod(quantity,2) as remainder from orders;

-- 8.Convert negative values to positive.
select ABS(-20) as positive value from dual;

-- 9.Truncate price without rounding.
select trunc(unit_price) as truncated_price from orders;
select trunc(678.987) as truncated_value from dual;

-- 10.Find square root of total sales.
select sqrt(quantity*unit_price) as square_root_total_price from orders;

-- 11.Calculate exponential value of a number.
select exp(2) as result from dual;

-- 12.Calculate power of 2^5.
select power(2,5) as result from dual;

-- 13.Find absolute difference between two prices.
select unit_price,
       abs(lag(unit_price) over (order by order_id) - unit_price) 
       as absolute_difference
from orders;

-- 14.Calculate sales growth percentage.
select order_date, quantity , unit_price , (quantity*unit_price) as total_sales,
    round((((quantity*unit_price) - lag(quantity*unit_price) over (order by order_date))/(quantity*unit_price))*100,2) as sales_growth_percentage
from orders;

-- 15.Find random number between 1 and 100.
select trunc(DBMS_RANDOM.VALUE(1,101)) as random_number from orders;

-- 16.Divide total sales by number of orders.
select sum(quantity*unit_price)/count(quantity) as result from orders;

-- 17.Find ceiling value of price.
select ceil(unit_price) as ceiled_unit_price from orders;
select ceil(798.87) as result from dual;

-- 18.Find floor value of price.
select floor(unit_price) as floor_unit_price from orders;
select floor(798.87) as result from dual;

-- 19.Convert decimal to integer.
select trunc(798.67) as result from dual;

-- 20.Calculate compound interest.
select 
   10000*power((1+(0.20/1)), (1*2)) as final_amount,
   10000*power((1+(0.20/1)), (1*2)) - 10000 as compound_interest
from dual;