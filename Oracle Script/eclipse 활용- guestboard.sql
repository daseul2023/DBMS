create table guestboard(
	name varchar2(200),
	email varchar2(200),
	subject varchar2(200),
	content varchar2(200)
	);
    
    select * from guestboard;
    
    insert into guestboard (name,email,subject,content) 
    values ( ���콺, aaa@aaa.com,T1,Faker)                 -- ���ڿ��϶�, ''��� ���� �߻���.
    
    insert into guestboard (name,email,subject,content) 
    values ( '���콺', 'aaa@aaa.com','T1','Faker');
    commit;
    
    -- developer������ �ݵ�� : commit ����� ��.
    -- commit �ϱ� �������� Lock
    
    insert into guestboard (name,email,subject,content) 
    values ( '�����߾�', 't1t1@t1.com','T1','��üž')
    
    rollback;