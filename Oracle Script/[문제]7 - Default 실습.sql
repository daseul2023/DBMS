create table grade_pt_rade40(
        mem_grade varchar2(20) not null constraint PK_GRADE_PT_RADE40 primary key,
        grad_pt_rate number (3,2)
);

create table member40(
        mem_id varchar2(6) not null constraint PK_MEMBER40 primary key,
        mem_pw varchar2(20) not null,
        mem_birth date default sysdate not null,
        mem_tel varchar2(20),
        mem_pt varchar2(10) not null,
        mem_grade varchar2(20), 
                constraint FK_MEMBER40_MEM_GRADE foreign key(mem_grade) references GRADE_PT_RADE40(mem_grade)
);

create table today40(
        today_code varchar2(6) not null constraint PK_TODAY40 primary key,
        today_sens_value number (3),
        today_intell_value number (3),
        today_phy_value number (3)
);

create table nation40(
        nation_code varchar2(26) not null constraint PK_NATION40 primary key,
        nation_name varchar2(50) not null 
);

create table theme40(
        theme_code varchar2(6) not null constraint PK_THEME40 primary key,
        theme_name varchar2(50) not null 
);

create table manager40(
        manager_id varchar2(30) not null constraint PK_MANAGER40 primary key,
        manager_pwd varchar2(20) not null,
        manager_tel varchar2(20) 
);

create table wine_type40(
        wine_type_code varchar2(6) not null constraint PK_WINE_TYPE40 primary key,
        wine_type_name varchar2(50) 
);


create table wine40(
        wine_code varchar2(26) not null constraint PK_WINE40 primary key,
        wine_name varchar2(100) not null,
        wine_url blob ,
        wine_sugar_code number(2),
        wine_price number(15) default 0 not null,
        wine_vintage date ,
        
        nation_code varchar2(6) ,
        wine_type_code varchar2(6) ,
        theme_code varchar2(6) ,
        today_code varchar2(6) ,
                constraint FK_WINE40_NATION_CODE foreign key(nation_code) references NATION40(nation_code),
                constraint FK_WINE40_WINE_TYPE_CODE foreign key(wine_type_code) references WINE_TYPE40(wine_type_code),
                constraint FK_WINE40_THEME_CODE foreign key(theme_code) references THEME40(theme_code),
                constraint FK_WINE40_TODAY_CODE foreign key(today_code) references TODAY40(today_code)
);

create table sale40(
        sale_date date default sysdate not null constraint PK_SALE40 primary key,
        sale_amount varchar2(5) not null,
        sale_price varchar2(6) not null,
        sale_tot_price varchar2(15) not null,
        wine_code varchar2(6) not null,
        mem_id varchar2(30) not null
);

create table stock_management40(
        stock_code varchar2(6) not null constraint PK_STOCK_MANAGEMENT40 primary key,
        ware_date date default sysdate not null,
        stock_amount number(5) default 0 not null,
        
        wine_code varchar2(6) ,
        manager_id varchar2(30),
                constraint FK_STOCK_MANAGEMENT40_WINE_CODE foreign key(wine_code) references WINE40(wine_code),
                constraint FK_STOCK_MANAGEMENT40_MANAGER_ID foreign key(manager_id) references MANAGER40(manager_id)
);

insert into grade_pt_rade40(mem_grade, grad_pt_rate)
values ('A', 1);
insert into grade_pt_rade40(mem_grade, grad_pt_rate)
values ('B', 2);
insert into grade_pt_rade40(mem_grade, grad_pt_rate)
values ('C', 3);
insert into grade_pt_rade40(mem_grade, grad_pt_rate)
values ('D', 4);
insert into grade_pt_rade40(mem_grade, grad_pt_rate)
values ('E', 5);
commit;

insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (1, 1234, '1997-7-15', '010-1111-1111', 7, 'A');
insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (2, 1234,'1996-7-5', '010-1111-1111', 7, 'B');
insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (3, 1234, '1996-7-5', '010-1111-1111', 7, 'C');
insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (4, 1234, '1997-7-15', '010-1111-1111', 7, 'D');
insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (5, 1234, '1997-7-15', '010-1111-1111', 7, 'E');
commit;

insert into today40(today_code, today_sens_value, today_intell_value, today_phy_value)
values (000, 123, 111, 111);
insert into today40(today_code, today_sens_value, today_intell_value, today_phy_value)
values (001, 123, 111, 111);
insert into today40(today_code, today_sens_value, today_intell_value, today_phy_value)
values (002, 123, 111, 111);
insert into today40(today_code, today_sens_value, today_intell_value, today_phy_value)
values (003, 123, 111, 111);
insert into today40(today_code, today_sens_value, today_intell_value, today_phy_value)
values (004, 123, 111, 111);
commit;

insert into nation40(nation_code, nation_name)
values (82,'대한한국');
insert into nation40(nation_code, nation_name)
values (81,'미국');
insert into nation40(nation_code, nation_name)
values (80,'영국');
insert into nation40(nation_code, nation_name)
values (79,'일본');
insert into nation40(nation_code, nation_name)
values (78,'베트남');
commit;

insert into theme40(theme_code, theme_name)
values (111,'놀이공원');
insert into theme40(theme_code, theme_name)
values (113,'놀이공원');
insert into theme40(theme_code, theme_name)
values (145,'놀이공원');
insert into theme40(theme_code, theme_name)
values (311,'놀이공원');
insert into theme40(theme_code, theme_name)
values (121,'놀이공원');
commit;

insert into manager40(manager_id, manager_pwd, manager_tel)
values ('페이커',1234, null);
insert into manager40(manager_id, manager_pwd, manager_tel)
values ('제우스',1334, null);
insert into manager40(manager_id, manager_pwd, manager_tel)
values ('도란',4234, null);
insert into manager40(manager_id, manager_pwd, manager_tel)
values ('쵸비',7234, null);
insert into manager40(manager_id, manager_pwd, manager_tel)
values ('기인',1934, null);
commit;

insert into wine_type40(wine_type_code, wine_type_name)
values (111, '보르도와인');
insert into wine_type40(wine_type_code, wine_type_name)
values (113, '미국와인');
insert into wine_type40(wine_type_code, wine_type_name)
values (114, '체코와인');
insert into wine_type40(wine_type_code, wine_type_name)
values (116, '호주와인');
insert into wine_type40(wine_type_code, wine_type_name)
values (119, '화이트와인');
commit;

insert into wine40(wine_code, wine_name, wine_url, wine_sugar_code, wine_price, wine_vintage, nation_code, wine_type_code, theme_code, today_code)
values (1100, '화이트와인', UTL_RAW.CAST_TO_RAW('faker') , 2, 21000, null, 82, 111, 111, 000);
insert into wine40(wine_code, wine_name, wine_url, wine_sugar_code, wine_price, wine_vintage, nation_code, wine_type_code, theme_code, today_code)
values (1101, '화이트와인', UTL_RAW.CAST_TO_RAW('zeus') , 2, 21000, null, 81, 113, 113, 001);
insert into wine40(wine_code, wine_name, wine_url, wine_sugar_code, wine_price, wine_vintage, nation_code, wine_type_code, theme_code, today_code)
values (1102, '화이트와인', UTL_RAW.CAST_TO_RAW('doran') , 2, 21000, null, 80, 114, 145, 002);
insert into wine40(wine_code, wine_name, wine_url, wine_sugar_code, wine_price, wine_vintage, nation_code, wine_type_code, theme_code, today_code)
values (1103, '화이트와인', UTL_RAW.CAST_TO_RAW('chovy') , 2, 21000, null, 79, 116, 311, 003);
insert into wine40(wine_code, wine_name, wine_url, wine_sugar_code, wine_price, wine_vintage, nation_code, wine_type_code, theme_code, today_code)
values (1104, '화이트와인', UTL_RAW.CAST_TO_RAW('kiin') , 2, 21000, null, 78, 119, 121, 004);
commit;

insert into sale40(sale_date, sale_amount, sale_price, sale_tot_price, wine_code, mem_id)
values ('2023-12-17', 100, 21000 , 45000, 1100, 1);
insert into sale40(sale_date, sale_amount, sale_price, sale_tot_price, wine_code, mem_id)
values ('2023-12-16', 100, 21000 , 45000, 1101, 2);
insert into sale40(sale_date, sale_amount, sale_price, sale_tot_price, wine_code, mem_id)
values ('2023-12-15', 300, 21000 , 45000, 1102, 3);
insert into sale40(sale_date, sale_amount, sale_price, sale_tot_price, wine_code, mem_id)
values ('2023-12-14', 200, 21000 , 45000, 1103, 4);
insert into sale40(sale_date, sale_amount, sale_price, sale_tot_price, wine_code, mem_id)
values ('2023-12-13', 100, 21000 , 45000, 1104, 5);
commit;

insert into stock_management40(stock_code, ware_date, stock_amount, wine_code, manager_id)
values (1, '2023-12-12', 4, 1100, '페이커');
insert into stock_management40(stock_code, ware_date, stock_amount, wine_code, manager_id)
values (2, '2023-12-12', 4, 1101, '제우스');
insert into stock_management40(stock_code, ware_date, stock_amount, wine_code, manager_id)
values (3, '2023-12-12', 4, 1102, '도란');
insert into stock_management40(stock_code, ware_date, stock_amount, wine_code, manager_id)
values (4, '2023-12-12', 4, 1103, '쵸비');
insert into stock_management40(stock_code, ware_date, stock_amount, wine_code, manager_id)
values (5, '2023-12-12', 4, 1104, '기인');
commit;

create view v_joy2
as
select o.manager_id, sale_amount, wine_url, wine_type_name, t.today_code
    from grade_pt_rade40 g
        join member40 m 
            on m.mem_grade = g.mem_grade
        join sale40 s
            on s.mem_id = m.mem_id
        join wine40 w
            on w.wine_code = s.wine_code
        join today40 t
            on t.today_code = w.today_code
        join theme40 e
            on e.theme_code = w.theme_code
        join nation40 n
            on n.nation_code = w.nation_code
        join wine_type40 p
            on p.wine_type_code = w.wine_type_code
        join theme40 h
            on h.theme_code = w.theme_code
        join stock_management40 o
            on o.wine_code = w.wine_code
        join manager40 a
            on a.manager_id = o.manager_id;
    
select * from v_joy2;
