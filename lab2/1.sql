--lab2

--1
create database lab2;
--2
create table countries(
    country_id serial primary key,
    country_name varchar(50),
    region_id int,
    population int
);

--3
insert into countries(country_name, region_id, population)
values('South Korea', 4, 300000000);

--4
insert into countries(country_id, country_name)
values(89, 'Kazakhstan');

--5
insert into countries(country_name, region_id, population)
values('Germany', NULL, 2000000);

--6
insert into countries(country_name, region_id, population)
values ('China', 4, 5600000),
       ('USA', 6, 120000000),
       ('India', 3, 565666000);

--7
alter table countries alter country_name set default 'Kazakhstan';

--8
insert into countries(country_name, region_id, population)
values(default, 5,  19000000);

--9
alter table countries alter region_id set default 3;
alter table countries alter population set default 1900000;
insert into countries(country_name, region_id, population)
values(default, default, default);

--10
create table countries_new as table countries with no data;

--11
insert into countries_new select * from countries;

--12
update countries
set region_id = 1
where region_id is null;

--13
select country_name, population * 1.1 as  "New Population"
from countries;

--14
delete from countries where population < 100000;

--15
delete from countries_new where country_id in (select country_id from countries) returning *;

--16
delete from countries returning *;


