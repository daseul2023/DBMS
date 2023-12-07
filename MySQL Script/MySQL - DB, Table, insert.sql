/*
   myDB2 데이터 베이스 생성
   member 테이블 생성
   레코드 2개 넣기 
*/

create database myDB2;

use myDB2;

create table member (
     idx int not null,
     name varchar(50) not null,
     addr varchar(50) not null
     );
     
select * from member;

insert into member (idx, name, addr)
values (1, '홍길동', '서울');

insert into member (idx, name, addr)
values (2, '김길동', '부산');   
     

