--#Q1: List employees who earn more than the company average salary. Use a subquery for the average.
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE salary > (SELECT AVG(salary) FROM hr.employees);

--#Q2: List employees whose department_id exists in hr.departments (i.e. they belong to a valid department). Use IN with a subquery.
SELECT employee_id, first_name, last_name, department_id
FROM hr.employees
WHERE department_id IN (SELECT department_id FROM hr.departments);

--#Q3: Show department names from hr.departments along with the count of employees in that department. 
--Use a scalar subquery in the SELECT list for the count (correlated by department_id).
SELECT d.department_id, d.department_name,
  (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = d.department_id) AS employee_count
FROM hr.departments d;

--#P1: List employees whose salary is greater than the average salary of their own department 
--(use a correlated subquery).
SELECT e.employee_id, e.first_name, e.department_id, e.salary
FROM hr.employees e
WHERE e.salary > (
    SELECT AVG(e2.salary) FROM hr.employees e2 WHERE e2.department_id = e.department_id
);

--#P2: List departments that have at least one employee (use EXISTS with a correlated subquery).
SELECT d.department_id, d.department_name
FROM hr.departments d
WHERE EXISTS (
    SELECT * FROM hr.employees e WHERE e.department_id = d.department_id 
);

--#P3: In a single query, show each department_id and the maximum salary in that department, 
--using a subquery in the FROM clause (derived table) that groups by department_id.
SELECT d.department_id, d.max_salary
FROM (
    SELECT department_id, MAX(salary) AS max_salary
    FROM hr.employees
    GROUP BY department_id
) d;

-- 20 Medium Questions


-- M1. List employees with salary > (SELECT AVG(salary) FROM hr.employees). 
-- Hint: WHERE salary > (scalar subquery).
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE salary > (SELECT AVG(salary) FROM hr.employees);

-- M2. List employees where department_id IN (SELECT department_id FROM hr.departments). 
-- Hint: IN with subquery.
SELECT employee_id, first_name, last_name, department_id 
FROM hr.employees 
WHERE department_id IN (SELECT department_id FROM hr.departments);

-- M3. Show employee_id, salary, and (SELECT AVG(salary) FROM hr.employees) AS avg_sal in SELECT. 
-- Hint: Scalar subquery in SELECT list.
SELECT employee_id, salary,
   (SELECT avg(salary) from hr.employees) as average_salary 
   FROM hr.employees;

-- M4. List departments where (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = d.department_id) > 3. 
-- Hint: Correlated scalar in WHERE.
SELECT d.department_id, d.department_name 
FROM hr.departments d
WHERE (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = d.department_id)>3;

-- M5. List employees where department_id IN (SELECT department_id FROM hr.departments WHERE department_id IN (10,20,30)). 
-- Hint: IN (subquery).
SELECT employee_id, first_name, department_id
FROM hr.employees 
WHERE department_id IN (
    SELECT department_id 
    FROM hr.departments 
    WHERE department_id IN(10,20,30)
);

-- M6. Show department_id, department_name, (SELECT COUNT(*) FROM hr.employees e 
-- WHERE e.department_id = d.department_id) FROM hr.departments d. Hint: Correlated scalar in SELECT.
SELECT d.department_id, d.department_name,
    (SELECT count(*) FROM hr.employees e WHERE e.department_id = d.department_id) as employee_count 
FROM hr.departments d;

-- M7. List employees with salary < (SELECT MIN(salary) FROM hr.employees WHERE department_id = 50). 
-- Hint: Scalar subquery for min in dept 50.
SELECT employee_id, first_name, salary
FROM hr.employees
WHERE salary < (SELECT MIN(salary) FROM hr.employees WHERE department_id = 50);

-- M8. Show employee_id, first_name, (SELECT department_name FROM hr.departments d 
-- WHERE d.department_id = e.department_id) FROM hr.employees e. Hint: Correlated scalar in SELECT.
SELECT e.employee_id, e.first_name,
    (SELECT d.department_name FROM hr.departments d WHERE e.department_id = d.department_id) as department
FROM hr.employees e;

-- M9. List departments that have at least one employee using EXISTS. 
-- Hint: WHERE EXISTS (SELECT 1 FROM hr.employees e WHERE e.department_id = d.department_id).
SELECT d.department_id, d.department_name
FROM hr.departments d
WHERE EXISTS (
    SELECT 1 FROM hr.employees e WHERE e.department_id = d.department_id 
);


-- M10. List employees where job_id IN (SELECT DISTINCT job_id FROM hr.employees WHERE department_id = 80). 
-- Hint: IN (subquery).
SELECT employee_id, first_name, job_id
FROM hr.employees 
WHERE job_id IN (SELECT DISTINCT job_id FROM hr.employees WHERE department_id = 80);

-- M11. Show department_id, (SELECT SUM(salary) FROM hr.employees e WHERE e.department_id = d.department_id) 
-- FROM hr.departments d. Hint: Correlated scalar in SELECT.
SELECT d.department_id, 
    (SELECT SUM(salary) FROM hr.employees e WHERE e.department_id = d.department_id) as total_salary 
FROM hr.departments d;

-- M12. List employees with salary between (SELECT MIN(salary) FROM hr.employees) and (SELECT MAX(salary) 
-- FROM hr.employees). Hint: Two scalar subqueries in BETWEEN.
SELECT employee_id, first_name, salary 
FROM hr.employees 
WHERE salary BETWEEN (SELECT MIN(salary) FROM hr.employees) AND  (SELECT MAX(salary) FROM hr.employees);

-- M13. List employees where department_id NOT IN (SELECT department_id FROM hr.departments 
-- WHERE department_id IS NOT NULL). Hint: NOT IN (subquery); exclude NULL in subquery to avoid logic issues.
SELECT employee_id, first_name, department_id 
FROM hr.employees 
WHERE department_id NOT IN (SELECT department_id FROM hr.departments WHERE department_id IS NOT NULL);

-- M14. Show employee_id, salary, (SELECT MAX(salary) FROM hr.employees) - salary AS diff_from_max. 
-- Hint: Scalar subquery in expression.
SELECT employee_id, salary, (SELECT MAX(salary) FROM hr.employees) - salary AS diff_from_max 
FROM hr.employees;

-- M15. List departments where (SELECT AVG(salary) FROM hr.employees e 
-- WHERE e.department_id = d.department_id) > 7000. Hint: Correlated scalar in WHERE.
SELECT d.department_id, d.department_name
FROM hr.departments d 
WHERE (SELECT AVG(salary) FROM hr.employees e WHERE e.department_id = d.department_id) > 7000;


-- M16. From (SELECT department_id, COUNT(*) c FROM hr.employees GROUP BY department_id) sub, SELECT * WHERE c > 5. 
-- Hint: Derived table in FROM with alias.
SELECT * 
FROM (SELECT department_id, COUNT(*) c FROM hr.employees GROUP BY department_id) sub
WHERE C > 5;

-- M17. List employees with salary >= (SELECT AVG(salary) FROM hr.employees WHERE job_id = e.job_id). 
-- Hint: Correlated subquery comparing to job average.
SELECT e.employee_id, e.first_name, e.salary 
FROM hr.employees e 
WHERE salary >= (SELECT AVG(salary) FROM hr.employees WHERE job_id = e.job_id);

-- M18. Show department_name and (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = d.department_id) 
-- FROM hr.departments d. Hint: Correlated count in SELECT.
SELECT department_name, 
    (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = d.department_id) as total_employeee
FROM hr.departments d;

-- M19. List employees where EXISTS (SELECT 1 FROM hr.departments d WHERE d.department_id = e.department_id). 
-- Hint: EXISTS with correlation.
SELECT e.employee_id, e.first_name 
FROM hr.employees e
WHERE EXISTS (SELECT 1 FROM hr.departments d WHERE d.department_id = e.department_id);

-- M20. From (SELECT job_id, AVG(salary) avg_sal FROM hr.employees GROUP BY job_id) sub, select job_id, avg_sal 
-- where avg_sal > 8000. Hint: Derived table, then filter.
SELECT job_id, avg_sal 
FROM (SELECT job_id, AVG(salary) avg_sal FROM hr.employees GROUP BY job_id) sub
WHERE avg_sal > 8000;


-- 20 Hard Questions


-- H1. Employees whose salary is in the top 5 company-wide (salary >= (SELECT MIN(salary) 
-- FROM (SELECT salary FROM hr.employees ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY))). 
-- Hint: Subquery in FROM or scalar with nested subquery.
SELECT employee_id, first_name, salary 
FROM hr.employees 
WHERE salary >= (SELECT MIN(salary) 
    FROM (SELECT salary FROM hr.employees ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY));

-- H2. Departments where total salary > (SELECT AVG(total) FROM (SELECT SUM(salary) total 
-- FROM hr.employees GROUP BY department_id)). 
-- Hint: HAVING SUM(salary) > (scalar from derived table).
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > (SELECT AVG(total)
    FROM (SELECT SUM(salary) AS total
        FROM hr.employees
        GROUP BY department_id
    )
);


-- H3. Employees who have the same job_id as their manager (correlated: 
-- (SELECT job_id FROM hr.employees m WHERE m.employee_id = e.manager_id) = e.job_id). 
-- Hint: Correlated scalar subquery.
SELECT *
FROM hr.employees e
WHERE e.job_id = (
    SELECT m.job_id
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
);

-- H4. Show employee_id, salary, and (SELECT department_name FROM hr.departments d WHERE d.department_id = e.department_id) 
-- and (SELECT COUNT(*) FROM hr.employees e2 WHERE e2.department_id = e.department_id). 
-- Hint: Two correlated scalars in SELECT.
SELECT e.employee_id, e.salary, 
    (SELECT department_name FROM hr.departments d WHERE d.department_id = e.department_id) as department,
    (SELECT COUNT(*) FROM hr.employees e2 WHERE e2.department_id = e.department_id) as employee_count
FROM hr.employees e;

-- H5. List departments that have more employees than (SELECT AVG(cnt) FROM (SELECT COUNT(*) cnt 
-- FROM hr.employees GROUP BY department_id)). 
-- Hint: Correlated count in HAVING vs scalar from derived table.
SELECT department_id, COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) > (SELECT AVG(cnt)
    FROM (SELECT COUNT(*) AS cnt
        FROM hr.employees
        GROUP BY department_id
    ) 
);

-- H6. Employees where salary > all salaries in department 50 (salary > (SELECT MAX(salary) 
-- FROM hr.employees WHERE department_id = 50)). 
-- Hint: Use MAX in subquery for "greater than all."
SELECT * 
FROM hr.employees 
WHERE salary > (SELECT MAX(salary) FROM hr.employees WHERE department_id = 50);

-- H7. From (SELECT department_id, COUNT(*) c, SUM(salary) s FROM hr.employees GROUP BY department_id) 
-- join hr.departments on department_id; show department_name, c, s. 
-- Hint: Derived table join departments.
SELECT d.department_name, e.c, e.s
FROM (SELECT department_id, COUNT(*) c, SUM(salary) s FROM hr.employees GROUP BY department_id) e
JOIN hr.departments d ON e.department_id = d.department_id;

-- H8. Employees whose department has exactly 3 people: WHERE (SELECT COUNT(*) 
-- FROM hr.employees e2 WHERE e2.department_id = e.department_id) = 3. 
-- Hint: Correlated count = 3.
SELECT e.employee_id, e.first_name
FROM hr.employees e 
WHERE (SELECT COUNT(*) FROM hr.employees e2 WHERE e2.department_id = e.department_id) = 3;

-- H9. Departments where manager_id is in (SELECT employee_id FROM hr.employees) (department's manager exists). 
-- Hint: WHERE d.manager_id IN (SELECT employee_id FROM hr.employees).
SELECT d.department_name, d.manager_id
FROM hr.departments d
WHERE d.manager_id IN (SELECT e.employee_id FROM hr.employees e);

-- H10. Show each employee_id and (SELECT first_name||' '||last_name FROM hr.employees m 
-- WHERE m.employee_id = e.manager_id) AS manager_name. 
-- Hint: Correlated scalar in SELECT.
SELECT e.employee_id, 
    (SELECT first_name||' '||last_name 
    FROM hr.employees m 
    WHERE m.employee_id = e.manager_id) AS manager_name
FROM hr.employees e;

-- H11. List employees in department_id that has the highest total salary (department_id IN (SELECT department_id 
-- FROM (SELECT department_id, SUM(salary) s FROM hr.employees GROUP BY department_id ORDER BY s DESC FETCH FIRST 1 ROW ONLY))). 
-- Hint: Subquery in FROM + ORDER BY + FETCH; then IN.
SELECT *
FROM hr.employees
WHERE department_id IN (
    SELECT department_id
    FROM (
        SELECT department_id, SUM(salary) AS s
        FROM hr.employees
        GROUP BY department_id
        ORDER BY s DESC
        FETCH FIRST 1 ROW ONLY
    )
);

-- H12. Employees where salary > (SELECT AVG(salary) FROM hr.employees e2 WHERE e2.department_id = e.department_id) * 1.1. 
-- Hint: Correlated avg * 1.1.
SELECT e.employee_id, e.first_name, e.salary
FROM hr.employees e
WHERE salary > (SELECT AVG(salary) FROM hr.employees e2 WHERE e2.department_id = e.department_id) * 1.1 ;

-- H13. Departments with no employees: NOT EXISTS (SELECT 1 FROM hr.employees e WHERE e.department_id = d.department_id). 
-- Hint: NOT EXISTS correlated.
SELECT d.department_id, d.department_name 
FROM hr.departments d 
WHERE NOT EXISTS (SELECT 1 FROM hr.employees e WHERE e.department_id = d.department_id);

-- H14. Show department_id, department_name, (SELECT AVG(salary) FROM hr.employees e WHERE e.department_id = d.department_id), 
-- (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = d.department_id) FROM hr.departments d. 
-- Hint: Two correlated scalars.
SELECT d.department_id, d.department_name, 
    (SELECT AVG(salary) FROM hr.employees e WHERE e.department_id = d.department_id) as avereage_salary, 
    (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = d.department_id) as emp_count
FROM hr.departments d;

-- H15. List job_id and count from hr.employees where count > (SELECT AVG(cnt) FROM (SELECT COUNT() cnt 
-- FROM hr.employees GROUP BY job_id)). 
-- Hint: GROUP BY job_id HAVING COUNT() > (scalar from derived table).
SELECT job_id, count(*) as emp_count 
FROM hr.employees 
GROUP BY job_id 
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM hr.employees
        GROUP BY job_id
    )
);

-- H16. Employees whose hire_date is (SELECT MIN(hire_date) FROM hr.employees WHERE department_id = e.department_id). 
-- Hint: Correlated min: e.hire_date = (SELECT MIN(hire_date)...).
SELECT e.employee_id, e.first_name, e.hire_date
FROM hr.employees e
WHERE e.hire_date = (
    SELECT MIN(e2.hire_date)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
);

-- H17. From (SELECT department_id, ROUND(AVG(salary),2) a FROM hr.employees GROUP BY department_id) 
-- sub join hr.departments d on sub.department_id = d.department_id; show d.department_name, sub.a. 
-- Hint: Derived table join.
SELECT d.department_name, sub.a
FROM (
    SELECT department_id, ROUND(AVG(salary), 2) AS a
    FROM hr.employees
    GROUP BY department_id
) sub
JOIN hr.departments d ON sub.department_id = d.department_id;

-- H18. Employees where salary >= (SELECT MAX(salary) FROM hr.employees e2 WHERE e2.department_id = e.department_id) * 0.9. 
-- Hint: Correlated max * 0.9 (within 10% of dept max).
SELECT e.employee_id, e.first_name, e.salary
FROM hr.employees e
WHERE e.salary >= (
    (SELECT MAX(e2.salary)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id) * 0.9
);

-- H19. Departments where (SELECT COUNT(DISTINCT job_id) FROM hr.employees e WHERE e.department_id = d.department_id) >= 2. 
-- Hint: Correlated count distinct in WHERE.
SELECT d.department_id, d.department_name
FROM hr.departments d
WHERE (
    SELECT COUNT(DISTINCT e.job_id)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) >= 2;

-- H20. Show employee_id, salary, (SELECT AVG(salary) FROM hr.employees), 
-- salary - (SELECT AVG(salary) FROM hr.employees) AS diff. 
-- Hint: Two uses of same scalar subquery in SELECT.
SELECT e.employee_id, e.salary,
       (SELECT AVG(salary) FROM hr.employees) AS avg_salary,
       e.salary - (SELECT AVG(salary) FROM hr.employees) AS diff
FROM hr.employees e;