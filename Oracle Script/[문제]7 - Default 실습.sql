
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
        mem_id varchar2(30) not null, 
                constraint FK_SALE40_WINE_CODE foreign key(wine_code) references WINE40(wine_code),
                constraint FK_SALE40_MEM_ID foreign key(mem_id) references MEMBER40(mem_id)
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
values (2, 1234, null, '010-1111-1111', 7, 'B');
insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (3, 1234, '1996-7-5', '010-1111-1111', 7, 'C');
insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (4, 1234, '1997-7-15', '010-1111-1111', 7, 'D');
insert into member40(mem_id, mem_pw, mem_birth, mem_tel, mem_pt, mem_grade)
values (5, 1234, '1997-7-15', '010-1111-1111', 7, 'E');
commit;

insert into today40(today_code, today_sens_value, today_intell_value, today_phy_value)
values (5, 1234, '1997-7-15', '010-1111-1111', 7, 'E');

today40(
        today_code varchar2(6) not null constraint PK_TODAY40 primary key,
        today_sens_value number (3),
        today_intell_value number (3),
        today_phy_value number (3)

