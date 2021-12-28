-- ���� ���̺�
-- �����̸�, ���� ȸ��, ���� ����

create table snack(
	s_no number(4) primary key,
	s_name varchar2(10 char) not null,
	s_company varchar2(10 char) not null,
	s_price number(4) not null,
	
	s_exp date not null
);
--------------------------------------------------------------------------------------
-- DML (Data Manipulation Language) : ������ ���۾�
-- �����͸� �˻�, ����, ����, �����ϴµ� ���Ǵ� ����
-- Select, Insert, Update, Delete, ...
-- �ٿ��� CRUD!
-- C (Insert)
insert into [���̺��](�÷���, �÷Ÿ�, ...) values(��, ��, ..);

insert into snack(s_no, s_name, s_company, s_price) values (1, '��������', '������', 500);
-- => �÷����� ������ִ°� ��Ģ!

-- �÷� ������ �ٲ㼭 �ֱ�? - o
insert into snack(s_no, s_name, s_price, s_company) values (1, '���޴���', 500, '�Ե�');
-- => �÷� ������ ���缭 �����ָ� ����!

-- �÷��� ��� ���ϰ� ������� ���� �ֱ�! - o
insert into snack values (3, '����������', '�Ե�', 3500);
-- => ���̺� ������� �־��ֱ⸸ �ϸ� �÷��� �Ƚᵵ ��!

drop table snack cascade constraint purge;

-- 4~5�� �־�ô�!
insert into snack values(1, '����', '������', 500);
insert into snack values(2, '�ζ���', '����', 1500);
insert into snack values(3, 'Ȩ����', '����', 2500);
insert into snack values(4, '�������ݷ�', '�Ե�', 800);
select * from snack;
-- => �̰� ����µ� ��ȣ �����ϴ°� ������ �ʳ� �׷��� �Ʒ��� ����

-- Factory Pattern!
-- My SQL : Autoincrement �ɼ�
-- Oracle :  Sequence
--		��ȣ�� ������ �°� �ڵ����� �������ִµ�..
--		���̺���� �����ϰ�, insert�� �����ص� sequence ���� �ö�.

-- Sequence ����
create sequence ��������; -- �����ϰ� �����
create sequence snack_seq;
-- ��ȭó��, ���̺�� �ڿ� _seq�� �ٿ��ִ� ��ȭ�� ����

-- ��ü���� ������ (�̰� �׳� �ʱ��Ѱž�,, �����ϰ� �� ���� ����)
create sequence ��������
	increment by 1 -- ������(1�� ����)
	start with 1   -- ���۰�
	minValue 	   -- �ּҰ�
	maxValue 	   -- �ִ밪
	nocycle/cycle  -- �ִ밪�� �����ϸ� ���۰����� �ٽ� �ݺ� ����/����
	nocache/cache  -- �������� �̸� �������� �޸𸮿��� ������ ����/����
	noorder/order  -- n�� �ݺ�����/����
	;
-- sequence ����
drop sequence [��������];
drop sequence snack_seq;

-- sequence ���
insert into snack values(snack_seq.nextval, '��������', '�Ե�', 5000);
insert into snack values(snack_seq.nextval, '��������', '������', 5000);
insert into snack values(snack_seq.nextval, '������', '�Ե�', 800);
insert into snack values(snack_seq.nextval, '��Ϲ���Ĩ', '����', 3000);
insert into snack values(snack_seq.nextval, '��Ϲ���Ĩ(�̰ǽ���)', '����', 50000000);
insert into snack values(snack_seq.nextval, '���޴���', 'ũ���', 500);
-- 5���� �����ϸ� �� �������·� ������� ����!

select * from snack;

-- => ������ ���������� ���� insert ��ǰ�� ������ ��ȣ���� �浹�ϱ� ������ �ȵ��� ���·� �������� ��������!
-- => �ٵ� ������ insert �̹� �������� ���̺� ���� ������ ���� ��� �����ؾ���..

-- �ð� / ��¥
--	sysdate : ���ó�¥ / ����ð�
select sysdate from dual;

insert into snack values(snack_seq.nextval, '���޴��� �����', 'ũ���', 500, sysdate);

-- Ư���ð� / ��¥
--	�����Լ� - to_date('��', '����')
--		����(�빮��) - YYYY, MM, DD, AM/PM, HH, HH24(��õ), MI(��), SS(��)

insert into snack values(snack_seq.nextval, '���޴��� ������', 'ũ���', 500, to_date('2022-02-15 17', 'YYYY-MM-DD HH24')
);
-- ���� ������ ��! �־��ּ���! (�����ʹ� ������ �������� ����!)
insert into snack values(snack_seq.nextval, '����', '������', 1000, to_date('2022-02-15 17', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, 'Ȩ����', '����', 1500, to_date('2022-03-15 13', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '�ζ���', '����', 1000, to_date('2022-04-15 14', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '�ֹֽ�', '����', 400, to_date('2022-02-16 19', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '��Ĩ', 'ũ���', 1500, to_date('2022-02-17 21', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '���ڼ���', '������', 1000, to_date('2022-02-18 05', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, 'ĭ��', '�Ե�', 1000, to_date('2023-02-15 22', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '��¡����', '���', 1200, to_date('2022-06-15 11', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '����', '������', 4500, to_date('2022-02-13 16', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '���ĸ�', '���', 1300, to_date('2022-09-15 10', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '�ٳ���ű', '���', 1300, to_date('2022-12-18 07', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '������', '����', 3500, to_date('2022-07-14 02', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '������', '����', 2000, to_date('2022-05-10 01', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '��Ϲ���Ĩ', '����', 1500, to_date('2024-03-11 18', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '�����', '���', 1200, to_date('2022-11-16 05', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '��Ű', '����', 1500, to_date('2022-12-05 06', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '�ڰ���', '����', 1500, to_date('2023-10-04 23', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '��īĨ', '������', 1500, to_date('2022-08-01 12', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '������ ������', 'ũ���', 800, to_date('2025-06-27 10', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '�����', '����', 1000, to_date('2024-03-21 23', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, 'ī��Ÿ��', '������', 2500, to_date('2024-03-21 17', 'YYYY-MM-DD HH24')
);
select * from snack;
--------------------------------------------------------------------------------------------------------------------
-- ���� �����͸� ��ȸ�غ���!
-- R (Read)
select [distinct] [�÷���], [�÷��� as ��Ī || �÷��� ��Ī], [������ ���], [����Լ�], ...
	from [���̺��]
	where [���ǽ�]
	group by [�׷���]
	having [�Լ� ������ ����]
	order by [���Ĵ�� asc / desc(��������/��������)] -- �⺻���� ��������

-- �������̺� ��ü ��ȸ
select * from snack;
select s_company from snack;	-- ���� �������� ȸ�簪�� �����µ�,, �ߺ� �����ϰ�;�!
select distinct s_company from snack;	-- �ߺ� ���ŵǰ� �ϳ����� ������ ��!

-- ���� ����� �����ѵ�..
-- �÷��� ��ü�� s_price/100
--	-> �÷��� ��Ī�� �ο��ؼ� � ������ ���� ���̰� ���
select s_price / 100 from snack;

select s_price / 100 as price from snack;	-- �� ����� as �־ ��Ī �ο� ���1
select s_price / 100 price from snack;		-- �� ����� ���� �־ ��Ī �ο� ���2
--------------------------------------------------------------------------------------------------------------------
-- ������ (���������)
-- Dual ���̺�
--	1. ����Ŭ ��ü���� �����ϴ� �������̺�
--	2. �����ϰ� �Լ��� �̿��ؼ� ��� ������� Ȯ���� �� ���

-- ��κ��� ������ ���� �켱�ż� 13�̶�� ������� �����µ�
-- ����Ŭ������ �ݴ�� ���ڰ� �켱�� ��!
select 1 + '3' from dual;

-- ���ڸ� �������� -> ���� + ���ڰ� �ƴ� ���� => ����!
select 1 + 'a' from dual;

-- ���ڸ� �����ֱ� ���� ������ (||)
select '3' || 10 from dual;
--------------------------------------------------------------------------------------------------------------------

-- WHERE (���ǽ�)
-- ��ü ������ �� ������ ���ǿ� �´� �����͸� ã���ִ� ����
-- ���ǽĿ� ����� ������ (�� ������)
-- =, !=, ^=, <>, >, <, >=, <= , ...
-- 2��°�� 4��°�� ǥ��ȭ �ϱ� ���ؼ� ����
-- 3��°�� ����ȭ�� �α� ���ؼ� ����
-- => �ٵ� �츮�� 2��° ���ϱ� 2��°�� �˾Ƶֵ� ��!

-- ������ 3000���� ������ ��� ������ ��ȸ
select * from snack where s_price = 1000;

-- ��� ���� �̸�(����)���� ��ȸ (ex : ��Ĩ(2000)) + ���̺� ����� �̸�(����) ������
-- ��Ʈ) �̸�(����) �����ϸ� �ȳ���! -> "�̸�(����)" �����ؾ���
select s_name || '(' || s_price || '��)' as  "�̸�(����)" from snack;

-- 2000�� ������ ���� �߿��� �ּҰ����� ������
select MIN(s_price) from snack where s_price <= 2000;

-- ��� ������ ��հ��� ������
select round(AVG(s_price), 2) ��� from snack;

-- ������ �̸�, ������ 30% ���ε� �ݾ�
select s_name, s_price * 0.7 from snack;

-- 3000�� ������ ������ �̸�, ȸ���̸� ��ȸ
select s_name, s_company  from snack where s_price <= 3000;














