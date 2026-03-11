-- #Q1: List employees hired in the year 2005.
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE hire_date >= DATE '2005-01-01' AND hire_date < DATE '2006-01-01';

--Alternative using EXTRACT:
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE EXTRACT(YEAR FROM hire_date) = 2005;

-- #Q2: For each employee, show tenure in years using MONTHS_BETWEEN 
-- (and divide by 12). Use alias tenure_years, rounded to 1 decimal.
SELECT employee_id, first_name, last_name, hire_date,
  ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12, 1) AS tenure_years
FROM hr.employees;

-- #Q3: Add a column salary_band using CASE: Low (salary < 5000), 
-- Medium (5000–11999), High (>= 12000). Show employee_id, first_name, salary, salary_band.
SELECT employee_id, first_name, salary,
  CASE
    WHEN salary < 5000 THEN 'Low'
    WHEN salary < 12000 THEN 'Medium'
    ELSE 'High'
  END AS salary_band
FROM hr.employees;

-- #P1: Show the first 3 characters of last_name for each employee (use SUBSTR).
SELECT employee_id, first_name, last_name, substr(last_name,1,3) as last_name_substring
FROM hr.employees;

-- #P2: List employees with tenure greater than 15 years (use MONTHS_BETWEEN as above).
SELECT employee_id, first_name, last_name, hire_date,
  ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12, 1) AS tenure_years
FROM hr.employees
WHERE ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)/12, 1)>15;

-- #P3: In the SELECT list, use NVL(commission_pct, 0) in an expression that computes something 
-- like total compensation (e.g. salary + salary * commission). Give the expression an alias.
SELECT employee_id, first_name, NVL(salary*(1+salary*commission_pct),0) as total_compensation
FROM hr.employees;

-- #M1: Show employee_id, first_name, and LENGTH(last_name) as last_name_length.
SELECT employee_id, first_name, LENGTH(last_name) AS last_name_length 
FROM hr.employees;

-- #M2: List employees hired in 2004 using EXTRACT(YEAR FROM hire_date).
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE EXTRACT(YEAR FROM hire_date) = 2004;

-- #M3: Add a column job_type: 'Sales' if job_id like 'SA%', else 'Other'. Use CASE.
SELECT employee_id, first_name, job_id,
CASE 
    WHEN job_id LIKE 'SA%' THEN 'Sales' 
    ELSE 'Other' 
END AS job_type
FROM hr.employees;

--#M4. Show first_name, last_name, and tenure in months (MONTHS_BETWEEN(SYSDATE, hire_date)).
SELECT first_name, last_name,
ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),1) AS tenure_months
FROM hr.employees;

--#M5. List employees with salary between 4000 and 8000 and department_id 50 or 60. Use parentheses.
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE salary BETWEEN 4000 AND 8000 AND (department_id = 50 OR department_id = 60);

--#M6. Display employee_id, salary, and salary_level: 'Tier1' if salary < 5000, 
--'Tier2' if < 10000, else 'Tier3'.
SELECT employee_id, salary,
CASE 
    WHEN salary < 5000 THEN 'Tier1' 
    WHEN salary < 10000 THEN 'Tier2'
    ELSE 'Tier3'
END as salary_level
FROM hr.employees;

--#M7. Show last_name and INITCAP(last_name).
SELECT last_name, INITCAP(last_name) FROM hr.employees;

--#M8. List employees where department_id is in the set (10, 20, 30) from hr.departments (use subquery IN).
SELECT employee_id, first_name, department_id
FROM hr.employees
WHERE department_id IN (SELECT department_id FROM hr.departments WHERE department_id IN (10,20,30));

--#M9. Add column hire_month as EXTRACT(MONTH FROM hire_date).
SELECT employee_id, first_name, EXTRACT(MONTH FROM hire_date) AS hire_month
FROM hr.employees;

--#M10. Show phone_number and COALESCE(phone_number, 'No Phone').
SELECT employee_id, first_name, phone_number,
COALESCE(phone_number, 'No Phone') AS contact
FROM hr.employees;

--#M11. List employees with (department_id = 50 AND salary > 5000) OR (department_id = 60).
SELECT employee_id, first_name, departmenr_id, salary
FROM hr.employees
WHERE (department_id = 50 AND salary > 5000) OR department_id = 60;

--#M12. Display hire_date and ADD_MONTHS(hire_date, 12) as one_year_later.
SELECT employee_id, firsr_name, hire_date,
ADD_MONTHS(hire_date, 12) AS one_year_later
FROM hr.employees;

--M13. Show first_name, last_name, and SUBSTR(first_name, 1, 1) || SUBSTR(last_name, 1, 1) as initials.
SELECT first_name, last_name, SUBSTR(first_name,1,1) || SUBSTR(last_name,1,1) AS initials
FROM hr.employees;

--M14. List employees hired after 2006-01-01.
SELECT employee_id, first_name, hire_date
FROM hr.employees
WHERE hire_date > DATE '2006-01-01';

--M15. Add column has_commission: 'Yes' if commission_pct is not null, 'No' otherwise. Use NVL2 or CASE.
SELECT first_name, employee_id, NVL2(commission_pct, 'Yes', 'No') AS has_commission
FROM hr.employees;

--M16. Show salary and ROUND(salary, -2) (rounded to nearest hundred).
SELECT first_name, salary, ROUND(salary, -2) AS salary_rounded
FROM hr.employees;

--M17. List employees where job_id is SA_REP or SA_MAN and salary > 8000.
SELECT employee_id, first_name, salary, job_id
FROM hr.employees
WHERE job_id IN ('SA_REP','SA_MAN') AND salary > 8000;

--M18. Display employee_id, hire_date, and TRUNC(hire_date) (same day at midnight).
SELECT employee_id, hire_date, TRUNC(hire_date) AS hire_day
FROM hr.employees;

--M19. Show last_name and LOWER(last_name).
SELECT last_name, LOWER(last_name) AS last_lower
FROM hr.employees;

--M20. List employees with tenure (MONTHS_BETWEEN/12) >= 10 years.
SELECT employee_id, first_name, hire_date
FROM hr.employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date)/12 >= 10;

--H1. Show employee_id, salary, and a band: 'A' if salary in top 25%, 'B' if next 25%, etc. 
--Use NTILE(4) over salary order or CASE with subquery for percentiles.
--Hint: Use subquery for AVG/percentiles or NTILE(4) OVER (ORDER BY salary DESC) and map 1->'A', 2->'B', etc.

--Using NTILE(4)
SELECT employee_id, salary,
       CASE NTILE(4) OVER (ORDER BY salary DESC)
            WHEN 1 THEN 'A'
            WHEN 2 THEN 'B'
            WHEN 3 THEN 'C'
            WHEN 4 THEN 'D'
       END AS salary_band
FROM hr.employees;

--Using CASE
SELECT employee_id, salary,
       CASE
           WHEN salary >= (SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary) 
                           FROM hr.employees) THEN 'A'
           WHEN salary >= (SELECT PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY salary) 
                           FROM hr.employees) THEN 'B'
           WHEN salary >= (SELECT PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salary) 
                           FROM hr.employees) THEN 'C'
           ELSE 'D'
       END AS salary_band
FROM hr.employees;

--H2. List employees whose hire_date is in the same year as their manager's hire_date 
--(need self-join on manager_id; compare EXTRACT(YEAR FROM e.hire_date) = EXTRACT(YEAR FROM m.hire_date)).
--Hint: Self-join hr.employees e and m on e.manager_id = m.employee_id; WHERE EXTRACT(YEAR FROM e.hire_date) = EXTRACT(YEAR FROM m.hire_date).
SELECT m.employee_id, e.manager_id, e.hire_date
FROM hr.employees e 
JOIN hr.employees m ON e.manager_id = m.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = EXTRACT(YEAR FROM m.hire_date);

--H3. Add column salary_vs_avg: (salary - (SELECT AVG(salary) FROM hr.employees)). Round to 2 decimals.
SELECT first_name, ROUND(salary - (SELECT AVG(salary) FROM hr.employees), 2) AS salary_vs_avg
FROM hr.employees;

--H4. List employees with exactly 5 characters in first_name.
SELECT first_name
FROM hr.employees
WHERE LENGTH(first_name) = 5;

--H5. Show first_name, last_name, and full_name with last_name first: last_name || ', ' || first_name.
SELECT first_name, last_name, last_name || ', ' || first_name AS full_name
FROM hr.employees;

--H6. For each employee show hire_date and the day of week (use TO_CHAR(hire_date, 'Day') or similar).
SELECT first_name, hire_date, TO_CHAR(hire_date, 'Day') AS day_of_week
FROM hr.employees;

--H7. List employees where department_id is in (SELECT department_id FROM hr.departments).
SELECT first_name, DEPARTMENT_ID
FROM hr.employees
WHERE department_id IN (SELECT department_id FROM hr.departments);

--H8. Add column years_until_10: years until 10 years tenure (10 - tenure_years),
--only for people with < 10 years.
SELECT first_name, hire_date,
    CASE 
        WHEN MONTHS_BETWEEN(SYSDATE, hire_date)/12 < 10 THEN ROUND(10 - MONTHS_BETWEEN(SYSDATE, hire_date)/12, 1) 
    END AS years_until_10
FROM hr.employees;

--H9. Show salary and commission_pct and total_comp as salary + salary*NVL(commission_pct,0), rounded to 2 decimals.
SELECT salary, commission_pct, ROUND(salary * (1 + NVL(commission_pct,0)), 2) AS total_comp
FROM hr.employees;

--H10. List employees hired on the first day of any month (EXTRACT(DAY FROM hire_date) = 1).
SELECT employee_id, first_name, hire_date
FROM hr.employees
WHERE EXTRACT(DAY FROM hire_date) = 1;

--H11. Display employee_id, salary, and salary rank within department 
--(use RANK() OVER (PARTITION BY department_id ORDER BY salary DESC)).
SELECT employee_id, salary, department_id,
RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS sal_rank
FROM hr.employees;

--H12. List employees whose last_name contains the letter 'a' at least twice.
SELECT first_name, last_name
FROM hr.employees
WHERE (LENGTH(last_name) - LENGTH(REPLACE(LOWER(last_name),'a',''))) >= 2;

--H13. Show hire_date and LAST_DAY(hire_date) (last day of that month).
SELECT first_name, hire_date, LAST_DAY(hire_date) AS month_end
FROM hr.employees;

--H14. Add column comp_category: 'Salary only' if commission_pct is null, 'Salary+Commission' otherwise.
SELECT first_name, salary, commission_pct,
    CASE 
        WHEN commission_pct IS NULL THEN 'Salary only' 
        ELSE 'Salary+Commission' 
    END AS comp_category
FROM hr.employees;

--H15. List employees with tenure (years) between 5 and 15.
SELECT first_name, hire_date
FROM hr.employees
WHERE MONTHS_BETWEEN(SYSDATE, hire_date)/12 BETWEEN 5 AND 15;

--H16. Show first_name reversed (use REVERSE or loop in PL/SQL; in Oracle no REVERSE—use SUBSTR in a custom way or simple: 
--list as-is and add a note). For Oracle use: list first_name and perhaps SUBSTR from end.
--Hint: In Oracle 11g+: use LISTAGG trick or recursive SUBSTR; or skip reverse and use LENGTH/SUBSTR to build reversed string.

SELECT first_name,
       (SELECT LISTAGG(SUBSTR(first_name, LEVEL, 1), '')          --
               WITHIN GROUP (ORDER BY LEVEL DESC)
        FROM dual
        CONNECT BY LEVEL <= LENGTH(first_name)) AS reversed_name
FROM hr.employees;
--LEVEL generates positions from 1 to length of string
--SUBSTR(first_name, LEVEL, 1) extracts each character
--ORDER BY LEVEL DESC reverses the order
--LISTAGG joins the characters

--H17. List employees where department_id exists in hr.departments and salary > (SELECT AVG(salary) FROM hr.employees).
SELECT first_name, department_id, salary
FROM hr.employees
WHERE department_id IN (SELECT department_id FROM hr.departments) AND salary > (SELECT AVG(salary) FROM hr.employees);

--H18. Display salary and salary with 15% bonus: salary * 1.15.
SELECT first_name, salary, salary * 1.15 AS salary_with_bonus
FROM hr.employees;

--H19. Add column hire_decade: '2000s' if hire_date in 2000-2009, '1990s' if 1990-1999, else 'Other'.
SELECT first_name, hire_date,
    CASE 
        WHEN EXTRACT(YEAR FROM hire_date) BETWEEN 2000 AND 2009 THEN '2000s' 
        WHEN EXTRACT(YEAR FROM hire_date) BETWEEN 1990 AND 1999 THEN '1990s' 
        ELSE 'Other' 
    END AS hire_decade
FROM hr.employees;

--H20. List employees with first_name starting with 'A' or 'B' and salary > 6000.
SELECT first_name, salary
FROM hr.employees
WHERE (first_name LIKE 'A%' OR first_name LIKE 'B%') AND salary > 6000;