-- #Q1: List employees in department_id 50.
-- SELECT employee_id, first_name, last_name, department_id
-- FROM hr.employees
-- WHERE department_id = 50;

-- #Q2: List employees whose salary is between 5000 and 10000 (inclusive).
-- select employee_id, first_name, last_name, salary
-- from hr.employees
-- where salary between 5000 and 10000;

-- #Q3: List employees whose last name starts with 'K'.
-- select employee_id, first_name, last_name
-- from hr.employees
-- where last_name like 'K%';

-- #Q4: List the top 5 highest-paid employees (employee_id, first_name, salary).
-- select employee_id, first_name, salary
-- from hr.employees
-- order by salary desc
-- fetch first 5 rows only;

-- #P1: List employees who have no commission_pct (NULL).
-- select employee_id, first_name, commission_pct
-- from hr.employees
-- where commission_pct is null;

-- #P2: List employees whose job_id contains the string 'MAN'.
-- select employee_id, first_name, job_id
-- from hr.employees
-- where upper(job_id) like '%MAN%';

-- #P3: List all employees ordered by hire_date descending (newest first).
-- select employee_id, first_name, last_name,hire_date
-- from hr.employees
-- order by hire_date desc;

-- #M1: List employees in department_id 80 with salary greater than 8000.
-- select department_id, salary, first_name
-- from hr.employees
-- where department_id = 80 and salary > 8000;

-- #M2: Find employees whose last_name ends with 'n'.
-- select first_name, last_name
-- from hr.employees
-- where upper(last_name) like '%N';

-- #M3: List employees hired after January 1, 2005.
-- select first_name, employee_id, hire_date
-- from hr.employees
-- where hire_date >= date '2005-01-01' ;

-- #M4: Get employees whose job_id is either 'SA_REP' or 'SA_MAN'.
-- select first_name, last_name, job_id
-- from hr.employees
-- where upper(job_id) = 'SA_REP' OR upper(job_id) = 'SA_MAN';

-- #M5: List employees with salary between 4000 and 7000 (inclusive).
-- select employee_id, first_name, last_name, salary
-- from hr.employees
-- where salary between 4000 and 7000;

-- #M6: Find employees who have a manager (manager_id is not null).
-- select first_name, last_name, manager_id
-- from hr.employees
-- where manager_id is not null;

-- #M7: List departments with department_id 10, 20, or 30 from hr.departments.
-- select department_name, department_id
-- from hr.departments
-- where department_id in (10,20,30);

-- #M8: Get the top 3 employees by hire_date (oldest first).
-- select first_name, last_name, hire_date
-- from hr.employees
-- order by hire_date asc
-- fetch first 3 rows only;

-- #M9: List employees in department 50, ordered by last_name ascending.
-- select first_name, last_name, department_id
-- from hr.employees
-- where department_id = 50
-- order  by last_name asc;

-- #M10: Find employees whose first_name starts with 'J'.
-- select first_name, last_name, employee_id
-- from hr.employees
-- where upper(first_name) like 'J%';

-- #M11: List employees with salary not in the range 5000 to 10000.
-- select first_name, employee_id, salary
-- from hr.employees
-- where salary not between 5000 and 10000;

-- #M12: Get employees whose job_id contains 'CLERK'.
-- select first_name, last_name, job_id
-- from hr.employees
-- where upper(job_id) like '%CLERK%';

-- #M13: List employees with commission_pct greater than 0.2.
-- select first_name, commission_pct
-- from hr.employees
-- where commission_pct is not null and commission_pct > 0.2;

-- #M14: Find the 10 most recently hired employees.
-- select first_name, last_name, hire_date
-- from hr.employees
-- order by hire_date desc
-- fetch first 10 rows only;

-- #M15: List employees in departments 50 or 60, ordered by department_id then salary descending.
-- select first_name, department_id, salary
-- from hr.employees
-- where department_id in(50,60)
-- order by department_id, salary desc;

-- #M16: Get employees whose last_name has exactly 5 characters.
-- select first_name, last_name
-- from hr.employees
-- where last_name like '_____';

-- #M17: List departments where manager_id is not null from hr.departments.
-- select department_id, manager_id
-- from hr.departments
-- where manager_id is not null;

-- #M18: Find employees with salary >= 10000, ordered by salary ascending.
-- select first_name, last_name, salary
-- from hr.employees
-- where salary >= 10000
-- order  by salary asc;

-- #M19: List employees whose email ends with '.com' or contains 'example' 
-- (if applicable; otherwise use a pattern that exists).
-- select first_name, email
-- from hr.employees
-- where email like '%.com' or email like '%example%';

-- #M20: Get distinct job_id values from employees in department 50.
-- select distinct job_id, department_id
-- from hr.employees
-- where department_id = 50;

-- #H1: List employees in department 80 with salary > 7000 OR job_id = 'SA_MAN', ordered by salary DESC.
-- select employee_id, department_id, salary
-- from hr.employees
-- where (department_id = 80 and salary > 70000) or (upper(job_id) = 'SA_MAN')
-- order by salary desc;

-- #H2: Find employees hired between Jan 1, 2000 and Dec 31, 2005.
-- select employee_id, hire_date
-- from hr.employees
-- where hire_date between date '2000-01-01' and date '2005-12-31';

-- #H3: List employees whose last_name is 4 characters and starts with 'K'.
-- select first_name, last_name
-- from hr.employees
-- where upper(last_name) like 'K___';

-- #H4: Get top 5 highest-paid employees in department 50 only.
-- select employee_id, first_name, salary, department_id
-- from hr.employees
-- where department_id = 50
-- order by salary desc
-- fetch first 5 rows only;

-- #H5: List employees with no manager and salary > 5000.
-- select employee_id, manager_id, salary
-- from hr.employees
-- where manager_id is null and salary > 5000;

-- #H6: Find employees whose first_name has an 'a' as the second character.
-- select first_name from hr.employees
-- where upper(first_name) like '_A%';

-- #H7: List departments (hr.departments) with department_id between 40 and 90.
-- select department_id from hr.departments
-- where department_id between 40 and 90;

-- #H8: Get employees with salary < 3000 or salary > 15000, ordered by salary.
-- select employee_id, salary
-- from hr.employees
-- where salary <3000 or salary > 15000
-- order by salary;

-- #H9: List employees in department 60 with job_id 'IT_PROG', or in department 100 with job_id like 'FI%'.
-- select department_id, job_id from hr.employees
-- where (department_id = 60 and job_id  = 'IT_PROG') or (department_id = 100 and job_id = 'FI%');

-- #H10: Find employees whose hire_date is in the year 2003.
-- select employee_id, hire_date, extract(year from hire_date) from hr.employees
-- where extract(year from hire_date) = 2003;

-- #H11: List employees with commission_pct NULL and job_id starting with 'SA'.
-- select commission_pct, job_id from hr.employees
-- where commission_pct is  null and job_id like 'SA%';

-- #H12: Get the 3 oldest employees (earliest hire_date) in department 90.
-- select employee_id, department_id, hire_date from hr.employees
-- where department_id = 90
-- order by hire_date asc
-- fetch first 3 rows only;

-- #H13: List employees whose last_name does not start with 'A', 'B', or 'C'.
-- select first_name, last_name from hr.employees
-- where last_name not like 'A%' and last_name not like 'B%' and last_name not like 'C%';

-- #H14: Find employees with salary in (5000, 6000, 7000, 8000).
-- select employee_id, salary
-- from hr.employees
-- where salary in(5000,6000,7000,8000);

-- #H15: List employees ordered by department_id ASC, then by hire_date DESC within each department.
-- select department_id, hire_date
-- from hr.employees
-- order by department_id asc, hire_date desc;

-- #H16:  Get employees whose first_name and last_name 
-- both start with the same letter (simplified: same first letter).
-- select first_name, last_name
-- from hr.employees
-- where substr(first_name,1,1) = substr(last_name,1,1);

-- #H17: List employees with manager_id not null and department_id in (50, 80, 100).
-- select manager_id, department_id
-- from hr.employees
-- where manager_id is not null and department_id in(50,80,100);

-- #H18: Find employees with salary between 3000 and 5000 and job_id containing 'REP'.
-- select employee_id, salary, job_id
-- from hr.employees
-- where salary between 3000 and 5000 and job_id like '%REP%';

-- #H19: List departments (hr.departments) ordered by department_name descending.
-- select department_name from hr.departments
-- order by department_name desc;

-- #H20: Get employees with hire_date not in 2004 (all years except 2004).
-- select employee_id, hire_date
-- from hr.employees
-- where hire_date < date '2004-01-01' or hire_date > date '2004-12-31';