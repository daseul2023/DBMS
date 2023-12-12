
-- ���̺� ���Ǽ� < �ǽ� >

create table tb_zipcode20(
        zipcode varchar2(7) not null constraint PK_TB_ZIPCODE20_ZIPCODE primary key,
        sido varchar2(30) null,
        gugun varchar2(30) null,
        dong varchar2(30) null,
        bungi varchar2(30) null
);

create table member20(
        id varchar2(20) not null constraint PK_MEMBER20_ID primary key,
        pwd varchar2(20) null,
        name varchar2(50) null,
        address varchar2(20) null,
        tel varchar2(13) null,
        indate date default sysdate null,
        zipcode varchar2(7) null,
            constraint FK_MEMBER20_ZIPCODE foreign key(zipcode) references TB_ZIPCODE20(zipcode)    
);

create table products20(
        product_code varchar2(20) not null constraint PK_PRODUCTS20_PRODUCT_CODE primary key,
        product_name varchar2(100) null,
        product_kind char(1) null,
        product_price1 varchar2(10) null,
        product_price2 varchar2(10) null,
        product_content varchar2(1000) null,
        product_image varchar2(50) null,
        sizeSt varchar2(5) null,
        sizeEt varchar2(5) null,
        product_quantity varchar2(5) null,
        useyn char(1) null,
        indate date null
);

drop table orders20 cascade constraints;

create table orders20(
        o_seq number(10) not null constraint PK_ORDERS20_O_SEQ primary key,
        product_size varchar2(5) null,
        quantity varchar2(5) null,
        result char(1) null,
        indate date null,
        product_code varchar2(20) null,
        id varchar2(16) null,
            constraint FK_ORDERS20_PRODUCT_CODE foreign key(product_code) references PRODUCTS20(product_code),
            constraint FK_ORDERS20_Id foreign key(id) references MEMBER20(id)
);

insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (1, '����', '���ʱ�', '�߾ӵ�', '6����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (2, '�λ�', '������', '�߾ӵ�', '5����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (3, '���', '���빮��', '���', '4����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (4, '�뱸', '������', '��ϵ�', '3����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (5, '����', '������', '����', '2����');
commit;

select * from tb_zipcode20;


insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('����Ŀ', 123, '�̻���', '����Ŀ����', '010-1111-1111', '2013-12-12', 1);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('���콺', 123, '�ֿ���', '��������', '010-2111-1111', '2013-12-11', 2);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('����', 123, '�����', 'kt����', '010-3111-1111', '2013-12-10', 3);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('��������', 123, '�̹���', '�ְ����', '010-4111-1111', '2013-12-09', 4);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('�ݺ�', 123, '������', '��������', '010-5111-1111', '2013-12-08', 5);
commit;

select * from member20;

insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (100, 'å', 0, 9000, 15000, '�ڵ�', '�ڹ�','A4', 'A4', 4, 2, '2023-10-19');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (200, 'å', 1, 8000, 12000, '�ڵ�', 'SQL','A4', 'A4', 41, 3, '2023-10-17');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (300, 'å', 2, 9000, 16000, '�ڵ�', 'HTML','A4', 'A4', 43, 4, '2023-10-10');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (400, 'å', 3, 7000, 16000, '�ڵ�', '����Ŭ','A4', 'A4', 46, 5, '2023-9-19');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (500, 'å', 4, 9000, 21000, '�ڵ�', 'JSP','A4', 'A4', 54, 6, '2023-11-19');
commit;

select * from products20;

insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (111, 'A4', 5, 1, '2023-12-12', 100, '����Ŀ');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (113, 'A4', 55, 1, '2023-2-12', 200, '���콺');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (112, 'A4', 15, 1, '2023-12-2', 300, '�ݺ�');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (114, 'A4', 2, 1, '2023-1-12', 400, '��������');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (115, 'A4', 1, 1, '2023-2-1', 500, '����');
commit;

select * from orders20;


create view v_joy
as
select  o.id ���̵�, name �̸�, sido �õ�, product_content ��ǰ����, product_price2 ��ǰ�ǸŰ�, quantity �ֹ�����
    from tb_zipcode20 t
    join member20 m
         on t.zipcode = m.zipcode
    join orders20 o
         on o.id = m.id
    join products20 p
        on p.product_code = o.product_code;
        
select * from v_joy;       


        
        
        
        
