
#1) You are required to create two tables PASSENGER and PRICE with the attributes and properties 


create database TravelOnTheGo;
use TravelOnTheGo;

Create Table Passanger(Passenger_name varchar(50),
 Category varchar(50),
 Gender varchar(50),
 Boarding_City varchar(50),
 Destination_City varchar(50),
 Distance int,
 Bus_Type varchar(50)
);

#2) Insert the data in the tables

insert into Passanger values
("Sejal","AC", "F","Bengaluru","Chennai",350,"Sleeper"),
("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting"),
("Pallavi","AC","F","Panaji","Bengaluru", 600,"Sleeper"),
("Khusboo","AC","F","Chennai","Mumbai", 1500,"Sleeper"),
("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper"),
("Ankur","AC","M","Nagpur","Hyderabad", 500,"Sitting"),
("Hemant","Non-AC","M","Panaji","Mumbai", 700,"Sleeper"),
("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting"),
("Piyush","AC","M","Pune","Nagpur", 700,"Sitting");
select * from Passanger;
create table Price(Bus_Type varchar(50),
 Distance int,
 Price int);
 insert into Price values("Sleeper", 350, 770),
("Sleeper",  500, 1100),
("Sleeper",  600 ,1320),
("Sleeper",  700, 1540),
("Sleeper",  1000, 2200),
("Sleeper",  1200, 2640),
("Sleeper",  1500, 2700),
("Sitting",  500 ,620),
("Sitting",  60, 744),
("Sitting",  700, 868),
("Sitting",  1000, 1240),
("Sitting",  1200, 1488),
("Sitting", 1500, 1860);
Select * from price;
#3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?
select  Gender, count(Gender) as'Passenger n0' from Passanger where Distance < 600 Group by Gender;

#4) Find the minimum ticket price for Sleeper Bus?
select Bus_Type, min(price) as Price From price where Bus_type = 'Sleeper';

#5) Select passenger names whose names start with character 'S'?
select Passenger_name from passanger where Passenger_name like 'S%';

#6) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
select Passenger_name,Boarding_City, Destination_City,price from passanger, price where passanger.Bus_Type = Price.Bus_Type group by passanger.passenger_name;

#7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus for a distance of 1000 KM s 
select Passenger_name, price, passanger.Distance from Passanger, price where Passanger.Bus_Type = 'Sitting' AND Passanger.Distance = 1000 group by passanger.passenger_name;
##7) What are the passenger name/s and his/her ticket price who travelled in the Sleeper bus for a distance of 1000 KM s 
select Passenger_name, price, passanger.Distance, price.Bus_Type from Passanger, price where passanger.Bus_Type = 'Sleeper' AND Passanger.Distance = 1000 group by passanger.passenger_name;

#8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select  Price from(select Passanger.Passenger_name,Passanger.Bus_Type,PRICE.Price
from Passanger left join PRICE on Passanger.Bus_Type=PRICE.Bus_Type
where Passanger.Distance=PRICE.Distance && Passanger.Passenger_name='Pallavi') as charge ;

#9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
select distinct distance from passanger order by distance desc;

#10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables 
	 SELECT passenger_name, distance, (distance)*100/ sum(distance) over() 'percentage' from passanger order by distance desc;

#11) Display the distance, price in three categories in table Price
	#a) Expensive if the cost is more than 1000
	#b) Average Cost if the cost is less than 1000 and greater than 500
    #c) Cheap otherwise
Select Distance, price,
case
when price > 1000 then 'Expensive'
when price < 1000 and price > 500 then 'Average Cose'
else 'cheap' end as 'Cost' from price;