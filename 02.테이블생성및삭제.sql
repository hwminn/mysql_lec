-- 스키마 선택하기 
USE testdb;
/* 
	테이블은 부모 테이블을 먼저 만들고, 자식 테이블을(FK를 가진테이블) 나중에 만든다. 
    테이블 삭제와 생성 순서는 항상 역순으로 작업한다. 
*/
-- 테이블 삭제하기 
DROP TABLE IF EXISTS tbl_order CASCADE; -- 참조 중인 테이블이 존재하면 함께삭제하는 CASCADE 옵션을 추가한다 
DROP TABLE IF EXISTS tbl_product CASCADE;

-- 테이블 만들기 
CREATE TABLE IF NOT EXISTS tbl_product
(
	prod_id INT           NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '제품코드',
    prod_name VARCHAR(20) NULL COMMENT'제품이름',
    price INT(5) COMMENT'제품가격',
    stock SMALLINT DEFAULT 0 COMMENT'제품재고'  
)ENGINE=INNODB COMMENT '제품'; 

CREATE TABLE IF NOT EXISTS tbl_order
(
	order_id INT NOT NULL AUTO_INCREMENT COMMENT'주문번호',
    order_user VARCHAR(20) COMMENT'주문자',
    prod_id INT COMMENT'제품번호',	  
    order_dt DATETIME DEFAULT NOW() COMMENT'주문일자',
    PRIMARY KEY(order_id),
    FOREIGN KEY(prod_id) REFERENCES tbl_product(prod_id)
)ENGINE=INNODB COMMENT'주문';

ALTER TABLE tbl_order AUTO_INCREMENT=1000;