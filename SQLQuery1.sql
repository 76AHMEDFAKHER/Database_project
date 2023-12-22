create database restaurant;

create schema restaurant_schema;

create table restaurant_schema.Customers(
Customer_id int primary key,
Customer_address varchar(200),
Customer_name  varchar(200),
Customer_phone int );

create table restaurant_schema.menu(
meal_name varchar(200)primary key ,
meal_category varchar(200) ,
meal_price int ,
 );

create table restaurant_schema.orders(
order_id int primary key,
order_price int,
num_of_order int ,
order_date  date ,
c_id int ,
m_name varchar(200),
constraint c_fk foreign key (c_id)
references restaurant_schema.Customers(Customer_id)
 );

alter table restaurant_schema.orders
add foreign key (m_name)
references restaurant_schema.menu(meal_name)

create table restaurant_schema.staff(
staff_id int primary key,
staff_phone varchar(12),
staff_name varchar(50) ,
staff_address varchar(50) 
 );

create table restaurant_schema.stock(
stock_name varchar(20) primary key,
number_of_stock int,
 );

insert into restaurant_schema.Customers
values
(1, '10th of Ramadan City','Aya', 0108399149),
(2, '10th of Ramadan City','Nour', 0105533556),
(3, 'Madinaty','Salma', 015668879),
(4,'Elshorouk','Arwa', 0156426545),
(5, 'Elzamalek','Mariam', 015647482),
(6, 'Maadi','Malak', 010888897),
(7, 'Madinaty','Mira', 0118839939),
(8, 'Elzamalik','Nada', 0158382920),
(9, 'Nasr city','Amira', 010482992),
(10, 'Elshorouk','Hagar', 010992972)

insert into restaurant_schema.orders
values
(10, 250,3,'2023-12-1', 1,'Burger'),
(20, 100,1,'2023-12-5', 2,'Pizza'),
(30, 50,1,'2023-12-2', 3,'French fries'),
(40, 300,2,'2023-12-4', 4,'Burger'),
(50, 150,1,'2023-12-7', 5,'Meat shawarma'),
(60, 100,1,'2023-12-8', 6,'Chicken Shawarma'),
(70, 200,2,'2023-12-10', 7,'Pizza'),
(80, 250,3,'2023-12-1', 8,'Pizza'),
(90, 400,3,'2023-12-4', 9,'Sushi'),
(100, 150,1,'2023-12-7', 10,'Pizza')

insert into restaurant_schema.menu
values
('Pizza','Fast food',200),
('Sushi','Fast food',200),
('Chicken Shawarma','Fast food',50),
('Meat shawarma','Fast food',70),
('Burger','Fast food',150),
('French fries','Fast food',20)

insert into restaurant_schema.staff
values
(1000, '0118399149','ahmed','10th of Ramadan City'),
(2000, ' 0125533556','Nour','10th of Ramadan City'),
(3000, '0118839939','Salma', 'Elshorouk')

insert into restaurant_schema.stock
values
('Tomatoes',20),
('potatoes',15),
('onions',40),
('lettuce',10),
('garlic',50),
('pepper',10)
 
create table restaurant_schema.CustomersBACKUP(
Cbup_id int primary key,
Customer_address varchar(200),
Customer_name  varchar(200),
Customer_phone int
);

insert into restaurant_schema.CustomersBACKUP
select*from restaurant_schema.Customers 
where Customer_id in (select Customer_id from restaurant_schema.Customers);

create table restaurant_schema.staffBACKUP(
Sbup_id int primary key,
staff_phone varchar(12),
staff_name varchar(50) ,
staff_address varchar(50) 
 );

insert into restaurant_schema.staffBACKUP
select*from restaurant_schema.staff 
where staff_id in (select staff_id from restaurant_schema.staff);

create table restaurant_schema.stockBACKUP(
STbup_name varchar(20) primary key,
number_of_stock int,
 );

 insert into restaurant_schema.stockBACKUP
select*from restaurant_schema.stock 
where stock_name in (select stock_name from restaurant_schema.stock);

create table restaurant_schema.menuBACKUP(
mlbup_name varchar(200)primary key ,
meal_category varchar(200) ,
meal_price int 
 );
 insert into restaurant_schema.menuBACKUP
 select *from restaurant_schema.menu
 where meal_name in (select meal_name from restaurant_schema.menu)

create table restaurant_schema.ordersBACKUP(
Obup_id int primary key,
order_price int,
num_of_order int ,
order_date  date ,
c_id int ,
m_name varchar(200),
constraint cBUP_fk foreign key (c_id)
references restaurant_schema.CustomersBACKUP(Cbup_id)
 );

alter table restaurant_schema.ordersBACKUP
add foreign key (m_name)
references restaurant_schema.menuBACKUP(mlbup_name)

insert into restaurant_schema.ordersBACKUP
 select *from restaurant_schema.orders
 where order_id in (select order_id from restaurant_schema.orders);
