CREATE USER 'freelancers'@'localhost' IDENTIFIED BY 'Freelancer@9876'; 
CREATE DATABASE 'freelancers';
grant all permissions on 'freelancers' to 'freelancers'@'localhost';


CREATE USER 'recruiters'@'localhost' IDENTIFIED BY 'Recruiter@9876'; 
CREATE DATABASE 'recruiters';
grant all permissions on 'recruiters' to 'recruiters'@'localhost';

-- 2 users or  one user?? freelancers and recruiters
-- or 2 data bases?

-- messenger system
-- updater system

-- Tables:
-- userinfo, applications, jobs_applied 
-- recruiterinfo, jobs posted - when, what, till, applications recived per job posted

