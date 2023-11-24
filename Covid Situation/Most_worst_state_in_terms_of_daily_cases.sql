-- create table covid(city varchar(50),days date, cases int);


/*Records*/

-- insert into covid values('DELHI','2022-01-01',100);
-- insert into covid values('DELHI','2022-01-02',200);
-- insert into covid values('DELHI','2022-01-03',300);
-- insert into covid values('MUMBAI','2022-01-01',100);
-- insert into covid values('MUMBAI','2022-01-02',100);
-- insert into covid values('MUMBAI','2022-01-03',300);
-- insert into covid values('CHENNAI','2022-01-01',100);
-- insert into covid values('CHENNAI','2022-01-02',200);
-- insert into covid values('CHENNAI','2022-01-03',150);
-- insert into covid values('BANGALORE','2022-01-01',100);
-- insert into covid values('BANGALORE','2022-01-02',300);
-- insert into covid values('BANGALORE','2022-01-03',200);
-- insert into covid values('BANGALORE','2022-01-04',400);


/*Write a Query to find state where cases are increasing day by day*/
with cte as(
select city, days, cases,
 lag(cases,1,0)over(PARTITION BY city order by days) as prev_d from covid)
 select DISTINCT city from covid
 where city not in (select distinct city from cte where cases <= prev_d)
 