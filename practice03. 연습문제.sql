USE hrdb;

-- 문제 1.
SELECT COUNT(*) AS haveMngCnt
FROM employees
WHERE manager_id IS NOT NULL;

-- 집계함수는 NULL을 제외하고 집계
SELECT COUNT(manager_id) haveMngCnt
FROM employees;

-- 문제 2.
SELECT MAX(salary) AS 최고임금, MIN(salary) AS 최저임금, MAX(salary)-MIN(salary) AS "최고임금-최저임금"
FROM employees;

-- 문제 3.
SELECT DATE_FORMAT(MAX(hire_date),"%Y년 %m월 %d일")
FROM employees;

-- 문제 4.
SELECT department_id 부서아이디, AVG(salary) 평균임금, MAX(salary) 최고임금, MIN(salary) 최저임금
FROM employees
GROUP BY department_id
ORDER BY department_id DESC;

-- 문제 5.
SELECT job_id, MAX(salary) 최고임금, MIN(salary) 최저임금, ROUND(AVG(salary),0) 평균임금
FROM employees
GROUP BY job_id
ORDER BY MIN(salary) DESC, AVG(salary) ASC;

-- 문제 6.
SELECT DATE_FORMAT(MIN(hire_date),'%Y-%m-%d %W') '최장기 근속직원 입사일'
FROM employees;

-- 문제 7.
SELECT department_id 부서, AVG(salary) 평균임금, MIN(salary) 최저임금, AVG(salary)-MIN(salary) "평균임금-최저임금"
FROM employees
GROUP BY department_id
HAVING AVG(salary)-MIN(salary) < 2000
ORDER BY AVG(salary)-MIN(salary) DESC;

-- 문제 8.
SELECT job_id, MAX(salary)-MIN(salary) diff_salary
FROM employees
GROUP BY job_id
ORDER BY diff_salary DESC;

-- 나는 다른 TABLE 이용해서 이렇게 함
-- SELECT job_title 업무, max_salary-min_salary 임금격차
-- FROM jobs
-- ORDER BY max_salary-min_salary DESC;

-- 문제 9.
SELECT manager_id 매니저아이디, ROUND(AVG(salary),0) 평균급여, MIN(salary) 최소급여, MAX(salary) 최대급여
FROM employees
WHERE hire_date >= '2005-01-01'
GROUP BY manager_id
HAVING AVG(salary)>=5000
ORDER BY AVG(salary) DESC;

-- 문제 10. CASE ~ WHEN ~ ELSE 문
SELECT CONCAT(first_name, ' ', last_name) 이름, hire_date 입사일,
	CASE
		WHEN hire_date <= '2002-12-31' THEN '창립멤버'
        WHEN hire_date BETWEEN '2003-01-01' AND '2003-12-31' THEN '03년입사'
        WHEN hire_date BETWEEN '2004-01-01' AND '2004-12-31' THEN '04년입사'
        ELSE '상장이후입사'
	END AS optDate
FROM employees
ORDER BY hire_date;

-- 문제 11.
-- 환경 변수 : 소프트웨어가 실행될 때 로딩되는 실행을 위한 데이터 불러들임
-- lc_ -> Locale 정보
SHOW VARIABLES; -- 환경 변수 확인

SET lc_time_names = 'ko_KR';		-- 세션 환경 변수 (세션 : 내가 로그인할때만)
-- SET GLOBAL lc_time_names = 'ko_KR';	-- 글로벌 환경 변수 (전체 시스템 사용자에 대해서 영향 미치므로. root 계정 아니면 작동안됨)

SHOW VARIABLES LIKE 'lc_time_names';
SELECT DATE_FORMAT(MIN(hire_date),'%Y년 %m월 %d일(%W)') AS "가장 오래 근속한 직원의 입사일"
FROM employees;
/*
https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-format
%Y : Year
%m : Month (00..12)
%d : Day of the Month (00..31)
%W : Weekday name (Sundaty ~ Saturday)
