USE testdb;

DROP TABLE IF EXISTS tbl_customer ;
DROP TABLE IF EXISTS tbl_bank ;

CREATE TABLE IF NOT EXISTS tbl_bank
(
    bank_id   VARCHAR(20) NOT NULL COMMENT '은행코드',
    bank_name VARCHAR(30) COMMENT '은행명',
    CONSTRAINT pk_bank PRIMARY KEY(bank_id)
) ENGINE=INNODB COMMENT '은행';

CREATE TABLE IF NOT EXISTS tbl_customer
(
    cust_id   INT NOT NULL AUTO_INCREMENT COMMENT '고객코드',
    cust_name VARCHAR(30) NOT NULL COMMENT '고객명',
    phone     VARCHAR(30) UNIQUE COMMENT '고객전화번호',
    age       SMALLINT CHECK(age BETWEEN 0 AND 100) COMMENT '고객나이',
    bank_id   VARCHAR(20) COMMENT '은행코드',
    CONSTRAINT pk_customer PRIMARY KEY(cust_id),
    CONSTRAINT fk_bank_customer FOREIGN KEY(bank_id) REFERENCES tbl_bank(bank_id)
) ENGINE=INNODB COMMENT '고객';