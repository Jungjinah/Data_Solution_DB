-- [옵션]
-- 제약조건(Costraint)이라고 부름
-- 데이터 무결성을 보장하기 위해서 사용
--		데이터 무결성 : 데이터베이스에 저장된 데이터의 일관성, 정확성을 지키는 것
-- 1. 도메인 무결성 제약조건
--		도메인 제약(Domain Constraint)이라고도 하며,
--		릴레이션 내의 튜플들이 도메인에 지정된 값만 가져야한다는 조건
--		자료형(type), 널(null / not null), 기본값(default), 체크(check)
-- 2. 개체 무결성 제약조건
--		기본키 제약(Primary Key Constraint)이라고 함
--		릴레이션은 기본키를 지정하고, NULL값을 가져서는 안되며,
--		릴레이션 내에 오직 하나의 값만 존재해야 한다는 조건
-- 3. 참조 무결성 제약조건
--		외래키 제약(Foreign Key Constraint)이라고 함
--		참조 받는 릴레이션의 외래키는 참조하는 릴레이션의 기본키와 도메인이 동일해야 하며,
--		참조 받는 릴레이션의 값이 변경될 때, 참조하는 릴레이션의 제약을 받는다

-- => not null / primary key / foreign key

-- 1. NOT NULL : (null은 값이 비어있다 / 0도 아니고 띄어쓰기도 아닌 값을 넣지 않은 상태)
--			NULL을 허용하지 않는다 -> 필수적으로 값을 넣어줘라!(가장 많이 사용 O)
-- [2가지 예시]
create table example(
	coll varchar2(10 char),
	coll varchar2(10 char) not null
);

-- constraint 키워드를 사용해서 제약조건명을 따로 부여함
create table example2(
	coll varchar2(10 char),
	coll varchar2(10 char)
	constraint col2_notnull not null
);
-- constraint 키워드 써서 사용한 구조는 기본키 할 때 설명!

-- 2. Unique : 해당 컬럼에 들어가는 값이 테이블 전체에서 유일해야 한다!는 의미 (존재자체만 알아둬,,)
--		Not null과 함께 사용이 가능하지만, unique는 잘 사용되지 않음
create table example3(
	col1 varchar2(10 char) unique,
	col2 varchar2(10 char) unique not null, /* not null과 함께 부여 */
	col1 varchar2(10 char)
	constraint col3_unique unique(col3)
);

-- 3. Primary key(기본 키) : Null을 허용하지 않고, 중복된 데이터를 허용하지 않음.
--							(not null 	   + 		unique 		= primary key)
-- 데이터의 특정 조건을 검색하거나, 수정 등의 작업을 할 때 기본키로 구분한다.
-- ex) ID, 주민등록번호, 회원번호, 글 번호, ...
-- 가급적이면 한 테이블 당 PK는 하나였으면..!
create table example4(
	col1 varchar2(10 char) primary key,
	col2 varchar2(10 char),
	col3 varchar2(10 char)
);

/* PK를 2개 이상 줘야하는 경우 constraint 키워드 사용 */
crate table example5(
	col1 varchar2(10 char),
	col2 varchar2(10 char),
	col3 varchar2(10 char)
	constraint pk_example5 primary key(col1, col2)
);

-- 4. foreign key(외래 키) : 다른 테이블의 특정 컬럼을 조회해서
--						   동일한 데이터가 있는 경우에만 입력, 수정, ... 가능!
-- 참조하는(두개 연결된) 테이블은 PK나 unique로 지정된 컬럼만을 FK로 지정할 수 있다
-- 외래키 설정을 위해서는 참조받는 컬럼이 먼저 생성되어야 하고,
--		외래키를 심을 테이블이 이후에 생성되어야 함!

-- 외래키 테이블 구조
create table 테이블명(
	컬럼명 자료형,
	constraint FK명 foreign key(컬럼명)
		references 대상테이블명(대상테이블의 기본키( OR 고유키) 컬럼명)
		[on delete set null || on delete cascade] -- (선택 옵션이야)
		-- 참조하는 테이블에서 행 부분을 지웠을 때,
		-- 이 테이블에서 연결되어 있는 행에 대해서 null값을 먹일지
		-- 아니면 같이 지울지에 대한 옵션
);

-- 외래키 예제1
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
insert into example7 values('40'); -- example6에는 40이라는 값이 없으므로 외래키가 먹히지 않는 상황!
select * from example7;
-- example6에 '10'인 값을 지우면 어떻게 될까?
delete from example6 where col1 = '10'; -- examle7의 '10'의 값은 외래키 안먹히는 상황 됨!

-- 외래키 예제2
-- 학과 테이블과 이것을 참조하는 학생 테이블을 만들어보자.
-- 학과테이블 : 학과코드(4자리 숫자), 학과명
-- 학생테이블 : 학생 번호(3자리 숫자), 학생 이름, 학과코드
-- 학과테이블의 학과 코드를 지우면 학생정보도 지워지게

create table major1(
	m_code number(4) primary key,
	m_name varchar2(10 char) not null	-- 값이 웬만하면 다 넣어줘 라는 말이 있어 'not null'집어넣음
);										-- 대신, not null을 넣으면 무조건 값을 넣어줘야함 

insert into major1 values(1001, '컴퓨터공학과');
insert into major1 values(2001, '기계공학과');
insert into major1 values(3001, '산업경영공학과');
select * from major1;

create table student(
	s_number number(3) primary key,				
	s_name varchar2(10 char) not null,			
	s_code number(4),							
	constraint fk_student foreign key(s_code)	-- 외래키를 이용하여 참조해보기 위해 constraint 사용
		references major1(m_code)				
		on delete cascade						-- foreign키 값도 같이 지우겠다! 이 뜻,,
);

insert into student values(101, '진아', 1001);
insert into student values(102, '지나', 2001);
insert into student values(103, '정진아', 3001);
insert into student values(104, '정지나', 4001);
insert into student values(105,'', 4001);		-- 얘는 not null을 안넣으면 돌아감.

select * from student;
delete from major1 where m_code = '1001';

-- 5. check : 데이터의 값의 범위나 조건을 설정하여 조건에 해당하는 데이터만 허용한다.
create table example8(
	col1 number(10)
	constraint ex8_check check (col1 between 1 and 9)
);	-- 값이 1부터 9까지의 숫자만 들어갈 수 있게 check 씀!
	-- check조건에 대한 이름 : ex_8
	
-- 6. default : 아무런 데이터를 입력하지 않았을 경우, 지정한 데이터가 자동으로 입력됨
create table example9(
	col number(3) default 999
);
insert into example9 values(default);	-- 999	-- default와 함께 명시해놓으면 주어진 숫자 나옴!
insert into example9 values(null);		-- 0
insert into example9 values(0);			-- null
insert into example9 values(11);		-- 11

select * from example9;

-- 커피 메뉴에 대한 테이블
-- 커피의 이름, 가격, 칼로리, 판매개시한 날짜 값이 들어갈 수 있게
-- 테이블에 PK가 하나 꼭 있어야하고, 비어있는 값이 없었으면..!

create table coffee(
	c_name varchar2(10 char) primary key,
	c_price number(5) not null,
	c_kcal number(4, 1) not null,
	c_start date not null
);
-- drop table coffee;	: 'drop table 이름;' 넣으면 coffee로 했던 테이블 지워짐!

-- DDL - Alter, Drop(비교적 쉬움)

-- 데이터 타입 변경 / 컬림의 크기(용량) 변경
alter table [테이블명] modify [컬럼명] [데이터타입(용량)];
alter table coffee modify c_name number(3); -- 값이 있는 상태에서 데이터타입 변경하면 에러!
-- 값이 있는 상태에서 용량을 적게 변경하면 에러!
alter table coffee modify c_name varchar2(2 char);

-- 컬럼명 변경
alter table [테이블명] rename column [이전 컬럼명] to [새로운 컬럼명];
alter table coffee rename column c_name to c_name2;

-- 컬럼 추가
alter table [테이블명] add [컬럼명] [데이터타입(용량)] [제약조건(생략가능)];
alter table coffee add c_taste varchar2(10 char) not null;

-- 컬럼 삭제
alter table [테이블명] drop column [컬럼명];
alter table coffee drop column c_taste;

-- 테이블명 변경
alter table [테이블명] rename to [변경할 테이블명];
alter table coffee rename to coffee1;
--------------------------------------------------------------------------------------
-- drop

-- 테이블을 삭제! (휴지통에 넣기)
drop table [테이블명] cascade constraint;
drop table coffee cascade constraint;
select * from coffee;

-- 휴지통에 있는 테이블 복원
flashback table [테이블명] to before drop;
flashback table coffee to before drop;
select * from coffee;

-- 휴지통 비우기
purge recyclebin;

-- 휴지통 넣기 + 비우기 => 테이블을 완전 삭제
drop table [테이블명] cascade constraint purge;
drop table coffee cascade constraint purge;
/* DDL끝! */
--------------------------------------------------------------------------------------
