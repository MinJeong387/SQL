USE hrdb;

SELECT * FROM departments;

-----------------------
-- SET OPERATION
-----------------------
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date 
FROM employees
WHERE department_id = 80; -- 34개

SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date
FROM employees
WHERE salary > 9000; -- 23개

SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date 
FROM employees
WHERE department_id = 80
INTERSECT
SELECT CONCAT(first_name, ' ', last_name) AS full_name, salary, hire_date
FROM employees
WHERE salary > 9000; -- 42개
-- UNION ALL : 중복을 제거하지 않은 합집합
-- MySQL은 INTERSECT, EXCEPT는 지원하지 않음

-------------------------------
-- Simple Join or Equi Join
-------------------------------
SELECT * FROM employees;	-- 107
SELECT * FROM departments;	-- 27

SELECT first_name, department_name
FROM employees, departments;
-- 카티전 프로덕트 (조합 가능한 모든 레코드의 쌍)	- 107*27

SELECT *
FROM employees, departments
WHERE employees.department_id = departments.department_id;
-- 두 테이블을 연결(JOIN)해서 큰 테이블을 만듦
-- 이름, 부서 ID, 부서명
SELECT CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;	-- 106

SELECT CONCAT(first_name, ' ', last_name) AS full_name, emp.department_id, dept.department_id, department_name
FROM employees emp JOIN departments dept 
					USING (department_id);	-- 조인 조건 필드
		
----------------------------
-- OUTER JOIN
----------------------------
-- 조건이 만족하는 짝이 없는 경우에도 NULL을 포함하여 결과를 출력
-- 모든 결과를 표현할 테이블이 어느 위치에 있느냐에 따라 
-- LEFT, RIGHT, FULL OUTER 조인으로 구분













