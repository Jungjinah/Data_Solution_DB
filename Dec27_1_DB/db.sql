-- 주석

-- Java : 실행 -> 모든 소스가 다 실행
-- SQL연습장 : 원하는 줄만 골라서 실행 o

-- create table dec27_test(name char, age number);	-- 이렇게 한줄로 만들 수 있다! but, 가독성을 위해서

create table dec271_test(		-- 한줄이지만, 가독성을 위해 줄을 바꿔놓은 상태!
	name char,					-- 여러 줄을 실행하고 싶으면 : 그 줄들을 다 드래그해서 -> *** alt + x
	age number
);

-- 한 줄 실행 : 커서를 그 줄에 놓고 -> *** alt + s 
select * from dec271_test;	
-- => 모든 것을 다 보고싶으면 '*'사용하고, 각각 알고 싶으면 ','써서 나열 (주석은 웬만하면 다른줄에 써!)

drop table dec271_test cascade constraint purge;
------------------------------------------------------------------
-- 용어 정리!
-- 테이블 ( = 릴레이션) : 데이터베이스에서 정보를 구분해서 저장하는 기본단위
--		행과 열로 이루어진 데이터들의 집합
-- 행(Row) : 테이블을 구성하는 데이터들 중 가로부분 (→)
--		튜플(Tuple), 레코드(Record)라고도 부름
-- 열(Column) : 테이블을 구성하는 데이터들 중 세로부분 (↓)
--		필드(Field), 속성(Attribute) 이라고도 부름
-- 스키마(Schema) : 데이터베이스의 기본 구조를 정의하는 것 / 쉽게 말하면 제목부분 ex) p_name ...
--		테이블의 헤더를 나타내며, 속성과 자료타입을 갖고 있음
-- 인스턴스(Instance) : 테이블에서 실제로 저장된 데이터의 값
-- 도메인(Domain) : 속성이 가질 수 있는 값의 집합
--		특정 속성에서 사용할 데이터의 범위를 사용자가 정의
--		p_age number(3) : 정수 3자리까지만 받겠다
-- 		p_name varchar2(10 char) : 문자열 최대 10글자까지만 받겠다 (넘어가면 에러!)

create table person(
	p_name varchar2(10 char),
	p_age number(3),			-- 정수형 3자리까지만 가능하다. 그래서 4자리가 들어가면 에러발생!
	p_gender varchar2(2 char)
);

-- 값 넣기
insert into PERSON values('홍길동', 10, '남자');
insert into PERSON values('홍길동', 10, '남자');
insert into PERSON values('김길동', 30, '여자');
insert into PERSON values('최길동', 20, '남자');
insert into PERSON values('최길동', 1000, '남자');	-- 에러발생!

-- 전체 조회
select * from PERSON;

-- 중복값 없애고 조회
select distinct * from PERSON;

-- 릴레이션의 특징
-- 1. 속성은 단일 값만 갖는다.
--	각 속성의 값은 도메인에 정의된 값만 가지며, 그 값은 모두 다 단일해야!!

-- 2. 속성은 서로 다른 이름을 가진다. (오류 뜨면 duplicate 뜸!) - 이름을 중복해서 만들지 않기
--	ex) 컬럼명을 중복 오류!

-- 3. 한 속성의 값은 모두 같은 도메인 값을 갖는다.
--	p_age는 최대 3자리 정수로 된 값만 가짐

-- 4. 속성의 순서는 상관없다.
--	속성의 순서가 달라도 릴레이션, 스키마는 같음
select * from person;
select p_age, p_gender, p_name from person;
-- 순서만 바뀌었지, 내용에는 변화가 없음

-- 5. 릴레이션 내의 중복된 튜플은 허용되지 않는다.
-- 즉, 모든 튜플에는 '차별성'이 있어야.. (생일을 추가하던가, 핸드폰 번호를 추가한다거나..)
--		-> 유일한 값으로 만들어라~
------------------------------------------------------------------
-- SQL명령문의 종류!

-- 데이터 정의어 (DDL / Data Difinition Language)
--	-> 테이블이나 관계의 구조를 생성하는데 사용하며
--		Creat, Drop, Alter,...
-- 데이터 조작어 (DML / Data Manipulation Language) ***
--		: 테이블에 데이터를 검색, 삽입, 수정, 삭제하는데 사용하며
--			Select, Insert, Update, Delete, ... (CRUD)
--			Selcet - 질의어(Query)라고도 함
-- 데이터 제어어 (DCL / Data Control Language)
--		: 데이터베이스에 접근하고, 객체들을 사용하도록 '권한'을 주거나, 회수하는데 사용
-- 			Grant, Revoke,...
--			-> DBA(DataBase Administor)의 업무!
-- 트랙잭션 처리어 (TCL / Transaction Control Language)
--	: DML에 의해 조작된 결과를 작업단위(태랜잭션)별로 제어하는데 사용
--		-> Commit, Rollback, Savepoint, ...
------------------------------------------------------------------
-- SQL이라는 언어로 DB를 제어해볼건데,,
-- 		DB메이커는 달라도, SQL문법은 거의 비슷
--		대/소문자 구별하지 않음
--			-> 다 대문자로 받아들임
--			-> 낙타체가 안통함 -> 뱀체로 사용!
-- 			-> 데이터는 구별함 o
--				'a'와 'A'는 서로 다른 데이터!
------------------------------------------------------------------
-- 테이블을 제대로 만들어보자!
-- 테이블의 구조.. 봐야함..
create table 테이블명(
	컬럼명 자료형[옵션], -- 옵션 : 필요하면 넣는것 // [] 넣는거 아님
	컬럼명 자료형,
	...
);

-- 자료형 (데이터타입)
--	크게 3가지로 나눌 수 있음
-- 문자형
--		char(용량)
--		 무조건 그 용량대로 저장
--		 용량이 비어있다면 띄어쓰기로 그 용량을 메꿈
		 char(5 char) -- 5글자를 넣어야
		 ㅁㄴㅇ(세글자만 넣음) -- 뒤에 2글자는 띄어쓰기로 메꾼다.
--		 처리속도가 빠르다
--		 ex) 성별, 주민번호, 핸드폰번호
--		varchar2(용량)
--		 정해진 용량만큼 데이터를 안넣으면
--		 그 용량을 조절해서 저장
--		 주력으로 사용!
--		 용량을 조절하는 만큼 처리속도가 느리다!(비교적)
--		 ex) 이름, 주소, ...
-- 문자형 용량
--		varchar2(5) : 5bytes
--			영어, 숫자, 띄어쓰기 : 1byte 차지
--			한글 1글자 : 3byte
--			글자수 계산하기가 살짝 애매..
--		varchar2(5 char) : 한글/영어 5글자 -> 15byte
-- => 문자형 자료형을 쓸 때는 용량에 'char'를 넣어서 쓰자!
create table test2(
	t_name varchar2(5)
);

create table test3(
	t_name varchar2(5 char)
);

-- 문자형의 값을 넣을때는 ''(작은 따옴표)를 사용해서!
insert into test2 values('가나다');	-- 값이 안들어감 (9byte라 불가능)
insert into test3 values('가나다');	-- 값이 들어감	(3글자라 가능)
drop table test3 cascade constraint purge;
------------------------------------------------------------------
-- 숫자형
-- Number(P, S) : 십진수 기준
--	 P : 정밀도(Precision), S : 범위(Scale)
--	 P는 소수점 기준 모든 유효숫자 자릿수를 의미 -> P에 명시된 것보다 큰 숫자값 -> 에러!
--	 S가 양수면 소수점 이하, 음수면 소수점 이상(소수점 기준 왼쪽) 유효숫자 자리수를 나타냄
--	 S에 명시한 숫자 이상의 숫자를 입력하면, S에 명시한 숫자로 반올림 처리!
--	 S가 음수면 소수점 기준 왼쪽 자릿수만큼 반올림 처리!
--		ex) 값이 123.54 
--				number(3) : 124 (정수표현 / 유효숫자는 3개 / 소수점 아래에서 반올림)
--				number(3, 2) : 에러 (실수표현 / 유효숫자는 5개 / P가 3 (유효숫자가 P보다 큼) 
--				number(5, 2) :123.54 (P가 5이면서 5의 범위 맞고, 소수 2째자리까지 나타내시오)
--				number(7, 1) : 123.5 (유효숫자가 5개 -> 123.5400, 소수점자리는 첫째자리까지 반올림 -> 123.5)
--				number(7, -1) :120 (첫번째 자리가 반올림해서 120,,)
--				number(7, -3) : 0
--				number(7, -4) : 0

-- Float(P) : 이진수 기준

create table testNum(
	t_num number(5),
	t_no float(5)
);
insert into testNum values(12345, 12345);	-- 테이블에 값을 넣는 부분
select * from testNum; -- 12345, 12000
-- float(5) 5자리 10진수 (x) 5자리 2진수(o)
-- 5자리 이진수 -> 10진수로 변경하려면 0.3 정도를 곱하면 됨
-- 5 x 0.3 = 약 1.5
-- float(5)는 실제로 float(2) -> 1.5를 반올림해서 2
-- 12345 중 앞의 두자리 12만 제대로 나오고, 나머지는 0으로 메꿔준 상황
-- float는 실제로 쓰일게 없음,,, 그래서 안 쓸거야..
-- => 사실상 Number / 크기 설정 -> P, S를 적절히 조절해서!!
------------------------------------------------------------------
-- 날짜형
--	Date : 연도, 월, 일, 시, 분, 초까지 입력 가능
--	Timestamp : 연도, 월, 일, 시, 분, 초, 밀리초까지 입력 가능
--	=> 주력은 Date
select sysdate from dual;
------------------------------------------------------------------
-- [번외] - 중요한지 안중요한지는 받아들이기 나름,,
-- ROWID 타입
-- 테이블에서 행의 위치를 지정하는 논리적인 주소 값
-- 데이터베이스 전체에서 중복되지 않는 유일한 값
-- 테이블에 새로운 값이 생성되면 자동적으로 생성
-- 데이터베이스 저장 x
-- 조회는 가능, 변경은 불가능
select rowid from dual;	-- dual이라는 테이블 값의 주석 값
						-- AAAABO AAB AAAAOH AAA
-- 앞에서부터 6글자 : 데이터 객체번호
--		데이터 객체 생성지 할당
-- 그 다음 3글자 : 상대적 파일번호
--		데이터가 저장되는 물리적인 파일번호
-- 그 다음 6글자 : 블록번호
--		데이터 파일 내에서 행을 포함하는 블록 위치
-- 그 다음 3글자 : 행 번호
--		블록 헤더내에서 행 슬롯의 위치
-- 가상의 주소값! (연습용 테이블)