-- 과자 테이블
-- 과자이름, 과자 회사, 과자 가격

create table snack(
	s_no number(4) primary key,
	s_name varchar2(10 char) not null,
	s_company varchar2(10 char) not null,
	s_price number(4) not null,
	
	s_exp date not null
);
--------------------------------------------------------------------------------------
-- DML (Data Manipulation Language) : 데이터 조작어
-- 데이터를 검색, 삽입, 수정, 삭제하는데 사용되는 문장
-- Select, Insert, Update, Delete, ...
-- 줄여서 CRUD!
-- C (Insert)
insert into [테이블명](컬럼명, 컬렴명, ...) values(값, 값, ..);

insert into snack(s_no, s_name, s_company, s_price) values (1, '초코파이', '오리온', 500);
-- => 컬럼명을 명시해주는게 원칙!

-- 컬럼 순서를 바꿔서 넣기? - o
insert into snack(s_no, s_name, s_price, s_company) values (1, '새콤달콤', 500, '롯데');
-- => 컬럼 순서에 맞춰서 적어주면 괜츈!

-- 컬럼명 명시 안하고 순서대로 값을 넣기! - o
insert into snack values (3, '엄마손파이', '롯데', 3500);
-- => 테이블 순서대로 넣어주기만 하면 컬럼명 안써도 돼!

drop table snack cascade constraint purge;

-- 4~5개 넣어봅시다!
insert into snack values(1, '미쯔', '오리온', 500);
insert into snack values(2, '부라보콘', '해태', 1500);
insert into snack values(3, '홈런볼', '해태', 2500);
insert into snack values(4, '가나초콜렛', '롯데', 800);
select * from snack;
-- => 이거 만드는데 번호 지정하는거 귀찮지 않냐 그래서 아래꺼 실행

-- Factory Pattern!
-- My SQL : Autoincrement 옵션
-- Oracle :  Sequence
--		번호를 순서에 맞게 자동으로 생성해주는데..
--		테이블과는 무관하고, insert에 실패해도 sequence 값은 올라감.

-- Sequence 생성
create sequence 시퀀스명; -- 간단하게 만들기
create sequence snack_seq;
-- 문화처럼, 테이블명 뒤에 _seq를 붙여주는 문화가 있음

-- 구체적인 시퀀스 (이건 그냥 필기한거얌,, 복잡하게 쓸 생각 ㄴㄴ)
create sequence 시퀀스명
	increment by 1 -- 증가값(1씩 증가)
	start with 1   -- 시작값
	minValue 	   -- 최소값
	maxValue 	   -- 최대값
	nocycle/cycle  -- 최대값에 도달하면 시작값부터 다시 반복 할지/말지
	nocache/cache  -- 시퀀스를 미리 만들어놓고 메모리에서 가져다 쓸지/말지
	noorder/order  -- n번 반복할지/말지
	;
-- sequence 삭제
drop sequence [시퀀스명];
drop sequence snack_seq;

-- sequence 사용
insert into snack values(snack_seq.nextval, '초코파이', '롯데', 5000);
insert into snack values(snack_seq.nextval, '초코파이', '오리온', 5000);
insert into snack values(snack_seq.nextval, '마이쮸', '롯데', 800);
insert into snack values(snack_seq.nextval, '허니버터칩', '해태', 3000);
insert into snack values(snack_seq.nextval, '허니버터칩(이건실패)', '해태', 50000000);
insert into snack values(snack_seq.nextval, '새콤달콤', '크라운', 500);
-- 5번은 실패하면 쏙 빠진상태로 결과값이 나옴!

select * from snack;

-- => 시퀀스 돌리기전에 위에 insert 제품들 돌리면 번호끼리 충돌하기 때문에 안돌린 상태로 시퀀스만 돌려야함!
-- => 근데 위에꺼 insert 이미 돌렸으면 테이블 삭제 시퀀스 삭제 모두 시행해야함..

-- 시간 / 날짜
--	sysdate : 오늘날짜 / 현재시간
select sysdate from dual;

insert into snack values(snack_seq.nextval, '새콤달콤 딸기맛', '크라운', 500, sysdate);

-- 특정시간 / 날짜
--	내장함수 - to_date('값', '패턴')
--		패턴(대문자) - YYYY, MM, DD, AM/PM, HH, HH24(추천), MI(분), SS(초)

insert into snack values(snack_seq.nextval, '새콤달콤 포도맛', '크라운', 500, to_date('2022-02-15 17', 'YYYY-MM-DD HH24')
);
-- 이제 값들을 막! 넣어주세요! (데이터는 많으면 많을수록 좋다!)
insert into snack values(snack_seq.nextval, '미쯔', '오리온', 1000, to_date('2022-02-15 17', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '홈런볼', '해태', 1500, to_date('2022-03-15 13', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '부라보콘', '해태', 1000, to_date('2022-04-15 14', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '쌍쌍바', '해태', 400, to_date('2022-02-16 19', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '콘칩', '크라운', 1500, to_date('2022-02-17 21', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '초코송이', '오리온', 1000, to_date('2022-02-18 05', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '칸초', '롯데', 1000, to_date('2023-02-15 22', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '오징어집', '농심', 1200, to_date('2022-06-15 11', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '오뜨', '오리온', 4500, to_date('2022-02-13 16', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '양파링', '농심', 1300, to_date('2022-09-15 10', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '바나나킥', '농심', 1300, to_date('2022-12-18 07', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '오예스', '해태', 3500, to_date('2022-07-14 02', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '맛동산', '해태', 2000, to_date('2022-05-10 01', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '허니버터칩', '해태', 1500, to_date('2024-03-11 18', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '새우깡', '농심', 1200, to_date('2022-11-16 05', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '포키', '해태', 1500, to_date('2022-12-05 06', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '자가비', '해태', 1500, to_date('2023-10-04 23', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '포카칩', '오리온', 1500, to_date('2022-08-01 12', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '마이쮸 포도맛', '크라운', 800, to_date('2025-06-27 10', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '구운감자', '해태', 1000, to_date('2024-03-21 23', 'YYYY-MM-DD HH24')
);
insert into snack values(snack_seq.nextval, '카스타드', '오리온', 2500, to_date('2024-03-21 17', 'YYYY-MM-DD HH24')
);
select * from snack;
--------------------------------------------------------------------------------------------------------------------
-- 이제 데이터를 조회해보자!
-- R (Read)
select [distinct] [컬럼명], [컬럼명 as 별칭 || 컬럼명 별칭], [연산자 사용], [통계함수], ...
	from [테이블명]
	where [조건식]
	group by [그룹대상]
	having [함수 포함한 조건]
	order by [정렬대상 asc / desc(오름차순/내림차순)] -- 기본값은 오름차순

-- 과자테이블 전체 조회
select * from snack;
select s_company from snack;	-- 과자 종류별로 회사값이 나오는데,, 중복 제거하고싶어!
select distinct s_company from snack;	-- 중복 제거되고 하나씩만 나오게 됨!

-- 숫자 계산이 가능한데..
-- 컬럼명 자체가 s_price/100
--	-> 컬럼명에 별칭을 부여해서 어떤 값인지 눈에 보이게 명시
select s_price / 100 from snack;

select s_price / 100 as price from snack;	-- 이 방법은 as 넣어서 별칭 부여 방법1
select s_price / 100 price from snack;		-- 이 방법은 띄어쓰기 넣어서 별칭 부여 방법2
--------------------------------------------------------------------------------------------------------------------
-- 연산자 (산술연산자)
-- Dual 테이블
--	1. 오라클 자체에서 제공하는 더미테이블
--	2. 간단하게 함수를 이용해서 계산 결과값을 확인할 때 사용

-- 대부분의 언어들은 문자 우선돼서 13이라는 결과값이 나오는데
-- 오라클에서는 반대로 숫자가 우선시 됨!
select 1 + '3' from dual;

-- 숫자만 연산해줌 -> 숫자 + 숫자가 아닌 문자 => 에러!
select 1 + 'a' from dual;

-- 문자를 더해주기 위한 연산자 (||)
select '3' || 10 from dual;
--------------------------------------------------------------------------------------------------------------------

-- WHERE (조건식)
-- 전체 데이터 중 지정한 조건에 맞는 데이터를 찾아주는 문장
-- 조건식에 사용할 연산자 (비교 연산자)
-- =, !=, ^=, <>, >, <, >=, <= , ...
-- 2번째와 4번째는 표준화 하기 위해서 만듬
-- 3번째는 차별화를 두기 위해서 만듬
-- => 근데 우리는 2번째 쓰니까 2번째만 알아둬도 돼!

-- 가격이 3000원인 과자의 모든 정보를 조회
select * from snack where s_price = 1000;

-- 모든 과자 이름(가격)으로 조회 (ex : 콘칩(2000)) + 테이블 헤더에 이름(가격) 나오게
-- 힌트) 이름(가격) 실행하면 안나옴! -> "이름(가격)" 지정해야함
select s_name || '(' || s_price || '원)' as  "이름(가격)" from snack;

-- 2000원 이하의 과자 중에서 최소가격이 얼마인지
select MIN(s_price) from snack where s_price <= 2000;

-- 모든 과자의 평균가가 얼마인지
select round(AVG(s_price), 2) 평균 from snack;

-- 과자의 이름, 가격의 30% 할인된 금액
select s_name, s_price * 0.7 from snack;

-- 3000원 이하인 과자의 이름, 회사이름 조회
select s_name, s_company  from snack where s_price <= 3000;














