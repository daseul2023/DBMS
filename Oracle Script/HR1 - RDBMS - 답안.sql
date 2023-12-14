
-- 1. �����ȣ(eno)�� 7788�� ����� �̸�(ename)�� �μ���ȣ(dno)�� ����ϼ���.  �÷����� ��Ī(alias) ���Ѽ� ��� �ϼ���.

select * from employee;

select * from department;

select ename ����̸�, e.dno �μ���ȣ
from employee e
    join department d
    on e.dno = d.dno
where eno = 7788;

-- 2. 1981�⵵ �Ի��� ����� �̸�(ename)�� �Ի���(hiredate) �� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ���: _ , %)

select ename ����̸�, hiredate �Ի���
from employee
where hiredate like '81%';

-- 3. ��� ����(job) �� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    -- �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.

select ename ����̸�, job ������, salary �޿�
from employee
where job in ('CLERK', 'SALESMAN')
and salary not in (1600, 950, 1300);

-- 4. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���. �Ҽ����� �߶� ��� �ϼ��� . (months_between , trunc �Լ� ���)

select trunc(months_between(sysdate, '1991-11-6'))
from dual;

-- 5. �μ���(dno) ������ ����� 2000 �̻� ��� �ϵ� �μ���ȣ(dno)��  ������������ ����ϼ���. 
  -- ����� �Ҽ����� 2�ڸ������� ����ϵ� �ݿø��ؼ� ��� �ϼ���.

select dno �μ���ȣ, round(avg(salary),2) ����
from employee
group by dno
having round(avg(salary),2) >= 2000
order by dno asc;

-- 6. �޿��� ��� �޿����� ���� ������� �����ȣ(eno)�� �̸�(ename)�� ǥ���ϵ� 
    -- ����� �޿�(salary) �� ���� �������� �����Ͻÿ�.  subquery�� ����ؼ� ��� �ϼ���.

select eno �����ȣ, ename �̸�, salary �޿�
from employee
where salary > (select round(avg(salary),2) from employee)
order by salary asc;

-- 7. ��å(job) �� 'MANAGER' �� ����̸�(ename), �μ���ȣ(dno), 
   -- �μ���(dname), �μ���ġ(loc) ����ϵ� ����̸�(ename) �������� �����ϼ���.

select ename ����̸�, job ��å, e.dno �μ���ȣ, dname �μ���, loc �μ���ġ
from employee e
    join department d
    on e.dno = d.dno
where job = 'MANAGER'
order by ename desc;

-- 8. ������ ������ ������ view �� �����ؼ� �ܼ�ȭ�ϰ� view�� �����Ͻÿ� . 
-- ��(view) �� :  v_join 

-- employee, department ���̺��� �μ����� �ּ� ������ �޴� ����̸�(ename), ����� ��å (job), �μ���(dname), �μ���ġ (loc) �� ��µ� �ּҿ����� 900�̻� �� ����ϼ���. 
   --��, �μ���ȣ 20���� �����ϰ� ����ϼ���. 
   -- ��Ʈ :  JOIN, group by, where, having , subquery  ������ Ȱ�� �ϼ���
   
   -- ��� :  view ���� ����, view ���� ���� �� ��������. 
   
create view v_join
as
select ename ����̸�, job ��å, dname �μ���, loc �μ���ġ, e.dno �μ���ȣ
from employee e
    join department d
    on e.dno = d.dno
where salary in (
        select min(salary) 
        from employee 
        where dno <> 20
        group by dno
        having min(salary) >= 900);
        
-- 9. ���̺� ����� alter table �� ����Ͽ� ������ ���� ���̺�� ���� ���� ������ �߰� �Ͻÿ� 
   -- employee ���̺��� ��� �÷��� ���� �����Ͽ� EMP50 ���̺��� �����Ͻÿ�
   -- department ���̺��� ��� �÷��� ���� �����Ͽ� DEPT50 ���̺��� �����Ͻÿ�. 
   -- ���� ���̺� �ο��� ���������� ����� ���̺��� �ο� �Ͻÿ� . 
   
create table EMP50
as
select * from employee;

create table DEPT50
as
select * from department;

alter table EMP50
modify dno not null;

alter table DEPT50
modify dno not null;

select * from emp50;

alter table EMP50
modify manager not null;


alter table emp50
    ADD constraint pk_emp50_eno primary key (eno);
alter table dept50
    ADD constraint pk_dept50_dno primary key (dno);
alter table emp50
    add constraint fk_emp50_dno foreign key (dno) references dept50 (dno);
commit;


-- 10. 9�� ���׿��� ������ ���̺� (EMP50, DEPT50) ���̺��� ����Ͽ� �Ʒ� ������ �ۼ��Ͻÿ�. 
     -- ��� ������ DataBase �� ������ ���� �Ͻÿ�. 
     -- 1. EMP50 ���̺� ���ڵ�(���� �߰��Ͻÿ�). 
         -- �����ȣ : 8181     ����̸� : ȫ�浿     ��å : �繫��     ���ӻ�� :  SCOTT (7788) 
         -- �Ի糯¥ : ������ �ý����� ��¥     ���� : 1000.     ���ʽ� : 100     �μ���ȣ : 20
     -- 2. EMP50 ���̺� ���� ���ʽ��� ���� ������� ã�Ƽ� ���ʽ��� 50���� ���� �Ͻÿ�. 
     -- 3. DEPT50 ���̺��� �μ���ȣ 40�� �μ����� ����Ρ��� �ٲٰ�, �μ���ġ�� ������� �����Ͻÿ�. 
     -- 4. EMP50 ���̺��� ��å�� ��MANAGER�� ������� ã�� ���� �Ͻÿ�. 
     
insert into EMP50 (eno, ename, job, manager, hiredate, salary, commission, dno)
values (8181, 'ȫ�浿', '�繫��', 7788, sysdate, 1000, 100 ,20);

commit;

select * from EMP50;

update EMP50
set commission = 50
where commission is null or commission = 0;

update EMP50
set commission = 50
where commission = null;

commit;

select * from DEPT50;

update DEPT50
set dname = '���', loc = '����'
where dno = 40;

commit;

delete EMP50
where job = 'MANAGER';

commit;



---------------------------------------------------------------------------------------



-- 1.
select ename �̸�,
       DNO   �μ���ȣ
from EMPLOYEE
where eno = 7788;


-- 2.
select ename    �̸�,
       hiredate �Ի���
from employee
where to_char(hiredate, 'YYYYMMDD') like '__81%';


-- 3,
select ename  �̸�,
       job    ������,
       salary �޿�
from EMPLOYEE
where salary not in (1600, 950, 1300)
AND job in ('CLERK', 'SALESMAN');

-- 4.
select trunc(months_between(sysdate, '1995/10/23'))
from dual;

-- 5.
select dno �μ���ȣ, round(avg(SALARY), 2) ��տ���
from EMPLOYEE
group by dno
having avg(SALARY) >= 2000
order by dno ASC;

-- 6.
select eno   �����ȣ,
       ename �̸�
from EMPLOYEE
where salary >= (select avg(salary) from EMPLOYEE)
order by salary ASC;

-- 7.
select e.ename �̸�,
       d.dno   �μ���ȣ,
       d.dname �μ���,
       d.loc   �μ���ġ
from EMPLOYEE e
         join
     DEPARTMENT d
     on
         e.dno = d.dno
where job = 'MANAGER'
order by ename DESC;

-- 8.
create view v_join
as
select ename �̸�,
       job   ��å,
       dname �μ���,
       loc   �μ���ġ
from EMPLOYEE e
         join
     DEPARTMENT d
     on
         e.dno = d.dno
where e.dno <> 20
  AND salary in (select MIN(salary)
                 from EMPLOYEE
                 group by dno
                 having MIN(salary) >= 900);
select *
from v_join;


-- 9.
create table emp50
as
select *
from EMPLOYEE;

create table dept50
as
select *
from DEPARTMENT;

alter table emp50
    ADD constraint pk_emp50_eno primary key (eno);
alter table dept50
    ADD constraint pk_dept50_dno primary key (dno);
alter table emp50
    add constraint fk_emp50_dno foreign key (dno) references dept50 (dno);
commit;





create table EMP50
as
select * from employee;

create table DEPT50
as
select * from department;

alter table EMP50
modify dno not null;

alter table DEPT50
modify dno not null;
-- 10.
-- -- 1.
insert into emp50
values (8181, 'ȫ�浿', '�繫��', 7788, sysdate, 1000, 100, 20);
commit;
-- -- 2.
update emp50
set commission = 50
where COMMISSION is null
   or COMMISSION = 0;
commit;
-- -- 3.
update dept50
set dname = '���',
    loc   = '����'
where dno = 40;
commit;
-- -- 4.
delete emp50
where job = 'MANAGER';
commit;


---------------------------------------------------------
select *
from emp50;
select *
from dept50;




