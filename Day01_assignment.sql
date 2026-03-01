-- --#Q1: List employee_id, first_name, and last_name from hr.employees.
-- SELECT employee_id, first_name, last_name 
-- FROM hr.employees;

-- --#Q2: Display the full name as a single column using concatenation (e.g., "First Last").
-- SELECT first_name || ' ' || last_name AS full_name 
-- FROM hr.employees;

-- --#Q3: Calculate annual salary as salary * 12 and give it the alias annual_salary
-- SELECT employee_id, first_name, last_name, salary, salary * 12 AS annual_salary
-- FROM hr.EMPLOYEES;

-- --#P1: List all distinct values of job_id.
-- SELECT DISTINCT job_id
-- FROM hr.EMPLOYEES;

-- --#P2: Show commission_pct and salary for the first 10 rows (use FETCH FIRST 10 ROWS ONLY or equivalent).
-- SELECT salary, commission_pct
-- FROM hr.employees FETCH FIRST 10 ROWS ONLY;

-- --#P3: Write a SELECT that returns each employee’s employee_id and a literal value 'HR' 
-- --in a column named department.
-- SELECT first_name,last_name, employee_id, 'HR' as department
-- FROM hr.employees;

-- -- #M1: Display employee_id, first_name, last_name, and a new column full_name 
-- -- that is first_name and last_name concatenated with a comma between them (e.g., "John, Doe").
-- select first_name,last_name, first_name || ',' || last_name as full_name
-- from hr.employees;

-- -- #M2: List employee_id, salary, and a column bonus_10_pct showing 10% of salary (salary * 0.10).
-- select employee_id, salary, salary * 0.10 as bonus_10_pct
-- from hr.employees;

-- -- #M3: Show employee_id, hire_date, and a literal column record_type with value 'Employee' for every row.
-- select employee_id, hire_date, 'Employee' as record_type 
-- from hr.employees;

-- -- #M4:  For each employee, display email and a column email_domain set to the literal '@company.com'.
-- select first_name, last_name, email, '@company.com' as email_domain
-- from hr.employees;

-- -- #M5: List employee_id, salary, commission_pct, and effective_commission 
-- -- where effective_commission is NVL(commission_pct, 0).
-- select employee_id, salary, commission_pct,nvl(commission_pct,0) as effective_commission
-- from hr.employees;

-- -- #M6: Display first_name, last_name, and a column initials formed by the 
-- -- first character of first_name and the first character of last_name (e.g., "JD").
-- select first_name,last_name, substr(first_name,1,1) || substr(last_name,1,1) as initials
-- from hr.employees;

-- -- #M7: Show employee_id, salary, and annual_salary as salary * 12, 
-- -- and also annual_plus_bonus as salary * 12 * 1.1 (10% bonus).
-- select employee_id,salary,salary*12 as annual_salary, salary*12*1.1 as annual_plus_bonus
-- from hr.employees;

-- -- #M8: List all columns from hr.departments using explicit 
-- -- column names (department_id, department_name, manager_id, location_id).
-- select department_id,department_name,manager_id,location_id from hr.departments;

-- -- #M9: From hr.employees, select employee_id and a column description that is the literal 'Emp#' 
-- -- concatenated with employee_id (cast to string if needed: use TO_CHAR(employee_id)).
-- select employee_id, 'Emp#' || to_char(employee_id) as description 
-- from hr.employees;

-- -- #M10: Display job_id, salary, and a column salary_band that is the literal 'Standard' for every row.
-- select job_id,salary, 'standard' as salary_band from hr.employees;

-- -- #M11: List employee_id, first_name, last_name, and a column display_name 
-- -- as "Last, First" (last_name, comma space, first_name).
-- select first_name,last_name, last_name || "," || first_name as display_name
-- from hr.employees;

-- -- #M12: Show department_id from hr.departments and a literal 1 as column sort_order.
-- select department_id, '1' as sort-order from hr.departments;

-- -- #M13: From hr.employees, display salary and monthly_net as salary * 0.85 (assuming 15% tax).
-- select salary, salary*0.85 as monthly_net from hr.employees;

-- #M14: List employee_id, commission_pct, and commission_display 
-- where NULL commission_pct is shown as 0 using NVL.
-- select employee_id,commission_pct, nvl(commission_pct,0) as commission_dipaly
-- from hr.employees;

-- #M15: Display first_name, last_name, salary, and a column 
-- compensation that is salary * (1 + NVL(commission_pct, 0)).
-- select first_name,last_name,salary,salary*(1+nvl(commission_pct,0)) as compensation
-- from hr.employees;

-- #M16: From hr.departments, list department_name and a literal column region with value 'HQ'.
-- select department_name, 'HQ' as region from hr.departments;

-- #M17: Show employee_id, hire_date, and a column years_label with literal 'Years of service'.
-- select employee_id,hire_date, 'Years of service' as years_label
-- from hr.employees;

-- #M18: List employee_id, salary, and double_salary as salary * 2.
-- select employee_id,salary,salary*2 as double_salary from hr.employees;

-- #M19: From hr.employees, display manager_id and a column has_manager that is the literal 'Yes' when 
-- manager_id is not null and 'No' when manager_id is null (use NVL2: NVL2(manager_id, 'Yes', 'No')).
-- select manager_id, nvl2(manager_id,'Yes','No') as has_manager from hr.employees;

-- #M20: Show department_id, department_name from hr.departments, and a calculated 
-- column dept_code as the first 3 characters of department_name (use SUBSTR).
-- select department_id,department_name,substr(department_name,1,3) as dept_code 
-- from hr.departments;

-- #H1: Display employee_id, first_name, last_name, salary, and a column salary_rank_label that is 
-- 'High' if salary >= 10000, 'Medium' if salary >= 5000 and < 10000, else 'Low'. Use CASE.
-- select employee_id, first_name, last_name, salary,
-- case
--     when salary>=10000 then 'High'
--     when salary between 5000 and 10000 then 'Medium'
--     else 'Low'
-- end as salary_rank_label
-- from hr.employees;

-- #H2: List employee_id, salary, commission_pct, and total_comp as salary + (salary * NVL(commission_pct, 0)), 
-- formatted to 2 decimal places using ROUND(..., 2).
-- select employee_id, salary, commission_pct, round(salary*(1+nvl(commission_pct,0)),2) as total_comp
-- from hr.employees;

-- #H3: From hr.employees, show employee_id, email, 
-- and email_upper as UPPER(email). Also show email_length as LENGTH(email).
-- select employee_id,email, upper(email) as email_upper, length(email) as emial_length
-- from hr.employees;

-- #H4: Display department_id from hr.departments, department_name, 
-- and a column name_length (number of characters in department_name).
-- select department_id,department_name, length(department_name) as name_length
-- from hr.departments;

-- #H5: List employee_id, first_name, last_name, and a column reverse_name 
-- as last_name concatenated with first_name (no comma).
-- select employee_id,first_name,last_name, concat(last_name,' ',first_name) as reverse_name
-- from hr.employees;

-- #H6: Show employee_id, hire_date, and a literal column data_source with value 'HR.EMPLOYEES'.
-- select employee_id, hire_date, 'HR.EMPLOYYES' as data_source
-- from hr.employees;

-- #H7: From hr.employees, display job_id, salary, and salary_percentage as 
-- (salary / (SELECT SUM(salary) FROM hr.employees)) * 100, rounded to 2 decimals.
-- select job_id,salary, round(salary/(select sum(salary) from hr.employees) *100,2) as salary_percentage
-- from hr.employees;

-- #H8: List employee_id, first_name, last_name, and a column formal_name 
-- as "Mr. " or "Ms. " (your choice) concatenated with first_name and last_name.
-- select employee_id,first_name,last_name, concat('Ms. ',first_name,' ',last_name) as formal_name
-- from hr.employees;

-- #H9: Display employee_id, salary, and annual_with_raise as (salary * 12) * 1.05 (5% annual raise).
-- select employee_id,salary, (salary*12)*1.05 as annual_with_raise
-- from hr.employees;

-- #H10: From hr.departments, show department_id, department_name, and a column id_name 
-- that concatenates department_id and department_name with a hyphen 
-- (e.g., "10-Administration"). Use TO_CHAR(department_id) for the number.
-- select department_id,department_name, to_char(department_id)||'-'||department_name as id_name
-- from hr.departments;

-- #H11: List employee_id, commission_pct, and commission_category: 'Commissioned' if commission_pct 
-- is not null, 'Non-commissioned' if null. Use NVL2 or CASE.
-- select employee_id, commission_pct,nvl2(commission_pct,'Commissioned','Non-commissioned') 
-- as commission_category from hr.employees;

-- #H12: Show employee_id, first_name, last_name, salary, and a column salary_expression that is the
-- literal string 'salary * 12' (not the result of the calculation).
-- select employee_id, first_name,last_name, salary, 'salary*12' as salary_expression
-- from hr.employees;

-- #H13: From hr.employees, display employee_id, job_id, and a column job_salary_label 
-- as job_id concatenated with ':' and salary (e.g., "SA_REP:9000"). Use TO_CHAR(salary).
-- select employee_id, job_id, job_id||':'||to_char(salary) as job_salary_label 
-- from hr.employees;

-- #H14: List employee_id, salary, and tax_bracket as 
-- '20%' if salary >= 10000, '15%' if salary >= 5000, else '10%'. Use CASE.
-- select employee_id,salary,
--       case
--           when salary >= 10000 then '20%'
--           when salary >= 5000 and salary < 10000 then '15%'
--           else '10%'
--       end as tax_bracket
-- from hr.employees;

-- #H15: Display department_id, department_name from hr.departments, and a column 
-- dept_info that is "Department " followed by department_id and " - " and department_name.
-- select department_id, department_name, 'Department' || to_char(department_id)|| '-' || department_name 
-- as dept_info from hr.departments;

-- #H16: From hr.employees, show employee_id, first_name, last_name, 
-- and full_name_reversed as last_name, space, first_name (e.g., "Doe John").
-- select employee_id, first_name, last_name, concat(last_name,' ',first_name) as full_name_reversed
-- from hr.employees;

-- #H17: List employee_id, salary, commission_pct, and effective_salary as salary when 
-- commission_pct is null, otherwise salary * (1 + commission_pct). Use NVL2 or CASE.
-- select employee_id,salary,commission_pct,nvl2(commission_pct,salary*(1+commission_pct),salary) 
-- as effective_salary from hr.employees;

-- #H18: Show employee_id, hire_date, and a column hire_year that is the year from hire_date 
-- (use EXTRACT(YEAR FROM hire_date) in Oracle).
-- select employee_id, hire_date, extract(year from hire_date) as hire_year
-- from hr.employees;

-- #H20: List employee_id, first_name, last_name, and a column name_with_id
--  as "[" || employee_id || "] " || first_name || " " || last_name (e.g., "[100] Steven King").
-- select employee_id, first_name, last_name, 
-- '['||to_char(employee_id)||']'||first_name||' '||last_name as name_with_id
-- from hr.employees;