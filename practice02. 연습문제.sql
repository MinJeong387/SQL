USE hrdb;

-- 문제 1.
SELECT emp.employee_id AS 사번, emp.first_name AS 이름, emp.last_name AS 성, dept.department_name AS 부서명
FROM employees emp JOIN departments dept ON emp.department_id = dept.department_id
ORDER BY dept.department_name, emp.employee_id DESC;

-- 문제 2.
SELECT emp.employee_id, emp.first_name, emp.salary, dept.department_name, jobs.job_title
FROM employees emp JOIN departments dept ON emp.department_id = dept.department_id
				   JOIN jobs ON emp.job_id = jobs.job_id
ORDER BY emp.employee_id ASC;	-- ASC는 생략가능

-- 문제 2-1.
SELECT emp.employee_id, emp.first_name, emp.salary, dept.department_name, jobs.job_title
FROM employees emp LEFT OUTER JOIN departments dept ON emp.department_id = dept.department_id
			 	   LEFT OUTER JOIN jobs ON emp.job_id = jobs.job_id
ORDER BY emp.employee_id ASC;

-- 문제 3.
SELECT loc.location_id, loc.city, dept.department_name, dept.department_id
FROM locations loc INNER JOIN departments dept ON loc.location_id = dept.location_id
ORDER BY loc.location_id ASC;

-- 문제 3-1.
SELECT loc.location_id, loc.city, dept.department_name, dept.department_id
FROM locations loc LEFT JOIN departments dept ON loc.location_id=dept.location_id
ORDER BY loc.location_id;	-- LEFT JOIN = LEFT OUTER JOIN : 뭐라 쓰든 상관없음

-- 문제 4.
SELECT reg.region_name 지역이름, con.country_name 나라이름
FROM countries con INNER JOIN regions reg ON con.region_id = reg.region_id
ORDER BY reg.region_name, con.country_name DESC;

-- 문제 5.
SELECT emp.employee_id 사번, emp.first_name 이름, emp.hire_date 채용일, man.first_name 매니저이름, man.hire_date 매니저입사일
FROM employees emp INNER JOIN employees man ON emp.manager_id = man.employee_id
WHERE emp.hire_date < man.hire_date;

-- 문제 6.
SELECT con.country_name, con.country_id, loc.city, loc.location_id, dept.department_name, dept.department_id
FROM countries con INNER JOIN locations loc ON con.country_id = loc.country_id
				   INNER JOIN departments dept ON loc.location_id = dept.location_id
ORDER BY con.country_name;

-- 문제 7.
SELECT emp.employee_id 사번, CONCAT(first_name,' ',last_name) 이름, his.job_id 업무아이디, his.start_date 시작일, his.end_date 종료일	-- his.job_id 말고 emp.job_id 해도 상관없음
FROM job_history his INNER JOIN employees emp ON his.employee_id = emp.employee_id
WHERE his.job_id = 'AC_ACCOUNT';

-- 문제 8.
SELECT dept.department_id 부서번호, dept.department_name 부서이름, emp.first_name 매니저이름, loc.city 위치한도시, con.country_name 나라이름, reg.region_name 지역명
FROM employees emp, 
	departments dept, 
    locations loc, 
    countries con, 
    regions reg
WHERE dept.manager_id = emp.employee_id AND
	dept.location_id = loc.location_id AND
    loc.country_id = con.country_id AND
    con.region_id = reg.region_id
ORDER BY dept.department_id ASC;	

-- 문제 9. departments에 manager_id 가 비어있는게 많음 (주의)
SELECT emp.employee_id 사번, emp.first_name 이름, dept.department_name 부서명, man.first_name 매니저이름
FROM employees emp LEFT JOIN departments dept ON emp.department_id = dept.department_id
				   LEFT JOIN employees man ON emp.manager_id = man.employee_id;
                   
-- 문제 9-1.
SELECT emp.employee_id 사번, emp.first_name 이름, dept.department_name 부서명, man.first_name 매니저이름
FROM employees emp LEFT JOIN departments dept ON emp.department_id = dept.department_id
				   INNER JOIN employees man ON emp.manager_id = man.employee_id;

-- 문제 9-2.
SELECT emp.employee_id 사번, emp.first_name 이름, dept.department_name 부서명, man.first_name 매니저이름
FROM employees emp INNER JOIN departments dept ON emp.department_id = dept.department_id
				   INNER JOIN employees man ON emp.manager_id = man.employee_id;
                   