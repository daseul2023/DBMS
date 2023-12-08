
/* 그룹 함수 : group by, having 
select 컬럼명
from 테이블[뷰]
where 조건 
group by 컬럼명[동일한 값을 그룹핑]
having 조건[group by한 결과 값의 조건]
order by 컬럼명 asc[desc]
*/

/* 집계 함수 : number 타입의 컬럼에 적용    <== NULL을 자동으로 처리함
     SUM - 컬럼의 모든 값의 합
     AVG - 컬럼의 모든 값의 평균
     MAX - 컬럼의 최대값
     MIN - 컬럼의 최소값
     COUNT (*) - 그룹핑된 레코드 수 출력
     
     주의 : 나온 결과가 단일 행으로 출력이 되기때문에 다른 컬럼과 사용 시 오류 발생함
           단, group by 절에 grouping된 컬럼은 출력 가능.
  
*/
desc employee;

-- 컬럼의 함수 사용 : 주의
-- 월급 (salary)
select SUM (salary) 합계,Round(AVG(salary),2) as 평균값,   --,emame, salary 등 이와같이 다른 컬럼과 같이 사용했을 시 오류 발생하기 때무에 같은 집계 함수만 써야 함.
max (salary) 최대값 , min(salary) as 최소값
, count(*) "계산된 레코드 수"
from employee;

-- 집계 함수는 NULL을 자동으로 처리함.
select commission
from employee;

-- 보너스 (commission) <== null은 자동으로 처리됨.
select SUM (commission) 합계,Round(AVG(commission),2) as 평균값,  
       max (commission) 최대값 , min(commission) as 최소값
       , count(*) "계산된 레코드 수"
from employee;

-- 부서별로 월급의 합계, 평균, 최대월급, 최소월급, 그룹핑된 수를 출력
select dno 부서번호, SUM(salary) 합계, Round(AVG(salary)) 평균,         -- group by에 쓰여진 함수는 사용 가능
       MAX(salary) 최대값, MIN(salary) 최소값, count(*) "그룹핑된 수"
from employee
group by dno;         -- DNO 컬럼의 동일한 값을 grouping해서 집계함수를 적용함. 

select salary, dno
from employee
order by dno asc;

-- 직책(job)별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된 수를 출력해보세요.
select ename,job,salary
from employee
order by job;

select job 직책,
sum(salary) 합계, round(avg(salary),2) 평균, max(salary)최대값, min(salary)최소값,
count(*)그룹핑된수
from employee
group by job;                -- job 컬럼의 동일한 값을 그룹핑

-- 오류 발생문
select ename                 -- group by job 컬럼과 동일한 컬럼이 아니기 때문에 오류가 발생함.
from employee
group by job;

select count(*) 전체레코드수 from employeel

/*
   group by 절에서 where [조건] vs having [조건]
      where [조건] : group by 하기 전에 조건을 가져옴,     별칭 이름을 사용할 수 없다.
      having [조건] : group by 해서 나온 결과에 대한 조건, 별칭 이름을 사용할 수 없다.
      
   order by 컬럼명 asc[desc]  : 별칭 이름을 사용 가능
*/
-- 직급별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된 수를 출력하되, 부서번호 20번은 제외하고(조건) 부서별로 평균이 2000 이상인 내용(결과)만 출력.]
   -- 평균을 desc 출력
-- 내가 푼 문제
select job 직급, 
sum(salary)합계, avg(salary) 평균, max(salary) 최대값, min(salary) 최소값,
count(job) 그룹핑된수
from employee
where dno ^= 20                    -- where dno not in (20), group by 전의 조건
having avg(salary) >=2000
group by job
order by avg(salary) desc;

select *
from employee;

-- 선생님이 푼 문제
select job 직급, 
sum(salary)합계, avg(salary) 평균, max(salary) 최대값, min(salary) 최소값,
count(job) 그룹핑된수
from employee
where dno != 20                    
group by job
having avg(salary) >=2000         -- having을 group by 뒤에 썼음.
order by avg(salary) desc;

-- group by 절에서 컬럼이 2개 이상, 두 컬럼에 걸쳐서 동일한 내용을 그룹핑함.
    -- job, dno
select job , dno
from employee
order by job asc;

select dno, job, sum(salary) 합한값, count(*)
from employee
group by job, dno;

-- 각 직책(job)에 대해서 월급의 합계, 평균, 최대값, 최소값, 카운트수를 출력하되, 입사일이 81년도에 입사한 사원들만 적용
-- 월급의 평균이 1500만원 이상인 것만 출력하되, 평균을 내림차순 정렬
select job 직책, 
sum(salary) 합계, round(avg(salary)) 평균, max(salary) 최대값, min(salary) 최소값,
count(*) 카운트수
from employee
where substr (hiredate, 1, 2) = 81          -- where hiredate like '81%'
group by job
having round(avg(salary)) >= 1500
order by 평균 desc;

/*  group by 절에서 사용되는 키워드
      rollup : group by 컬럼  <== 결과 마지막 라인에 전체 결과도 한번 더 출력
      cube   : grouping 마지막 라인에 결과 출력, 마지막 라인에 전체 결과도 세부적으로 출력
    
*/

select job 직책, 
sum(salary) 합계, round(avg(salary)) 평균, max(salary) 최대값, min(salary) 최소값,
count(*) 카운트수
from employee
where substr (hiredate, 1, 2) = 81          
group by rollup (job)                       -- rollup(키워드명)
having round(avg(salary)) >= 1500
order by 평균 desc;

-- 1. rollup, cube 키워드를 사용하지 않는 경우 : 그룹핑한 결과만 출력
select dno, job,
count(*), sum(salary), round(avg(salary),2),max(salary), min(salary)
from employee
group by dno,job
order by count(*) desc;

select dno,job
from employee
order by job asc

-- 2. rollup 키워드를 사용하는 경우 : 그룹핑한 결과 출력, 마지막 라인의 전체 내용도 출력
select dno, job,
count(*), sum(salary), round(avg(salary),2),max(salary), min(salary)
from employee
group by rollup (dno, job)
order by count(*) desc;

-- 3. cube 키워드를 사용하는 경우 : 그룹핑한 결과 출력, 전체 내용도 출력, 세부사항까지 출력
select dno, job,
count(*), sum(salary), round(avg(salary),2),max(salary), min(salary)
from employee
group by cube (dno, job)
order by count(*) desc;

/*
   SubQuery : select 문 내의 select 쿼리 [sub query], 여러번의 작업을 한 구문에서 처리
       - where 절에서 많이 사용됨
*/

-- ename (사원이름)이 SCOTT인 사원의 직책과 같은 사원들을 출력 : 2번 쿼리가 필요함.

-- 1. SCOTT 사원의 직책을 알아오는 쿼리
select ename 사원이름, job 직책
from employee
where ename = 'SCOTT';
-- 2. 알아온 직책을 조건으로해서 검색해서 이름을 출력
select ename 사원이름, job 직책
from employee
where job = 'ANALYST';

-- SubQuery를 사용해서 하나의 쿼리로 처리함.
select ename 사원이름, job 직책
from employee
where job = (select job from employee where ename = 'SCOTT');

select * from employee;

select ename 사원이름, job 직책
from employee
where job = (select job from employee where ename = 'ALLEN');       -- (이너 쿼리에 바깥 쿼리랑 다르게 job, ename 이런식으로 입력하면) 오류 발생

-- SCOTT과 ALLEN의 직책에 해당되지않는 사원들을 모두 출력

    -- 1. SCOTT의 직책을 출력하는 쿼리
select job from employee where ename = 'SCOTT';  -- ANALYST

    -- 2. ALLEN의 직책을 출력하는 쿼리
select job from employee where ename = 'ALLEN';  -- SALESMAN

    -- 3. where job not in ('SCOTT의 직책', 'ALLEN의 직책');
select ename 이름, job 직책
from employee
where job not in ('ANALYST', 'SALESMAN');

-- SubQuerry로 한 라인으로 출력
select ename 이름, job 직책
from employee
where job not in (
  (select job from employee where ename = 'SCOTT'), 
  (select job from employee where ename = 'ALLEN'));

select ename 이름, job 직책
from employee
where job not in (
  (select job from employee where ename = 'SCOTT' or ename = 'ALLEN'));

select ename 이름, job 직책
from employee
where job not in (select job from employee where ename in ('SCOTT', 'ALLEN'));  

-- 단일 값 : =
-- 여러개의 값 : in
-- 'SCOTT'보다 많은 월급을 받는 사원들 정보, 월급을 출력
select ename 사원이름, salary 월급
from employee
where salary >(select salary from employee where ename = 'SCOTT');

-- 최소 급여를 받는 사원의 이름, 담당업무, 급여 출력
select ename 사원이름, job 담당업무, salary 급여
from employee
where salary =(select min(salary) from employee);

-- subquery를 사용해서 출력
-- 부서별(dno)로 최소 급여를 받는 사원정보의 이름, 직책, 월급을 출력 : 힌트 : group by, dno, min, in 키워드
select ename 사원이름, job 직책, salary 월급, dno 부서번호
from employee
order by dno asc, salary;

-- subquerry
select ename 사원이름, job 직책, salary 월급, dno 부서번호
from employee
where salary in (select min(salary) from employee group by dno);   -- 각 부서별 최소월급의 select한 값을 출력

select dno
from employee;

-- 각 부서의 최소 급여가 30번 부서의 최소 급여보다 큰 부서를 출력
-- 내가 푼 문제
select salary 급여, dno 부서번호
from employee
where salary in (select min(salary) from employee where min(salary) group by dno);

-- 선생님이 푼 문제
select dno, count(*), min(salary)부서별최소월급
from employee
group by dno           -- 부서번호 동일한 값을 그룹핑
having min(salary) > (
            -- 서브쿼리 : 30번 부서의 최소 월급
            select min(salary) from employee 
            where dno =30);








