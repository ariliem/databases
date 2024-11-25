--1
create or replace function increase_valuee( a int)
returns integer as $$
begin
   return a + 10;
end;
$$
language plpgsql;
select increase_valuee(5);


--2
create or replace function compare_numberss(a int, b int, out result text)
as $$
begin
    if a>b then
        result := 'Greater';
    elsif a = b then
        result := 'Equal';
    else
        result := 'Lesser';
    end if;
end;
$$
language plpgsql;
select compare_numberss(5,6);



--3
create or replace function number_series(n int)
returns text
as $$
declare
    i int := 1;
    series text :='';
begin
    while i<=n loop
        series := series || i || case when i<n then ', ' else '' end;
        i:=i+1;
        end loop;
    return series;
end;
$$
language plpgsql;
select number_series(5);



--4
create or replace function find_employee(ename varchar)
returns table(id int, name varchar, salary int)
as $$
    begin
        return query
        select e.id,e.name,e.salary
        from employees1 e
        where e.name = ename;
    end;
$$ language plpgsql;
select find_employee('bbb');




--5
create table products (
    id_product serial primary key ,
    name varchar(255),
    price float,
    category varchar(100)
);
insert into products (name, category, price)
values
    ('Smartphone', 'Electronics', 599.99),
    ('Laptop', 'Electronics', 899.99),
    ('Shirt', 'Clothing', 29.99),
    ('Jeans', 'Clothing', 49.99);
create or replace function list_products(categoryname varchar)
returns table(id_product int, name varchar, price float)
as $$
    begin
        return query
        select p.id_product, p.name, p.price
        from products p
        where p.category = categoryname;
    end;
$$ language plpgsql;
select list_products('Electronics');



--6
create table employees1(
    id serial primary key,
    name varchar(45),
    salary numeric(44),
    bonus numeric(55)
);
insert into employees1(name, salary, bonus)
values
    ('bbb', 45, 47),
    ('ddd', 64, 86),
    ('ccc', 56, 89);

drop function calculate_bonus(emp_id int);
create or replace function calculate_bonus(emp_id int)
returns numeric
as $$
declare
    salary numeric;
    bonus numeric;
begin
    select e.salary into salary
    from employees1 e
    where e.id = emp_id;

    bonus := salary * 0.10;
    return bonus;
end;
$$ language plpgsql;
drop function update_salary(emp_id int);
create or replace function update_salary(emp_id int)
returns numeric
as $$
declare
    bonus numeric;
    new_salary numeric;
begin
    bonus := calculate_bonus(emp_id);

    select e.salary into new_salary
    from employees1 e
    where e.id = emp_id;

    new_salary := new_salary + bonus;
    return new_salary;
end;
$$ language plpgsql;

select update_salary(1);




--7
create or replace function complex_calculation(num int, txt varchar, out result text)
as $$
declare
    num_res int;
    txt_res varchar;
begin
    <<main_block>>
    begin
        <<subblock_numeric>>
        begin
            num_res := num * num;
        end;
        <<subblock_string>>
        begin
            txt_res := reverse(txt);
        end;
        result := 'Numeric result: ' || num_res || ', String result: ' || txt_res;
    end;
end;
$$ language plpgsql;

select complex_calculation(5, 'aray');
