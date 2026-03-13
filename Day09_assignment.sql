--#Q1: Show total salary per department_id.
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id;

--#Q2: Show average salary per job_id.
SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id;

--#Q3: Show the number of employees per department_id.
SELECT department_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

--#Q4: Show the minimum and maximum hire_date per department_id. Use MIN(hire_date) and MAX(hire_date).
SELECT department_id, MIN(hire_date) AS earliest_hire, MAX(hire_date) AS latest_hire
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

--#P1: Show average salary per job_id only for job_ids that have more than 5 employees (use HAVING COUNT(*) > 5).
SELECT job_id, AVG(salary) as average_salary
FROM hr.employees 
GROUP BY job_id
HAVING count(*) > 5;

--#P2: Show the sum of salary for department_id 50 only (one row).
SELECT department_id, SUM(salary)
FROM hr.employees  
GROUP BY department_id 
HAVING department_id = 50;

--#P3: Show the maximum commission_pct per department_id (remember NULLs are ignored by MAX).
SELECT department_id, MAX(commission_pct) as maximum_commission
FROM hr.employees 
GROUP BY department_id;

--20 Medium Questions

-- M1. Show total salary (SUM(salary)) for the whole company from hr.employees.
SELECT SUM(salary) FROM hr.employees;

-- M2. Count employees per job_id.
SELECT job_id, count(*) as toatl_amployees
FROM hr.employees 
GROUP BY job_id;

-- M3. Show average salary per department_id.
SELECT department_id, AVG(salary)
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- M4. List department_id and min(salary), max(salary) per department.
SELECT department_id, MIN(salary) AS least_salary, MAX(salary) AS highest_salary
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- M5. Count employees per department_id.
SELECT department_id, count(*) as toatl_amployees
FROM hr.employees 
GROUP BY department_id
ORDER BY department_id;

-- M6. Show job_id and total salary per job.
SELECT job_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id
ORDER BY job_id;

-- M7. List department_id and number of employees with non-null commission_pct (COUNT(commission_pct)).
SELECT department_id, COUNT(commission_pct)
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- M8. Show min(hire_date) and max(hire_date) per job_id.
SELECT job_id, MIN(hire_date) AS earliest_hire, MAX(hire_date) AS latest_hire
FROM hr.employees 
GROUP BY job_id
ORDER BY job_id;

-- M9. Count total employees (COUNT()) in hr.employees.
SELECT COUNT(*) as toatl_employees
FROM hr.employees;

-- M10. Show department_id, avg(salary), and count(*) per department.
SELECT department_id, ROUND(AVG(salary),2) AS average_salary, COUNT(*) as toatl_employees
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- M11. List job_id and average salary per job; order by average salary desc.
SELECT job_id, AVG(salary) as average_salary 
FROM hr.employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

-- M12. Show department_id and sum(salary) for department_id in (50, 60, 80).
SELECT department_id, SUM(salary) as total_salary 
FROM hr.employees
WHERE department_id IN (50,60,80) 
GROUP BY department_id;

-- M13. Count employees per manager_id (include only where manager_id is not null).
SELECT manager_id, COUNT(*) AS total_employees 
FROM hr.employees 
WHERE manager_id IS NOT NULL 
GROUP BY manager_id;

-- M14. Show job_id and min(salary) per job.
SELECT job_id, MIN(salary) AS least_salary 
FROM hr.employees
GROUP BY job_id;

-- M15. List department_id and max(hire_date) per department.
SELECT department_id,  MAX(hire_date) as latest_hire 
FROM hr.employees
GROUP BY department_id;

-- M16. Show total salary for department_id 90 only.
SELECT department_id, SUM(salary) as toatl_salary
FROM hr.employees 
WHERE department_id = 90
GROUP BY department_id;

-- M17. Count distinct job_id values (COUNT(DISTINCT job_id)).
SELECT COUNT(DISTINCT job_id) total_job_id
FROM hr.employees;


-- M18. Show department_id, job_id, and count(*) per (department_id, job_id).
SELECT department_id, job_id, count(*) as toatl_employees
FROM hr.employees
GROUP BY department_id, job_id;

-- M19. List department_id and avg(salary) rounded to 2 decimals per department.
SELECT department_id, ROUND(AVG(salary), 2) as average_salary 
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- M20. Show job_id and count of employees; only job_ids with at least 2 employees.
SELECT job_id, count(*) as toatl_employee 
FROM hr.employees
GROUP BY job_id 
HAVING COUNT(*) >= 2;

-- 20 Hard Questions

-- H1. Show department_id, department_name (join to hr.departments), and total salary per department.
SELECT d.department_id, d.department_name, SUM(e.salary) as total_slary 
FROM hr.employees e
JOIN hr.departments d ON e.department_id  = d.department_id 
GROUP BY d.department_id, d.department_name;

-- H2. List job_id and average salary for jobs that have more than 3 employees.
SELECT job_id, AVG(salary) as average_salary 
FROM hr.employees
GROUP BY job_id 
HAVING COUNT(*) > 3;

-- H3. Show department_id and count of employees, and also count of employees hired after 2000 
--(use SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) > 2000 THEN 1 ELSE 0 END)).
SELECT department_id, COUNT(*) as toatal_employees, 
SUM(CASE WHEN EXTRACT(YEAR FROM hire_date) > 2000 THEN 1 ELSE 0 END) as total
FROM hr.employees
GROUP BY department_id; 

-- H4. List department_id where total salary is greater than 100000.
SELECT department_id, SUM(salary) as toatl_salary 
FROM hr.employees
GROUP BY department_id 
HAVING SUM(salary) > 100000;

-- H5. Show job_id and max(salary) and min(salary) per job; only jobs where max - min > 5000.
SELECT job_id, MIN(salary) AS least_salary, MAX(salary) AS highest_salary
FROM hr.employees
GROUP BY job_id 
HAVING MAX(salary) - MIN(salary) > 5000;

-- H6. List department_name (join) and employee count per department; order by count desc.
SELECT d.department_name, COUNT(*) as total_employees 
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id 
GROUP BY d.department_name
ORDER BY COUNT(*) DESC;

-- H7. Show department_id and average tenure in years (AVG(MONTHS_BETWEEN(SYSDATE, hire_date)/12)) per department.
SELECT department_id, AVG(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS average_tenure_years 
FROM hr.employees
GROUP BY department_id;

-- H8. List job_id and total salary for jobs with word 'MAN' in job_id.
SELECT job_id, SUM(salary) as total_salary 
FROM hr.employees
WHERE job_id LIKE '%MAN%' 
GROUP BY job_id;

-- H9. Show department_id, count(*), and sum(salary) per department; only departments with avg(salary) > 7000.
SELECT department_id, count(*) as total_employee, sum(salary) as total_salary
FROM hr.employees
GROUP BY department_id 
HAVING AVG(salary) > 7000;

-- H10. List department_name and min(salary), max(salary) per department (join).
SELECT d.department_name, MIN(e.salary) as least_salary, MAX(e.salary) as highest_salary 
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- H11. Show manager_id and count of direct reports; only managers with more than 2 reports.
SELECT manager_id, count(*) as total_reports
FROM hr.employees
WHERE manager_id IS NOT NULL 
GROUP BY manager_id 
HAVING COUNT(*) > 2;

-- H12. List department_id and count of distinct job_id in that department.
SELECT department_id, COUNT(DISTINCT job_id) as toatl_job_id 
FROM hr.employees
GROUP BY department_id;

-- H13. Show job_id and average salary; only for departments 50, 80, 90.
SELECT job_id, AVG(salary) as average_salary 
FROM hr.employees
WHERE department_id IN (50,80,90) 
GROUP BY job_id;

-- H14. List department_id where the number of employees is greater than 5 and total salary > 200000.
SELECT department_id, count(*) as toatl_employees, SUM(salary) as toatl_salary 
FROM hr.employees
GROUP BY department_id 
HAVING COUNT(*) > 5 AND SUM(salary) > 200000;

-- H15. Show department_name and total salary per department; only departments with at least 1 employee with commission_pct not null.
SELECT d.department_name, SUM(e.salary) as total_salary
FROM hr.employees e
JOIN hr.departments d on e.department_id = d.department_id 
GROUP BY d.department_name
HAVING COUNT(e.commission_pct) > 0;

-- H16. List job_id and count of employees; order by count desc, then job_id.
SELECT job_id, count(*) as total_employees 
FROM hr.employees
GROUP BY job_id 
ORDER BY COUNT(*) DESC, job_id;

-- H17. Show department_id and sum(salary) and avg(salary) per department; round avg to 2 decimals.
SELECT department_id, SUM(salary) as toatl_salary, ROUND(AVG(salary), 2) as average_salary 
FROM hr.employees
GROUP BY department_id
ORDER BY department_id;

-- H18. List department_id that has the maximum total salary (use subquery: WHERE SUM(salary) = (SELECT MAX(total) FROM (SELECT SUM(salary) total FROM hr.employees GROUP BY department_id))).
SELECT department_id, SUM(salary) as total_salary 
FROM hr.employees 
GROUP BY department_id 
HAVING SUM(salary) = (SELECT MAX(s) FROM (SELECT SUM(salary) s FROM hr.employees GROUP BY department_id));

-- H19. Show department_id, job_id, count(*), and sum(salary) per (department_id, job_id); 
--use ROLLUP(department_id, job_id).
SELECT department_id, job_id, COUNT(*) AS eployee_count, SUM(salary) AS total_salary 
FROM hr.employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id, job_id;


-- H20. List department_name and employee count; include departments with 0 employees 
--(LEFT JOIN from departments to employees, then GROUP BY).
SELECT d.department_name, COUNT(e.employee_id) employee_count
FROM hr.departments d 
LEFT JOIN hr.employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;