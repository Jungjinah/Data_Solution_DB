-- [Dec30_1]

-- [제약조건 중 외래키!]

-- 웹사이트에서 게시판과 이름 [참조하는] 게시판 댓글 테이블 구성
-- 게시판 테이블 : [작성자 / 게시판 글 내용 / 작성시간]
-- 댓글 테이블 : [작성자 / 댓글 내용 / 작성시간]

drop table board;
drop sequence board_seq;
drop table wcomment;
drop sequence wcomment_seq;

create table board (
    b_no number(4) primary key,
    b_name varchar2(10 char) not null,
    b_text varchar2(100 char) not null,
    b_time date not null
);

create sequence board_seq;
insert into board values (board_seq.nextval, '진아', '오늘은 목요일' , to_date('2021-12-30 09:10:58', 'YYYY-MM-DD HH24:MI:SS'));
insert into board values (board_seq.nextval, '지나', '내일은 금요일' , to_date('2021-12-30 09:10:58', 'YYYY-MM-DD HH24:MI:SS'));
select * from board;

CREATE TABLE WCOMMENT (
    w_no number(4) primary key not null,
    w_name varchar2(10 char) not null,
    w_text varchar2(100 char) not null,
    w_time date not null ,
    w_num number(4),
    constraint fk_w_num foreign key(w_num)    -- FK_뒤에 쓰는 말은 아무렇게 써줘도 돼
        references board(b_no)                  -- FK_ 쓰는건 문화같은거구!    
        on delete cascade
);
create sequence wcomment_seq;

insert into wcomment values (wcomment_seq.nextval, '도진', '목요일은 닭가슴살~' , sysdate, 1);
insert into wcomment values (wcomment_seq.nextval, '호진', '금요일은 탄수화물~' , sysdate, 2);
insert into wcomment values (wcomment_seq.nextval, '노진', '토요일은 탕수육~' , sysdate, 1);
insert into wcomment values (wcomment_seq.nextval, '보진', '일요일은 간단식사~' , sysdate, 2);
select * from wcomment;

-- 게시글 1번을 지웠을 때 댓글도 같이 지워지는가?
delete from board where b_no = 1;
--------------------------------------------------------------------------------













