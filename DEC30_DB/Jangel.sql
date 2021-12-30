-- [Dec30_1]

-- [�������� �� �ܷ�Ű!]

-- ������Ʈ���� �Խ��ǰ� �̸� [�����ϴ�] �Խ��� ��� ���̺� ����
-- �Խ��� ���̺� : [�ۼ��� / �Խ��� �� ���� / �ۼ��ð�]
-- ��� ���̺� : [�ۼ��� / ��� ���� / �ۼ��ð�]

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
insert into board values (board_seq.nextval, '����', '������ �����' , to_date('2021-12-30 09:10:58', 'YYYY-MM-DD HH24:MI:SS'));
insert into board values (board_seq.nextval, '����', '������ �ݿ���' , to_date('2021-12-30 09:10:58', 'YYYY-MM-DD HH24:MI:SS'));
select * from board;

CREATE TABLE WCOMMENT (
    w_no number(4) primary key not null,
    w_name varchar2(10 char) not null,
    w_text varchar2(100 char) not null,
    w_time date not null ,
    w_num number(4),
    constraint fk_w_num foreign key(w_num)    -- FK_�ڿ� ���� ���� �ƹ����� ���൵ ��
        references board(b_no)                  -- FK_ ���°� ��ȭ�����ű�!    
        on delete cascade
);
create sequence wcomment_seq;

insert into wcomment values (wcomment_seq.nextval, '����', '������� �߰�����~' , sysdate, 1);
insert into wcomment values (wcomment_seq.nextval, 'ȣ��', '�ݿ����� ź��ȭ��~' , sysdate, 2);
insert into wcomment values (wcomment_seq.nextval, '����', '������� ������~' , sysdate, 1);
insert into wcomment values (wcomment_seq.nextval, '����', '�Ͽ����� ���ܽĻ�~' , sysdate, 2);
select * from wcomment;

-- �Խñ� 1���� ������ �� ��۵� ���� �������°�?
delete from board where b_no = 1;
--------------------------------------------------------------------------------













