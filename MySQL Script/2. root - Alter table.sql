
-- 데이터 베이스 생성 : root 접속 
create database shop ; 

-- 데이타 베이스에 접속(사용)  하기  : use 
use shop ; 

-- 테이블 생성 : number ( Oracle ) <==  int : 정수, double : 실수(8) , float : 실수(4)  
--            varchar2(50) : Oracle   <== varchar(50)  
create table dept60 (
	dno int not null primary key, 
    dname varchar(50) not null, 
    loc varchar(50) not null     
    ); 

-- 테이블 구조 확인 하기 
desc dept60 ; 

-- 테이블의 값 확인 하기 
select * from dept60 ; 

-- 테이블에 값 넣기  <== MySQL, MSSQL <=== 자동 커밋 트랜잭션 
insert into dept60 
values ( 10, '인사부', '서울') ; 

-- insert, update, delete 시 명시적으로 트랜잭션을 시작하고, 명시적으로 트랜잭션을 rollback, commit

start transaction ;   -- MySQL 명시적으로 트랜잭션 시작 ,  
insert into dept60 
values ( 20, '관리부', '부산') ; 

rollback ; 
commit ; 

-- 실제 DB에서 값을 insert, update, delete  <== 트랜잭션을 명시적으로 시작하고 값을 확인후 commit ; 
select * from dept60 ;

-- UPDATE 시 보호 설정이 있음.  <== Edit => Preference => SQL Editor ==> Safe Update 체크 해제 
update dept60 
set loc = '광주'
where dno = 10 ; 

-- Delete  : delete from 테이블명   
delete from dept60 
where dno = 20 ; 


-- MySQL은 자동 커밋 트랜 잭션 <== 
create table account10 (
	no int not null primary key , 
	name varchar(50) not null, 
    money double not null default 0 
    ); 

select * from account10 ; 

insert into account10 
values ( 1 , '홍길동', 100) ; 

insert into account10 
values ( 2 , '이순신', 200) ; 
   
-- 홍길동 계좌에서 10억을 이순신 계좌로 입금 : 트랜잭션이 2번 발생됨 
update account10 
set money = money -10 
where no = 1 ; 

update account10 
set money = money + 10
where no = 2 ; 

-- 홍길동 계좌에서 10억을 이순신 계좌로 입금 : 트랜잭션이 1 발생됨 
start transaction ; 

update account10 
set money = money -10 
where no = 1 ; 

update account10 
set money = money + 10
where no = 2 ; 

select * from account10 ; 
rollback; 
commit; 