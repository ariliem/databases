--lab1

create database lab1;


create table users(
    id SERIAL,
    firstname varchar(50),
    lastname varchar(50),
    PRIMARY KEY(id)
);

alter table users
add column isadmin INT DEFAULT 0;


alter table users
ALTER COLUMN isadmin SET DATA TYPE BOOLEAN
USING isadmin::BOOLEAN;


alter table users
ALTER COLUMN isadmin SET DEFAULT FALSE;
--PRIMARY KEY(id)

create table tasks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


drop table tasks;


drop database IF EXISTS lab1;
