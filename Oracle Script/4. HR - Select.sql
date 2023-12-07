
/*
   select : ���̺��� ���� �˻�
   select �÷��� from ���̺��[���]
   select * from employee;
*/
-- employee ���̺��� ��� �÷��� ��� �ϱ�
select
*
from employee;            -- �ٿ��� �ǰ� �� ��
-- Ư�� �÷��� ��� �ϱ�
select eno, ename, job    
from employee;            -- �� �÷� ������ , �ٿ��� ��

-- Ư�� �÷��� ������ ����ϱ�, �÷��� ������ �� �� �ִ�, �÷� �̸��� �ٲ� �� �ִ�.
select eno, ename, salary, ename, ename, salary, salary*12
from employee;            -- ������ �÷��� ������ ��½�ų �� ����

-- �÷� �̸��� ��Ī���� �ٲٰ� ����ϱ�
select eno as �����ȣ,     -- as�� �����ص� ��, �����̳� Ư������ ���� "" ���� ��.
ename �����, salary as ����, salary*12 as ����
from employee;

-- employee ���̺��� �� �÷��� �ǹ� 
select*
from employee;

select eno as �����ȣ,ename �����, job as ��å, manager "���ӻ���� ���", 
hiredate �Ի糯¥, salary ����, commission ���ʽ�, dno �μ���ȣ
from employee;

-- ���̺� ������ Ȯ���ϱ�, desc ���̺��, ���� �÷���, null ��뿩��, �ڷ���(number : ����, �Ǽ�, char, varchar2 : ���ڿ�)    -- null �� 0�� �ƴϰ� ����ִ� ����
desc employee;         -- insert �� �÷��� �ڷ���, NULL ��뿩�θ� Ȯ�� �� ���� ����.

select*from employee;

-- ������ ��� : ���� : NULL ���� ������ ����� NULL
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�
from employee;

-- ���� = ���� * 12+���ʽ�
   -- null �÷��� ������ �ϸ� ��� null

-- null ó���� �ȵ�
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�,      --���� ���̺� ���
       salary * 12 + commission ����
from employee;

-- nvl (Null Value Logic)(�÷���,0) : null�� ó���ϴ� �Լ�, �÷��� �� �� null�� 0���� ��ȯ�ϴ� �Լ�
-- nvl (value 1, value 2)
-- value1 ���� NULL�� �ƴ� ��� value1 ���� �״�� ���ϰ�, NULL�� ��� value2 ���� ���ڴٴ� ���̴�.
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�,      --���� ���̺� ���
       nvl(commission,0)��ó����, salary * 12 + nvl (commission, 0) ����
from employee;

-- �÷��� �÷��� ������ �� �ִ�. : +, -, *, /   <== number (����, �Ǽ�) Ÿ��
-- number : ���� 
-- number(7,2) : �Ǽ�, ��ü 7�ڸ�, �Ҽ������� 2�ڸ�
select * from employee;
desc employee;

select ename, salary, salary + salary as "+����", salary* salary as "*����", salary *0.1 as "������ 10%"
from employee;

-- �ߺ�ó�� �� ��� : distinct �÷��� , �÷����� �ߺ��� ���� �� ���

select * from employee;

-- �츮 ȸ���� �μ��� ���
select distinct dno
from employee;

-- �츮 ȸ���� ��å�� �ߺ� ���� �� ���(CLERK : �繫��, SALESMAN : �������, MANAGER : ������, ANALYST : �м���, PRESIDENT : ����)
   -- ��ҹ��� �������� ���� : ���� (select, create, from, group by, order by, insert, delete ��), �÷���, ���̺��
   -- ���̺� ���� ���ڵ��� ���� ��ҹ��ڸ� ������.
select distinct job
from employee;

select * from employee;

-- JOB (��å)�� MAMAGER (������)�� ����� ������ ���
select ename �����, job ��å
from employee
where job ='MANAGER';      -- ���ڵ� ���� ��ҹ��ڸ� �����ϱ� ������ ��ҹ��� �������ֱ�!

-- �μ� ���̺� Ȯ�� : department
select * from department;

select dno �μ���ȣ, dname �μ���, loc �μ���ġ
from department;

-- salgrade : ������ ����� �����ϴ� ���̺�  <==JOIN
select * from salgrade;

select grade �����ǵ��, losal ���ϳ�������, hisal ��������
from salgrade;

-- SELECT ���� ��ü ����, SQL : ����ȭ�� ���� ���
/*    ������ �ٲ�� �ȵǰ� ���� ����
SELECT �÷���
FROM ���̺��[���]
WHERE ����
GROUP BY �׷��� ó���� �÷���    <== �÷��� ������ ���� �׷����ؼ� ó����.
HAVING ����                   <== GROUP BY ����� ���� ����
ORDER BY �÷��� ASC[DESC]     <== ASC : ��������(���)����, DESC : ��������(�𼾵�)����, �÷��� �����ؼ� ���
*/

-- where ���� ����ϱ� : �� ������ (NUMBER Ÿ���� �÷����� ���) : = : ����, > , < , >=, <=
      -- ���� �ʴ� : <> , != , ^=
      -- or         -- in (��, ��, �� ... )
      -- and 
      -- between
select * from employee;

select *
from employee
where salary > 1500;

select *
from employee
where salary = 1500;

select *
from employee
where salary <> 1500;

-- or ������
select *
from employee
where salary = 1500 or salary = 800 or salary = 1600;

-- in Ű���� : in (��, ��, ��)
select *
from employee
where salary in (1500, 800 , 1600);

-- and ������ ��� : �μ���ȣ�� 10���� ����� ������ 1500 �̻��� ����ڸ� ���
select *
from employee
where dno = 10 and salary > 1500;

-- ��å�� manager �̸鼭 ������ 2000 �̻��� ����� �����ȣ, �����, ������ ���
select eno �����ȣ, ename as �����, salary ����, job ��å
from employee
where job='MANAGER' and salary >= 2000;

-- �񱳿����ڸ� date, varchar, char : 81�⵵ �Ի��� ����� ��� ����ض�
select *
from employee
where hiredate > '81/01/01' and hiredate < '81/12/31';

-- ���ڿ� : char, varchar, nvarchar, nchar : ���ڿ�, ''
select *
from employee
where ename < 'D';

-- like in : ���ڿ����� Ư�� ���� �˻� : % : (���� �� �������) ����� �͵� �������, _ : �ѱ��ڰ� ����� �͵� �������.
-- �÷��� Ư�� ���� �˻� �� ����.
select * from employee
where ename like '%LA%';

select * from employee
where ename like '_CO%';

-- NULL �˻� : is null , is not null , = ���� ���� ��

select*from employee;

-- commission �÷��� ���� null �� ����ڸ� ��� : ���ʽ��� ���� ���
select *from employee
where commission is null;

-- commission �÷��� ���� not null �� ����ڸ� ��� : ���ʽ��� �ִ� ���
select *from employee
where commission is not null;

-- count () : ���ڵ��� ������ ��� : ����¡ ó�� 
     -- null �� ī��Ʈ���� �ʴ´�.
     
select count(*) �ѷ��ڵ��
from employee;

select count(ename) 
from employee;

select count(commission)     -- ���ڵ� �� : null �÷��� ������� �ʴ´�.
from employee;

select commission ��������     -- null : ����ִ� ����, 0��
from employee;

desc employee;

-- ���̺��� ��ü ���ڵ带 ��Ȯ�ϰ� ���: not null �÷��� count(�÷���), count(*)

-- Ư�� �÷��� �����ؼ� ��� : order by �÷��� ASC[DESC], select ������ ���� �������� �;� ��.
   -- ASC : ������������ : A ====> Z, �� =====> ��, 1 ======> 9   ���� ����
   -- DESC : ������������ : Z ====> A, �� =====> ��, 9 =====> 1
   
-- ����(salary) �÷��� �������� ����
select *
from employee
order by salary asc;       -- asc�� ������ �� �ִ�.

-- ����(salary) �÷��� �������� ����
select *
from employee
order by salary desc;

-- �̸� (ename) �÷��� �������� ����
select*
from employee
order by ename;

-- ��å (job) �÷��� �������� ����
select *
from employee
order by job desc;

-- ������ �÷��� where �� ���� ����Ҷ� order by�� where �� ������ ó��
select *
from employee
where salary > 1500
order by salary desc;

-- order by���� ���� �÷��� ������ ��, ���� �÷��� ��� �����ϰ�, ���� ���� ������ �� ���� ���� ���ؼ� ���� �÷��� ����
  -- �亯�� �Խ��� ���� �� ����....


-- job : ���� ���� ����, dno : job �� ������ ���� ���ؼ� dno�� ��������, 
                      -- ename : dno���� ������ ���� ���ؼ� ename�� ������������
select dno, ename
from employee
order by dno asc, ename desc;

select job, dno, ename 
from employee
order by job asc, dno;

select dno , job , ename 
from employee
order by dno desc, job asc, ename desc ; 
   






