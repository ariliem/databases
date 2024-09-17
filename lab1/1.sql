CREATE DATABASE lab1;


CREATE TABLE users(
    id SERIAL,
    firstname varchar(50),
    lastname varchar(50),
    PRIMARY KEY(id)
);

ALTER TABLE users
ADD COLUMN isadmin INT DEFAULT 0;


ALTER TABLE users
ALTER COLUMN isadmin SET DATA TYPE BOOLEAN
USING isadmin::BOOLEAN;


ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;


CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


DROP TABLE tasks;


DROP DATABASE IF EXISTS lab1;
