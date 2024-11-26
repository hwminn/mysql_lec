USE db_company;



/* 중첩 서브쿼리 : 단일 행 서브쿼리 */

-- 1. 평균 급여 이상을 받는 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
  FROM tbl_employee
 WHERE salary >= (SELECT AVG(salary) FROM tbl_employee);

-- 2. 사원번호가 1001인 사원의 직책을 가진 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
  FROM tbl_employee
 WHERE position = (SELECT position
                     FROM tbl_employee
                    WHERE emp_id = 1001);



/* 중첩 서브쿼리 : 다중 행 서브쿼리 */

-- 3. 부서명이 '영업부'인 부서에 근무하는 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
  FROM tbl_employee
 WHERE dept_id IN (SELECT dept_id
                     FROM tbl_department
                    WHERE dept_name = '영업부');



/* 스칼라 서브쿼리 : SELECT 절에서 사용. 하나의 값을 반환 */

-- 4. 사원번호가 1002인 사원의 정보와 전체급여평균 조회하기
SELECT 
       emp_id
     , emp_name
     , salary
     , (SELECT AVG(salary) FROM tbl_employee)
  FROM
       tbl_employee
 WHERE
       emp_id = 1002;



/* 인라인 뷰 : FROM 절에서 사용. 테이블 형식의 결과 반환 */
-- from 절의 서브퀴리가 인라인 뷰? 

-- 5. 부서별 급여 평균 중 가장 높은 급여 평균 조회하기 
SELECT MAX(average)
  FROM (SELECT AVG(salary) AS average  -- AS는 공백으로 대체가능함 
         FROM tbl_employee
         GROUP BY dept_id) tbl_average; -- 인라인 뷰 (파생 테이블)는 반드시 별명이 필요하다.



/* 상관 서브쿼리 : 메인 쿼리가 서브 쿼리에 영향을 미치는 쿼리 */

-- 6. 전체 사원의 정보와 부서별 급여 평균 조회하기
SELECT 
       emp_id
     , dept_id
     , emp_name
     , salary
     , (SELECT AVG(salary)
          FROM tbl_employee
         WHERE dept_id = e.dept_id) AS 부서급여평균
  FROM
       tbl_employee e;

-- 7. 모든 사원의 정보와 부서명 조회하기
SELECT 
       emp_id
     , dept_id
     , (SELECT dept_name
          FROM tbl_department
         WHERE dept_id = e.dept_id) AS dept_name
     , emp_name
     , position
     , gender
     , hire_date
     , salary
  FROM
       tbl_employee e;

-- 8. (db_menu 스키마) 메뉴가격이 카테고리별 평균 메뉴가격보다 높은 메뉴 조회하기
USE db_menu;
SELECT menu_code, menu_name, menu_price, category_code, orderable_status
  FROM tbl_menu m
 WHERE menu_price > (SELECT AVG(menu_price)
                       FROM tbl_menu
                      WHERE category_code = m.category_code);