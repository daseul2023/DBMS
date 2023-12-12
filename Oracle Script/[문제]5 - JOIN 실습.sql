/*
   JOIN 실습
    member10 : 회원 정보를 저장하는 테이블
    zipcode10 : 우편번호를 저장하는 테이블
    product10 : 제품 정보를 저장하는 테이블
    order10 : 주문 정보를 저장하는 테이블
*/

-- 테이블 삭제 : Foreign Key가 참조하는 테이블은 삭제되지 않는다. : cascade constraints
    -- 1. 참조하는 테이블을 먼저 삭제 후 삭제해야 한다.
    -- 2. 테이블 삭제 시 cascade constraints 옵션을 사용해서 강제 삭제

-- Member10 테이블에서 참조되는 테이블이므로 삭제가 안된다.
drop table zipcode10;
-- Order10 테이블에서 참조되기 때문에 삭제할 수 없다.
drop table member10;
-- SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'MEMBER10';
drop table order10;
drop table product10;

-- 2. 테이블 삭제 시 cascade constraints 옵션을 사용해서 강제 삭제
    -- zipcode10 테이블을 강제 테이블을 삭제함.
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
        -- Foreign Key 제약 조건 추가함 : member10(zipcode) ===> zipcode10(zipcode)
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
        --Foreign Key 2개 들어감 
        constraint FK_ORDER10_M_ID foreign key(m_id) references MEMBER10(m_id),
        constraint FK_ORDER10_PRO_ID foreign key(pro_id) references PRODUCT10(pro_id)
);

-- 각 테이블에 레코드 5개씩 넣습니다.

-- ANSI JOIN 문을 사용해서 주문정보(Order10)테이블을 기준으로 
    -- 주문자명, 주문자메일주소, 주문자번지(시도),주문제품명,제품의 가격을 출력합니다. 
    -- order10,member10,zipcode10,product10

insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (123456, '경기도 시흥시', '일군', '일이삼');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (123455, '경기도 안산시', '이군', '일일삼');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (123454, '경기도 안양시', '삼군', '이일삼');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (133454, '경기도 군포시', '사군', '이일사');
commit;
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (133456, '경기도 파주시', '오군', '이이사');
commit;

-- Member10 테이블에는 참조되지 않지만 zipcode10 테이블에는 존재함 <=== RIGHT OUTER JOIN
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (60, '강릉', '사군', '이일사');
insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
values (70, '울진', '오군', '이이사');
commit;

select * from zipcode10;

insert into member10 (m_id, pass, name, email, zipcode)
values (1333, '일이삼사', '홍당무', 'abc@naver.com', 123456);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1334, '일이삼', '홍길동', 'bc@naver.com', 123455);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1332, '일육육', '홍길미', 'cc@naver.com', 123454);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1222, '일칠칠', '홍장미', 'rose@naver.com', 133454);
commit;
insert into member10 (m_id, pass, name, email, zipcode)
values (1122, '이이이', '홍길순', 'suni@naver.com', 133456);
commit;

-- member10 테이블에는 존재하지만 주문정보에는 없는 회원    <=== LEFT OUTER JOIN
insert into member10 (m_id, pass, name, email, zipcode)
values (6, '일칠칠', '심길동', 'fff@naver.com', 133454);
insert into member10 (m_id, pass, name, email, zipcode)
values (7, '이이이', '이길동', 'ggg@naver.com', 133456);
commit;

select * from member10;

insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121212, '책', 15000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121211, '가방', 50000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121210, '머리끈', 5000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (121200, '텀블러', 45000 , 1);
commit;
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (221200, '키링', 30000 , 1);
commit;

-- 주문 정보에는 없는 제품 (주문되지 않는 제품)  <=== RIGHT OUTER JOIN 
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (600, '망고', 20000 , 30);
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
values (700, '체리', 26000 , 100);
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

    -- 주문자명, 주문자메일주소, 주문자번지(시도),주문제품명,제품의 가격을 출력합니다. 
    -- order10,member10,zipcode10,product10
    
-- 내가 푼 문제
select name 주문자명, email 주문자메일주소, si_do 주문자번지, pro_name 주문제품명, pro_price 제품가격
from zipcode10 z join member10 m
on z.zipcode = m.zipcode                            -- 교집합을 찾아서 위에 굳이 교집합 넣지 않아도 실행 가능.
                join  order10 o
                on m.m_id = o.m_id
                join product10 p
                on o.pro_id = p.pro_id;
                
                
-- 선생님이 푼 문제               
select name 주문자명, email 주문자메일주소, si_do 주문자번지, pro_name 주문제품명, pro_price 제품가격
from order10 o join member10 m
    on o.m_id = m.m_id                           
         join  product10 p
         on o.pro_id = p.pro_id
         join zipcode10 z
         on m.zipcode = z.zipcode;

-- 모델링 되지 않는 주문 테이블  <=== order11
create table order11 (
    o_id number(6) not null primary key,
    
    m_name varchar2(200) not null,             -- 주문자 이름
    m_phone varchar2(200) not null,            -- 주문자 핸드폰 번호
    m_addr varchar2(200) not null,             -- 주문자의 배송 주소
    m_email varchar2(200) null,                -- 주문자의 메일 주소
    
    p_id number(6) not null,                   -- 제품 번호
    p_name varchar2(200) not null,             -- 제품 이름
    p_price number(7,2) not null,              -- 제품 가격
    p_cnt number(6) null                       -- 제품 수량
    )
    
    insert into order11 (o_id, m_name, m_phone, m_addr, m_email, p_id, p_name, p_price, p_cnt)
    values (10, '홍길동', '010-1111-1111', '서울', 'aaa@aaa.kr', 700, '체리', 26000, 100);
    
    insert into order11 (o_id, m_name, m_phone, m_addr, m_email, p_id, p_name, p_price, p_cnt)
    values (20, '김길동', '010-2222-1111', '부산', 'bbb@bbb.kr', 700, '바나나', 26000, 100);
    
    commit;
    
    select * from order11;

-- JOIN : ANSI JOIN, 
    -- INNER JOIN : on 절에 공통의 값만 출력한다.
    -- LEFT OUTER JOIN : 왼쪽 테이블의 모든 내용 출력
    -- RIGHT OUTER JOIN : 오른쪽 테이블의 모든 내용 출력
-- member10(다), zipcode(1) 테이블 :           <== zipcode 1 대 member 테이블 다
select *
from member10 m
    join zipcode10 z
    on m.zipcode = z.zipcode;

-- member10 에는 on절에 매칭되지않더라도 오른쪽 테이블의 모든 값을 출력 : RIGHT OUTER JOIN
select *
from member10 m               -- left outer join 하면 왼쪽 테이블이 나오고
    right outer join zipcode10 z      -- 오른쪽 테이블은 right outer join 하면 나온다
    on m.zipcode = z.zipcode;

-- 주문 테이블 (order10), 주문자 정보 (member10)   <=== on m_id

select * from order10;

select * 
from order10 o
    join member10 m
    on o.m_id = m.m_id;

-- 주문 정보에는 없는 사용자 출력 (주문하지않는 사용자) : RIGHT OUTER JOIN
select *
from order10 o
    right outer join member10 m
    on o.m_id = m.m_id;

select *
from member10 m
    left outer join order10 o
    on o.m_id = m.m_id;
    
-- 3개 테이블 조인 : Order10, Member10, Zipcode10

select *
from order10 o
    join member10 m
        on o.m_id = m.m_id
    join zipcode10 z
        on z.zipcode = m.zipcode;
        
-- 4개 테이블 조인 : Order10, Member10, Zipcode10, Product10
-- INNER JOIN
select *
from order10 o
    join member10 m
        on o.m_id = m.m_id
    join zipcode10 z
        on z.zipcode = m.zipcode
    join product10 p
        on p.pro_id = o.pro_id;

-- 주문하지 않는 사용자 정보도 출력, 판매되지 않는 제품도 OUTER JOIN 을 사용해서 출력
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




