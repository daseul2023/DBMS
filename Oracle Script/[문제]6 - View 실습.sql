
-- 테이블 정의서 < 실습 >

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
values (1, '서울', '서초구', '중앙동', '6번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (2, '부산', '동래구', '중앙동', '5번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (3, '울산', '동대문구', '면목동', '4번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (4, '대구', '성동구', '상암동', '3번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
values (5, '대전', '강남구', '율동', '2번지');
commit;

select * from tb_zipcode20;


insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('페이커', 123, '이상혁', '페이커빌딩', '010-1111-1111', '2013-12-12', 1);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('제우스', 123, '최우제', '강남빌딩', '010-2111-1111', '2013-12-11', 2);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('기인', 123, '김기인', 'kt빌딩', '010-3111-1111', '2013-12-10', 3);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('구마유시', 123, '이민형', '최고빌딩', '010-4111-1111', '2013-12-09', 4);
insert into member20 (id, pwd, name, address, tel, indate, zipcode)
values ('쵸비', 123, '정지훈', '젠지빌딩', '010-5111-1111', '2013-12-08', 5);
commit;

select * from member20;

insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (100, '책', 0, 9000, 15000, '코딩', '자바','A4', 'A4', 4, 2, '2023-10-19');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (200, '책', 1, 8000, 12000, '코딩', 'SQL','A4', 'A4', 41, 3, '2023-10-17');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (300, '책', 2, 9000, 16000, '코딩', 'HTML','A4', 'A4', 43, 4, '2023-10-10');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (400, '책', 3, 7000, 16000, '코딩', '오라클','A4', 'A4', 46, 5, '2023-9-19');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, 
                        product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
values (500, '책', 4, 9000, 21000, '코딩', 'JSP','A4', 'A4', 54, 6, '2023-11-19');
commit;

select * from products20;

insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (111, 'A4', 5, 1, '2023-12-12', 100, '페이커');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (113, 'A4', 55, 1, '2023-2-12', 200, '제우스');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (112, 'A4', 15, 1, '2023-12-2', 300, '쵸비');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (114, 'A4', 2, 1, '2023-1-12', 400, '구마유시');
insert into orders20 (o_seq, product_size, quantity, result, indate, product_code, id)
values (115, 'A4', 1, 1, '2023-2-1', 500, '기인');
commit;

select * from orders20;


create view v_joy
as
select  o.id 아이디, name 이름, sido 시도, product_content 상품내용, product_price2 상품판매가, quantity 주문수량
    from tb_zipcode20 t
    join member20 m
         on t.zipcode = m.zipcode
    join orders20 o
         on o.id = m.id
    join products20 p
        on p.product_code = o.product_code;
        
select * from v_joy;       


        
        
        
        
