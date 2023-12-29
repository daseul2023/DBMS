
select * from board
order by seq desc;

desc board;



select * from board order by seq desc;

update board 
set title ='제목 수정됨', write = '이순신', content = '내용 수정됨'
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

-- title 컬럼으로 검색하는 쿼리
select * from board
where title like '%우제%';
-- write 컬럼으로 검색하는 쿼리
select * from board
where write like '%상혁%';
-- content 컬럼으로 검색하는 쿼리
select * from board
where content like '%MVC%';
-- regdate 컬럼으로 검색하는 쿼리
select * from board
where regdate like '%23/12/26%';

select * from board
where cnt >10;
