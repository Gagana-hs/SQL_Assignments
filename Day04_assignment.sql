-- #Q1: Insert one row into your backup table. Use a new employee_id (e.g. 999), 
-- set first_name, last_name, email, hire_date, job_id, salary, department_id to valid values.
-- create table hr_emp_backup as
-- select * from hr.employees;

-- INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date, 
-- job_id, salary, department_id)
-- VALUES (999, 'John', 'Doe', 'JDOE', SYSDATE, 'SA_REP', 5000, 50);

-- #Q2: Update salary by 10% for all employees in department_id 60 in your backup table.
-- UPDATE hr_emp_backup
-- SET salary = salary *1.10
-- WHERE department_id = 60;

-- #Q3: Delete all rows from your backup table where department_id is NULL.
-- DELETE FROM hr_emp_backup
-- WHERE department_id is null;

-- #P1: Bulk insert into your backup table from 
-- hr.employees only for employees whose salary is greater than 10000.
-- INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date,
-- job_id, salary, department_id)
-- SELECT employee_id, first_name, last_name,email, hire_date, job_id, salary, department_id
-- FROM hr.employees
-- WHERE salary > 10000;

-- #P2: Update job_id for a specific employee_id in your backup table 
-- (choose an id and a valid job_id).
-- UPDATE hr_emp_backup SET job_id = 'AD_ASST'
-- WHERE employee_id = 199;

-- #P3: Delete rows from your backup table that you inserted for testing 
-- (e.g. where employee_id = 999).
-- DELETE FROM hr_emp_backup WHERE employee_id = 999;

-- #M1: Insert one row into hr_emp_backup with employee_id 990, 
-- first_name 'Test', last_name 'User', salary 4000, department_id 50.
-- INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date,
-- job_id, salary, department_id) 
-- VALUES (990, 'Test', 'User','USER', SYSDATE, 'SH_CLERK', 4000, 50);

-- #M2:  Update salary to 6000 for employee_id 990 in hr_emp_backup.
-- UPDATE hr_emp_backup SET salary = 6000
-- WHERE employee_id = 990;

-- #M3: Delete the row where employee_id = 990 from hr_emp_backup.
-- DELETE FROM hr_emp_backup WHERE employee_id = 990;

-- #M4: Insert into hr_emp_backup from hr.employees only for department_id 80.
-- INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE department_id = 80; 

-- #M5: Update first_name to 'Updated' for employee_id 100 in hr_emp_backup.
-- UPDATE hr_emp_backup SET first_name = 'Updated' WHERE employee_id = 100;

-- #M6: Delete all rows from hr_emp_backup where department_id = 90.
-- DELETE FROM hr_emp_backup WHERE department_id = 90;

-- #M7: Insert two rows into hr_emp_backup (e.g. employee_id 991 and 992) 
-- using two separate INSERT statements.

-- INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date, 
-- job_id, salary, department_id)
-- VALUES (991, 'KEVIN', 'Doe', 'KDOE', SYSDATE, 'SA_REP', 4000, 50);

-- INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date, 
-- job_id, salary, department_id)
-- VALUES (992, 'MARK', 'JOE', 'MJOE', SYSDATE, 'SH_CLERK', 7000, 60);

-- #M8: Update salary by 5% for all employees in hr_emp_backup in department 50.
-- UPDATE hr_emp_backup SET salary = salary * 1.05 WHERE department_id = 50;

-- #M9: Delete rows from hr_emp_backup where salary is NULL.
-- DELETE FROM hr_emp_backup WHERE salary IS NULL;

-- #M10: Insert into hr_emp_backup from hr.employees where job_id = 'SA_REP' 
-- (all columns that exist in backup).
-- INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE job_id = 'SA_REP';

-- #M11: Update department_id to 60 for employee_id 105 in hr_emp_backup.
-- UPDATE hr_emp_backup SET department_id = 60 WHERE employee_id = 105;

-- #M12: Delete the single row with employee_id 999 from hr_emp_backup (if it exists).
-- DELETE FROM hr_emp_backup WHERE employee_id = 999;

-- #M13: Insert one row with employee_id 993, last_name 'Lee', first_name 'Amy', 
-- salary 5500, department_id 60.
-- INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date, 
-- job_id, salary, department_id)
-- VALUES (993, 'AMY', 'LEE', 'ALEE', SYSDATE, 'SH_CLERK', 5500, 60);

-- #M14: Update last_name to 'Smith' for all employees in hr_emp_backup with first_name 'John'.
-- UPDATE hr_emp_backup SET last_name = 'SMITH' WHERE first_name = 'JOHN';

-- #M15: Delete rows from hr_emp_backup where hire_date is before 2000.
-- DELETE FROM hr_emp_backup WHERE hire_date < DATE '2000-01-01';

-- #M16: Insert from hr.employees where salary between 5000 and 7000 into hr_emp_backup.
-- INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE salary BETWEEN 5000 AND 7000;

-- #M17: Update job_id to 'IT_PROG' for one specific employee (e.g. employee_id 200) in hr_emp_backup.
-- UPDATE hr_emp_backup SET job_id = 'IT_PROG' WHERE employee_id = 200;

-- #M18: Delete rows from hr_emp_backup where commission_pct is not null.
-- DELETE FROM hr_emp_backup WHERE commission_pct IS NOT NULL;

-- #M19: Insert a row with hire_date = SYSDATE for a new employee in hr_emp_backup.
-- INSERT INTO hr_emp_backup (employee_id, first_name, last_name, email, hire_date, 
-- job_id, salary, department_id)
-- VALUES (994, 'ANNA', 'LEE', 'ALEE', SYSDATE, 'AD_ASST', 6500, 80);

-- #M20: Update salary to 10000 for the employee with the highest employee_id in hr_emp_backup 
-- (use subquery: WHERE employee_id = (SELECT MAX(employee_id) FROM hr_emp_backup)).
-- UPDATE hr_emp_backup SET salary = 10000 
-- WHERE employee_id = (SELECT MAX(employee_id) FROM hr_emp_backup);


-- #H1: Use MERGE to sync hr_emp_backup with hr.employees: when employee_id matches, update salary and 
-- hire_date; when not matched, insert the row from hr.employees.
-- MERGE INTO hr_emp_backup b
-- USING hr.employees e ON (b.employee_id = e.employee_id)
-- WHEN MATCHED THEN 
-- UPDATE SET b.salary = e.salary, b.hire_date = e.hire_date
-- WHEN NOT MATCHED THEN INSERT (employee_id, first_name, last_name, salary,email, job_id, hire_date, department_id)
--   VALUES (e.employee_id, e.first_name, e.last_name, e.salary, e.email,
--      e.job_id, e.hire_date, e.department_id);

-- #H2:  Update hr_emp_backup so that salary equals the salary from hr.employees 
-- for the same employee_id (only for employees in department 60).
-- UPDATE hr_emp_backup e SET e.salary = (SELECT salary FROM hr.employees
-- WHERE employee_id = e.employee_id) WHERE e.employee_id IN (SELECT employee_id FROM hr.employees 
-- WHERE department_id = 60);


-- #H3: Delete from hr_emp_backup all employees who do not exist in hr.employees (e.g. test rows).
-- DELETE FROM hr_emp_backup
-- WHERE employee_id NOT IN (SELECT employee_id FROM hr.employees);

-- DELETE FROM hr_emp_backup e
-- WHERE NOT EXISTS(
--    SELECT 1
--    FROM hr.employees s
--    WHERE s.employee_id = e.employee_id
-- );

-- #H4: Insert into hr_emp_backup only employees from hr.employees whose employee_id is not 
-- already in hr_emp_backup (use INSERT ... SELECT ... WHERE NOT EXISTS).
-- INSERT INTO hr_emp_backup  SELECT * FROM hr.employees e
-- WHERE NOT EXISTS(
--     SELECT 1
--     FROM hr_emp_backup b
--     WHERE b.employee_id = e.employee_id
-- );

-- #H5: Update hr_emp_backup: set salary to the average salary of the department 
-- (from hr.employees) for that employee's department_id.
-- UPDATE hr_emp_backup b SET salary = (SELECT avg(salary) from hr.employees
-- WHERE department_id = b.department_id);

-- #H6: Delete from hr_emp_backup the single row with the smallest employee_id.
-- DELETE FROM hr_emp_backup WHERE employee_id = (SELECT min(employee_id) FROM hr_emp_backup);

-- #H7:  Insert into a backup table one row per department from hr.departments 
-- with department_id, department_name, and a column emp_count = 0. 
-- Then (separately) update emp_count using a subquery that counts employees per department.

-- CREATE TABLE dept_backup (department_id number, department_name varchar2(100), emp_count number);

-- INSERT INTO dept_backup (department_id, department_name, emp_count)
-- SELECT department_id, department_name, 0 
-- FROM hr.departments;

-- UPDATE dept_backup b SET emp_count = (SELECT count(*) FROM hr.employees e 
-- WHERE e.department_id = b.department_id);

-- #H8: Update hr_emp_backup: set first_name and last_name 
-- from hr.employees for the same employee_id where department_id = 50.
-- UPDATE hr_emp_backup b SET (first_name, last_name) = (SELECT first_name, last_name 
-- FROM hr.employees WHERE employee_id = b.employee_id) WHERE b.department_id = 50;

-- #H9:  Delete from hr_emp_backup all rows where the employee's salary 
-- in hr.employees is less than 3000 (match on employee_id).
-- DELETE FROM hr_emp_backup WHERE employee_id IN (SELECT employee_id FROM hr.employees 
-- WHERE salary < 3000);

-- #H10: Insert from hr.employees where department_id is in (10, 20, 30) and salary > 5000.
-- INSERT INTO hr_emp_backup
-- SELECT * FROM hr.employees WHERE department_id in(10,20,30) and salary > 5000;

-- #H11: Update hr_emp_backup: set department_id to 50 for all employees whose current department_id is NULL.
-- UPDATE hr_emp_backup SET department_id = 50 WHERE department_id is null;

-- #H12: Delete from hr_emp_backup employees who have the same first_name and last_name as 
-- another row in hr_emp_backup (keep one; delete duplicates—e.g. keep min(employee_id) per name).
-- DELETE FROM hr_emp_backup a WHERE employee_id NOT IN ( SELECT min(employee_id) 
-- FROM hr_emp_backup GROUP BY first_name, last_name) AND EXISTS ( SELECT 1 FROM hr_emp_backup b
-- WHERE b.first_name = a.first_name AND b.last_name = a.last_name and b.employee_id<a.employee_id);

-- DELETE FROM hr_emp_backup(
--     SELECT row_number() over(partition by first_name, last_name 
--     ORDER BY ROWID) as rn 
--     FROM hr_emp_backup
-- ) 
-- where rn>1;

-- #H13: MERGE: for rows in hr.employees that exist in hr_emp_backup, 
-- update salary; for rows that do not exist, insert. Use department_id 80 only.
-- MERGE INTO hr_emp_backup b
-- USING (
--     SELECT *
--     FROM hr.employees
--     WHERE department_id = 80
-- ) e
-- ON (b.employee_id = e.employee_id)
-- WHEN MATCHED THEN
-- UPDATE SET b.salary = e.salary
-- WHEN NOT MATCHED THEN
-- INSERT (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id)
-- VALUES (e.employee_id, e.first_name, e.last_name,e.email, e.hire_date, e.job_id, e.salary,e.department_id);

-- #H14: Update hr_emp_backup so salary is increased by 10% only for employees whose 
-- salary in hr.employees is below the company average.
-- UPDATE hr_emp_backup SET salary = salary * 1.10
-- WHERE employee_id IN (SELECT employee_id FROM hr.employees
-- WHERE salary < (SELECT avg(salary) from hr.employees));

-- #H15: Delete from hr_emp_backup where hire_date is the earliest in the table (only one row).
-- DELETE FROM hr_emp_backup WHERE hire_date = (SELECT min(hire_date) FROM hr_emp_backup);

-- #H16: Insert into hr_emp_backup from hr.employees only for
-- employees who are managers (employee_id in (SELECT manager_id FROM hr.employees)).
-- INSERT INTO hr_emp_backup
-- SELECT * FROM hr.employees
-- WHERE employee_id IN (
--     SELECT manager_id
--     FROM hr.employees
--     WHERE manager_id IS NOT NULL
-- );

-- #H17: Update last_name in hr_emp_backup to UPPER(last_name) for all rows.
-- UPDATE hr_emp_backup SET last_name = UPPER(last_name);

-- #H18: Delete from hr_emp_backup the top 5 highest salary earners (use subquery with ROWNUM or FETCH).
-- DELETE FROM hr_emp_backup 
-- WHERE employee_id IN (SELECT employee_id FROM hr_emp_backup 
-- ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY);

-- #H19: Insert from hr.employees where job_id like 'SA%' and commission_pct is not null.
-- INSERT INTO hr_emp_backup 
-- SELECT * FROM hr.employees WHERE job_id LIKE 'SA%' AND commission_pct IS NOT NULL;

-- #H20:  Update hr_emp_backup: set salary to the 
-- max salary in the same department (from hr.employees) for each employee.
-- UPDATE hr_emp_backup e SET salary = (SELECT MAX(salary) FROM hr.employees 
-- WHERE department_id = e.department_id) WHERE department_id IS NOT NULL;