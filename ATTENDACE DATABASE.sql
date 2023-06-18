CREATE DATABASE `attendance` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
create table Sinfo(
RollNo INT(10),
Sname VARCHAR (40),
DOB date,
Address VARCHAR(40),
Marks numeric (3,0),
Phn int(10)
 );
 
 create table Pinfo(
Pcode VARCHAR(40),
Pname VARCHAR(40)
);

create table Attdetails(
RollNo INT(10),
Pcode VARCHAR(40),
Attendance INT(10),
home_marks numeric (3,0)
);

alter table Sinfo add primary key (RollNo);
alter table Pinfo add primary key (Pcode);
alter table Attdetails add foreign key (RollNo) references sinfo(RollNo) on delete cascade;
alter table Attdetails add foreign key (Pcode) references Pinfo(Pcode) on delete cascade;

INSERT INTO Sinfo values ( 101, "Alok Singh", "1998-02-01", "E273 Mukherjee Nagar, Delhi", "95.55", "123456789");
INSERT INTO Sinfo values ( 102, "Saurabh", "1994-01-27", "Flat 141 Roop Nagar, Delhi", "88.36", "998877665");
INSERT INTO Sinfo values ( 103, "Jatin Sharma", "2000-08-31", "Gokul Apartment Kamla Nagar, Delhi", "90.78", "1122334455");
INSERT INTO Sinfo values ( 104, "Kishan Kumar", "1995-02-01", " Civil Lines, Delhi", "89.99", "678943219");
INSERT INTO Sinfo values ( 105, "Dishan Singh", "1998-11-07", "Saket Nagar, Delhi", "98.33", "987876547");

INSERT INTO Pinfo values( "A400" , "Database Management");
INSERT INTO Pinfo values( "A401" , "Tableu");
INSERT INTO Pinfo values( "A402" , "Object Oriented Programming");
INSERT INTO Pinfo values( "A403" , "SQL");
INSERT INTO Pinfo values( "A404" , "Python");

INSERT INTO attdetails values( "101","A401", 59.8, "95.55");
INSERT INTO attdetails values( "102","A400", 91.3, "88.36");
INSERT INTO attdetails values( "103","A404", 76.7, "90.78");
INSERT INTO attdetails values( "104","A402", 88.3, "89.99");
INSERT INTO attdetails values( "105","A403", 79.1, "98.33");

-- QUERIES TO SHOW ON 17TH JUNE , 2022 (FRIDAY)::

select Rollno, sname from sinfo 
where rollno in (select rollno from attdetails where home_marks> 60 and attendance>55 and Pcode="A401");

select rollno, sname, address, marks from sinfo
where address like "%delhi%" and rollno in (select rollno from attdetails where pcode="A401" and home_marks>60);

select rollno,sum(Attendance),sum(home_marks) from attdetails
group by rollno;

select sname, home_marks from sinfo, attdetails
where home_marks in (select max(home_marks) from attdetails where pcode='A402')
and sinfo.rollno=attdetails.rollno;

select sname, pcode, home_marks
from sinfo, attdetails where attdetails.rollno=sinfo.rollno and home_marks in (select max(home_marks) from attdetails where pcode= "A402");

select pname,pcode from pinfo
where pcode in (select Pcode from attdetails group by pcode having avg(Attendance)>=80);

delete from pinfo where pname='SQL';











