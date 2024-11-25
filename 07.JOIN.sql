USE db_company;

-- 1. 모든 사원의 부서번호, 부서명, 사원번호, 사원명 조회하기 
SELECT d.dept_id, e.dept_id, dept_name, emp_id, emp_name
  FROM tbl_department d JOIN tbl_employee e
    ON d.dept_id= e.dept_id;
  -- 크로스 조인이라고 한다. // 조인 조건이 잘못 작성된 경우에도 cross join을 수행

/* INNER JOIN*/
-- 2. 두 테이블이 모두 가지고 있는 데이터를 조회할 때 사용 
-- 반드시 올바른 조인 조건을 작성해야 함

-- 테이블작성
-- FORM DRIVE TABLE JOIN DRIVEN TABLE ( 앞에 운전하는 테이블 뒤에는 끌려오는 테이블을 설정해야함 기준 테이블을 설정)
-- DRIVE TABLE : 조인을 주동적으로 하는 테이블 , 관계상 PK 를 가진 테이블을 사용 (데이터가 적은=(행이적은) 테이블을 사용)
-- ON 절에서도 DRIVE TABLE 의 칼럼을 먼저 작성 

-- 2.모든 사원의 부서번호 부서명 사원번호 사원명 조회 
SELECT d.dept_id, e.dept_id, dept_name, emp_id,emp_name
  FROM tbl_department d INNER JOIN tbl_employee e
    ON d.dept_id=e.dept_id;
    
    
-- 3. 대구에 근무하는 사원 조회하기 
SELECT emp_id, e.dept_id, emp_name,position , gender, hire_date, salary
  FROM tbl_department d INNER JOIN tbl_employee e
    ON d.dept_id=e.dept_id
 WHERE location='대구';
 
-- 4. 지역별로 근무하는 사원 수 조회하기 
SELECT location, COUNT(*)
  FROM tbl_department d INNER JOIN tbl_employee e 
    ON d.dept_id= e.dept_id
GROUP BY location;

-- 5. (db_menu 스키마) 메뉴코드 , 메뉴명, 가격, 카테고리이름, 주문가능여부 조회하기 
/*USE db_menu;
SELECT menu_code, menu_name,menu_price,category_name,orderable_status
  FROM tbl_category c INNER JOIN tbl_menu m 
    ON  c.category_code= m.category_code;*/ 
    
/* OUTER JOIN */
-- 어느 한 테이블만 가지고 있는 데이터를 조회할 때 사용. 
-- LEFT [OUTER] JOIN: 첫 번째 테이블 (왼쪽에 있음)의 모든 데이터는 항상 조회되는 방식. 
-- RIGHT [OUTER] JOIN : 두 번째 테이블(오른쪽에 있음)의 모든 데이터는 항상 조회되는 방식. 

-- 6. 부서별 사원 수 조회하기 // 근무 중인 사원이 없으면 0을 표시.
SELECT dept_name, COUNT(emp_id)
  FROM tbl_department d LEFT JOIN tbl_employee e
    ON d.dept_id =e.dept_id
GROUP BY d.dept_id, dept_name;

