/*
You are given a table entries that records visits to a store. Each row contains the visitor's name, address, email, the floor they visited, and the resource they used.

Write a SQL query to generate a summary for each visitor that shows:

The total number of visits made by the visitor
The list of resources used by the visitor (concatenated)
The floor most frequently visited by the visitor (only include visitors who have visited a floor more than once)
The output should display the visitor's name, their most visited floor, total visits, and resources used.

*/

create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');



with total_visit as (
select name, count(name) as total_visit ,group_concat(resources) as resource_used 
from entries
group by name
),
most_visited_floor as (select  name, floor,count(floor) as most_visited_floor_cnt from entries
group by name, floor
having most_visited_floor_cnt >1)

select a.name,b.floor as most_visited_floor ,a.total_visit, a.resource_used from total_visit a inner join most_visited_floor
b on a.name = b.name;

