/*

1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
    ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  

*/ 

-- number (����, �Ǽ�)
-- java������ ���� int, �Ǽ� double�� ǥ�������� ����Ŭ������ number()�ȿ� �ִ´�.

-- 1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
-- �� Ǯ��
select *
from employee;

select ename ����̸�, salary �޿�,
(salary +300)"�λ�� �޿�"
from employee;

-- ������ Ǯ��
desc employee;                      -- Ÿ���� �� �� ����.

select * 
from employee; 

select eno as �����ȣ, ename �����, job ��å, manager "���ӻ��  ID",
    hiredate �Ի糯¥, salary ����, commission ���ʽ�, dno �μ���ȣ
from employee; 

select ename, salary, salary + 300 as �λ�ȱ޿�
from employee; 

-- 2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
   -- ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
-- �� Ǯ��
select ename ����̸�, salary �޿�, commission ���ʽ�,
(salary * 12 + 100) "���� �� ����"
from employee
order by (salary * 12 + 100)desc;

select ename ����̸�, salary �޿�, commission ���ʽ�,
salary*12 +nvl (commission,0) +100 �����Ѽ���
from employee
order by salary*12 +nvl (commission,0) +100 desc;

-- ������ Ǯ��
select * from tab;          -- ����� DataBase ���� ��� ���̺� ���  / tab=table

select ename, salary, commission from employee; 
    
select ename, salary,commission,salary *12, salary *12 + NVL(commission,0) + 100 as �ѿ���
from employee; 

-- 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���.
-- �� Ǯ��
select ename ����̸�, salary �޿�
from employee
where salary >=2000
order by salary desc;

-- ������ Ǯ��
desc employee;

select ename, salary    -- �÷���
from employee           -- ���̺�, ��
where salary >= 2000    -- ����
order by salary desc    -- ���� 

-- 4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���.
-- �� Ǯ��
select eno �����ȣ, ename ����̸�, dno �μ���ȣ
from employee
where eno = 7788;

-- ������ Ǯ��
select ename, dno ,eno
from employee
where eno = 7788               -- �����̱� ������ '' ���� �ʾƾ� �ϴ°� ����!!

-- 5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
-- �� Ǯ��
select ename ����̸�, salary �޿�
from employee
where salary < 2000 or salary > 3000;

select ename ����̸�, salary �޿�
from employee
where salary not between 2000 and 3000;

-- ������ Ǯ��
select ename, salary 
from employee
where salary not between 2000 and 3000; 

-- 6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
-- �� Ǯ��
select ename ����̸�, job ������, hiredate �Ի���
from employee
where hiredate between '1981/02/20' and '1981/05/01';

select ename ����̸�, job ������, hiredate �Ի���
from employee
where hiredate >='1981/02/20' and hiredate <='1981/05/01';

-- ������ Ǯ��
select ename, job, hiredate
from employee
where hiredate between '1981/2/20' and '1981/5/1'; 

-- 7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
-- �� Ǯ��
select ename ����̸�, dno �μ���ȣ
from employee
where dno = 20 or dno = 30
order by ename desc;

-- ������ Ǯ��
select ename, dno 
from employee
where dno = 20 or dno = 30 
order by ename desc; 

select ename, dno 
from employee
where dno in ( 20, 30 )
order by ename desc; 

-- 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���.
-- �� Ǯ��
select ename ����̸�, salary �޿�, dno �μ���ȣ
from employee
where salary between 2000 and 3000
and dno in (20, 30)
order by ename asc;

select ename ����̸�, salary �޿�, dno �μ���ȣ
from employee
where salary >=2000 and salary <=3000 
and (dno in (20,30))
order by ename asc;

-- ������ Ǯ��
select ename, salary, dno 
from employee
where (salary between 2000 and 3000) and (dno in (20,30)) 

-- 9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
-- �� Ǯ��
select ename ����̸�, hiredate �Ի���
from employee
where hiredate like '81%';

select ename ����̸�, hiredate �Ի���
from employee
where substr (hiredate, 1, 2) = '81';

-- ������ Ǯ��
select ename, hiredate 
from employee 
where hiredate like '81%';

-- 10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
-- �� Ǯ��
select ename ����̸�, job ������
from employee
where manager is null; 

-- ������ Ǯ��
select * from employee; 

select ename, manager
from employee
where manager is null ; 

-- 11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
-- �� Ǯ��
select ename ����̸�, salary �޿�, commission ���ʽ�
from employee
where commission is not null
order by salary desc,
commission desc;

-- ������ Ǯ��
select * from employee
order by commission desc; 

select ename, salary, commission 
from employee
where commission is not null
order by salary desc, commission desc

-- 12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
-- �� Ǯ��
select ename ����̸�
from employee
where substr (ename, 3, 1) = 'R';

select ename ����̸�
from employee
where ename like '__R%';

select ename ����̸�
from employee
where instr (ename, 'R', 3)=3;

select *
from employee;

-- ������ Ǯ��
select ename 
from employee
where ename like '__R%' 

select ename
from employee
where instr(ename, 'R', 3)=3;

select ename , instr(ename, 'R', 3) from employee; 


-- 13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
-- �� Ǯ��
select ename �̸�
from employee
where INSTR (ename, 'A') >0
and INSTR (ename, 'E')>0;

-- ������ Ǯ��
select ename 
from employee
where ename like '%A%' and ename like '%E%'

select ename 
from employee
where instr(ename, 'A')!=0 and instr(ename, 'E')!=0;

select ename,
instr (ename, 'A'),              -- ���� ��ȣ�� ���
instr (ename, 'E')
from employee;                  

-- 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    -- �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
-- �� Ǯ��
select ename ����̸�, job ������, salary �޿�
from employee
where job in ('CLERK','SALESMAN')
and salary not in (1600, 950,1300);

-- ������ Ǯ��
select ename, job, salary 
from employee
where (job = 'CLERK' or job = 'SALESMAN') and salary not in ( 1600,950, 1300) 

select ename , job , salary 
from employee
where job in ('CLERK', 'SALESMAN') and salary not in (1600,950,1300);

-- 15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
-- �� Ǯ��
select ename ����̸�, salary �޿�, commission ���ʽ�
from employee 
where commission >= 500;

-- ������ Ǯ��
select ename, salary ,commission
from employee
where commission >= 500; 

































