--1
create database lab4;
--2
create table warehouses(
    code serial primary key,
    location varchar(255),
    capacity integer
);

create table boxes(
    code char(4) primary key,
    contents varchar(255),
    value real,
    warehouse integer
);
--3
insert into warehouses (location, capacity)
values( 'Chicago', 3 ),
      ( 'Chicago', 4),
      ( 'New York', 7),
      ( 'Los Angeles', 2),
      ( 'San Francisco', 8);

select * from warehouses;

insert into boxes(code, contents, value, warehouse)
values ('OMN7', 'Rocks', 180, 3),
       ('4H8P', 'Rocks', 250, 1),
       ('4RT3', 'Scissors', 190, 4),
       ('7G3H', 'Rocks', 200,1),
       ('8JN6', 'Papers', 75,1),
       ('8Y6U', 'Papers', 50, 3),
       ('9J6F', 'Papers', 175, 2),
       ('LL08', 'Rocks', 140, 4 ),
       ('P0H6', 'Scissors', 125, 1),
       ('P2T6', 'Scissors', 150, 2),
       ('TU55','Papers',90, 5);

select * from boxes;
--4
select * from warehouses;
--5
select * from boxes where value>150;
--6
select distinct contents from boxes;
--7
select warehouse, count(warehouse) from boxes group by warehouse order by warehouse asc;
--8
select warehouse, count(warehouse) from boxes group by warehouse having count(warehouse)>2 order by warehouse asc;
--9
insert into warehouses(location, capacity) values ('New York', 3);
--10
insert into boxes(code, contents, value, warehouse) values('H5RT', 'Papers',200, 2);
--11
update boxes set value = value*0.85 where value = (select value from boxes order by value desc offset 2 limit 1);
--12
delete from boxes where value<150;
--13
delete from boxes where warehouse in (select * from warehouses where location='New York');
