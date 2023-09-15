/*Tickets Table*/

create table tickets
(
ticket_id varchar(10),
create_date date,
resolved_date date
);

/*Insert Values in tickets*/

insert into tickets values
(1,'2022-08-01','2022-08-03')
,(2,'2022-08-01','2022-08-12')
,(3,'2022-08-01','2022-08-16');

/*Holiday Table*/

create table holidays
(
holiday_date date
,reason varchar(100)
);

/*Record in holiday table*/

insert into holidays values
('2022-08-11','Rakhi'),('2022-08-15','Independence day');

with cte as (
select ticket_id,create_date,resolved_date,
datediff(resolved_date,create_date) as business_day
count(holiday_date) as holiday,
week(resolved_date) - week(create_date) as weekend
from 
(SELECT * FROM tickets LEFT JOIN holidays ON 
holiday_date BETWEEN create_date AND resolved_date)s
group by ticket_id,create_date,resolved_date)
select ticket_id,business_day - holiday - 2*weekend as business_day
from cte
