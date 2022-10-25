CREATE USER 'ishifree'@'localhost' IDENTIFIED BY 'Freelancer@9876'; 
CREATE DATABASE ishifree;
GRANT ALL PRIVILEGES ON ishifree.* TO 'ishifree'@'localhost';

-- Freelancers

create table freelancers (Id varchar(20) primary key,
password varchar(20) not null
);

create table freewallet (Id varchar(20) primary key,
amount int default 0, check (amount>0),
foreign key(Id) references freelancers(Id)
);

create table freedetails (Id varchar(20) primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
photo varchar(100),
gender varchar(1) not null,
work_phone varchar(25) not null, 
street varchar(30),
city varchar(15)not null,
state varchar(15) not null,
pincode varchar(6) not null,
foreign key(Id) references freelancers(Id)
);

create table freeeducation (Id varchar(20),
university varchar(30) not null,
degree varchar(10),
year_start int not null, 
year_end int,
primary key(Id, university, year_start),
foreign key(Id) references freelancers(Id)
);

create table freeexperience (Id varchar(20),
company varchar(30) not null,
title varchar(10),
start_date date not null, 
end_date date,
description varchar(300),
primary key(Id, company, title, start_date)
foreign key(Id) references freelancers(Id)
);

-- employer

create table employer (Id varchar(20) primary key,
password varchar(20) not null
);

create table empwallet (Id varchar(20) primary key,
amount int default 0
);

create table empdetails (Id varchar(20) primary key,
name varchar(30) not null,
photo_url varchar(100),
position varchar(100),
company varchar(100),
phone_no varchar(25) not null, 
address varchar(100)
);


create table jobs (job_id varchar(20),
role varchar(20),
emp_id varchar(20),
status int(2) not null,
duration int not null,
budget varchar(10) not null,
skill varchar(60) not null,
description text(800) not null,
post_date date not null, 
exp_date date,
primary key(job_id),
foreign key(emp_id) references employer(Id)
);

create table proposals (
proposal_id varchar(20),
job_id varchar(20),
free_id varchar(20),
emp_id varchar(20),
status int(2) not null,
duration int not null,
budget int not null,
coverletter text(800) not null,
post_date date not null, 
primary key(proposal_id)
foreign key(emp_id) references employer(Id),
foreign key(free_id) references freelancers(Id),
foreign key(job_id) references jobs(job_id)
);