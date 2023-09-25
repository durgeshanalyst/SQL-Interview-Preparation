create table employee 
(
emp_name varchar(10),
dep_id int,
salary int
);

insert into employee values 
('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000)



/*Write a query to print lowest and higshest salary by each department*/

-- Method 1:

WITH CTE AS (
SELECT dep_id, MIN(salary) AS MINSAL, max(salary) as mxsal
FROM employee
GROUP BY dep_id )
select c.dep_id, 
    min(case when e.salary=MINSAL then emp_name else null end) as min_sal_em,
    max(case when e.salary = mxsal then emp_name else null end) as mx_sal_em
from employee e join cte c on c.dep_id=e.dep_id
GROUP BY c.dep_id