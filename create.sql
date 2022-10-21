CREATE USER 'ishifree'@'localhost' IDENTIFIED BY 'Freelancer@9876'; 
CREATE DATABASE 'ishifree';
grant all permissions on 'ishifree' to 'freelancers'@'localhost';

-- 2 users or  one user?? freelancers and recruiters
-- or 2 data bases?

-- messenger system
-- updater system

-- Tables:
-- userinfo, applications, jobs_applied 
-- recruiterinfo, jobs posted - when, what, till, applications recived per job posted

create table 'freelancers' (Id varchar(20) primary KEY,
password varchar(20) not null);

create table freewallet (Id varchar(20) primary key,
amount int default 0, check (amount>0));

create table freedetails (Id varchar(20) primary key,
name varchar(30) not null,
photo_url varchar(100),
phone_no varchar(25) not null, 
address varchar(100));

create table freeeducation (Id varchar(20),
institute varchar(30) not null,
degree varchar(10),
year_start int not null, 
year_end int,
primary key(Id,year_start)
);

create table freeexperience (Id varchar(20),
company varchar(30) not null,
title varchar(10),
start_date date not null, 
end_date date,
primary key(Id,start_date)
);



create table 'employer' (Id varchar(20) primary KEY,
password varchar(20) not null);

create table empwallet (Id varchar(20) primary key,
amount int default 0);

create table empdetails (Id varchar(20) primary key,
name varchar(30) not null,
photo_url varchar(100),
position varchar(100),
company varchar(100),
phone_no varchar(25) not null, 
address varchar(100));


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
primary key(job_id)
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
);