-- MATHEMATIC FUNCTIONS – 20 Questions
-- radiuns = degree*pi/180
-- degrees = radiuns * 180/pi
-- ACOS(-1) = pi

-- 1.Find sine value of an angle.
select sin(90* acos(-1)/180) as sin_90 from dual;
select sin(30*acos(-1)/180) as sin_30 from dual;

-- 2.Find cosine value of an angle.
select cos(60 * acos(-1)/180) as cos_60 from dual;
select cos(90*acos(-1)/180) as cos_90 from dual;

-- 3.Find tangent value.
select tan(45 * acos(-1)/180) as tan_45 from dual;
select tan(0*acos(-1)/180) as tan_0 from dual;

-- 4.Convert degrees to radians.
select 90* acos(-1)/180 as radians from dual;

-- 5.Convert radians to degrees.
select (acos(-1)/2)*180/acos(-1) as degrees from dual;

-- 6.Find logarithm (base 10) of a number.
select log(10,100) as log_100 from dual;
select log(10,1000) as log_1000 from dual;

-- 7.Find natural log of a number.
select ln(32) as natural_log from dual;

-- 8.Find square of a number.
select power(6,2) as square from dual;

-- 9.Find cube of a number.
select power(6,3) as cube from dual;

-- 10.Calculate factorial of a number.

-- 11.Find greatest value among three numbers.
select greatest(10,30,50) as greates_num from dual;

-- 12.Find least value among three numbers.
select least(10,20,70) as least_num from dual;

-- 13.Calculate variance of sales.
select variance(quantity*unit_price) as variance_sales from orders group by product_category;

-- 14.Calculate standard deviation of sales.
select stddev(quantity*unit_price) as stddev_sales from orders group by product_category;

-- 15.Find average deviation.
select avg(abs(quantity*unit_price - (select avg(quantity*unit_price) from orders)))
as avg_deviation from orders;

-- 16.Calculate geometric mean.
--GM=exp(∑ln(x)/n​)
select exp(avg(ln(quantity*unit_price))) as geometric_mean 
from orders
where quantity*unit_price >0;

-- 17.Calculate harmonic mean.
select count(*)/sum(1/(quantity*unit_price)) as harmonic_mean
from orders
where quantity*unit_price != 0;

-- 18.Find sum of squares.
select sum(power(quantity*unit_price,2)) as sum_of_squares
from orders;
select sum(power(quantity,2)) as sum_of_squares
from orders;

-- 19.Calculate correlation between two columns.
select corr(quantity, unit_price) as correlation from orders;

-- 20.Calculate regression slope.
select REGR_SLOPE(unit_price, quantity) as regression_slope
from orders;