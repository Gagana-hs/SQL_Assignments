-- DATE FUNCTIONS – 20 Questions


-- 1.Extract year from Order_Date.
select extract(year from order_date) as year from orders;

-- 2.Extract month from Order_Date.
select extract(month from order_date) as month from orders;

-- 3.Extract day from Order_Date.
select extract(day from order_date) as day from orders;

-- 4.Find current date.
select sysdate as current_date from orders;

-- 5.Find current timestamp.
select current_timestamp from orders;
select systimestamp from orders;

-- 6.Add 7 days to Order_Date.
select order_date+7 as new_date from orders;

-- 7.Subtract 30 days from Order_Date.
select order_date, order_date-30 as new_date from orders;

-- 8.Find difference between two dates.
select order_date, (order_date - lag(order_date) over (order by order_id))
as difference_of_date from orders;

-- 9.Find number of months between two dates.
select months_between(sysdate, order_date) as months_difference from orders;

-- 10.Find last day of the month.
select last_day(order_date) as last_day from orders;

-- 11.Get first day of the year.
select trunc(order_date,'year') as first_day from orders;

-- 12.Format date as 'DD-MM-YYYY'.
select to_char(order_date, 'DD-MM-YYYY') as formated_date from orders;

-- 13.Convert string to date.
select to_date('24-02-2026', 'DD-MM-YYYY') as converted_date from dual;

-- 14.Convert date to string.
select to_char(order_date, 'DD-MM-YYYY') as converted_date from orders;

-- 15.Find week number of the year.
select to_char(order_date, 'ww') as week_number from orders;

-- 16.Find day name from date.
select to_char(order_date, 'day') as day from orders;

-- 17.Find quarter of the year.
select to_char(order_date, 'q') as quarter from orders;

-- 18.Calculate age from DOB.
select trunc((sysdate - date '1997-02-24')/365) as age from dual;

-- 19.Check if date is weekend.
select order_date,
       case 
         when to_char(order_date, 'DY', 
              'NLS_DATE_LANGUAGE=ENGLISH') in ('SAT','SUN')
         then 'Weekend'
         else 'Weekday'
       end as day_type
from orders;

-- 20.Find next Monday after a given date.
select next_day(order_date, 'MONDAY') as next_monday from orders;