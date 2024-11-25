USE db_company;

-- 1. 모든 사원의 부서번호, 부서명, 사원번호, 사원명 조회하기 
SELECT d.dept_id, e.dept_id, dept_name, emp_id, emp_name
  FROM tbl_employee e JOIN tbl_department d
    ON d.dept_id= e.dept_id;
  -- 크로스 조인이라고 한다. // 조인 조건이 잘못 작성된 경우에도 cross join을 수행

/* INNER JOIN*/
-- 두 테이블이 모두 가지고 있는 데이터를 조회할 때 사용 
SELECT d.dept_id, e.dept_id, dept_name, emp_id,emp_name
  FROM tbl_department d INNER JOIN tbl_employee e
    ON d.dept_id=e.dept_id;