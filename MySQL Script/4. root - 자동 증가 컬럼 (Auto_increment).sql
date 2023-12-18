
-- 자동 증가 컬럼 : auto_increment, 초기값 : 1, 증가값 : 1
--       MSSQL : identity
-- 		 오라클 : sequence

create table abc (
	a int not null auto_increment primary key,
    b varchar(50),
    c varchar(50)
    );
    
select * from abc;

-- MySQL 컬럼을 명시해야함. 자동 증가 컬럼인 a는 명시 안해도 됨!
insert into abc ( b, c)       
values ('서울', 'addr1');

