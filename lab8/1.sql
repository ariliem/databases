 --1
create database lab8;
--2
create table salesman (
    salesman_id serial,
    name varchar(50),
    city varchar(50),
    commission float
);
insert into salesman (salesman_id, name, city, commission) values(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),(5003, 'Lauson Hen', 'San Jose', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);
drop table customers;
create table customers (
    customer_id serial,
    cust_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id int
);
insert into customers (customer_id, cust_name, city, grade, salesman_id) values(3002, 'Nick Rimando', 'New York', NULL, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),(3007, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);
drop table orders;
create table orders(
    ord_no int,
    purch_amt float,
    ord_date date,
    customer_id int,
    salesman_id int
);
insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),(70008, 5760, '2012-09-10', 3002, 5001);

--3
create role junior_dev with login;

--4
create view salesmen as select * from salesman where city = 'New York';

--5
create view oders as
    select o.ord_no, s.name as salesman_name, c.cust_name as customer_name
    from orders o
    join salesman s on o.salesman_id = s.salesman_id
    join customers c on o.customer_id=c.customer_id;

grant all privileges on oders to junior_dev;

--6
create view high as select * from customers where grade = (select max(grade) from customers);
grant select on high to junior_dev;
--7
create view num_salesman as select city,count(*) from salesman group by city;

--8
create view each_salesman as select s.name as salesman_name
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.name
having count(c.customer_id)>1;

--9
create role intern;
grant junior_dev to intern;
