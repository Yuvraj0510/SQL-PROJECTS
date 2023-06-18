CREATE DATABASE `employee` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
create database bank;
use bank;

create table employee(
person_name varchar(30),
street varchar(30),
city varchar(10)
);

create table company(
company_name varchar(30),
city varchar(10)
);

create table works(
person_name varchar(30),
company_name varchar(30),
salary varchar(10)
);

create table manager(
person_name varchar(30),
manager_name varchar(30)
);

#Identify primary and foreign keys.
alter table employee
add primary key (person_name);

alter table company
add primary key(company_name);

alter table manager
add foreign key(manager_name) references employee(person_name);

alter table works
add foreign key (person_name) references employee(person_name);

alter table works
add foreign key (company_name) references company(company_name);

alter table manager
add foreign key (person_name) references employee(person_name);



insert into employee values('Akshat','Bobson Street','Mumbai');
insert into employee values('Divy','Hudson Lane','Delhi');
insert into employee values('Ram','McRobert Street','Agra');
insert into employee values('Ishan','Grove Street','Kolkata');
insert into employee values('Kishan','Beverly Street','Gurugram');
insert into employee values('Shri','Carter Street','Bangalore');

insert into company values('SAMBA BANK', 'MUMBAI');
insert into company values('HDFC BANK', 'BANGALORE');
insert into company values('NCB BANK', 'GURUGRAM');
insert into company values( 'STATE BANK', 'KOLKATA');
insert into company values('ICICI BANK', 'DELHI');
insert into company values('AXIS BANK', 'AGRA');

insert into works values('Ishan', 'SAMBA BANK', 65000);
insert into works values( 'Ram', 'NCB BANK', 22000);
insert into works values('Kishan', 'ICICI BANK', 11000);
insert into works values('Shri', 'HDFC BANK', 8000);
insert into works values('Divy', 'STATE BANK', 110000);
insert into works values('Akshat', 'AXIS BANK', '7000');

insert into manager values ('Akshat', 'Akshat');    
insert into manager values ('Kishan', 'Ram');
insert into manager values ('Divy', 'Akshat');
insert into manager values ('Ram','Divy');
insert into manager values ('Shri','Shri');
insert into manager values ('Ishan','Kishan');

 select * from employee;
 select * from company;
 select * from works;
 select * from manager;
desc employee;
desc company;
desc works;
desc manager;

# Alter table employee, add a column “Email”.
alter table employee add(email varchar(20));
select * from employee;

#Find the name of all managers who work for both Samba Bank and NCB Bank.
select manager_name from manager
where manager_name in(select person_name from works where company_name='SAMBA BANK' and company_name='NCB BANK');

#Find the names, street address and cities of residence and salary of all employees  who work for “Samba Bank” and earn more than $10,000.
select employee.person_name, city,street from works,employee 
where works.person_name=employee.person_name and company_name='SAMBA BANK' and salary>10000;

#Find the names of all employees who live in the same city as the company for which they work.
 select person_name from employee, company where employee.city=company.city;

# Find the highest salary, lowest salary and average salary paid by each company.
select company_name, max(salary), min(salary),avg(salary) from works 
group by company_name;

#Find the sum of salary and number of employees in each company
select company_name, count(person_name),sum(salary) from works 
group by company_name;

#Find the name of the company that pays highest salary
 select company_name from works where salary = (select max(salary) from works);