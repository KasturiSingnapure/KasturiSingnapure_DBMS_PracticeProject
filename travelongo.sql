create database travelongo;

use travelongo;

 create table PASSENGER (

Id    int auto_increment primary key,
Passenger_name     varchar(20),
Category           varchar(20),
Gender             varchar(20),
Boarding_City      varchar(20),
Destination_City   varchar(20),
Distance           int,
Bus_Type           varchar(20)
);

 create table PRICE (

Bus_Type  varchar(20),
Distance  int,
Price     int
);

insert into passenger values(default,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values(default,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into passenger values(default,'Pallavi','AC','F','panaji','Bengaluru',600,'Sleeper');
insert into passenger values(default,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into passenger values(default,'Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper');
insert into passenger values(default,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into passenger values(default,'Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper');
insert into passenger values(default,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into passenger values(default,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from passenger;

insert into price values('Sleeper',350,770);
insert into price values('Sleeper',500,1100);
insert into price values('Sleeper',600,1320);
insert into price values('Sleeper',700,1540);
insert into price values('Sleeper',1000,2200);
insert into price values('Sleeper',1200,2640);
insert into price values('Sleeper',1500,2700);
insert into price values('Sitting',500,620);
insert into price values('Sitting',600,744);
insert into price values('Sitting',700,868);
insert into price values('Sitting',1000,1240);
insert into price values('Sitting',1200,1488);
insert into price values('Sitting',1500,1860);

select * from price;

-- 3)
 select Gender, count(Gender) FROM Passenger where Distance>=600 group by Gender ;

-- 4) 
select min(Price) as Minimum_Price from Price where Bus_Type = 'Sleeper';


-- 5) 
select Passenger_Name FROM Passenger where Passenger_Name like 'S%';


-- 6) 
select a.Passenger_name,a.Boarding_City,a.Destination_City,a.Bus_type,b.Price from Passenger a , Price b where (a.Bus_Type = b.Bus_Type and a.Distance = b.Distance);


-- 7) 
select a.Passenger_name,b.Price from Passenger a ,Price b where (a.Bus_Type = "Sitting" and b.Bus_Type = "Sitting" and a.Distance = 700 and b.Distance=700);


-- 8) 
SELECT Price FROM Price where distance=(SELECT Distance FROM Passenger where passenger_name = "Pallavi");

				

SELECT Price FROM Price where distance=(
select distance from passenger where (boarding_city = 'bengaluru' and destination_city='panaji')
or (boarding_city = 'panaji' and destination_city='bengaluru')
);

-- 9) 
SELECT distinct(Distance) FROM Passenger order by distance desc;

-- 10)
with total as ( select sum(distance) as total from Passenger)
select passenger_Name,(distance / total.total)*100 as percentage_travel from Passenger,total ;

-- 11)
SELECT Distance, Price,
CASE
WHEN
Price > 1000 THEN "Expensive"
WHEN Price <1000 and Price > 500 THEN "Average"
ELSE "cheap" END as Cost FROM price;
