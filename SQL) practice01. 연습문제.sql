-- 문제 1.
SELECT concat(first_name," ",last_name) AS 이름, salary AS 월급, phone_number AS 전화번호, hire_date AS 입사일
FROM employees
ORDER BY hire_date, concat(first_name," ",last_name);

-- 문제 2. (최고월급의 내림차순?)
SELECT job_title, max_salary
FROM jobs
ORDER BY max_salary DESC;

-- 문제 3.
SELECT concat(first_name," ",last_name), job_id, commission_pct, salary
FROM employees
WHERE job_id IS NOT NULL AND commission_pct IS NULL AND salary>3000
ORDER BY salary DESC;

-- 문제 4.
SELECT job_title, max_salary
FROM jobs
WHERE max_salary>=10000
ORDER BY max_salary DESC;

-- 문제 5.
SELECT first_name, salary, IFNULL(commission_pct,0)
FROM employees
WHERE 10000<=salary AND salary<14000
ORDER BY salary DESC;

-- 문제 6.
SELECT concat(first_name," ",last_name), salary, DATE_FORMAT(hire_date,'%Y-%m'), department_id
FROM employees
WHERE department_id =10 OR department_id =90 OR department_id =100;

-- 문제 7.
SELECT concat(first_name," ",last_name), salary
FROM employees
WHERE first_name LIKE "%S%" OR first_name LIKE "%s%";

-- 문제 8.
SELECT *
FROM departments
ORDER BY LENGTH(department_name) DESC;

-- 문제 9.
SELECT UPPER(country_name)
FROM countries
WHERE region_id IS NOT NULL
ORDER BY country_name;

-- 문제 10.
SELECT concat(first_name," ",last_name), salary, REPLACE(phone_number,'.','-'), hire_date
FROM employees
WHERE hire_date < '2003-12-31';
