create database Restaurant
use Restaurant

create schema restaurant_schema

create table restaurant_schema.Customers(
Customer_id int primary key,
Customer_address varchar(200),
Customer_name  varchar(200),
Customer_phone int );

insert into restaurant_schema.Customers
values (1, '10th of Ramadan City','Aya', 0108399149),
(2, '10th of Ramadan City','Nour', 0105533556),
(3, 'Madinaty','Salma', 015668879),
(4,'Elshorouk','Arwa', 0156426545),
(5, 'Elzamalek','Mariam', 015647482),
(6, 'Maadi','Malak', 010888897),
(7, 'Madinaty','Mira', 0118839939),
(8, 'Elzamalik','Nada', 0158382920),
(9, 'Nasr city','Amira', 010482992),
(10, 'Elshorouk','Hagar', 010992972)