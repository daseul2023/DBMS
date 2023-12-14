
/*
    SQL : 모든 쿼리 구문 , select, create, alter, drop , insert, update, delete, grant, revoke, rollbac, commit 
       - 구조화된 질의 언어 
    
    SQL 종류 
        - DQL(Data Query Language)  : 출력, 검색 , select 
        - DDL (Date Definition Language) : 스키마 (틀, 구조), 객체 (테이블, 뷰, 함수, 시퀀스, 트리거, 저장프로시져, 인덱스) 생성, 수정,삭제
                    create (생성), alter (수정), drop(삭제) 
        - DML ( Data Manupulation Language) : 테이블의 레코드(값) 를 조작하는 언어 
                    insert( 입력 ) , update( 수정 ) , delete ( 삭제 ) 
                    -- 트랜잭션이 발생( RAM )  , commit : RAM의 변경된 내용을 DataBase 영구히 저장하도록 함. , rollback : 원래대로 되돌림. 
                    -- 트랜Ъ퓽 insert, update, delete  시작되면 자동으로 트랜잭션이 시작 
                    -- 트랜잭션을 종료 : rollback : 메모리에 변경된 내용을 다시 원래 상태로 되돌림, commit : DB에 영구적으로 적용함. 
                    -- 트랜Ъ퓽 종료 되지 않으면 LOCK 걸려서 트랜Ъ 트랜잭션 종료될때 까지 LOCK 걸려 있다. 
                    -- 오라클 :   DML 문을 시작하면 자동으로 트랜잭션이 시작됨 .     종료 (rollback, commit)  <== 명시 
                    -- MySQL, MSSQL : DML 문을 시작하면 자동으로 트랜잭션이 시작됨 . commit 자동으로 처리됨 
                    -- 명시적으로 트랜잭션을 시작 할 수 있고, 명시적으로 끝낼 수 있다. 
        - DCL ( Data Control Language) :  계정(Account) 에게 객체(Resource) 에 권한을 부여함.  grant(부여), revoke (제거)
        - TCL ( Transaction Control Language) : 트랜잭션을 관리 하는 언어,  <== DML 문에서 사용됨 
                commit (DB에 영구히 저장), rollback ( 원래되로 되돌림), savepoint ( 트랜잭션 내에서 임시 저장시점 생성 ) 
                begin transaction   : 명시적으로 트랜잭션 시작 
*/ 

/*
        트랜잭션 :  작업(일) 을 처리하는 최소 단위  : ALL or NOTHING :  되면 전부 되게 하거나 안되면 전부 안되게 함.
            - 트랜잭션 log  에 기록 되어 있다.   <== 오류난 시점까지 복원 ,  백업 시점 시점이 아니라 오류난 시점까지 복원가능 
            
            - 트랜잭션의 4가지 특징 
                - 원자성 (Atomicity) : 일을 처리하는 최소 단위 
                - 일관성 (Consistency) : 트랜잭션에서 처리된 결과는 일관성을 가진다. ALL or NOTHING 
                - 독립성 (lsolation) : 하나의 트랜잭션은 다른 트랜잭션과 격리되어 있다. , LOCK, 
                - 직속성 ( Durability) : commit  , DB에 영구적으로 저장됨               
                
                
*/ 

-- 테이블 복사 

create table account10 
as 
select eno as no, ename as name , salary as  account
from employee ; 

-- 은행의 통장 테이블 :  no : 계좌번호,  name : 통장주인 , account : 돈 (입금액), 억  
select * from account10; 

-- SMITH 에서 Miller에게 10억을 입금  :  2개의 update 구문을 하나의 transaction 으로 처리 : ALL or NOTHING 
    -- SMITH Account - 10억    :     update account10 set account = account - 10 where no= 7369
    -- Miller Account + 10억   :      update account10 set account = account + 10 where no = 7934 

begin transaction ;      -- 명시적으로 트랜잭션을 시작 

update  account10 
    set  account = account - 10 
where no = 7369;

update account10 
set account = account + 10 
 where no = 7934; 

select * from account10; 

-- 트랜잭션 종료 
rollback; 
commit ; 

desc account10 ; 


/* 
    DML : insert(값을 입력) , update (수정) , delete (삭제)  
        <== 트랜잭션 자동 시작, 
        <== 트랜잭션 종료 ( rollback, commit) 는 명시 (오라클) 

*/ 

-- 테이블 복사 
create table dept03 
as 
select * from department ; 

select * from dept03 ; 

-- dept03 : primary key 제약 조건 추가 
alter table dept03 
add constraint PK_DEPT03_DNO primary key (dno) ; 


-- INSERT : 주의 사항 , 각 컬럼에 자료형 : number , 문자, 날짜 , 컬럼에 적용된 제약 조건을 확인 
desc dept03 ; 
select * from user_constraints where table_name in ('DEPT03') ; 

-- insert into 테이블명 (컬럼명, 컬럼명,컬럼명) values ( 값, 값, 값 ) ; 

insert into dept03 ( dno, dname, loc ) 
values ( 50, 'HR', 'SEOUL') ; 

rollback ; 
commit ; 

select * from dept03 ; 

-- insert 시 컬럼 이름을 명시 하지 않는 경우 모든 컬럼에 값을 넣어야함. 
insert into dept03 
values ( 60, '인사부', '부산'); 

commit ; 

-- 컬럼 생략 할때는 모든 컬럼에 값이 순서에 맞게 입력 
insert into dept03 
values ( 70, '인사부');

-- 컬럼을 명시할때 순서를 바꿀 수 있고 , 특정컬럼은 값을 넣지 않아도 됨. 
insert into dept03 ( dname, dno) 
values ( '영업부', 80) ; 

commit ; 


--UPDATE 문 : 입력된 값을 수정시 사용 , 반드시 where 조건을 사용, where 조건에 사용되는 컬럼은 Primary Key 컬럼이어야 함. 
/*
    update 테이블명 
    set 컬럼명 = 바꿀값 , 컬럼명=바꿀값
    where 조건 
*/ 

update dept03 
set loc = '대구'  
where dno = 80 ;  

rollback ; 
commit ; 

select * from dept03 ; 

-- 
update dept03
set dname = '관리부', loc = '광주'
where dno = 40 ; 

--
insert into dept03
values (90,'영업부','대구');

insert into dept03
values (91,'영업부','광주');

-- update에서 반드시 where 조건, 조건을 처리하는 컬럼은 Primary Key, Unique 키 컬럼을 정의
update dept03
set dname = '인쇄부'
where loc = '광주';          -- 중복된 값

-- update 시 Primary Key 컬럼을 조건으로 처리해서 원하는 값만 수정
update dept03
set dname = '인쇄부'
where dno in (91, 80);

-- Delete : 레코드를 삭제할 때, where <조건> , <조건 : 중복되지않는 컬럼>
/*
    delete 테이블명
    where 조건
*/

select * from dept03;

-- delete 문에서 조건을 사용하지않는 경우 모든 레코드가 삭제됨

delete dept03

rollback;
commit;

-- delete, where 조건 사용  
delete dept03
where dno = 91;

-- 모든 레코드를 삭제 : 
   -- delete         : 레코드 하나 하나를 삭제함. 시간이 오래 걸림.  <<로우레벨 포맷>>
   -- truncate table 테이블명 : 한꺼번에 통째로 모든 레코드를 날림 <<빠른 포맷>>
   
   -- drop table 테이블명    : 테이블 자체를 삭제 

select * from dept03;

rollback;
commit;

-- 모든 레코드 삭제 : 테이블은 그대로 둔 채 값만 삭제, 시간이 소요됨.
delete dept03;

-- 모든 레코드 삭제 : 테이블은 그대로 둔 채 값만 삭제, 빠른 시간 내에 삭제 가능 <== DDL 문이기 때문에 롤백이 안됨. 실행 후 바로 커밋됨.
    -- 빠르게 처리됨
truncate table dept03;

----------------------------------------------------------------------------------------------------------------------

-- create, alter, drop, truncate, rename 등 DDL 구문에서 rollback 이나 commit 을 쓰면 안됨!!!

create table emp04
as
select * from employee;

select * from emp04;

/*  emp04
    임의의 값을 추가 : insert 
    임의의 값을 수정 : update 
    임의의 값을 삭제 : delete 
*/

insert into emp04
values (7766, 'MICHEL', 'ANALYST', 7782, '86/06/03', 2000, null,10);

rollback;

/*
    DDL : create (생성), alter (수정), drop (삭제) <== 테이블, 뷰, 함수, 시퀀스, 트리거, 저장프로시저, 스키마를 생성, 수정, 삭제
    
    자료형 : 데이터를 저장하는 타입
        - 숫자 : number (정수 자릿수) : 정수
                number (7,2)       : 소수, 전체 7자리, 소숫점 이하 2자리까지 넣을 수 있는 자료형
        - 문자 : char (n); 영문 1자(1byte), 한글 1자(3byte)
                - 성능이 빠르다, 하드 공간 낭비가 발생할 수 있다.
                - 주민번호(13),자릿수가 지정된 곳에 사용됨.
            varchar2(n) : 영문1자 (1byte), 한글1자(3byte)
                - 가변공간으로 적용됨, 성능은 char 보다 느릴 수 있다. 하드공간 낭비를 시키지 않는다.
                - 자릿수를 알 수 없는 문자열일 때 사용됨 (주소, 메일주소 등)
            nchar(n)     : nchar(10) : 한글10자까지 
            nvarchar2(n) : nchar(10) : 한글10자까지
        - 날짜 : date : BC 4712년 1월 1일 ~~~ 9999년 12월 31일까지 저장, 년, 월, 일, 시, 분, 초 까지만 저장 가능
                timestamp : insert (값이 들어오는 시스템의 시간) : 년, 월, 일, 시, 분, 초 밀리세컨드까지 저장
        - LOB 데이터 타입 : 대량의 값을 저장, 바이너리 파일 (그림,mp3같은)
                CLOB : 문자를 대량으로 넣을 수 있다. <== 글 내용
                BLOB : mp3, jpeg, hwp 이진 데이터 파일
                BFILE :  대용량 파일 저장
*/

--
drop table test10;
create table test10 (
        id number(4) not null primary key,                   -- 제약조건 이름 생략 가능, 중복된 값을 넣을 수 없다. 정수 4자리까지 들어감. 실수 넣으면 안됨.
        n1 char(10),                                -- 영문 10자, 한글 3자까지 들어감.
        n2 nchar(10),                               -- 영문 10자, 한글 10자까지 들어감.
        n3 varchar(10),                             -- 영문 10자, 한글 3자까지 들어감.
        n4 nvarchar2(10)                            -- 영문 10자, 한글 10자까지 들어감.
);

select * from test10;
commit;

insert into test10 (id, n1, n2, n3, n4)
values (1111, 'abcdefghij', '가나다라마바사아자차', 'abcdefghij', '가나다라마바사아자차');

insert into test10 (id, n1)
values (1112, '가나다');

/*
제약 조건 : 테이블의 컬럼에 들어가는 키 , 데이터의 무결성 (결함없는데이터, 원하는 값만 ) 
            Primary Key :  
                  - 테이블의 컬럼에 1번만 넣을 수 있다.  
                  - 두개 컬럼을 묶어서 PK를 넣을 수 있다. 
                  - 테이블을 생성할때 반드시 PK 이 존재해야 한다.  - Update, Delete 구문에서 PK 컬럼을 where 조건으로 사용함. 
                  - 특정 컬럼에 중복 된 값을 넣지 못하도록 함. 
                  - 반드시 not null 컬럼이어야함.  null을 넣을 수 없다. 
                  - index 가 자동으로 생성 된다. 컬럼의 검색을 빠르게 함. 
                  - JOIN 시 ON 에서 많이 사용하는 키 컬럼. 
            Unique Key : 
                  - 컬럼에 중복된 값을 넣지 못하도록 함. 
                  - null을 넣을 수 있다. 단 1번만 넣을 수 있다.  not null, null 
                  - 하나의 테이블에 여러번 Unique Key 를 넣을 수 있다. 
                  - index 가 자동으로 생성됨.  JOIN 시 ON에 사용됨 
            Foreign Key : 
                  - 다른 테이블(부모 테이블) 의 특정 컬럼을 참조 해서 값을 넣도록 함. 
                  - Foreign Key 가 잠조하는 컬럼은 부모테이블의 Primary Key , Unique Key 를 참조함. 
             NOT NULL 
                   - 컬럼에 NULL을 넣을 수 없도록 하는 제약 조건 
             CHECK 
                    - 컬럼에 조건을 넣어서 내개 원하는 값만 넣을 수 있도록 함. 
                    -  월 컬럼에  1 ~ 12 까지 넣을 수 있도록 
             default  : 제약 조건은 아니지만 제약 조건처럼 사용됨 
                     -  컬럼에 값을 넣지 않으면 default 로 설정된 값이 등록됨. 
                     
            제약 조건을 출력하는 데이터 사전 : user_constraints 
                select * from user_constraints where table_name in ('테이블명') ; 

*/ 

-- 제약 조건 이름을 넣지않고 테이블 생성한 경우 : Oracle에서 제약 조건 이름을 랜덤하게 생성한다.
-- insert 시 오류가 발생할 경우 제약조건이름으로 오류난 컬럼을 찾기 힘들다.
create table member1(
    id varchar2(50) not null primary key,        -- primary key 컬럼은 null을 넣을 수 없다. 제약 조건 이름을 생략하면 Oracle에서 자동으로 지정함.
                                                 -- 제약 조건 이름이 없어서 오류가 날 경우 임의적으로 지정하기 때문에 지정해주는게 좋음
    pass varchar2(50) not null,
    addr varchar2(100) null,
    jumin char(13) null,              -- 자릿수가 지정된 컬럼
    phone varchar2(50),
    age number(3),                    -- 정수 3자리
    weight number(5,2)                -- 실수 전체 5자리, 소숫점이하 2자리
);

desc member1;

insert into member1 (id, pass, addr, jumin, phone, age, weight)
values ('abc', '1234', '서울', '123456-789100','010-1111-1111', 30, 77.77);

commit;

select * from member1;
select * from user_constraints where table_name in ('MEMBER1');

-- 테이블 생성 시 제약 조건 이름 부여
create table member2(
    id varchar2(50) not null constraint PK_MEMBER2_ID primary key,        -- constraint 제약조건이름을 넣겠다 선언.                                            
    pass varchar2(50) constraint NN_MEMBER2_PASS not null,                -- NN = not null
    addr varchar2(100) null,
    jumin char(13) null,             
    phone varchar2(50),
    age number(3),                    
    weight number(5,2)                
);

select * from member2;
select * from user_constraints where table_name in ('MEMBER2');

insert into member2 (id, addr, jumin, phone, age, weight)
values ('abcd', '서울', '123456-789100','010-1111-1111', 30, 77.77);

commit;

/* UNIQUE : 중복된 값을 넣을 수 없다. null을 한번만 넣을 수 있다. 테이블을 여러번 넣을 수 있다.

*/

create table member3(
    id varchar2(50) not null constraint PK_MEMBER3_ID primary key,                                                
    pass varchar2(50) constraint NN_MEMBER3_PASS not null,                
    addr varchar2(100) null,
    jumin char(13) null constraint U_MEMBER3_JUMIN unique,             -- 중복되면 안됨.
    phone varchar2(50) not null constraint U_MEMBER3_PHONE unique,     -- 중복되면 안됨.
    age number(3),                    
    weight number(5,2)                
);

insert into member3 (id, pass, addr, jumin, phone, age, weight)
values ('abc', '1234', '서울', '123456-789101','010-1111-1112', 30, 77.77);

commit;
select * from member3;

-- CHECK 제약 조건 : 컬럼의 조건에 맞는 값만 넣을 수 있도록 함.
drop table member4;

create table member4(
    id varchar2(50) not null constraint PK_MEMBER4_ID primary key,                                                
    pass varchar2(50) constraint NN_MEMBER4_PASS not null,                
    addr varchar2(100) null constraint CK_MEMBER4_ADDR check (addr in ('서울','부산','대구')),
    jumin char(13) null constraint U_MEMBER4_JUMIN unique,             -- 중복되면 안됨.
    phone varchar2(50) not null constraint U_MEMBER4_PHONE unique,     -- 중복되면 안됨.
    age number(3) constraint CK_MEMBER4_AGE check (age > 0 and age < 200), 
    gender char(1) constraint CK_MEMBER4_GENDER check (gender in ('w','m')),
    weight number(5,2)
);

insert into member4 (id, pass, addr, jumin, phone, age, gender, weight)
values ('abc', '1234', '부산', '123456-789101','010-1111-1112', 150, 'w', 77.77);
commit;
select * from member4;

-- default : 제약 조건이 아니다. 제약 조건 이름을 부여할 수 없다.
    -- 값을 넣을 때 값이 들어가고 값을 넣지 않을 때 default 로 설정된 값이 들어간다.

create table member5(
    id varchar2(50) not null constraint PK_MEMBER5_ID primary key,                                                
    pass varchar2(50) constraint NN_MEMBER5_PASS not null,                
    addr varchar2(100) null constraint CK_MEMBER5_ADDR check (addr in ('서울','부산','대구')),
    jumin char(13) null constraint U_MEMBER5_JUMIN unique,             -- 중복되면 안됨.
    phone varchar2(50) not null constraint U_MEMBER5_PHONE unique,     -- 중복되면 안됨.
    age number(3) constraint CK_MEMBER5_AGE check (age > 0 and age < 200), 
    gender char(1) constraint CK_MEMBER5_GENDER check (gender in ('w','m')),
    weight number(5,2),
    hiredate date default sysdate,
    addr2 char(10) default '서울',
    age2 number default 0
);

insert into member5 (id, pass, addr, jumin, phone, age, gender, weight)
values ('abc', '1234', '부산', '123456-789101','010-1111-1112', 150, 'w', 77.77);

commit;
select * from member5;

insert into member5 (id, pass, addr, jumin, phone, age, gender, weight, hiredate, addr2, age2)
values ('abcd', '1234', '부산', '123456-789102','010-1111-1113', 150, 'w', 77.77, '2023-10-19', '강릉', 20);



















