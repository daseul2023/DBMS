/*
   JOIN �ǽ�
    member10 : ȸ�� ������ �����ϴ� ���̺�
    zipcode10 : �����ȣ�� �����ϴ� ���̺�
    product10 : ��ǰ ������ �����ϴ� ���̺�
    order10 : �ֹ� ������ �����ϴ� ���̺�
*/

create table zipcode10 (
    zipcode number(6) not null constraint PK_ZIPCODE10_ZIPCODE Primary Key,
    si_do varchar2(200) not null,
    gu_gun varchar2(200) not null,
    bungi varchar2(200) not null
);

create table member10(
    m_id number(4) not null constraint PK_MEMBER10_M_ID Primary Key,
    pass varchar2(200) not null,
    name varchar2(200) not null,
    email varchar2(200) not null,
    zipcode number(6) null,
        -- Foreign Key ���� ���� �߰��� : member10(zipcode) ===> zipcode10(zipcode)
        constraint FK_MEMBER10_ZIPCODE foreign key(zipcode) references ZIPCODE10(zipcode)
);

create table product10(
    pro_id number(6) not null constraint PK_PRODUCT10_PRO_ID primary key,
    pro_name varchar2(200) not null,
    pro_price number(7,2) not null,
    pro_cnt number(4) default 0 not null
);

create table order10(
    ord_id number(6) not null constraint PK_ORDER10_ORD_ID primary key,
    m_id number(4) not null,            -- FK : MEMBER10(m_id)
    pro_id number(6) not null,          -- FK : PRODUCT10(pro_id)
        --Foreign Key 2�� �� 
        constraint FK_ORDER10_M_ID foreign key(m_id) references MEMBER10(m_id),
        constraint FK_ORDER10_PRO_ID foreign key(pro_id) references PRODUCT10(pro_id)
);

-- �� ���̺� ���ڵ� 5���� �ֽ��ϴ�.

-- ANSI JOIN ���� ����ؼ� �ֹ�����(Order10)���̺��� �������� 
    -- �ֹ��ڸ�, �ֹ��ڸ����ּ�, �ֹ��ڹ���(�õ�),�ֹ���ǰ��,��ǰ�� ������ ����մϴ�. 
    -- order10,member10,zipcode10,product10

insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (123456, '��⵵ �����', '�ϱ�', '���̻�');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (123455, '��⵵ �Ȼ��', '�̱�', '���ϻ�');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (123454, '��⵵ �Ⱦ��', '�ﱺ', '���ϻ�');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (133454, '��⵵ ������', '�籺', '���ϻ�');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (133456, '��⵵ ���ֽ�', '����', '���̻�');
commit;

select * from zipcode10;

insert into member10 (m_id, pass, name, email, zipcode)
values (1333, '���̻��', 'ȫ�繫', 'abc@naver.com', 123456);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1334, '���̻�', 'ȫ�浿', 'bc@naver.com', 123455);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1332, '������', 'ȫ���', 'cc@naver.com', 123454);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1222, '��ĥĥ', 'ȫ���', 'rose@naver.com', 133454);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1122, '������', 'ȫ���', 'suni@naver.com', 133456);
commit;

select * from member10;

insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121212, 'å', 15000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121211, '����', 50000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121210, '�Ӹ���', 5000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121200, '�Һ�', 45000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (221200, 'Ű��', 30000 , 1);
commit;

select * from product10;

insert into order10 (ord_id, m_id, pro_id)
values (111111, 1333, 121212);
insert into order10 (ord_id, m_id, pro_id)
values (121111, 1334, 121211);
insert into order10 (ord_id, m_id, pro_id)
values (131111, 1332, 121210);
insert into order10 (ord_id, m_id, pro_id)
values (141111, 1222, 121200);
insert into order10 (ord_id, m_id, pro_id)
values (151111, 1122, 221200);
commit;

select * from order10;

    -- �ֹ��ڸ�, �ֹ��ڸ����ּ�, �ֹ��ڹ���(�õ�),�ֹ���ǰ��,��ǰ�� ������ ����մϴ�. 
    -- order10,member10,zipcode10,product10
    
-- ���� Ǭ ����
select name �ֹ��ڸ�, email �ֹ��ڸ����ּ�, si_do �ֹ��ڹ���, pro_name �ֹ���ǰ��, pro_price ��ǰ����
from zipcode10 z join member10 m
on z.zipcode = m.zipcode                            -- �������� ã�Ƽ� ���� ���� ������ ���� �ʾƵ� ���� ����.
                join  order10 o
                on m.m_id = o.m_id
                join product10 p
                on o.pro_id = p.pro_id;
                
                
-- �������� Ǭ ����               
select name �ֹ��ڸ�, email �ֹ��ڸ����ּ�, si_do �ֹ��ڹ���, pro_name �ֹ���ǰ��, pro_price ��ǰ����
from order10 o join member10 m
    on o.m_id = m.m_id                           
         join  product10 p
         on o.pro_id = p.pro_id
         join zipcode10 z
         on m.zipcode = z.zipcode;





