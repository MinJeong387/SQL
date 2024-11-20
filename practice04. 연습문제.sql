USE hrdb;

-- 문제 1.
SELECT COUNT(salary)
FROM employees
WHERE salary < (SELECT AVG(salary)
				FROM employees);
                
-- 문제 2.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary BETWEEN (SELECT AVG(salary) FROM employees) AND (SELECT MAX(salary) FROM employees);

-- 문제 3.
SELECT loc.location_id, loc.street_address, loc.postal_code, loc.city, loc.state_province, loc.country_id
FROM locations loc JOIN departments dept ON loc.location_id = dept.location_id
				   JOIN employees emp ON dept.department_id = emp.department_id 
WHERE emp.first_name="Steven" AND emp.last_name="king";

-- 문제 4.
SELECT employee_id, first_name, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id="ST_MAN")
ORDER BY salary DESC;

-- 문제 5.
-- 방법1. 조건절비교
SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary)
								  FROM employees
                                  GROUP BY department_id)
ORDER BY salary DESC;

-- 방법2. 테이블조인
SELECT emp.employee_id, emp.first_name, emp.salary, emp.department_id
FROM employees emp JOIN (SELECT department_id, MAX(salary)
						 FROM employees
						 GROUP BY department_id) AS tab
					ON emp.department_id = tab.department_id
ORDER BY salary DESC;

-- 문제 6.
SELECT j.job_title, SUM(salary)
FROM employees emp JOIN jobs j ON emp.job_id = j.job_id
GROUP BY j.job_title
ORDER BY SUM(salary) DESC;

-- 문제 7.
SELECT emp.employee_id, emp.first_name, emp.salary
FROM employees emp JOIN (SELECT department_id, AVG(salary) AS Asal 
						 FROM employees 
                         GROUP BY department_id) AS tab
					ON emp.department_id = tab.department_id
WHERE emp.salary > tab.Asal;
                    
-- 문제 8.
SELECT employee_id, first_name, salary, hire_date
FROM employees
ORDER BY hire_date
LIMIT 10,5;