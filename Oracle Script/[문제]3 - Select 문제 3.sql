/*
1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
   ������ ������ ��ġ ��Ű�ÿ�.
7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
10.   �����ȣ,
      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
      �̸�, 
       [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�"       
11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
	dual ���̺� ���
    
12 �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
        -- sysdate - ���� (date) 
        
13.  employee ���̺��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ��� 

*/     

-- 1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
select hiredate �Ի�����,
substr(hiredate, 1,2) �Ի�⵵, substr(hiredate,4,2) �Ի��
from employee;

SELECT SUBSTR(TO_CHAR(hiredate, 'YYYY'), 1, 4) AS �Ի�⵵,
       SUBSTR(TO_CHAR(hiredate, 'MM'), 1, 2) AS �Ի��
FROM employee;

select *
from employee;

-- 2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
select ename ����̸�,
substr (hiredate, 4,2)�Ի��
from employee
where substr (hiredate, 4,2)= '04';

-- 3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
select manager ���ӻ��, mod(3,2) Ȧ�����ӻ��
from employee
where manager is not null;

SELECT *
FROM employee
WHERE MOD(MANAGER, 2) = 1;

-- 4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
select salary ����, mod(3,0) ����3�ǹ��
from employee
where salary>=(mod(3,0));

-- �ٽ� Ǯ��!! 4��

-- 5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
select to_char(hiredate, 'YY MON DY') �Ի�⵵
from employee;

-- 6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
  -- ������ ������ ��ġ ��Ű�ÿ�.
select trunc(sysdate - to_date('23/1/1')) from dual;
  
-- 7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select trunc( sysdate - to_date('91/11/6', 'YYYY-MM-DD')) 
"�¾ ��¥���� ������� ��ĥ�� ��������?" from dual;

-- 8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
select trunc( months_between(sysdate, '91/11/06')) 
"�¾ ��¥���� ������� ��� �����°�" from dual;

-- 9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ���� 0���� ��� �Ͻÿ�.
select *
from employee;

select manager ������, nvl (manager,0) ������2
from employee;

-- 10.   �����ȣ,
    -- [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
     -- �̸�, 
      --  [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�" 
select 
eno �����ȣ, rpad(substr(eno, 1, 2),4,'*') as ������ȣ,
ename �̸�, rpad(substr(ename, 1,1),4,'*') as  �����̸�
from employee;

-- 11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
	-- dual ���̺� ���
select rpad('801210-1',15,'*') �ֹι�ȣ,
rpad('010-12',13,'*')��ȭ��ȣ
from dual;
    
-- 12 �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
        -- sysdate - ���� (date) 
select trunc(months_between(sysdate, '91/11/06')),
trunc(sysdate - to_date('91/11/6'))
from dual;
        
-- 13.  employee ���̺��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ��� 
select 
to_date('2050/12/24', 'YYYY-MM-DD')-hiredate
from employee;

SELECT TO_DATE('2050-12-24', 'YYYY-MM-DD') - TRUNC(SYSDATE) AS days_until_20501224
FROM dual;













































