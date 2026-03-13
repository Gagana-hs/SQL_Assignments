--#Q1: List departments (department_id) where the average salary is greater than 8000. Use HAVING.
SELECT department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > 8000;

--#Q2: List job_id values that have more than 3 employees.
SELECT job_id, COUNT(*) AS emp_count
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 3;

--#Q3: Show department name and total salary for each department. 
--(Join hr.employees to hr.departments and use GROUP BY with SUM(salary).
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

--#P1: List departments (by id or name) where total salary is greater than 200000.
SELECT department_id, SUM(salary) AS toatl_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > 20000;

--#P2: List job_id where the minimum0 salary in that job is less than 3000.
SELECT job_id, MIN(salary) as least_salary
FROM hr.employees
GROUP BY job_id
HAVING MIN(salary) < 3000;

--#P3: Use ROLLUP on department_id in a query that shows COUNT(*) and SUM(salary), 
--and describe the extra rows ROLLUP adds.
SELECT department_id, COUNT(*) AS employee_count, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

-- 20 Medium Questions


-- M1. List department_id where average salary > 8000 (HAVING AVG(salary) > 8000).
SELECT department_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id 
HAVING AVG(salary) > 8000;

-- M2. Show job_id that have more than 3 employees.
SELECT job_id, COUNT(*) AS emp_count
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 3;

-- M3. List department_name and total salary per department (join and GROUP BY).
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- M4. List department_id where total salary > 150000.
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > 150000;

-- M5. Show job_id where min(salary) < 4000.
SELECT job_id, MIN(salary) as least_salary
FROM hr.employees
GROUP BY job_id 
HAVING MIN(salary) < 4000;

-- M6. List department_id and count() per department; only departments with more than 5 employees.
SELECT department_id, COUNT(*) AS emp_count
FROM hr.employees
GROUP BY department_id 
HAVING COUNT(*) > 5;

-- M7. Show department_name and average salary per department (join, GROUP BY).
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- M8. List job_id and total salary for jobs with more than 2 employees.
SELECT job_id, COUNT(*) AS emp_count
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 2;

-- M9. Show department_id where max(salary) > 12000.
SELECT department_id, MAX(salary) as highest_salary 
FROM hr.employees
GROUP BY department_id 
HAVING MAX(salary) > 12000;

-- M10. List department_name and employee count; only departments with at least 3 employees.
SELECT d.department_name, COUNT(e.employee_id) as employee_count
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name 
HAVING COUNT(e.employee_id) >= 3;

-- M11. Show job_id and avg(salary) for jobs with total salary > 50000.
SELECT job_id, AVG(salary) as average_salary
FROM hr.employees
GROUP BY job_id 
HAVING SUM(salary) > 50000;

-- M12. List department_id where average salary is between 6000 and 10000.
SELECT department_id, AVG(salary) as average_salary
FROM hr.employees
GROUP BY department_id 
HAVING AVG(salary) BETWEEN 6000 AND 10000;

-- M13. Show department_name and min(salary), max(salary) per department (join).
SELECT d.department_name, MIN(e.salary) as least_salary, MAX(e.salary) as highest_salary
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- M14. List job_id that have exactly 2 employees.
SELECT job_id, COUNT(*) AS emp_count
FROM hr.employees
GROUP BY job_id 
HAVING COUNT(*) = 2;

-- M15. Show department_id and sum(salary); only departments with avg(salary) < 7000.
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id 
HAVING AVG(salary) < 7000;

-- M16. List department_name and total salary; only departments with more than 10 employees.
SELECT d.department_name, SUM(e.salary) AS toatl_salary
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 10;

-- M17. Show job_id and count(*) for job_id starting with 'SA'.
SELECT job_id, COUNT(*) AS emp_count
FROM hr.employees
WHERE job_id LIKE 'SA%' 
GROUP BY job_id;

-- M18. List department_id where min(hire_date) is after 2005-01-01.
SELECT department_id, min(hire_date) as min_hire_date
FROM hr.employees
GROUP BY department_id 
HAVING MIN(hire_date) > DATE '2005-01-01';

-- M19. Show department_name and employee count; only departments with total salary > 200000.
SELECT d.department_name, COUNT(*) as employee_count
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING SUM(e.salary) > 200000;

-- M20. List job_id and avg(salary) for jobs with at least 1 employee; order by avg(salary) desc.
SELECT job_id, avg(salary) as average_salary
FROM hr.employees
GROUP BY job_id 
HAVING COUNT(*) >= 1 
ORDER BY AVG(salary) DESC; 


-- 20 Hard Questions


-- H1. Show department_id, job_id, count(*), sum(salary) with ROLLUP(department_id, job_id).
SELECT department_id, job_id, COUNT(*) AS emp_count, SUM(salary) as toatl_salary
FROM hr.employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id, job_id;

-- H2. List department_name and total salary; only departments where average salary > 8000 and count > 3.
SELECT d.department_name, SUM(e.salary) AS toatl_salary
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > 8000 AND COUNT(*) > 3;

-- H3. Show job_id and count of employees; only for department_id 50, 60, 80.
SELECT job_id, COUNT(*) AS emp_count
FROM hr.employees
WHERE department_id IN (50,60,80) 
GROUP BY job_id;

-- H4. List department_id where total salary is in the top 3 (use subquery: HAVING SUM(salary) IN (SELECT ... ORDER BY SUM(salary) DESC FETCH FIRST 3 ROWS ONLY)).
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id 
HAVING SUM(salary) IN (
    SELECT total_salary
    FROM (
    SELECT SUM(salary) as total_salary
    FROM hr.employees 
    GROUP BY department_id 
    ORDER BY SUM(salary) DESC 
    FETCH FIRST 3 ROWS ONLY
    )
);

-- H5. Show department_name, count(*), and sum(salary); only departments with at least 
--one employee with commission_pct not null.
SELECT d.department_name, count(*) as emp_count, sum(e.salary) as total_salary
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id
GROUP BY d.department_id, d.department_name 
HAVING COUNT(e.commission_pct) > 0;

-- H6. List job_id and average salary; only jobs where max(salary) - min(salary) > 5000.
SELECT job_id, avg(salary) as average_salary
FROM hr.employees
GROUP BY job_id 
HAVING MAX(salary) - MIN(salary) > 5000;

-- H7. Show department_id, department_name (join), count(), sum(salary), avg(salary) per department;
--only departments with count > 2 and avg > 6000.
SELECT d.department_name, d.department_id, count(*) as emp_count, 
sum(e.salary) as total_salary, avg(e.salary) as average_salary
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id
GROUP BY d.department_id, d.department_name 
HAVING COUNT(*) > 2 AND AVG(e.salary) > 6000;

-- H8. List department_name and number of employees with salary > 5000 in that department 
--(use SUM(CASE WHEN e.salary > 5000 THEN 1 ELSE 0 END)).
SELECT d.department_name, count(*) as emp_count
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;
HAVING SUM(CASE WHEN e.salary > 5000 THEN 1 ELSE 0 END);

-- H9. Show job_id and total salary for jobs that have at least 2 employees and total salary > 20000.
SELECT job_id, SUM(salary) as total_salary
FROM hr.employees
GROUP BY job_id 
HAVING COUNT(*) >= 2 AND SUM(salary) > 20000;

-- H10. List department_id where the department has both at least 3 employees and average salary < 9000.
SELECT department_id, avg(salary) AS average_salary, count(*) as emp_count
FROM hr.employees
GROUP BY department_id 
HAVING COUNT(*) >= 3 AND AVG(salary) < 9000;

-- H11. Show department_name and avg(salary) rounded to 2 decimals; only departments with total salary > 100000.
SELECT d.department_name, ROUND(AVG(e.salary), 2) as average_salary
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id
GROUP BY d.department_id, d.department_name 
HAVING SUM(e.salary) > 100000; 

-- H12. List job_id and count() and sum(salary); only job_ids that have more than 1 employee and sum(salary) > 30000.
SELECT job_id, count(*) as employee_count, sum(salary) as total_salary
FROM hr.employees
GROUP BY job_id 
HAVING COUNT(*) > 1 AND SUM(salary) > 30000;

-- H13. Show department_id, job_id, count(*) with GROUPING SETS ((department_id), (job_id)) 
--to get two grouping levels.
SELECT department_id, job_id, COUNT(*) AS emp_count
FROM hr.employees
GROUP BY GROUPING SETS ((department_id), (job_id));

-- H14. List department_name and total salary; exclude departments with only 1 employee.
SELECT d.department_name, SUM(e.salary) AS toatl_salary
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 1;

-- H15. Show department_id where min(salary) > 3000 and max(salary) < 15000.
SELECT department_id, MIN(salary) as least_salary, MAX(salary) as highest_salary
FROM hr.employees
GROUP BY department_id 
HAVING MIN(salary) > 3000 AND MAX(salary) < 15000;

-- H16. List job_id and average salary; only for employees hired after 2000.
SELECT job_id, AVG(salary) as average_salary
FROM hr.employees
WHERE hire_date > DATE '2000-12-31' 
GROUP BY job_id;

-- H17. Show department_name, count(), sum(salary), and avg(salary) per department; only departments with count between 2 and 10.
SELECT d.department_name, count(*) as emp_count, sum(e.salary) as total_salary, avg(e.salary) as average_salary
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id
GROUP BY d.department_id, d.department_name 
HAVING COUNT(*) BETWEEN 2 AND 10;

-- H18. List department_id that has the highest average salary (subquery: HAVING AVG(salary) >= ALL (SELECT AVG(salary) FROM hr.employees GROUP BY department_id)).
SELECT department_id, avg(salary) as average_salary
FROM hr.employees
GROUP BY department_id 
HAVING AVG(salary) = (SELECT MAX(av) FROM (SELECT AVG(salary) av FROM hr.employees GROUP BY department_id));

-- H19. Show department_id, job_id, count(*) with CUBE(department_id, job_id).
SELECT department_id, job_id, count(*) as employee_count
FROM hr.employees
GROUP BY CUBE(department_id, job_id);

-- H20. List department_name and total salary; only departments where at least one employee has job_id 'SA_REP'.
SELECT d.department_name, sum(e.salary) as total_salary
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id
GROUP BY d.department_id, d.department_name 
HAVING MAX(CASE WHEN e.job_id = 'SA_REP' THEN 1 ELSE 0 END) = 1;