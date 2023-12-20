create table guestboard(
	name varchar2(200),
	email varchar2(200),
	subject varchar2(200),
	content varchar2(200)
	);
    
    select * from guestboard;
    
    insert into guestboard (name,email,subject,content) 
    values ( 제우스, aaa@aaa.com,T1,Faker)                 -- 문자열일때, ''없어서 오류 발생함.
    
    insert into guestboard (name,email,subject,content) 
    values ( '제우스', 'aaa@aaa.com','T1','Faker');
    commit;
    
    -- developer에서는 반드시 : commit 해줘야 함.
    -- commit 하기 전까지는 Lock
    
    insert into guestboard (name,email,subject,content) 
    values ( '우제야야', 't1t1@t1.com','T1','세체탑')
    
    rollback;