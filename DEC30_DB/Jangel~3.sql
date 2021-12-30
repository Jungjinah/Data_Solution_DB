[DEC30_3]

DROP TABLE MARKET;
DROP SEQUENCE MARKET_SEQ;
CREATE TABLE MARKET(
    M_NO NUMBER(4) PRIMARY KEY,
    M_NAME VARCHAR2(10 CHAR) NOT NULL,
    M_LOCATION VARCHAR2(10 CHAR) NOT NULL,
    M_LAND NUMBER(4) NOT NULL,      -- �� ������ ���
    M_PARKING NUMBER(4) NOT NULL    -- ���� ������ ���
);

CREATE SEQUENCE MARKET_SEQ;
INSERT INTO MARKET VALUES(MARKET_SEQ.NEXTVAL, 'Ȩ�÷���', '����', 1000, 500);
INSERT INTO MARKET VALUES(MARKET_SEQ.NEXTVAL, 'Ȩ�÷���', '��õ', 500, 300);
INSERT INTO MARKET VALUES(MARKET_SEQ.NEXTVAL, '�̸�Ʈ', '����', 800, 800);
--------------------------------------------------------------------------------
DROP TABLE PRODUCT;
DROP SEQUENCE PRODUCT_SEQ;
CREATE TABLE PRODUCT(
    P_NO VARCHAR2(10 CHAR) PRIMARY KEY,
    P_NAME VARCHAR2(10 CHAR) NOT NULL,
    P_WEIGHT NUMBER(4) NOT NULL,
    P_PRICE NUMBER(5) NOT NULL,
    P_M_NO NUMBER(4) NOT NULL,
    CONSTRAINT FK_P_M_NO FOREIGN KEY(P_M_NO)
    REFERENCES MARKET(M_NO)
    ON DELETE CASCADE
);

CREATE SEQUENCE PRODUCT_SEQ;

INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, '����', 3000, 10000, 1);
INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, '��', 500, 5000, 2);
INSERT INTO PRODUCT VALUES(PRODUCT_SEQ.NEXTVAL, '����', 2000, 5000, 3);

-- U(UPDATAE)
UPDATE [���̺��]
SET �ʵ�� = ��, �ʵ�� = ��, ... -- �ٲ� ����
WHERE ����;
-- Ȩ�÷��� ��õ���� ��ǰ ���� 10% ����
UPDATE PRODUCT
    SET P_PRICE = P_PRICE * 0.9
        WHERE P_M_NO IN (
            SELECT M_NO
            FROM MARKET
            WHERE M_NAME = 'Ȩ�÷���' AND M_LOCATION = '��õ'
        );

-- ���� ��Ѱ� 10%����
UPDATE PRODUCT
    SET P_PRICE = P_PRICE * 0.9
        WHERE  P_PRICE = (
        SELECT MAX(P_PRICE)
        FROM PRODUCT
    );
------------------------------------
-- D(DELETE)
DELETE FROM [���̺��]
WHERE ���ǽ�;
-- ���� ���� ���� ��ǰ �� ����
DELETE FROM PRODUCT
    WHERE P_M_NO IN (
        SELECT M_NO
        FROM MARKET
        WHERE M_LAND IN (
            SELECT MIN(M_LAND)
            FROM MARKET
        )
    );
SELECT * FROM MARKET;
SELECT * FROM PRODUCT;




