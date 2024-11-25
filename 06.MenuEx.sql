-- root 계정으로 접속하기
-- greenit 계정에 db_menu 데이터베이스 사용 권한 부여하기
-- GRANT ALL PRIVILEGES ON db_menu.* TO 'greenit'@'%';

-- greenit 계정으로 접속하기
DROP DATABASE IF EXISTS db_menu;
CREATE DATABASE IF NOT EXISTS db_menu;
USE db_menu;

-- 테이블 삭제
DROP TABLE IF EXISTS tbl_payment_order;
DROP TABLE IF EXISTS tbl_payment;
DROP TABLE IF EXISTS tbl_order_menu;
DROP TABLE IF EXISTS tbl_order;
DROP TABLE IF EXISTS tbl_menu;
DROP TABLE IF EXISTS tbl_category;

-- 테이블 생성
CREATE TABLE IF NOT EXISTS tbl_category
(
    category_code     INT NOT NULL AUTO_INCREMENT COMMENT '카테고리코드',
    category_name     VARCHAR(30) NOT NULL COMMENT '카테고리명',
    ref_category_code INT COMMENT '상위카테고리코드',
    CONSTRAINT pk_category PRIMARY KEY(category_code),
    CONSTRAINT fk_ref_category FOREIGN KEY(ref_category_code) REFERENCES tbl_category(category_code)
) ENGINE=InnoDB COMMENT '카테고리';


CREATE TABLE IF NOT EXISTS tbl_menu
(
    menu_code        INT NOT NULL AUTO_INCREMENT COMMENT '메뉴코드',
    menu_name        VARCHAR(30) NOT NULL COMMENT '메뉴명',
    menu_price       INT NOT NULL COMMENT '메뉴가격',
    category_code    INT NOT NULL COMMENT '카테고리코드',
    orderable_status CHAR(1) NOT NULL COMMENT '주문가능상태',
    CONSTRAINT pk_menu PRIMARY KEY(menu_code),
    CONSTRAINT fk_menu_category FOREIGN KEY(category_code) REFERENCES tbl_category (category_code)
) ENGINE=InnoDB COMMENT '메뉴';

CREATE TABLE IF NOT EXISTS tbl_order
(
    order_code        INT NOT NULL AUTO_INCREMENT COMMENT '주문코드',
    order_date        VARCHAR(8) NOT NULL COMMENT '주문일자',
    order_time        VARCHAR(8) NOT NULL COMMENT '주문시간',
    total_order_price INT NOT NULL COMMENT '총주문금액',
    CONSTRAINT pk_order PRIMARY KEY(order_code)
) ENGINE=InnoDB COMMENT '주문';

CREATE TABLE IF NOT EXISTS tbl_order_menu
(
    order_code   INT NOT NULL COMMENT '주문코드',
    menu_code    INT NOT NULL COMMENT '메뉴코드',
    order_amount INT NOT NULL COMMENT '주문수량',
    CONSTRAINT pk_ordermenu PRIMARY KEY(order_code, menu_code),
    CONSTRAINT fk_ordermenu_order FOREIGN KEY (order_code) REFERENCES tbl_order(order_code),
    CONSTRAINT fk_ordermenu_menu FOREIGN KEY (menu_code) REFERENCES tbl_menu(menu_code)
) ENGINE=InnoDB COMMENT '주문별메뉴';

CREATE TABLE IF NOT EXISTS tbl_payment
(
    payment_code  INT NOT NULL AUTO_INCREMENT COMMENT '결제코드',
    payment_date  VARCHAR(8) NOT NULL COMMENT '결제일',
    payment_time  VARCHAR(8) NOT NULL COMMENT '결제시간',
    payment_price INT NOT NULL COMMENT '결제금액',
    payment_type  VARCHAR(6) NOT NULL COMMENT '결제구분',
    CONSTRAINT pk_payment PRIMARY KEY(payment_code)
) ENGINE=InnoDB COMMENT '결제';

CREATE TABLE IF NOT EXISTS tbl_payment_order
(
    order_code   INT NOT NULL COMMENT '주문코드',
    payment_code INT NOT NULL COMMENT '결제코드',
    CONSTRAINT pk_paymentorder PRIMARY KEY(order_code, payment_code),
    CONSTRAINT fk_order_paymentorder FOREIGN KEY(order_code) REFERENCES tbl_order(order_code),
    CONSTRAINT fk_payment_paymentorder FOREIGN KEY(order_code) REFERENCES tbl_payment(payment_code)
) ENGINE=InnoDB COMMENT '결제별주문';

-- 데이터 삽입
INSERT INTO tbl_category VALUES (null, '식사', null);
INSERT INTO tbl_category VALUES (null, '음료', null);
INSERT INTO tbl_category VALUES (null, '디저트', null);
INSERT INTO tbl_category VALUES (null, '한식', 1);
INSERT INTO tbl_category VALUES (null, '중식', 1);

INSERT INTO tbl_category VALUES (null, '일식', 1);
INSERT INTO tbl_category VALUES (null, '퓨전', 1);
INSERT INTO tbl_category VALUES (null, '커피', 2);
INSERT INTO tbl_category VALUES (null, '쥬스', 2);
INSERT INTO tbl_category VALUES (null, '기타', 2);

INSERT INTO tbl_category VALUES (null, '동양', 3);
INSERT INTO tbl_category VALUES (null, '서양', 3);

INSERT INTO tbl_menu VALUES (null, '열무김치라떼', 4500, 8, 'Y');
INSERT INTO tbl_menu VALUES (null, '우럭스무디', 5000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '생갈치쉐이크', 6000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '갈릭미역파르페', 7000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '앙버터김치찜', 13000, 4, 'N');

INSERT INTO tbl_menu VALUES (null, '생마늘샐러드', 12000, 4, 'Y');
INSERT INTO tbl_menu VALUES (null, '민트미역국', 15000, 4, 'Y');
INSERT INTO tbl_menu VALUES (null, '한우딸기국밥', 20000, 4, 'Y');
INSERT INTO tbl_menu VALUES (null, '홍어마카롱', 9000, 12, 'Y');
INSERT INTO tbl_menu VALUES (null, '코다리마늘빵', 7000, 12, 'N');

INSERT INTO tbl_menu VALUES (null, '정어리빙수', 10000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '날치알스크류바', 2000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '직화구이젤라또', 8000, 12, 'Y');
INSERT INTO tbl_menu VALUES (null, '과메기커틀릿', 13000, 6, 'Y');
INSERT INTO tbl_menu VALUES (null, '죽방멸치튀김우동', 11000, 6, 'N');

INSERT INTO tbl_menu VALUES (null, '흑마늘아메리카노', 9000, 8, 'Y');
INSERT INTO tbl_menu VALUES (null, '아이스가리비관자육수', 6000, 10, 'Y');
INSERT INTO tbl_menu VALUES (null, '붕어빵초밥', 35000, 6, 'Y');
INSERT INTO tbl_menu VALUES (null, '까나리코코넛쥬스', 9000, 9, 'Y');
INSERT INTO tbl_menu VALUES (null, '마라깐쇼한라봉', 22000, 5, 'N');

INSERT INTO tbl_menu VALUES (null, '돌미나리백설기', 5000, 11, 'Y');

COMMIT;