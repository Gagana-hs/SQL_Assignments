-- #Q1: Create a table hr_emp_backup from SELECT * FROM hr.employees (copy structure and data).
-- create table hr_emp_backup as 
-- select * from hr.employees;

-- #Q2: Add a column notes of type VARCHAR2(200) to hr_emp_backup.
-- alter table hr_emp_backup add notes varchar2(200);

-- #Q3: Rename the column notes to remarks in hr_emp_backup.
-- alter table hr_emp_backup rename column notes to remarks;

-- #P1: Create a table from hr.employees that contains only the columns: 
-- employee_id, first_name, last_name, salary, department_id.
-- create table hr_employees_backup as
-- select employee_id, first_name, last_name, salary, department_id
-- from hr.employees;

-- #P2: Alter that table to add a column effective_date of type DATE.
-- alter table hr_employees_backup add effective_date date;

-- #P3: Truncate the backup table you created (so it is empty but the structure remains).
-- truncate table hr_employees_backup;

-- #M1: Create a table hr_dept_backup as a full copy of hr.departments.
-- create table hr_dept_backup as
-- select * from hr.departments;

-- #M2: Add a column notes VARCHAR2(100) to hr_emp_backup.
-- alter table hr_emp_backup add notes varchar2(100);

-- #M3: Create a table emp_50 from employees in department 50 only (all columns).
-- create table emp_50 as
-- select * from hr.employees where department_id = 50;

-- #M4: Add column updated_at DATE DEFAULT SYSDATE to your backup table.
-- alter table hr_emp_backup add updated_at date default sysdate;

-- #M5: Create a table dept_names with only department_id and department_name from hr.departments.
-- create table dep_names as
-- select department_id, department_name from hr.departments;
-- alter table dep_names rename to dept_names;

-- #M6: Modify column notes in hr_emp_backup to VARCHAR2(500).
-- alter table hr_emp_backup modify notes varchar2(500);

-- #M7: Create an empty table emp_structure with the same structure as hr.employees (no rows).
-- create table emp_structure as
-- select * from hr.employees where 1=0;

-- #M8: Rename table hr_emp_backup to hr_employees_archive.
-- rename hr_emp_backup to hr_employees_archive;

-- #M9: Add two columns to a backup table: created_by VARCHAR2(50) and created_date DATE.
-- alter table hr_dept_backup add created_by varchar2(50);
-- alter table hr_dept_backup add created_date date;

-- #M10: Create table high_earners from hr.employees where salary > 10000 (all columns).
-- create table high_earners as
-- select * from hr.employees where salary > 10000;

-- #M11: Drop the column notes from your backup table.
-- alter table hr_employees_archive drop column notes ;

-- #M12: Create table emp_salary_dept with only employee_id, salary, department_id from hr.employees.
-- create table emp_saalry_dept as
-- select employee_id, salary, department_id from hr.employees;

-- #M13: Truncate the table emp_50 (or whatever copy table you created).
-- truncate table emp_50;

-- #M14: Rename column remarks to comments in your backup table.
-- alter table hr_employees_archive rename column remarks to comments;

-- #M15: Create a table dept_emp_count with department_id and a literal 0 
-- as column emp_count (one row per department).
-- create table dept_emp_count as
-- select department_id, 0 as emp_count from hr.departments;

-- #M16: Add column status VARCHAR2(20) DEFAULT 'ACTIVE' to a backup table.
-- alter table dept_emp_count add status varchar2(20) default 'Active';

-- #M17: Create table emp_hire_2005 from hr.employees where EXTRACT(YEAR FROM hire_date) = 2005.
-- create table emp_hire_2005 as 
-- select * from hr.employees where extract(year from hire_date) = 2005;

-- #M18: Modify column status to VARCHAR2(30).
-- alter table dept_emp_count modify status varchar2(30);

-- #M19: Create an empty table with the same structure as hr.departments. Name it dept_template.
-- create table dept_template as
-- select * from hr.departments where 1=0;

-- #M20: Add column audit_id NUMBER(10) to your backup table.
-- alter table hr_employees_archive add audit_id number(10);

-- #H1:  Create a table emp_dept_summary that has one row per department
-- with columns department_id, department_name (from hr.departments), 
-- and a computed column total_sal (use a subquery or join to get SUM(salary) per department).
-- create table emp_dept_summary as
-- select d.department_id, d.department_name, (select sum(salary) from hr.employees e
-- where e.department_id = d.department_id) as total_sal from hr.departments d;

-- #H2:Create table emp_backup_80 from hr.employees for department 80, 
-- but only columns employee_id, first_name, last_name, salary, commission_pct.
-- create table emp_backup_80 as
-- select employee_id, first_name, last_name, salary, commission_pct 
-- from hr.employees where department_id = 80;

-- #H3: Add a column full_name to a backup table and populate it with first_name || ' ' || last_name 
-- for all existing rows (requires UPDATE after ADD; then you could add a default for new rows).
-- alter table emp_backup_80 add full_name varchar2(50);
-- update emp_backup_80 set full_name = first_name|| ' ' ||last_name;

-- #H4: Create a table that has department_id, department_name, and a column manager_name 
-- (you would need to join hr.departments with hr.employees on manager_id to get manager's name).
-- create table dept_with_mgr as
-- select d.department_id, d.department_name, e.first_name||' ' ||e.last_name as manager_name
-- from hr.departments d left join hr.employees e 
-- on d.manager_id = e.employee_id;

-- #H5: Create table emp_job_salary with columns job_id, min_sal, max_sal, 
-- avg_sal (use GROUP BY job_id with MIN, MAX, AVG on salary from hr.employees).
-- create table emp_job_salary as
-- select job_id, min(salary) as min_salary, max(salary) as max_salary, avg(salary) as avg_salary
-- from hr.employees
-- group by job_id;

-- #H6:  Add a column that has a DEFAULT expression using SYSDATE 
-- and rename an existing column in the same table (two statements).
-- alter table emp_job_salary add calculated_on date default sysdate;
-- alter table emp_job_salary rename column job_id to emp_job_id;

-- #H7: Create a table emp_top_sal with the same structure as hr.employees 
-- but only rows where salary is in the top 10 
-- (use subquery: WHERE salary IN (SELECT ... ORDER BY salary DESC FETCH FIRST 10 ROWS ONLY)).
-- create table emp_top_sal as 
-- select * from hr.employees 
-- where salary in(select salary from hr.employees 
-- order by salary desc
-- fetch first 10 rows only);

-- #H8: Create table dept_emp_list with department_id,
-- department_name, and employee_count (count of employees per department).
-- create table dept_emp_list as
-- select d.department_id, d.department_name, count(e.employee_id) as employee_count 
-- from hr.departments d left join  hr.employees e on d.department_id = e.department_id
-- group by d.department_id, d.department_name;

-- #H9: Drop two columns from your backup table in one statement 
-- (if Oracle supports: ALTER TABLE ... DROP (col1, col2)).
-- alter table dept_with_mgr drop column department_id;
-- alter table dept_with_mgr drop column department_name;

-- #H10: Create a table that contains only employees whose 
-- manager_id is not null and department_id is not null (all columns).
-- create table emp_with_mgr_dept as 
-- select * from hr.employees
-- where manager_id is not null and department_id is not null;

-- #H11:Add a column salary_band VARCHAR2(10) 
-- and update it with CASE (Low/Medium/High) based on salary; then add DEFAULT 'Medium' for new rows.
-- alter table emp_with_mgr_dept add salary_band varchar2(10);
-- update  emp_with_mgr_dept 
-- set salary_band = 
--       case
--         when salary >= 10000 then 'high'
--         when salary >=5000 and salary <1000 then 'medium'
--         else 'low'
--       end;
-- alter table emp_with_mgr_dept modify salary_band default 'medium';

-- #H12:  Create table emp_duplicate_check with employee_id, first_name, last_name, 
-- and a column dup_count showing how many employees share the same 
-- first_name and last_name (use analytic or self-join in CTAS).
-- create table emp_duplicate_check as
-- select first_name, last_name, employee_id, count(*) OVER (PARTITION BY first_name, last_name)
-- as dup_count from hr.employees;

-- create table emp_duplicate_check as
-- select e1.first_name, e1.last_name, e1.employee_id, count(e2.employee_id) as dup_count
-- from hr.employees e1 join hr.employees e2
-- on e1.first_name = e2.first_name and e1.last_name = e2.last_name
-- group by e1.first_name, e1.last_name, e1.employee_id;

-- #H13: Create an empty table with the same structure as hr.employees and name it emp_import_staging.
-- create table emp_import_staging as 
-- select * from hr.employees where 1=0;

-- #H14:Modify the data type of a column from NUMBER to VARCHAR2 
-- (e.g. store employee_id as string). Oracle may require add new column, update, drop old, rename.
-- alter table hr_employees_archive add emp_id_str varchar2(50);
-- update hr_employees_archive set emp_id_str = to_char(employee_id);
-- alter table hr_employees_archive drop column employee_id;
-- alter table hr_employees_archive rename column emp_id_str to employee_id;

-- #H15: Create table dept_location_1700 from hr.departments where location_id = 1700.
-- create table dept_location_1700 as
-- select * from hr.departments where location_id = 1700;

-- #H16: Add column version NUMBER DEFAULT 1 and last_modified DATE DEFAULT SYSDATE to backup table.
-- alter table dept_location_1700 add version number default 1;
-- alter table dept_location_1700 add last_modified date default sysdate;

-- #H17: Create table emp_salary_range with columns 
-- from hr.employees but only for salary between 5000 and 15000
-- create table emp_salary_range as
-- select * from hr.employees 
-- where salary between 5000 and 15000;

-- #H18: Truncate a table and then add a new column. Verify the table has 0 rows.
-- truncate table emp_salary_range;
-- alter table emp_salary_range add salary_band varchar2(10);
-- select * from emp_salary_range;

-- #H19:  Create table job_list with distinct job_id 
-- from hr.employees and a literal column category with value 'HR'.
-- create table job_list as
-- select distinct job_id, 'HR' as category from hr.employees;

-- #H20: Drop table emp_structure if it exists (Oracle: use PL/SQL EXECUTE IMMEDIATE 
-- 'DROP TABLE emp_structure'; with exception when table does not exist, or check user_tables first).