/*
   JOIN �ǽ�
    member10 : ȸ�� ������ �����ϴ� ���̺�
    zipcode10 : �����ȣ�� �����ϴ� ���̺�
    product10 : ��ǰ ������ �����ϴ� ���̺�
    order10 : �ֹ� ������ �����ϴ� ���̺�
*/

-- ���̺� ���� : Foreign Key�� �����ϴ� ���̺��� �������� �ʴ´�. : cascade constraints
    -- 1. �����ϴ� ���̺��� ���� ���� �� �����ؾ� �Ѵ�.
    -- 2. ���̺� ���� �� cascade constraints �ɼ��� ����ؼ� ���� ����

-- Member10 ���̺��� �����Ǵ� ���̺��̹Ƿ� ������ �ȵȴ�.
drop table zipcode10;
-- Order10 ���̺��� �����Ǳ� ������ ������ �� ����.
drop table member10;
-- SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER10';
drop table order10;
drop table product10;

-- 2. ���̺� ���� �� cascade constraints �ɼ��� ����ؼ� ���� ����
    -- zipcode10 ���̺��� ���� ���̺��� ������.
drop table zipcode10 cascade constraints;
drop table member10 cascade constraints;
drop table order10 cascade constraints;
drop table product10 cascade constraints;


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

-- Member10 ���̺��� �������� ������ zipcode10 ���̺��� ������ <=== RIGHT OUTER JOIN
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (60, '����', '�籺', '���ϻ�');
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (70, '����', '����', '���̻�');
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

-- member10 ���̺��� ���������� �ֹ��������� ���� ȸ��    <=== LEFT OUTER JOIN
insert into member10 (m_id, pass, name, email, zipcode)
values (6, '��ĥĥ', '�ɱ浿', 'fff@naver.com', 133454);
insert into member10 (m_id, pass, name, email, zipcode)
values (7, '������', '�̱浿', 'ggg@naver.com', 133456);
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

-- �ֹ� �������� ���� ��ǰ (�ֹ����� �ʴ� ��ǰ)  <=== RIGHT OUTER JOIN 
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (600, '����', 20000 , 30);
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (700, 'ü��', 26000 , 100);
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

-- �𵨸� ���� �ʴ� �ֹ� ���̺�  <=== order11
create table order11 (
    o_id number(6) not null primary key,
    
    m_name varchar2(200) not null,             -- �ֹ��� �̸�
    m_phone varchar2(200) not null,            -- �ֹ��� �ڵ��� ��ȣ
    m_addr varchar2(200) not null,             -- �ֹ����� ��� �ּ�
    m_email varchar2(200) null,                -- �ֹ����� ���� �ּ�
    
    p_id number(6) not null,                   -- ��ǰ ��ȣ
    p_name varchar2(200) not null,             -- ��ǰ �̸�
    p_price number(7,2) not null,              -- ��ǰ ����
    p_cnt number(6) null                       -- ��ǰ ����
    )
    
    insert into order11 (o_id, m_name, m_phone, m_addr, m_email, p_id, p_name, p_price, p_cnt)
    values (10, 'ȫ�浿', '010-1111-1111', '����', 'aaa@aaa.kr', 700, 'ü��', 26000, 100);
    
    insert into order11 (o_id, m_name, m_phone, m_addr, m_email, p_id, p_name, p_price, p_cnt)
    values (20, '��浿', '010-2222-1111', '�λ�', 'bbb@bbb.kr', 700, '�ٳ���', 26000, 100);
    
    commit;
    
    select * from order11;

-- JOIN : ANSI JOIN, 
    -- INNER JOIN : on ���� ������ ���� ����Ѵ�.
    -- LEFT OUTER JOIN : ���� ���̺��� ��� ���� ���
    -- RIGHT OUTER JOIN : ������ ���̺��� ��� ���� ���
-- member10(��), zipcode(1) ���̺� :           <== zipcode 1 �� member ���̺� ��
select *
from member10 m
    join zipcode10 z
    on m.zipcode = z.zipcode;

-- member10 ���� on���� ��Ī�����ʴ��� ������ ���̺��� ��� ���� ��� : RIGHT OUTER JOIN
select *
from member10 m               -- left outer join �ϸ� ���� ���̺��� ������
    right outer join zipcode10 z      -- ������ ���̺��� right outer join �ϸ� ���´�
    on m.zipcode = z.zipcode;

-- �ֹ� ���̺� (order10), �ֹ��� ���� (member10)   <=== on m_id

select * from order10;

select * 
from order10 o
    join member10 m
    on o.m_id = m.m_id;

-- �ֹ� �������� ���� ����� ��� (�ֹ������ʴ� �����) : RIGHT OUTER JOIN
select *
from order10 o
    right outer join member10 m
    on o.m_id = m.m_id;

select *
from member10 m
    left outer join order10 o
    on o.m_id = m.m_id;
    
-- 3�� ���̺� ���� : Order10, Member10, Zipcode10

select *
from order10 o
    join member10 m
        on o.m_id = m.m_id
    join zipcode10 z
        on z.zipcode = m.zipcode;
        
-- 4�� ���̺� ���� : Order10, Member10, Zipcode10, Product10
-- INNER JOIN
select *
from order10 o
    join member10 m
        on o.m_id = m.m_id
    join zipcode10 z
        on z.zipcode = m.zipcode
    join product10 p
        on p.pro_id = o.pro_id;

-- �ֹ����� �ʴ� ����� ������ ���, �Ǹŵ��� �ʴ� ��ǰ�� OUTER JOIN �� ����ؼ� ���
select *
from order10 o
    full outer join member10 m
        on o.m_id = m.m_id
    join zipcode10 z
        on z.zipcode = m.zipcode
    full outer join product10 p
        on p.pro_id = o.pro_id;

-- LEFT OUTER JOIN
select *
from member10 m
   left outer join order10 o
        on o.m_id = m.m_id
    join zipcode10 z
        on z.zipcode = m.zipcode
    left outer join product10 p
        on p.pro_id = o.pro_id;




