create database lab10;
create table books (
    book_id int primary key,
    title varchar(255) ,
    author varchar(255) ,
    price decimal(10, 2) ,
    quantity int
);
insert into books (book_id, title, author, price, quantity) values
(1, 'database 101', 'a. smith', 40.00, 10),
(2, 'learn sql', 'b. johnson', 35.00, 15),
(3, 'advanced db', 'c. lee', 50.00, 5);

create table customers (
    customer_id int primary key,
    name varchar(255),
    email varchar(255)
);

insert into customers (customer_id, name, email) values
(101, 'john doe', 'johndoe@example.com'),
(102, 'jane doe', 'janedoe@example.com');

create table orders (
    order_id int primary key,
    book_id int,
    customer_id int,
    order_date date,
    quantity int,
    foreign key (book_id) references books(book_id),
    foreign key (customer_id) references customers(customer_id)
);

--1
start transaction;
insert into orders (order_id, book_id, customer_id, order_date, quantity)
values (1, 1, 101, '2.10.2024', 2);
update books
set quantity = quantity - 2
where book_id = 1;
commit;

select * from books;



--2
begin;
do $$
declare
    available_quantity int;
begin
    select quantity into available_quantity
    from books
    where book_id = 3;
    if available_quantity >= 10 then
        insert into orders (order_id, book_id, customer_id, order_date, quantity)
        values (1, 3, 102, current_date, 10);
        update books
        set quantity = quantity - 10
        where book_id = 3;
    else
        raise notice 'Недостаточно книг для выполнения заказа. Откат изменений.';
        raise exception 'Transaction rollback due to insufficient stock.';
    end if;
end;
$$;
commit;



--3
set transaction isolation level read committed;
begin;
update books
set price = 45.00
where book_id = 2;
commit;
set transaction isolation level read committed;
begin;
select price
from books
where book_id = 2;
commit;




--4
begin;
update customers
set email = 'jimin@gmail.com'
where customer_id = 101;
commit;

select * from customers where customer_id = 101;
