--1
create database lab6;
--2
create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);
create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references  departments
);
--3
select employees.first_name, employees.last_name, employees.department_id, departments.department_name
from employees
join departments on employees.department_id = departments.department_id
--4
select employees.first_name, employees.last_name, employees.department_id, departments.department_name
from employees
join departments on employees.department_id = departments.department_id
where employees.department_id in (80,40);
--5
select employees.first_name, employees.last_name, departments.department_name, locations.city, locations.state_province
from employees
join departments  on employees.department_id = departments.department_id
join locations on departments.location_id = locations.location_id;
--6
select departments.department_name, employees.first_name, employees.last_name
from departments
left join employees ON departments.department_id = employees.department_id;
--7
select employees.first_name, employees.last_name, employees.department_id, departments.department_name
from employees
left join departments  on employees.department_id = departments.department_id
