-- 사용자 추가 형식
-- CREATE USER '사용자'@'호스트' IDENTIFIED BY '비밀번호';
-- 호스트
-- localhost : 내부 접근
-- %         : 외부 접근
-- 1.1.1.1   : 특정 IP 에서만 접근

-- greenit 계정 만들기
CREATE USER 'greenit'@'%' IDENTIFIED BY 'greenit';

-- 스키마 확인 (데이터베이스 확인)
SHOW DATABASES;

-- mysql 스키마 사용 (기본 스키마)
USE mysql;

-- greenit 사용자 확인하기
SELECT * FROM user;  -- 사용자 정보가 저장된 user 테이블 조회하기

-- testdb 스키마 만들기 (MySQL 에서는 스키마와 데이터베이스가 같은 개념으로 사용된다.)
-- CREATE DATABASE 데이터베이스명;
-- CREATE SCHEMA 스키마명;
CREATE DATABASE testdb;

-- 스키마 생성 후 왼쪽 Navigator 창에서 새로고침 클릭하면 추가된 스키마를 확인할 수 있다.

-- greenit 사용자에게 권한 부여하기
-- GRANT 권한종류 PRIVILEGES ON 스키마.객체 TO '사용자'@'호스트';
GRANT ALL PRIVILEGES ON testdb.* TO 'greenit'@'%';  -- testdb 스키마의 모든 객체 사용 권한을 부여함

-- greenit 사용자의 권한 확인하기
SHOW GRANTS FOR 'greenit'@'%';