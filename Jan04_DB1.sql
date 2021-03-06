-- JAN04_1_DB_AIR

-- 측정일시, 지역, 미세먼지, 초미세먼지농도, 오존, 통합대기환경등급

DROP TABLE AIR;
DROP SEQUENCE AIR_SEQ;

CREATE TABLE AIR (
    A_NO NUMBER(4) PRIMARY KEY,
    A_MSRDT DATE NOT NULL,
    A_MSRSTE_NM VARCHAR2(10 CHAR) NOT NULL,
    A_PM10 NUMBER(3) NOT NULL,
    A_PM25 NUMBER(3) NOT NULL,
    A_O3 NUMBER(4,3) NOT NULL,
    A_IDEX_NM VARCHAR2(10 CHAR) NOT NULL
);

CREATE SEQUENCE AIR_SEQ;
SELECT * FROM AIR;