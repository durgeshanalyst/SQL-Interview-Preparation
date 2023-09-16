

/*All Room type search by User */
select
sum(case when filter_room_types like '%entire home%' then 1 else 0 end) AS 'entire home',
sum(case when filter_room_types like '%private room%' then 1 else 0 end) AS 'private room',
sum(case when filter_room_types like '%shared room%' then 1 else 0 end) AS 'shared room'
from 
airbnb_searches


/*Room type and searches*/



