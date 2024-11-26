USE db_company;

/* 클러스터 인덱스 : pk에 부여된 인덱스 */

-- 1. 인덱스 태우기 -> 부서번호가 1인 부서 조회하기
SELECT dept_id, dept_name, location
  FROM tbl_department
 WHERE dept_id=1;  -- 인덱스가 설정된 칼럼 조회 
 
 SELECT dept_id, dept_name, location
  FROM tbl_department
 WHERE dept_id*2=2;  -- 인덱스가 설정된 칼럼을 조작하면 
 
 -- 2. 인덱스 안 태우기-> 부서명이 영업부인 부서 조회하기 
 SELECT dept_id, dept_name, location
   FROM tbl_department
  WHERE dept_name='영업부';
  
-- 3. 부서번호가 1 이상인 부서 조회하기 
 SELECT dept_id, dept_name, location
   FROM tbl_department
  WHERE dept_id>=1; -- 범위 연산은 db 검색 엔진이 자가 판단하여 인덱스를 태울지 말지 결정함(index range scar or full table scan 중) 
  
  
--  4.인덱스 만들기
CREATE INDEX ix_name
    ON tbl_employee(emp_name ASC);

-- Index Range Scan
SELECT emp_id,dept_id,emp_name,position,gender,hire_date,salary
  FROM tbl_employee
 WHERE emp_name LIKE'이%';

-- FULL table scan(인덱스가 설정된 칼럼을 함수 처리했기 때문)
SELECT emp_id,dept_id,emp_name,position,gender,hire_date,salary
  FROM tbl_employee
 WHERE SUBSTRING(emp_name,1,1)='이';     -- 1번째 글자부터 1글자만 추출 
 

 
    