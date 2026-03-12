--#Q1: List all departments and the count of employees in each. Include departments that have zero employees.
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

--#Q2: For each employee, show the employee’s first and last name and the manager’s first and last name (self-join on manager_id).
SELECT e.first_name AS emp_first, e.last_name AS emp_last,
       m.first_name AS mgr_first, m.last_name AS mgr_last
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

--#Q3: List employees who have no department (department_id is NULL in hr.employees). 
--Use a left join to departments and filter where department is missing.
SELECT e.employee_id, e.first_name, e.last_name, e.department_id
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

--#P1: Using a self-join, show two levels of hierarchy: employee → manager → manager’s manager (if exists).
SELECT e.employee_id  AS employee, m.employee_id AS manager, mm.employee_id AS managers_manager
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id
LEFT JOIN hr.employees mm ON m.manager_id = mm.employee_id;


--#P2: List departments that have no employees (use RIGHT JOIN or a subquery / NOT EXISTS from departments).
SELECT d.department_id, e.employee_id
FROM hr.departments d
RIGHT JOIN hr.employees e ON d.department_id = e.department_id
WHERE e.employee_id is null;

--M1. List all employees (employee_id, first_name, last_name) and department_name; 
--include employees with no department (LEFT JOIN).
SELECT e.first_name, e.last_name, e.employee_id, d.department_name 
FROM hr.employees e 
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--M2. For each employee show first_name, last_name, and manager's first_name and last_name (self-join).
SELECT e.first_name as empl_first_name, e.last_name as empl_last_name,
m.first_name as manag_first_name, m.last_name as manag_last_name
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

--M3. List all departments (department_id, department_name) and count of employees; include departments with 0 employees.
SELECT d.department_id, d.department_name, COUNT(e.employee_id) as employee_count
FROM hr.departments d 
LEFT JOIN hr.employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;

--M4. Show employees who have no department (LEFT JOIN to departments, WHERE d.department_id IS NULL).
SELECT e.employee_id
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

--M5. List employee first_name, last_name, and department_name; use COALESCE(d.department_name, 'No Dept').
SELECT e.first_name, e.last_name, COALESCE(d.department_name, 'No Dept') AS department
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--M6. Show all departments and total salary in each (include departments with 0 salary).
SELECT d.department_id, SUM(e.salary) as total_salary
FROM hr.departments d 
LEFT JOIN hr.employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;

--M7. For each employee show name and manager name; use LEFT JOIN so employees without manager appear.
SELECT e.employee_id, e.first_name, m.manager_id
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

--M8. List departments (department_name) that have no employees (RIGHT JOIN from employees to departments then WHERE e.employee_id IS NULL, or NOT EXISTS).
SELECT d.department_name, e.employee_id
FROM hr.departments d 
LEFT JOIN hr.employees e ON d.department_id = e.department_id 
WHERE e.employee_id IS NULL;

--M9. Show employee_id, first_name, department_id, department_name; include employees with null department_id.
SELECT e.first_name, e.employee_id, d.department_id, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--M10. List all departments and the number of employees; show 0 for departments with no employees.
SELECT d.department_id, count(e.employee_id) as employee_count
FROM hr.departments d
LEFT JOIN hr.employees e on d.department_id = e.department_id
GROUP BY d.department_id;

--M11. Show employee name and manager name; alias manager columns as mgr_first_name, mgr_last_name.
SELECT e.first_name as empl_first_name, e.last_name as empl_last_name,
m.first_name as manag_first_name, m.last_name as manag_last_name
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

--M12. List employees (first_name, last_name) and department_name; include employees whose department_id is not in hr.departments (LEFT JOIN, they get NULL).
SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--M13. Show department_id, department_name, and employee count; include departments with 0 employees.
SELECT d.department_id, d.department_name, count(e.employee_id) as employee_count
FROM hr.departments d
LEFT JOIN hr.employees e on d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

--M14. For each employee show employee_id, salary, department_name; use NVL(d.department_name, 'Unassigned').
SELECT e.employee_id, e.salary, NVL(d.department_name, 'Unassigned') AS department
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--M15. List employees with their manager's employee_id and manager's last_name (self-join).
select e.employee_id as empl_id, m.employee_id AS mgr_emp_id, m.last_name AS mgr_last_name
from hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id; 

--M16. Show all departments (department_name) and min salary in that department (NULL for no employees).
SELECT d.department_name, min(e.salary) as min_salary
FROM hr.departments d
LEFT JOIN hr.employees e on d.department_id = e.employee_id
GROUP BY d.department_name;

--M17. List employees who have a manager (manager_id IS NOT NULL) and show manager's first_name.
SELECT e.employee_id, m.first_name as manager_first_name
FROM hr.employees e
INNER JOIN hr.employees m ON e.manager_id = m.employee_id;

--M18. Show employee_id, first_name, department_name; include employees with no department (LEFT JOIN).
SELECT e.employee_id, e.first_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--M19. List departments (department_id, department_name) and average salary; include departments with no employees (avg NULL or 0).
SELECT d.department_id, d.department_name, AVG(e.salary) as average_salary
FROM hr.departments d
LEFT JOIN hr.employees e on d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

--M20. For each employee show name and department_name; if no department show 'N/A'.
SELECT e.first_name, COALESCE(d.department_name, 'N/A') as department
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;

--H1. Show two-level hierarchy: employee name, manager name, and manager's manager name (self-join e to m, m to m2 on m.manager_id = m2.employee_id).
SELECT e.first_name as empl_name, m.first_name as mang_name, m2.first_name as mangers_mang_name
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id 
LEFT JOIN hr.employees m2 ON m.manager_id = m2.employee_id;

--H2. List departments that have no employees using NOT EXISTS.
SELECT * FROM hr.departments d 
WHERE NOT EXISTS (SELECT 1 FROM hr.employees e WHERE e.department_id = d.department_id);

--H3. Show all employees and all departments in one result (FULL OUTER JOIN): employee_id, first_name, department_id, department_name.
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM hr.employees e
FULL OUTER JOIN hr.departments d on e.department_id = d.department_id;

--H4. For each employee show name, department_name, and manager's department_name (join e to d, e to m, m to dm).
SELECT e.first_name, d.department_name, m.first_name as mng_name, dm.department_name as mang_dept_name
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id 
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id 
LEFT JOIN hr.departments dm ON m.department_id = dm.department_id;

--H5. List employees (name, salary, department_name) who earn more than their manager (self-join, compare e.salary > m.salary).
SELECT e.first_name, e.salary, m.department_id
FROM hr.employees e
JOIN hr.employees m ON e.manager_id = m.employee_id 
WHERE e.salary > m.salary;

--H6. Show all departments and count of employees; also show count of 
--employees with commission_pct not null per department (use conditional COUNT).
--Hint: d LEFT JOIN e, GROUP BY d; COUNT(e.employee_id), COUNT(e.commission_pct) or SUM(CASE WHEN e.commission_pct IS NOT NULL THEN 1 ELSE 0 END);
SELECT d.department_id, d.department_name, 
count(e.employee_id) as employee_count, count(e.commission_pct) as commission_count
FROM hr.departments d
LEFT JOIN hr.employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;


--H7. List employees who have the same manager as employee_id 104 (self-join or subquery: 
--manager_id = (SELECT manager_id FROM hr.employees WHERE employee_id = 104)).
SELECT employee_id, manager_id
FROM hr.employees
WHERE manager_id = (SELECT manager_id FROM hr.employees WHERE employee_id = 104) AND employee_id <> 104;

--H8. Show employee name, department_name, and manager name; include employees with no department and no manager.
SELECT e.first_name as employee_name, d.department_name, m.first_name as manager_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id 
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

--H9. List departments (department_name) where the department's manager (d.manager_id) is
--not in hr.employees or has no row (LEFT JOIN employees to d.manager_id).
--Hint: d LEFT JOIN employees mgr ON d.manager_id = mgr.employee_id WHERE mgr.employee_id IS NULL;
SELECT d.department_name
FROM hr.departments d
LEFT JOIN hr.employees mgr ON d.manager_id = mgr.employee_id
WHERE mgr.employee_id IS NULL;


--H10. Show employee_id, first_name, last_name, department_name, and manager's last_name;
--use LEFT JOINs so employees without department or manager appear.
SELECT e.employee_id, e.first_name as employee_first_name, e.last_name as employee_last_name,
d.department_name, m.last_name as manager_last_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id 
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

--H11. List employees (name, salary) whose salary is greater than their manager's salary (self-join e, m).
SELECT e.first_name, e.salary
FROM hr.employees e
JOIN hr.employees m ON e.manager_id = m.employee_id 
WHERE e.salary > m.salary;

--H12. Show all departments and total salary; include departments with 0 employees (total 0 or NULL).
SELECT d.department_name, sum(e.salary) as total salary
FROM hr.departments d
LEFT JOIN hr.employees e on d.department_id = e.department_id
GROUP BY d.department_name;

--H13. For each employee show name, department_name, and number of employees in that department 
--(join to aggregated subquery or use COUNT() OVER (PARTITION BY e.department_id)).
--Hint: e LEFT JOIN d; add COUNT() OVER (PARTITION BY e.department_id) AS dept_count;
SELECT e.first_name as employee_name, d.department_name, 
count(e.employee_id) over (PARTITION BY e.department_id) AS dept_count
FROM hr.employees e
LEFT JOIN hr.departments d on e.department_id = d.department_id;


--H14. List employees who are managers (employee_id in (SELECT manager_id FROM hr.employees)) 
--and show how many people they manage.

SELECT m.employee_id, m.first_name AS manager_name,
       c.cnt AS employees_managed
FROM hr.employees m
JOIN (
        SELECT manager_id, COUNT(*) AS cnt
        FROM hr.employees
        GROUP BY manager_id
     ) c
ON m.employee_id = c.manager_id
WHERE m.employee_id IN (
        SELECT manager_id
        FROM hr.employees
        WHERE manager_id IS NOT NULL
);


--H15. Show employee name, department_name, manager name; include employees with no department
--(department_name NULL) and no manager (manager name NULL).
SELECT e.first_name as employee_first_name, d.department_name, m.first_name as manager_first_name
FROM hr.employees e 
LEFT JOIN hr.departments d on e.department_id = d.department_id
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;

--H16. List departments (department_name) that have at least one employee with salary > 10000 
--(JOIN and EXISTS or IN).
SELECT DISTINCT d.department_name 
FROM hr.departments d 
JOIN hr.employees e ON d.department_id = e.department_id 
WHERE e.salary > 10000;

--H17. Show employee_id, first_name, last_name, department_name, and manager's first_name; 
--use COALESCE for manager first_name to 'No Manager'.

SELECT e.employee_id, e.first_name as employee_first_name, e.last_name as employee_last_name,
d.department_name, COALESCE(m.first_name, 'No Manager') as manager_first_name
FROM hr.employees e 
LEFT JOIN hr.departments d on e.department_id = d.department_id
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;


--H18. List all employees (employee_id, first_name) and all departments (department_id, department_name) 
--in one result with FULL OUTER JOIN; show which side each row came from 
--(e.g. CASE WHEN e.employee_id IS NOT NULL THEN 'Emp' ELSE 'Dept' END).
Hint: FULL OUTER JOIN; add a column that indicates source;
SELECT e.employee_id, e.first_name, d.department_id, d.department_name,
    CASE 
        WHEN e.employee_id IS NOT NULL AND d.department_id IS NOT NULL THEN 'Both'
        WHEN e.employee_id IS NOT NULL THEN 'Emp'
        ELSE 'Dept'
    END AS source
FROM hr.employees e
FULL OUTER JOIN hr.departments d ON e.department_id = d.department_id;


--H19. For each department show department_name and the name of the employee with the 
--highest salary in that department (join to (SELECT department_id, employee_id, 
--ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) rn FROM hr.employees) WHERE rn = 1).
--Hint: Subquery with ROW_NUMBER; join to departments and employees for names;

SELECT d.department_name, e.first_name AS highest_paid_employee
FROM hr.departments d
LEFT JOIN (
        SELECT department_id, employee_id,
               ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn
        FROM hr.employees
) r
ON d.department_id = r.department_id AND r.rn = 1
LEFT JOIN hr.employees e ON r.employee_id = e.employee_id;

--H20. List employees (name, department_name) who were hired before their manager 
--(compare e.hire_date < m.hire_date with self-join).
SELECT e.first_name, e.department_id
FROM hr.employees e 
JOIN hr.employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;