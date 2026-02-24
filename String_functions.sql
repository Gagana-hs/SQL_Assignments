-- STRING FUNCTIONS – 20 Questions

-- 1.Write a query to convert all customer names to uppercase.
UPDATE orders SET customer_name = UPPER(customer_name);
select * from orders;

-- 2.Extract the first 5 characters from Product_Name.
select substr(product_name,1,5) as first5_prod_name from orders;

-- 3.Find the length of each Customer_Name.
select customer_name, length(customer_name) as customer_name_length from orders;

-- 4.Replace the word "Rice" with "Premium Rice" in Product_Name.
select product_name, replace(product_name, 'Rice', 'Premium Rice') as result from orders;

-- 5.Remove leading and trailing spaces from Customer_Name.
select trim(customer_name) as updated_name from orders;

-- 6.Concatenate First_Name and Last_Name as Full_Name.
select first_name, last_name, concat(first_name,' ',last_name) as full_name from hr.employees;

-- 7.Find customers whose names start with 'A'.
select customer_name, order_id from orders where customer_name like 'A%';

-- 8.Extract the domain name from Email_ID.
select substr('gagna@gmail.com', instr('gagana@gmail.com', '@')) as domain_name from dual;

-- 9.Find the position of '@' in Email_ID.
select instr('gagana@gmail.com', '@') as position from dual;

-- 10.Reverse the Product_Name.
select product_name, reverse(product_name) as reversed_name from Orders;

-- 11.Convert the first letter of each word in Product_Name to uppercase.
select product_name, initcap(product_name) as updated_prod_name from orders;

-- 12.Extract the last 3 characters from Order_ID.
select order_id, substr(order_id, -3) as result from orders;

-- 13.Count how many times letter 'a' appears in Customer_Name.
select customer_name, (length(customer_name) - length(replace(lower(customer_name), 'a',''))) as a_count
from orders;

-- 14.Mask the last 4 digits of a phone number.
select phone_number, substr(phone_number,1,length(phone_number)-4) || '****' as masked_phone_number 
from hr.employees;

-- 15.Split Full_Name into First_Name and Last_Name.
select customer_name,
substr(customer_name,1,instr(customer_name,' ')-1) as first_name,
substr(customer_name,instr(customer_name,' ')+1) as last_name
from orders;

-- 16.Remove all special characters from Product_Code.
select product_code, REGEXP_REPLACE(product_code,'[^A-Za-z0-9]', '') as cleaned_prod_code 
from orders;

-- 17.Compare two columns ignoring case sensitivity.
alter table orders add lower_customer_name varchar2(100);
update orders set lower_customer_name = lower(customer_name);

select * from orders where upper(customer_name) = upper(lower_customer_name);

-- 18.Find customers whose name contains 'kumar'.
select customer_name from orders where lower(customer_name) like '%kumar%';

-- 19.Pad Order_ID with leading zeros to make it 6 digits.
select order_id, lpad(order_id,6,0) as padded_order_id from orders;

-- 20.Extract substring between two characters.
select customer_name, substr(customer_name,2,3) as result from orders;