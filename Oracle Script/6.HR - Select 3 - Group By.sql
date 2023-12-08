
/* �׷� �Լ� : group by, having 
select �÷���
from ���̺�[��]
where ���� 
group by �÷���[������ ���� �׷���]
having ����[group by�� ��� ���� ����]
order by �÷��� asc[desc]
*/

/* ���� �Լ� : number Ÿ���� �÷��� ����    <== NULL�� �ڵ����� ó����
     SUM - �÷��� ��� ���� ��
     AVG - �÷��� ��� ���� ���
     MAX - �÷��� �ִ밪
     MIN - �÷��� �ּҰ�
     COUNT (*) - �׷��ε� ���ڵ� �� ���
     
     ���� : ���� ����� ���� ������ ����� �Ǳ⶧���� �ٸ� �÷��� ��� �� ���� �߻���
           ��, group by ���� grouping�� �÷��� ��� ����.
  
*/
desc employee;

-- �÷��� �Լ� ��� : ����
-- ���� (salary)
select SUM (salary) �հ�,Round(AVG(salary),2) as ��հ�,   --,emame, salary �� �̿Ͱ��� �ٸ� �÷��� ���� ������� �� ���� �߻��ϱ� ������ ���� ���� �Լ��� ��� ��.
max (salary) �ִ밪 , min(salary) as �ּҰ�
, count(*) "���� ���ڵ� ��"
from employee;

-- ���� �Լ��� NULL�� �ڵ����� ó����.
select commission
from employee;

-- ���ʽ� (commission) <== null�� �ڵ����� ó����.
select SUM (commission) �հ�,Round(AVG(commission),2) as ��հ�,  
       max (commission) �ִ밪 , min(commission) as �ּҰ�
       , count(*) "���� ���ڵ� ��"
from employee;

-- �μ����� ������ �հ�, ���, �ִ����, �ּҿ���, �׷��ε� ���� ���
select dno �μ���ȣ, SUM(salary) �հ�, Round(AVG(salary)) ���,         -- group by�� ������ �Լ��� ��� ����
       MAX(salary) �ִ밪, MIN(salary) �ּҰ�, count(*) "�׷��ε� ��"
from employee
group by dno;         -- DNO �÷��� ������ ���� grouping�ؼ� �����Լ��� ������. 

select salary, dno
from employee
order by dno asc;

-- ��å(job)���� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��ε� ���� ����غ�����.
select ename,job,salary
from employee
order by job;

select job ��å,
sum(salary) �հ�, round(avg(salary),2) ���, max(salary)�ִ밪, min(salary)�ּҰ�,
count(*)�׷��εȼ�
from employee
group by job;                -- job �÷��� ������ ���� �׷���

-- ���� �߻���
select ename                 -- group by job �÷��� ������ �÷��� �ƴϱ� ������ ������ �߻���.
from employee
group by job;

select count(*) ��ü���ڵ�� from employeel

/*
   group by ������ where [����] vs having [����]
      where [����] : group by �ϱ� ���� ������ ������,     ��Ī �̸��� ����� �� ����.
      having [����] : group by �ؼ� ���� ����� ���� ����, ��Ī �̸��� ����� �� ����.
      
   order by �÷��� asc[desc]  : ��Ī �̸��� ��� ����
*/
-- ���޺��� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��ε� ���� ����ϵ�, �μ���ȣ 20���� �����ϰ�(����) �μ����� ����� 2000 �̻��� ����(���)�� ���.]
   -- ����� desc ���
-- ���� Ǭ ����
select job ����, 
sum(salary)�հ�, avg(salary) ���, max(salary) �ִ밪, min(salary) �ּҰ�,
count(job) �׷��εȼ�
from employee
where dno ^= 20                    -- where dno not in (20), group by ���� ����
having avg(salary) >=2000
group by job
order by avg(salary) desc;

select *
from employee;

-- �������� Ǭ ����
select job ����, 
sum(salary)�հ�, avg(salary) ���, max(salary) �ִ밪, min(salary) �ּҰ�,
count(job) �׷��εȼ�
from employee
where dno != 20                    
group by job
having avg(salary) >=2000         -- having�� group by �ڿ� ����.
order by avg(salary) desc;

-- group by ������ �÷��� 2�� �̻�, �� �÷��� ���ļ� ������ ������ �׷�����.
    -- job, dno
select job , dno
from employee
order by job asc;

select dno, job, sum(salary) ���Ѱ�, count(*)
from employee
group by job, dno;

-- �� ��å(job)�� ���ؼ� ������ �հ�, ���, �ִ밪, �ּҰ�, ī��Ʈ���� ����ϵ�, �Ի����� 81�⵵�� �Ի��� ����鸸 ����
-- ������ ����� 1500���� �̻��� �͸� ����ϵ�, ����� �������� ����
select job ��å, 
sum(salary) �հ�, round(avg(salary)) ���, max(salary) �ִ밪, min(salary) �ּҰ�,
count(*) ī��Ʈ��
from employee
where substr (hiredate, 1, 2) = 81          -- where hiredate like '81%'
group by job
having round(avg(salary)) >= 1500
order by ��� desc;

/*  group by ������ ���Ǵ� Ű����
      rollup : group by �÷�  <== ��� ������ ���ο� ��ü ����� �ѹ� �� ���
      cube   : grouping ������ ���ο� ��� ���, ������ ���ο� ��ü ����� ���������� ���
    
*/

select job ��å, 
sum(salary) �հ�, round(avg(salary)) ���, max(salary) �ִ밪, min(salary) �ּҰ�,
count(*) ī��Ʈ��
from employee
where substr (hiredate, 1, 2) = 81          
group by rollup (job)                       -- rollup(Ű�����)
having round(avg(salary)) >= 1500
order by ��� desc;

-- 1. rollup, cube Ű���带 ������� �ʴ� ��� : �׷����� ����� ���
select dno, job,
count(*), sum(salary), round(avg(salary),2),max(salary), min(salary)
from employee
group by dno,job
order by count(*) desc;

select dno,job
from employee
order by job asc

-- 2. rollup Ű���带 ����ϴ� ��� : �׷����� ��� ���, ������ ������ ��ü ���뵵 ���
select dno, job,
count(*), sum(salary), round(avg(salary),2),max(salary), min(salary)
from employee
group by rollup (dno, job)
order by count(*) desc;

-- 3. cube Ű���带 ����ϴ� ��� : �׷����� ��� ���, ��ü ���뵵 ���, ���λ��ױ��� ���
select dno, job,
count(*), sum(salary), round(avg(salary),2),max(salary), min(salary)
from employee
group by cube (dno, job)
order by count(*) desc;

/*
   SubQuery : select �� ���� select ���� [sub query], �������� �۾��� �� �������� ó��
       - where ������ ���� ����
*/

-- ename (����̸�)�� SCOTT�� ����� ��å�� ���� ������� ��� : 2�� ������ �ʿ���.

-- 1. SCOTT ����� ��å�� �˾ƿ��� ����
select ename ����̸�, job ��å
from employee
where ename = 'SCOTT';
-- 2. �˾ƿ� ��å�� ���������ؼ� �˻��ؼ� �̸��� ���
select ename ����̸�, job ��å
from employee
where job = 'ANALYST';

-- SubQuery�� ����ؼ� �ϳ��� ������ ó����.
select ename ����̸�, job ��å
from employee
where job = (select job from employee where ename = 'SCOTT');

select * from employee;

select ename ����̸�, job ��å
from employee
where job = (select job from employee where ename = 'ALLEN');       -- (�̳� ������ �ٱ� ������ �ٸ��� job, ename �̷������� �Է��ϸ�) ���� �߻�

-- SCOTT�� ALLEN�� ��å�� �ش�����ʴ� ������� ��� ���

    -- 1. SCOTT�� ��å�� ����ϴ� ����
select job from employee where ename = 'SCOTT';  -- ANALYST

    -- 2. ALLEN�� ��å�� ����ϴ� ����
select job from employee where ename = 'ALLEN';  -- SALESMAN

    -- 3. where job not in ('SCOTT�� ��å', 'ALLEN�� ��å');
select ename �̸�, job ��å
from employee
where job not in ('ANALYST', 'SALESMAN');

-- SubQuerry�� �� �������� ���
select ename �̸�, job ��å
from employee
where job not in (
  (select job from employee where ename = 'SCOTT'), 
  (select job from employee where ename = 'ALLEN'));

select ename �̸�, job ��å
from employee
where job not in (
  (select job from employee where ename = 'SCOTT' or ename = 'ALLEN'));

select ename �̸�, job ��å
from employee
where job not in (select job from employee where ename in ('SCOTT', 'ALLEN'));  

-- ���� �� : =
-- �������� �� : in
-- 'SCOTT'���� ���� ������ �޴� ����� ����, ������ ���
select ename ����̸�, salary ����
from employee
where salary >(select salary from employee where ename = 'SCOTT');

-- �ּ� �޿��� �޴� ����� �̸�, ������, �޿� ���
select ename ����̸�, job ������, salary �޿�
from employee
where salary =(select min(salary) from employee);

-- subquery�� ����ؼ� ���
-- �μ���(dno)�� �ּ� �޿��� �޴� ��������� �̸�, ��å, ������ ��� : ��Ʈ : group by, dno, min, in Ű����
select ename ����̸�, job ��å, salary ����, dno �μ���ȣ
from employee
order by dno asc, salary;

-- subquerry
select ename ����̸�, job ��å, salary ����, dno �μ���ȣ
from employee
where salary in (select min(salary) from employee group by dno);   -- �� �μ��� �ּҿ����� select�� ���� ���

select dno
from employee;

-- �� �μ��� �ּ� �޿��� 30�� �μ��� �ּ� �޿����� ū �μ��� ���
-- ���� Ǭ ����
select salary �޿�, dno �μ���ȣ
from employee
where salary in (select min(salary) from employee where min(salary) group by dno);

-- �������� Ǭ ����
select dno, count(*), min(salary)�μ����ּҿ���
from employee
group by dno           -- �μ���ȣ ������ ���� �׷���
having min(salary) > (
            -- �������� : 30�� �μ��� �ּ� ����
            select min(salary) from employee 
            where dno =30);








