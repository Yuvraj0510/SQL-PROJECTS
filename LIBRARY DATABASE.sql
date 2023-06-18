CREATE DATABASE `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
create table LibraryBooks(
AccessionNumber int,
Title VARCHAR(40),
Author VARCHAR(20),
Department varchar(20),
PurchaseDate varchar(20),
Price int
);
insert into library.librarybooks values ( 10001, "Programming using python" ,"Navathe", "CS" , "2000-01-15", 950);
insert into library.librarybooks values ( 10002, "Discrete mathematics" ," Michael j. Sandel", "Maths" , "1999-01-15", 500);
insert into library.librarybooks values ( 10003, "Database System Concepts" ," RK Sharma", "CS" , "1998-06-12", 404);
insert into library.librarybooks values ( 10004, "Electrical Engineering" ," Navathe", "CS" , "2004-02-01", 209);
insert into library.librarybooks values ( 10005, "Software Engineering" , "KK Agarwal", "CS" , "2001-05-28", 198);
insert into library.librarybooks values ( 10007, "Human Body" ,"RJ Bansal", "Medical" , "1990-08-09", 800);

create table IssuedBooks(
AccessionNumber int,
Borrower varchar(40)
);
insert into library.issuedbooks values ( 10002, "Aman");
insert into library.issuedbooks values ( 10004, "Raushan");
insert into library.issuedbooks values ( 10005, "Dev");
insert into library.issuedbooks values ( 10006, "Yash");
insert into library.issuedbooks values ( 10007, "Aman");

-- QUERIES TO SHOW ON 10TH JUNE , 2022 (FRIDAY)::

Alter table librarybooks
Add constraint PK primary key(AccessionNumber);

Delete from librarybooks where Title = "Database system Concepts";
select * from librarybooks; 

UPDATE librarybooks
SET Department = "CS"
WHERE Title = "Discrete Maths";

SELECT title,Department
FROM librarybooks
WHERE Department = "CS";

SELECT title,Department
FROM librarybooks
WHERE Department = "CS" and Author = "Navathe";

SELECT title,Department
FROM librarybooks
WHERE Department = "CS" ;


select * 
from librarybooks
where Price < 500 
or PurchaseDate between 1999-01-01 and 2004-01-01;





