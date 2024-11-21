
USE testdb;

DROP TABLE IF EXISTS bank_tbl CASCADE;
DROP TABLE IF EXISTS customer_tbl CASCADE;

CREATE TABLE IF NOT EXISTS bank_tbl
(
    bank_id VARCHAR(20) NOT NULL PRIMARY KEY,
    bank_name VARCHAR(30) NOT NULL
)ENGINE INNODB COMMENT '은행';


CREATE TABLE IF NOT EXISTS customer_tbl
(
    cust_id VARCHAR(20) NOT NULL,
    cust_name VARCHAR(30) NOT NULL,
    phone VARCHAR(30),
    age SMALLINT(3),
    bank_id VARCHAR(20),
    PRIMARY KEY(cust_id),
    FOREIGN KEY(bank_id) REFERENCES bank_tbl(bank_id)

)ENGINE INNODB COMMENT'고객';