CREATE DATABASE `student` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
create table Sinfo(
RollNo INT,
Sname VARCHAR (40),
DOB date,
Address VARCHAR(40),
Marks decimal (4,2) not null default 00.00,
Phn int
 );

create table Pinfo(
Pcode VARCHAR(40),
Pname VARCHAR(40)
);

create table Sdetails(
RollNo INT,
Pcode VARCHAR(40),
Attendance INT,
Marks INT
);

INSERT INTO Sinfo values ( 101, "Alok Singh", "1998-02-01", "E273 Mukherjee Nagar, Delhi", "95.55", "123456789");
INSERT INTO Sinfo values ( 102, "Saurabh", "1994-01-27", "Flat 141 Roop Nagar, Delhi", "88.36", "998877665");
INSERT INTO Sinfo values ( 103, "Jatin Sharma", "2000-08-31", "Gokul Apartment Kamla Nagar, Delhi", "90.78", "1122334455");
INSERT INTO Sinfo values ( 104, "Kishan Kumar", "1995-02-01", " Civil Lines, Delhi", "89.99", "678943219");
INSERT INTO Sinfo values ( 105, "Dishan Singh", "1998-11-07", "Saket Nagar, Delhi", "98.33", "987876547");


INSERT INTO Pinfo values( "400" , "Database Management");
INSERT INTO Pinfo values( "401" , "Tableu");
INSERT INTO Pinfo values( "402" , "Object Oriented Programming");
INSERT INTO Pinfo values( "403" , "SQL");
INSERT INTO Pinfo values( "404" , "Python");

INSERT INTO Sdetails values( "101","401", 59, "95.55");
INSERT INTO Sdetails values( "102","400", 91, "88.36");
INSERT INTO Sdetails values( "103","404", 76, "90.78");
INSERT INTO Sdetails values( "104","402", 88, "89.99");
INSERT INTO Sdetails values( "105","403", 79, "98.33");


-- QUERIES TO SHOW ON 16TH JUNE , 2022 (FRIDAY)::

select sdetails.Rollno, sdetails.Pcode, sdetails.Attendance, sinfo.Marks, sinfo.Sname
from Sdetails, sinfo
where sdetails.Attendance>75 and marks > "60"
select 





