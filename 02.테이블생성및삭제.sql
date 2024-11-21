-- 스키마 선택하기 
USE testdb;

-- 테이블 삭제하기 
DROP TABLE IF EXISTS tbl_product;
-- 테이블 만들기 
CREATE TABLE IF NOT EXISTS tbl_product
(
	prod_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '제품코드',
    prod_name VARCHAR(20) NULL COMMENT'제품이름',
    price INT COMMENT'제품가격',
    stock SMALLINT DEFAULT 0 COMMENT'제품재고'  
)ENGINE=INNODB COMMENT '제품'; 
