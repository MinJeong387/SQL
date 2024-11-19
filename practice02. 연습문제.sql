USE hrdb;

-- 문제 1.
SELECT em.employee_id, em.first_name, em.last_name, dept.department_name
FROM employees em JOIN departments dept ON em.department_id = dept.department_id
ORDER BY dept.department_name, em.employee_id DESC;

-- 문제 2.
SELECT em.employee_id, em.first_name, em.salary, dept.department_name, jobs.job_title
FROM employees em JOIN departments dept ON em.department_id = dept.department_id
				  JOIN jobs ON em.job_id = jobs.job_id
ORDER BY em.employee_id ASC;

-- 문제 2-1.
SELECT em.employee_id, em.first_name, em.salary, dept.department_name, jobs.job_title
FROM employees em LEFT OUTER JOIN departments dept ON em.department_id = dept.department_id
				  LEFT OUTER JOIN jobs ON em.job_id = jobs.job_id
ORDER BY em.employee_id ASC;

-- 문제 3.
SELECT loc.location_id, loc.city, dept.department_name, dept.department_id
FROM locations loc JOIN departments dept ON loc.location_id=dept.location_id
ORDER BY loc.location_id ASC;

-- 문제 3-1.
SELECT loc.location_id, loc.city, dept.department_name, dept.department_id
FROM locations loc LEFT OUTER JOIN departments dept ON loc.location_id=dept.location_id
ORDER BY loc.location_id ASC;

-- 문제 4.
SELECT reg.region_name, con.country_name
FROM countries con JOIN regions reg ON con.region_id = reg.region_id
ORDER BY reg.region_name ASC, con.country_name DESC;

-- 문제 5.
SELECT emp.employee_id, emp.first_name, emp.hire_date, man.first_name, man.hire_date
FROM employees emp JOIN employees man ON emp.manager_id = man.employee_id
WHERE emp.hire_date < man.hire_date;

-- 문제 6.
SELECT con.country_name, con.country_id, loc.city, loc.location_id, dept.department_name, dept.department_id
FROM locations loc JOIN countries con ON loc.country_id = con.country_id
				   JOIN departments dept ON loc.location_id = dept.location_id
ORDER BY con.country_name ASC;

-- 문제 7.
SELECT emp.employee_id, CONCAT(emp.first_name,' ',emp.last_name) AS full_name, emp.job_id, his.start_date, his.end_date
FROM job_history his JOIN employees emp ON his.employee_id = emp.employee_id
WHERE his.job_id = 'AC_ACCOUNT';

-- 문제 8.
SELECT dept.department_id, dept.department_name, emp.first_name, loc.city, con.country_name, reg.region_name
FROM employees emp JOIN departments dept ON emp.employee_id = dept.manager_id
				   JOIN locations loc ON dept.location_id = loc.location_id
				   JOIN countries con ON loc.country_id = con.country_id
				   JOIN regions reg ON con.region_id = reg.region_id;

-- 문제 9. departments에 manager_id 가 비어있는게 많음 (주의)
SELECT emp.employee_id, emp.first_name, dept.department_name, man.first_name
FROM employees emp LEFT OUTER JOIN departments dept ON emp.department_id = dept.department_id
				   LEFT OUTER JOIN employees man ON emp.manager_id = man.employee_id;
                   
-- 문제 9-1.
SELECT emp.employee_id, emp.first_name, dept.department_name, man.first_name
FROM employees emp LEFT OUTER JOIN departments dept ON emp.department_id = dept.department_id
				   JOIN employees man ON emp.manager_id = man.employee_id;

-- 문제 9-2.
SELECT emp.employee_id, emp.first_name, dept.department_name, man.first_name
FROM employees emp JOIN departments dept ON emp.department_id = dept.department_id
				   JOIN employees man ON emp.manager_id = man.employee_id;

