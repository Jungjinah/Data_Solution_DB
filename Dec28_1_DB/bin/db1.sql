-- [�ɼ�]
-- ��������(Costraint)�̶�� �θ�
-- ������ ���Ἲ�� �����ϱ� ���ؼ� ���
--		������ ���Ἲ : �����ͺ��̽��� ����� �������� �ϰ���, ��Ȯ���� ��Ű�� ��
-- 1. ������ ���Ἲ ��������
--		������ ����(Domain Constraint)�̶�� �ϸ�,
--		�����̼� ���� Ʃ�õ��� �����ο� ������ ���� �������Ѵٴ� ����
--		�ڷ���(type), ��(null / not null), �⺻��(default), üũ(check)
-- 2. ��ü ���Ἲ ��������
--		�⺻Ű ����(Primary Key Constraint)�̶�� ��
--		�����̼��� �⺻Ű�� �����ϰ�, NULL���� �������� �ȵǸ�,
--		�����̼� ���� ���� �ϳ��� ���� �����ؾ� �Ѵٴ� ����
-- 3. ���� ���Ἲ ��������
--		�ܷ�Ű ����(Foreign Key Constraint)�̶�� ��
--		���� �޴� �����̼��� �ܷ�Ű�� �����ϴ� �����̼��� �⺻Ű�� �������� �����ؾ� �ϸ�,
--		���� �޴� �����̼��� ���� ����� ��, �����ϴ� �����̼��� ������ �޴´�

-- => not null / primary key / foreign key

-- 1. NOT NULL : (null�� ���� ����ִ� / 0�� �ƴϰ� ���⵵ �ƴ� ���� ���� ���� ����)
--			NULL�� ������� �ʴ´� -> �ʼ������� ���� �־����!(���� ���� ��� O)
-- [2���� ����]
create table example(
	coll varchar2(10 char),
	coll varchar2(10 char) not null
);

-- constraint Ű���带 ����ؼ� �������Ǹ��� ���� �ο���
create table example2(
	coll varchar2(10 char),
	coll varchar2(10 char)
	constraint col2_notnull not null
);
-- constraint Ű���� �Ἥ ����� ������ �⺻Ű �� �� ����!

-- 2. Unique : �ش� �÷��� ���� ���� ���̺� ��ü���� �����ؾ� �Ѵ�!�� �ǹ� (������ü�� �˾Ƶ�,,)
--		Not null�� �Բ� ����� ����������, unique�� �� ������ ����
create table example3(
	col1 varchar2(10 char) unique,
	col2 varchar2(10 char) unique not null, /* not null�� �Բ� �ο� */
	col1 varchar2(10 char)
	constraint col3_unique unique(col3)
);

-- 3. Primary key(�⺻ Ű) : Null�� ������� �ʰ�, �ߺ��� �����͸� ������� ����.
--							(not null 	   + 		unique 		= primary key)
-- �������� Ư�� ������ �˻��ϰų�, ���� ���� �۾��� �� �� �⺻Ű�� �����Ѵ�.
-- ex) ID, �ֹε�Ϲ�ȣ, ȸ����ȣ, �� ��ȣ, ...
-- �������̸� �� ���̺� �� PK�� �ϳ�������..!
create table example4(
	col1 varchar2(10 char) primary key,
	col2 varchar2(10 char),
	col3 varchar2(10 char)
);

/* PK�� 2�� �̻� ����ϴ� ��� constraint Ű���� ��� */
crate table example5(
	col1 varchar2(10 char),
	col2 varchar2(10 char),
	col3 varchar2(10 char)
	constraint pk_example5 primary key(col1, col2)
);

-- 4. foreign key(�ܷ� Ű) : �ٸ� ���̺��� Ư�� �÷��� ��ȸ�ؼ�
--						   ������ �����Ͱ� �ִ� ��쿡�� �Է�, ����, ... ����!
-- �����ϴ�(�ΰ� �����) ���̺��� PK�� unique�� ������ �÷����� FK�� ������ �� �ִ�
-- �ܷ�Ű ������ ���ؼ��� �����޴� �÷��� ���� �����Ǿ�� �ϰ�,
--		�ܷ�Ű�� ���� ���̺��� ���Ŀ� �����Ǿ�� ��!

-- �ܷ�Ű ���̺� ����
create table ���̺��(
	�÷��� �ڷ���,
	constraint FK�� foreign key(�÷���)
		references ������̺��(������̺��� �⺻Ű( OR ����Ű) �÷���)
		[on delete set null || on delete cascade] -- (���� �ɼ��̾�)
		-- �����ϴ� ���̺��� �� �κ��� ������ ��,
		-- �� ���̺��� ����Ǿ� �ִ� �࿡ ���ؼ� null���� ������
		-- �ƴϸ� ���� �������� ���� �ɼ�
);

-- �ܷ�Ű ����1
create table example6(
	col1 varchar2(10 char) primary key
);
insert into example6 values('10');
insert into example6 values('20');
insert into example6 values('30');
select * from EXAMPLE6;

create table example7(
	col1 varchar2(10 char),
	constraint fk_col1 foreign key(col1)
		references EXAMPLE6(col1)
		on delete cascade
);
insert into example7 values('10');
insert into example7 values('20');
insert into example7 values('30');
insert into example7 values('40'); -- example6���� 40�̶�� ���� �����Ƿ� �ܷ�Ű�� ������ �ʴ� ��Ȳ!
select * from example7;
-- example6�� '10'�� ���� ����� ��� �ɱ�?
delete from example6 where col1 = '10'; -- examle7�� '10'�� ���� �ܷ�Ű �ȸ����� ��Ȳ ��!

-- �ܷ�Ű ����2
-- �а� ���̺�� �̰��� �����ϴ� �л� ���̺��� ������.
-- �а����̺� : �а��ڵ�(4�ڸ� ����), �а���
-- �л����̺� : �л� ��ȣ(3�ڸ� ����), �л� �̸�, �а��ڵ�
-- �а����̺��� �а� �ڵ带 ����� �л������� ��������

create table major1(
	m_code number(4) primary key,
	m_name varchar2(10 char) not null	-- ���� �����ϸ� �� �־��� ��� ���� �־� 'not null'�������
);										-- ���, not null�� ������ ������ ���� �־������ 

insert into major1 values(1001, '��ǻ�Ͱ��а�');
insert into major1 values(2001, '�����а�');
insert into major1 values(3001, '����濵���а�');
select * from major1;

create table student(
	s_number number(3) primary key,				
	s_name varchar2(10 char) not null,			
	s_code number(4),							
	constraint fk_student foreign key(s_code)	-- �ܷ�Ű�� �̿��Ͽ� �����غ��� ���� constraint ���
		references major1(m_code)				
		on delete cascade						-- foreignŰ ���� ���� ����ڴ�! �� ��,,
);

insert into student values(101, '����', 1001);
insert into student values(102, '����', 2001);
insert into student values(103, '������', 3001);
insert into student values(104, '������', 4001);
insert into student values(105,'', 4001);		-- ��� not null�� �ȳ����� ���ư�.

select * from student;
delete from major1 where m_code = '1001';

-- 5. check : �������� ���� ������ ������ �����Ͽ� ���ǿ� �ش��ϴ� �����͸� ����Ѵ�.
create table example8(
	col1 number(10)
	constraint ex8_check check (col1 between 1 and 9)
);	-- ���� 1���� 9������ ���ڸ� �� �� �ְ� check ��!
	-- check���ǿ� ���� �̸� : ex_8
	
-- 6. default : �ƹ��� �����͸� �Է����� �ʾ��� ���, ������ �����Ͱ� �ڵ����� �Էµ�
create table example9(
	col number(3) default 999
);
insert into example9 values(default);	-- 999	-- default�� �Բ� ����س����� �־��� ���� ����!
insert into example9 values(null);		-- 0
insert into example9 values(0);			-- null
insert into example9 values(11);		-- 11

select * from example9;

-- Ŀ�� �޴��� ���� ���̺�
-- Ŀ���� �̸�, ����, Į�θ�, �ǸŰ����� ��¥ ���� �� �� �ְ�
-- ���̺� PK�� �ϳ� �� �־���ϰ�, ����ִ� ���� ��������..!

create table coffee(
	c_name varchar2(10 char) primary key,
	c_price number(5) not null,
	c_kcal number(4, 1) not null,
	c_start date not null
);
-- drop table coffee;	: 'drop table �̸�;' ������ coffee�� �ߴ� ���̺� ������!

-- DDL - Alter, Drop(���� ����)

-- ������ Ÿ�� ���� / �ø��� ũ��(�뷮) ����
alter table [���̺��] modify [�÷���] [������Ÿ��(�뷮)];
alter table coffee modify c_name number(3); -- ���� �ִ� ���¿��� ������Ÿ�� �����ϸ� ����!
-- ���� �ִ� ���¿��� �뷮�� ���� �����ϸ� ����!
alter table coffee modify c_name varchar2(2 char);

-- �÷��� ����
alter table [���̺��] rename column [���� �÷���] to [���ο� �÷���];
alter table coffee rename column c_name to c_name2;

-- �÷� �߰�
alter table [���̺��] add [�÷���] [������Ÿ��(�뷮)] [��������(��������)];
alter table coffee add c_taste varchar2(10 char) not null;

-- �÷� ����
alter table [���̺��] drop column [�÷���];
alter table coffee drop column c_taste;

-- ���̺�� ����
alter table [���̺��] rename to [������ ���̺��];
alter table coffee rename to coffee1;
--------------------------------------------------------------------------------------
-- drop

-- ���̺��� ����! (�����뿡 �ֱ�)
drop table [���̺��] cascade constraint;
drop table coffee cascade constraint;
select * from coffee;

-- �����뿡 �ִ� ���̺� ����
flashback table [���̺��] to before drop;
flashback table coffee to before drop;
select * from coffee;

-- ������ ����
purge recyclebin;

-- ������ �ֱ� + ���� => ���̺��� ���� ����
drop table [���̺��] cascade constraint purge;
drop table coffee cascade constraint purge;
/* DDL��! */
--------------------------------------------------------------------------------------
