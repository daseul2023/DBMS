
select * from board
order by seq desc;

desc board;



select * from board order by seq desc;

update board 
set title ='���� ������', write = '�̼���', content = '���� ������'
where seq = 4;

commit;

desc board;

delete board where seq = 3;
rollback;

update board 
set cnt = cnt +1 
where seq = 7;

commit;

desc users;

select * from users 
where id = 'user' and password = '1234';

