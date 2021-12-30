-- [DEC30_2]

-- JOIN
-- �ϳ��� ��ɹ��� ���� ���� ���̺� ����� �����͸� �ѹ��� ��ȸ�� �� �ִ� ���
-- ��ġ �ϳ��� ���̺��ΰ�ó�� �����ִ� ��!

CREATE TABLE TB1( NAME VARCHAR2(20 CHAR), AGE NUMBER(3) );
CREATE TABLE TB2( NAME VARCHAR2(20 CHAR), AGE NUMBER(3) );

INSERT INTO TB1 VALUES('����', 30);
INSERT INTO TB1 VALUES('�ں��', 35);
INSERT INTO TB1 VALUES('�ֺ��', 40);
INSERT INTO TB1 VALUES('�����', 40);

INSERT INTO TB2 VALUES('����', 30);
INSERT INTO TB2 VALUES('�̺��', 50);
INSERT INTO TB2 VALUES('�����', 55);
--------------------------------------------------------------------------------
[JOIN ����]

-- CROSS JOIN : ������ ���� ���� �� ���̺� ���� ������ ��~�� ����� ��ȸ (��� ����� ��)
-- ��ǻ� �Ⱦ��� ����
SELECT * FROM TB1, TB2;
SELECT * FROM TB1 CROSS JOIN TB2;

-- INNEER JOIN : ���ǿ� �ش��ϴ� ���� ���� - WHERE ���̾�
SELECT * FROM TB1 INNER JOIN TB2 ON TB1.NAME = TB2.NAME;  
SELECT * FROM TB1 A, TB2 B WHERE A.NAME = B.NAME;    -- EQUI ���� (��������) / A B ��Ī�ο�
SELECT * FROM TB1 JOIN TB2 USING (NAME);             -- EQUI ���� JOIN ~ USING(���δ���÷���)
SELECT * FROM TB1 NATURAL JOIN TB2; -- �ڿ�����, ������ ���� ���ʿ� ���� �̸��� ���� ������ �÷����� ��ȸ

-- OUTER JOIN : ���� ���̺��� �����Ͱ� ��� ��ȸ(���� ����)�ǰ�,
--              ��� ���̺� �����Ͱ� ���� ��쿡 �ش� �÷��� ���� �������� ���ؼ� ���!
-- (+)�� �̿��� OUTER JOIN : NULL�� ��µǴ� ���̺��� �÷��� (+) ��ȣ �߰�

--      LEFT OUTER JOIN : ���� ���̺� ���� ������ ������ ���̺��� ���ǿ� ���� �ʾƵ� ���� ���� (���ǿ� ���� ������ NULL)
SELECT * FROM TB1 LEFT OUTER JOIN TB2 ON TB1.NAME = TB2.NAME;
SELECT * FROM TB1, TB2 WHERE TB1.NAME = TB2.NAME(+);
--      RIGHT OUTER JOIN : ������ ���̺� ���� ������ ���� ���̺��� ���ǿ� ���� �ʾƵ� ���� ���� (���ǿ� ���� ������ NULL)
SELECT * FROM TB1 RIGHT OUTER JOIN TB2 ON TB1.NAME = TB2.NAME;
SELECT * FROM TB1, TB2 WHERE TB1.NAME(+) = TB2.NAME;
--      FULL OUTER JOIN : ���� ���̺� ���� ���� �� �ٸ� �� ���̺��� ���ǿ� ���� �ʾƵ� ���� ����
SELECT * FROM TB1 FULL OUTER JOIN TB2 ON TB1.NAME = TB2.NAME;

-- SELF JOIN ** �򰥸�!
--  �ϳ��� ���̺��� �ִ� �÷����� �����ϴ� ������ �ʿ��� ���
--  �ܾ� ���� ������ JOIN �Ѵ�!

CREATE TABLE MEMBERR(
    M_ID VARCHAR2(10 CHAR) PRIMARY KEY,
    M_NAME VARCHAR2(10 CHAR) NOT NULL,
    M_MANAGER VARCHAR2(10 CHAR)     -- �����ڴ� ������ �ȹ����� �������� X
);

INSERT INTO MEMBERR VALUES('MEMBER1', 'ȸ��1', 'MANAGER1');
INSERT INTO MEMBERR VALUES('MEMBER2', 'ȸ��2', 'MANAGER1');
INSERT INTO MEMBERR VALUES('MEMBER3', 'ȸ��3', 'MANAGER1');
INSERT INTO MEMBERR VALUES('MEMBER4', 'ȸ��4', 'MANAGER2');
INSERT INTO MEMBERR VALUES('MEMBER5', 'ȸ��5', 'MANAGER2');
INSERT INTO MEMBERR VALUES('MANAGER1', '������1', 'NULL');
INSERT INTO MEMBERR VALUES('MANAGER2', '������2', 'NULL');

-- �� ���̺� ������ �� �����ڰ� � ȸ���� �����ϴ��� �˰� ����
SELECT M_ID, M_NAME, M_MANAGER FROM MEMBERR
    WHERE M_MANAGER IN (SELECT M_ID FROM MEMBERR);

SELECT * FROM MEMBERR A JOIN MEMBERR B
    ON A.M_ID = B.M_ID;

SELECT A.M_ID, A.M_NAME, B.M_ID "MEMBER_ID"
    FROM MEMBERR A JOIN MEMBERR B   -- ���� ���̺������� ���������� �ϱ� ���ؼ� ���̺� ���� ��Ī�� �޾���
    ON A.M_ID = B.M_MANAGER;        -- ���� ID�� ������ ������ ����
                                    -- ������ �����ؼ� �����ڰ� �����ϴ� ȸ�� ID���� ������ �� �ְ�!






