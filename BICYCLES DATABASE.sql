CREATE DATABASE `bicycle` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
create table Customer(
CustID VARCHAR (10),
Email VARCHAR(40),
C_Name VARCHAR(40),
Phone int,
ReferrerID VARCHAR(40)
);

create table Bicycle(
BicycleID VARCHAR(10),
Datepurchased date,
Color VARCHAR(10),
CustID VARCHAR(10),
ModelNo VARCHAR(20)
);

create table BicycleModel(
ModelNo VARCHAR(20),
Manufacturer VARCHAR(20)
);

create table Service(
Startdate date,
BicycleID VARCHAR(10),
Enddate date
);

#[[Q1.1) IDENTIFYING PRIMARY AND FOREIGN KEYS]]

ALTER TABLE customer add primary key (CustID);

ALTER TABLE bicycle add primary key (BicycleID);

ALTER TABLE bicyclemodel add primary key (ModelNo);

ALTER TABLE bicycle 
add foreign key (CustID) 
references Customer(CustID) on delete cascade;

ALTER TABLE service
add foreign key (bicycleID) 
references bicycle(bicycleID) on delete cascade;

ALTER TABLE bicycle
add foreign key (ModelNo) 
references bicyclemodel(ModelNo) on delete cascade;

#[[Q1.2) ADDING RECORDS]]
insert into Customer values ("C1", "ab@gmail.com", "Uday", "23456", "C1ABCD");
insert into Customer values ("C2", "bc@gmail.com", "Kishan", "89678", "C2ABCD");
insert into Customer values ("C3", "cd@gmail.com", "Raj", "56896", "C3ABCD");
insert into Customer values ("C4", "de@gmail.com", "Jay", "60356", "C4ABCD");
insert into Customer values ("C5", "ef@gmail.com", "Anant", "33554", "C5ABCD");

insert into Bicycle values ("B1", "2020-05-11", "Green", "C3", "M1ABCD");
insert into Bicycle values ("B2", "2019-09-15", "Blue", "C1", "M2ABCD");
insert into Bicycle values ("B3", "2020-03-21", "Red", "C2", "M3ABCD");
insert into Bicycle values ("B4", "2021-05-11", "Yellow", "C4", "M4ABCD");
insert into Bicycle values ("B5", "2022-03-17", "Green", "C1", "M5ABCD");

insert into BicycleModel values ("M1ABCD", "BSA");
insert into BicycleModel values ("M2ABCD", "Honda");
insert into BicycleModel values ("M3ABCD", "Atlas");
insert into BicycleModel values ("M4ABCD", "Honda");
insert into BicycleModel values ("M5ABCD", "Hero");

insert into Service values ("2010-05-09", "B1", "2020-10-08");
insert into Service values ("2010-03-01", "B2", "2021-10-10");
insert into Service values ("2015-01-20", "B3", "2022-09-08");
insert into Service values ("2011-05-30", "B4", "2020-05-13");
insert into Service values ("2006-02-28", "B5", "2020-04-29");

# List all the customers who have the bicycles manufactured by manufacturer “Honda”.
select c.C_Name, b.ModelNo, c.CustID
from bicycle b join bicyclemodel m on b.ModelNo=m.ModelNo
join customer c on c.CustID=b.CustID
where m.Manufacturer = "Honda";

# List the bicycles purchased by the customers who have been referred by customer“C1”
select b.bicycleid, b.custid, b.modelno, c.referrerid
from bicycle b join customer c on b.custid= c.custid
where c.referrerid = "C1ABCD";

# List the manufacturer of red colored bicycles.
select b.color, m.manufacturer
from bicycle b join bicyclemodel m on b.modelno= m.modelno
where b.color="Red";

#List the models of the bicycles given for service.
select b.modelno, s.startdate, s.enddate
from bicycle b join bicyclemodel m on b.modelno=m.modelno
join service s on s.bicycleid=b.bicycleid=b.bicycleid;






















