create database lab7;
--1
create table countriess(
    name varchar(200)
);
create index ind_countries_name on countriess(name);
--2
create table employee(
    employee_id serial primary key,
    name varchar(50),
    surname varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id serial
);
create index ind_employees_name_and_surname on employee(name, surname);
--3
create unique index idx_salary on employee(salary);
--4
create index ind_substring on employee(substring(name from 1 for 4));
--5
create table departments1(
    budget int
);
create index idx_departments_budget on departments1(budget);
create index idx_employees_salary on employee(salary);
create index idx_employees_department_id on employee(department_id);

