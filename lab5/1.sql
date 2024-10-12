--1
create database lab5;
--2
create table customers(
    customer_id int,
    customer_name varchar(255),
    city varchar(255),
    grade int,
    salesman_id int
);
insert into customers(customer_id, customer_name, city, grade, salesman_id)
values(3002, 'Nick Rimando', 'New York', 100, 5001 ),
      (3005, 'Graham Zusi', 'California',200, 5002 ),
      (3001, 'Brad Guzan', 'London', null, 5005),
      (3004, 'Fabian Johns', 'Paris', 300, 5006),
      (3007, 'Brad Davis', 'New York', 200, 5001),
      (3009, 'Geoff Camero', 'Berlin', 100, 5003),
      (3008, 'Julian Green', 'London', 300, 5002);
select * from customers;
create table orders(
    ord_no int,
    amount float,
    date date,
    customer_id int,
    salesman_id int
);
insert into orders(ord_no, amount, date, customer_id, salesman_id)
values(70001, 150.5 , '2012-10-05',3005, 5002),
      (70009, 270.65, '2012-09-10',3001, 5005),
      (70002, 65.26,'2012-10-05', 3002, 5001),
      (70004, 110.5, '2012-08-17',3009, 5003),
      (70007, 948.5, '2012-09-10', 3005, 5002),
      (70005, 2400.6, '2012-07-27', 3007, 5001),
      (70008, 5760, '2012-09-10', 3002, 5001);
select * from orders;
--3
select sum(amount) from orders;
--4
select avg(amount) from orders;
--5
select count(customer_name)
from customers
where customer_name is not null;
--6
select min(amount)
from orders;
--7
select *
from customers
where customer_name like '%b';
--8
select *
from orders
where customer_id in(
    select customer_id
    from customers
    where city='New York');
--9
select *
from customers
where customer_id in(
    select customer_id
    from orders
    where amount>10
    );
--10
select sum(grade)
from customers;
--11
select *
from customers
where customer_name is not null;
--12
select max(grade)
from customers;
