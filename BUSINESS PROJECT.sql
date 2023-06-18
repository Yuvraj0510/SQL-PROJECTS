CREATE DATABASE `q-5` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
create table  suppliers(
sno varchar(10) ,
sname varchar(35),
status int,
scity varchar(30));

create table parts(
pno varchar(10),
pname varchar(35),
colour varchar(30),
weight int,
city varchar(30));

create table project(
jno varchar(5),
jname varchar(35),
jcity varchar(30));

create table shipment(
sno varchar(5),
pno varchar(5),
jno varchar(5),
quantity int);

alter table suppliers
add primary key(sno);

alter table parts
add primary key(pno);

alter table project
add primary key(jno);

alter table shipment
add constraint fk1 foreign key(sno) references suppliers(sno),
add constraint fk2 foreign key(pno) references parts(pno),
add constraint fk3 foreign key(jno) references project(jno);

insert into suppliers values('s1','Juan',10,'London');
insert into suppliers values('s2','John',20,'Berlin');
insert into suppliers values('s3','Carter',10,'Berlin');
insert into suppliers values('s4','John',20,'London');
insert into suppliers values('s5','Emily',10,'Alaska');
select * from suppliers;

insert into parts values('p1','nut','red',5,'London');
insert into parts values('p2','bolt','green',6,'Berlin');
insert into parts values('p3','screw','blue',7,'Venice');
insert into parts values('p4','screw','red',5,'Alaska');
insert into parts values('p5','nut','blue',4,'London');
insert into parts values('p6','bolt','red',5,'Berlin');
select * from parts;

insert into project values('j1','abc','Berlin');
insert into project values('j2','pqr','Venice');
insert into project values('j3','xyz','London');
insert into project values('j4','lmn','Berlin');
insert into project values('j5','efg','Venice');
insert into project values('j6','mno','London');
select * from project;

insert into shipment values('s1','p1','j1',100);
insert into shipment values('s1','p1','j4',200);
insert into shipment values('s2','p3','j1',200);
insert into shipment values('s2','p3','j2',250);
insert into shipment values('s2','p3','j3',90);
insert into shipment values('s2','p3','j4',120);
insert into shipment values('s2','p3','j5',100);
insert into shipment values('s2','p3','j3',300);
insert into shipment values('s2','p3','j1',400);
insert into shipment values('s2','p5','j2',420);
insert into shipment values('s3','p3','j1',150);
insert into shipment values('s3','p4','j2',290);
insert into shipment values('s4','p6','j3',300);
insert into shipment values('s4','p6','j4',200);
insert into shipment values('s5','p6','j2',100);
insert into shipment values('s5','p2','j4',300);
insert into shipment values('s5','p2','j1',200);
insert into shipment values('s5','p5','j2',100);
insert into shipment values('s5','p5','j4',100);
insert into shipment values('s5','p6','j5',50);
insert into shipment values('s5','p1','j3',90);
insert into shipment values('s5','p3','j2',80);
insert into shipment values('s5','p4','j1',100);
insert into shipment values('s5','p5','j4',230);
select count(*) from shipment;
select * from shipment;


select sno from suppliers where scity='Berlin' and status>20;

select * from suppliers where sno in(select sno from shipment where pno='p2') 
order by sno asc;

select sname,sno from suppliers where sno not in(select sno from shipment where pno='p2');

select sno,shipment.pno,jno,quantity,weight from shipment,parts where parts.pno=shipment.pno;

select sno,pno,jno,quantity from shipment where quantity between 300 and 750;

select pno from parts where weight>16 or pno in(select pno from shipment where sno='s2');select city from parts where colour='red' group by city having count(city)>5;



select * from parts where pno in(select pno from shipment where sno in (select sno from suppliers where scity='london'));





select * from parts where city='london' and pno in(select pno from shipment where  sno in(select sno from suppliers where scity='london'));

select sno,count(pno) from shipment group by sno;

select sno,pno,sum(quantity) from shipment group by sno,pno;
