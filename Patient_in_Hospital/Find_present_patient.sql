create table hospital ( emp_id int
, action varchar(10)
, time datetime);

/*Insert Records*/

insert into hospital values ('1', 'in', '2019-12-22 09:00:00');
insert into hospital values ('1', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:00:00');
insert into hospital values ('2', 'out', '2019-12-22 09:15:00');
insert into hospital values ('2', 'in', '2019-12-22 09:30:00');
insert into hospital values ('3', 'out', '2019-12-22 09:00:00');
insert into hospital values ('3', 'in', '2019-12-22 09:15:00');
insert into hospital values ('3', 'out', '2019-12-22 09:30:00');
insert into hospital values ('3', 'in', '2019-12-22 09:45:00');
insert into hospital values ('4', 'in', '2019-12-22 09:45:00');
insert into hospital values ('5', 'out', '2019-12-22 09:40:00');

/*Find the Total number of patient present in the HOspital*/

/*APPROACH ONE*/

/*TAKE MAXIMUM TIME FOR IN AND FOR OUT THEN FILTER INTIME > OUTIME*/

WITH CTE AS (
SELECT emp_id,
max(CASE WHEN ACTION = 'IN' THEN time END) AS INTIME,
max(CASE WHEN ACTION = 'OUT' THEN time END) AS OUTTIME
FROM hospital
GROUP BY emp_id)
SELECT EMP_ID FROM CTE WHERE INTIME> OUTTIME OR OUTTIME IS NULL

/*APP 2*/


SELECT emp_id,
max(CASE WHEN ACTION = 'IN' THEN time END) AS INTIME,
max(CASE WHEN ACTION = 'OUT' THEN time END) AS OUTTIME
FROM hospital
GROUP BY emp_id
HAVING max(CASE WHEN ACTION = 'IN' THEN time END) > max(CASE WHEN ACTION = 'OUT' THEN time END)
OR max(CASE WHEN ACTION = 'OUT' THEN time END) IS NULL