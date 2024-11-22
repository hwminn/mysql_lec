USE db_company;

ALTER TABLE employee_tbl AUTO_INCREMENT=1001; 

-- 행 삽입하기 .
-- INSERT INTO  테이블(칼럼 , ...)VALUES(값, ....);
INSERT INTO department_tbl(dept_name, location)VALUES('영업부','대구');
INSERT INTO department_tbl(dept_name, location)VALUES('인사부','서울');
INSERT INTO department_tbl(dept_name, location)VALUES('총무부','대구');
INSERT INTO department_tbl(dept_name, location)VALUES('기획부','서울');

INSERT INTO employee_tbl(dept_id,position,emp_name,gender,hire_date,salary)VALUES(1,'현암','사원','M','2024-10-10',30000000);
INSERT INTO employee_tbl VALUES(NULL,2,'성다현','인턴','W','2024-10-10',10000000);
-- 첫번째 칼럼에는 NULL 값을 전달해서 emp_id 칼럼의 AUTO_INCREMENT 동작을 보장한다 
INSERT INTO employee_tbl VALUES(NULL,3,'김휘민','사원','M','2024-12-12',400000000);
INSERT INTO employee_tbl VALUES(NULL,4,'김준영','과장','W','2015-09-09',800000000);


-- 영구적으로 저장
COMMIT;

--  이전 커밋으로 복귀
--  ROLLBACK;

-- 수정/삭제를 위한 테스트 데이터 
INSERT INTO employee_tbl VALUES(NULL,1,'테스트','테스트부서','F',NOW(),234234);

-- 행 수정하기 
-- UPDATE테이블 SET 칼럼= 값,...WHERE;

UPDATE employee_tbl SET emp_name='코알라' WHERE emp_id=1005;
UPDATE employee_tbl SET salary=salary*1.5  ;

-- 행 삭제하기 
-- DELETE FROM 테이블 WHERE조건식;
-- 가능하면 pk를 조건으로 쓰는것이 좋은 코드이다. 
DELETE FROM employee_tbl WHERE emp_id>=1005;

ROLLBACK;

