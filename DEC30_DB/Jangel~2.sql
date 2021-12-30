-- [DEC30_2]

-- JOIN
-- 하나의 명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 기능
-- 마치 하나의 테이블인것처럼 보여주는 것!

CREATE TABLE TB1( NAME VARCHAR2(20 CHAR), AGE NUMBER(3) );
CREATE TABLE TB2( NAME VARCHAR2(20 CHAR), AGE NUMBER(3) );

INSERT INTO TB1 VALUES('김비버', 30);
INSERT INTO TB1 VALUES('박비버', 35);
INSERT INTO TB1 VALUES('최비버', 40);
INSERT INTO TB1 VALUES('오비버', 40);

INSERT INTO TB2 VALUES('김비버', 30);
INSERT INTO TB2 VALUES('이비버', 50);
INSERT INTO TB2 VALUES('정비버', 55);
--------------------------------------------------------------------------------
[JOIN 종류]

-- CROSS JOIN : 별도의 조건 없이 두 테이블 간의 가능한 모~든 결과를 조회 (모든 경우의 수)
-- 사실상 안쓰는 조인
SELECT * FROM TB1, TB2;
SELECT * FROM TB1 CROSS JOIN TB2;

-- INNEER JOIN : 조건에 해당하는 값만 나옴 - WHERE 절이얌
SELECT * FROM TB1 INNER JOIN TB2 ON TB1.NAME = TB2.NAME;  
SELECT * FROM TB1 A, TB2 B WHERE A.NAME = B.NAME;    -- EQUI 조인 (동등조인) / A B 별칭부여
SELECT * FROM TB1 JOIN TB2 USING (NAME);             -- EQUI 조인 JOIN ~ USING(조인대상컬럼명)
SELECT * FROM TB1 NATURAL JOIN TB2; -- 자연조인, 조건절 없이 양쪽에 같은 이름을 가진 동일한 컬럼만을 조회

-- OUTER JOIN : 기준 테이블의 데이터가 모두 조회(누락 없이)되고,
--              대상 테이블에 데이터가 있을 경우에 해당 컬럼의 값을 가져오기 위해서 사용!
-- (+)를 이용한 OUTER JOIN : NULL이 출력되는 테이블의 컬럼에 (+) 기호 추가

--      LEFT OUTER JOIN : 왼쪽 테이블에 값이 있을시 오른쪽 테이블이 조건에 맞지 않아도 값이 나옴 (조건에 맞지 않으면 NULL)
SELECT * FROM TB1 LEFT OUTER JOIN TB2 ON TB1.NAME = TB2.NAME;
SELECT * FROM TB1, TB2 WHERE TB1.NAME = TB2.NAME(+);
--      RIGHT OUTER JOIN : 오른쪽 테이블에 값이 있을시 왼쪽 테이블이 조건에 맞지 않아도 값이 나옴 (조건에 맞지 않으면 NULL)
SELECT * FROM TB1 RIGHT OUTER JOIN TB2 ON TB1.NAME = TB2.NAME;
SELECT * FROM TB1, TB2 WHERE TB1.NAME(+) = TB2.NAME;
--      FULL OUTER JOIN : 한쪽 테이블에 값이 있을 시 다른 쪽 테이블이 조건에 맞지 않아도 값이 나옴
SELECT * FROM TB1 FULL OUTER JOIN TB2 ON TB1.NAME = TB2.NAME;

-- SELF JOIN ** 헷갈림!
--  하나의 테이블내에 있는 컬럼끼리 연결하는 조인이 필요한 경우
--  단어 뜻대로 스스로 JOIN 한다!

CREATE TABLE MEMBERR(
    M_ID VARCHAR2(10 CHAR) PRIMARY KEY,
    M_NAME VARCHAR2(10 CHAR) NOT NULL,
    M_MANAGER VARCHAR2(10 CHAR)     -- 관리자는 관리를 안받으니 제약조건 X
);

INSERT INTO MEMBERR VALUES('MEMBER1', '회원1', 'MANAGER1');
INSERT INTO MEMBERR VALUES('MEMBER2', '회원2', 'MANAGER1');
INSERT INTO MEMBERR VALUES('MEMBER3', '회원3', 'MANAGER1');
INSERT INTO MEMBERR VALUES('MEMBER4', '회원4', 'MANAGER2');
INSERT INTO MEMBERR VALUES('MEMBER5', '회원5', 'MANAGER2');
INSERT INTO MEMBERR VALUES('MANAGER1', '관리자1', 'NULL');
INSERT INTO MEMBERR VALUES('MANAGER2', '관리자2', 'NULL');

-- 이 테이블 내에서 각 관리자가 어떤 회원을 관리하는지 알고 싶음
SELECT M_ID, M_NAME, M_MANAGER FROM MEMBERR
    WHERE M_MANAGER IN (SELECT M_ID FROM MEMBERR);

SELECT * FROM MEMBERR A JOIN MEMBERR B
    ON A.M_ID = B.M_ID;

SELECT A.M_ID, A.M_NAME, B.M_ID "MEMBER_ID"
    FROM MEMBERR A JOIN MEMBERR B   -- 같은 테이블이지만 셀프조인을 하기 위해서 테이블에 각각 별칭을 달아줌
    ON A.M_ID = B.M_MANAGER;        -- 계정 ID와 관리자 계정이 같은
                                    -- 값들을 연결해서 관리자가 관리하는 회원 ID값을 가져올 수 있게!






