/* 
다대다 관계
두 엔티티 사이에 다대다 관계가 존재할 수 있다. 
예시 : 학생과 과목, 고객과 상품등 
다대다 관계는  직접 연결이 불가능하므로, 새로운 엔티티를 추가하여 2개의 일대다 관계로 구성한다. 
예시: 학생과 과목(학생 - 수강신청 - 과목), 고객과 상품 (고객 -구매내역 -상품) 
두개를 합쳐서 프라이머리키 만들떄? PRIMARY KEY(COL1,COL2)
*/

-- 학생 -- 수강신청 -- 과목

USE testdb;

DROP TABLE IF EXISTS tbl_student;
DROP TABLE IF EXISTS tbl_apply;
DROP TABLE IF EXISTS tbl_class;

CREATE TABLE IF NOT EXISTS tbl_student
(
    student_id VARCHAR(10) NOT NULL COMMENT'학번',
    student_name VARCHAR(10)COMMENT'이름',
    student_age TINYINT COMMENT'나이',
    CONSTRAINT pk_student PRIMARY KEY(student_id)
)ENGINE=INNODB COMMENT '학생';

CREATE TABLE IF NOT EXISTS tbl_class
(
    class_code VARCHAR(3) NOT NULL COMMENT'과목코드',
    class_name VARCHAR(10) COMMENT'과목명',
    class_professor VARCHAR(10) COMMENT '교수명',
    CONSTRAINT pk_class PRIMARY KEY(class_code)
)ENGINE=INNODB COMMENT '강좌';

CREATE TABLE IF NOT EXISTS tbl_apply
(
    student_id VARCHAR(10) NOT NULL COMMENT'학번',
    class_code VARCHAR(3) NOT NULL COMMENT'과목코드',
    CONSTRAINT pk_student PRIMARY KEY(student_id,class_code),
    CONSTRAINT fk_student_id FOREIGN KEY(student_id)REFERENCES tbl_student(student_id),
    CONSTRAINT fk_class_code FOREIGN KEY(class_code)REFERENCES tbl_class(class_code)
)ENGINE=INNODB COMMENT'수강테이블';




