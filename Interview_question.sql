/*CREATE TABLE*/
CREATE TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
);

/*INSERT RECORDS*/

INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');


/*Write query to print number gold by each swimmer and only who has won gold*/

select gold as swimmer, count(gold) as gold
from events
where gold not in (
select silver from events
union select BRONZE from events
)
GROUP BY swimmer

/*METHOD 2*/

WITH CTE AS (
SELECT GOLD, 'GOLD' AS MEDAL_TYPE FROM events
UNION ALL
 SELECT SILVER, 'SILVER' AS MEDAL_TYPE FROM events
 UNION ALL
SELECT BRONZE, 'BRONZE' AS MEDAL_TYPE FROM events)
SELECT GOLD AS PLAYER, COUNT(MEDAL_TYPE)
FROM CTE
GROUP BY PLAYER
HAVING COUNT(DISTINCT MEDAL_TYPE)=1 AND MAX(MEDAL_TYPE)='GOLD'
