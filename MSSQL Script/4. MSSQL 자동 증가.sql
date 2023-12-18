
use mydb;

-- 컬럼에 값을 넣지 않을 때 자동으로 증가되도록 하는 컬럼 : identity
-- identity 컬럼은 값을 넣지 않는다.  <== MSSQL에서만 사용
-- 초기값 : 1, 증가값 : 1
-- 정수 선언 (int, bigint)
-- primary key

create table abc (
		a int not null identity primary key,
		b varchar(50),
		c varchar(50)
		);

insert into abc
values ('서울', 'add1');             -- 계속 실행하면 자동으로 값이 1씩 증가됨. identity (MSSQL에서만 사용함.)

select * from abc;