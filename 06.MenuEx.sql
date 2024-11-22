DROP DATABASE IF EXISTS db_menu;
CREATE DATABASE IF NOT EXISTS db_menu;

USE db_menu;

DROP TABLE IF EXISTS tbl_category;
DROP TABLE IF EXISTS tbl_menu;
DROP TABLE IF EXISTS tbl_order_menu;
DROP TABLE IF EXISTS tbl_order;
DROP TABLE IF EXISTS tbl_payment_order;
DROP TABLE IF EXISTS tbl_payment;

CREATE TABLE IF NOT EXISTS tbl_category
(
    category_code INT NOT NULL COMMENT'카테고리코드',
    category_name VARCHAR(30)COMMENT'카테고리명',
    ref_category_code INT,
    CONSTRAINT pk_category PRIMARY KEY(category_code),
    CONSTRAINT fk_category_category FOREIGN KEY(ref_category_code) REFERENCES tbl_category(category_code)
)ENGINE=INNODB COMMENT'카테고리';

CREATE TABLE IF NOT EXISTS tbl_menu
(
    menu_code INT NOT NULL COMMENT'메뉴코드',
    menu_name VARCHAR(30) COMMENT'메뉴명',
    menu_price INT COMMENT'메뉴가격',
    orderable_status CHAR(1) COMMENT'주문상태가능',
    category_code INT COMMENT'카테고리코드',
    CONSTRAINT pk_menu PRIMARY KEY(menu_code),
    CONSTRAINT fk_menu FOREIGN KEY(category_code) REFERENCES tbl_category(category_code)
)ENGINE=INNODB COMMENT'메뉴';

CREATE TABLE IF NOT EXISTS tbl_order
(
    order_code INT NOT NULL COMMENT '주문코드',
    order_date VARCHAR(8) COMMENT '주문일자',
    order_time VARCHAR(8) COMMENT '주문시간',
    total_order_price INT COMMENT '총주문금액',
    CONSTRAINT pk_order PRIMARY KEY(order_code)
)ENGINE=INNODB COMMENT'주문';

CREATE TABLE IF NOT EXISTS tbl_order_menu
(
    menu_code INT COMMENT'메뉴코드',
    order_code INT COMMENT'주문코드',
    order_amount INT COMMENT'주문수량',
    CONSTRAINT pk_order_menu PRIMARY KEY(menu_code,order_code),
    -- PRIMARY 면서 FOREIGN인데 NOT NULL 을 처리해야하는지? 
    CONSTRAINT fk_menu_code FOREIGN KEY(menu_code) REFERENCES tbl_menu(menu_code),
    CONSTRAINT fk_order_code FOREIGN KEY(order_code) REFERENCES tbl_order(order_code)
)ENGINE=INNODB COMMENT'주문메뉴';

CREATE TABLE IF NOT EXISTS tbl_payment
(
    payment_code INT NOT NULL COMMENT '결제코드',
    payment_date VARCHAR(8) COMMENT'결제일',
    payment_time VARCHAR(8) COMMENT'결제시간',
    payment_price INT COMMENT '결제금액',
    payment_type VARCHAR(8) COMMENT'결제구분',
    CONSTRAINT pk_payment PRIMARY KEY(payment_code)
)ENGINE=INNODB COMMENT'결제';



CREATE TABLE IF NOT EXISTS tbl_payment_order
(
    order_code INT COMMENT'주문코드',
    payment_code INT COMMENT'결제코드',
    CONSTRAINT pk_payment_order PRIMARY KEY(order_code,payment_code),
    CONSTRAINT fk_order_code2 FOREIGN KEY(order_code) REFERENCES tbl_order(order_code),
    CONSTRAINT fk_payment_code FOREIGN KEY(payment_code) REFERENCES tbl_payment(payment_code)
)ENGINE=INNODB COMMENT'주문결제';



