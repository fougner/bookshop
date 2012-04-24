drop table USERS cascade;
drop table USER_ROLES cascade;

create table USERS(
       USER_NAME varchar(15) not null primary key,
       USER_PASS varchar(15) not null,
       NAME varchar(100) not null,
       STREET_ADDRESS varchar(100)not null,
       ZIP_CODE varchar(10) not null,
       CITY varchar(30) not null,
       COUNTRY varchar(30) not null
);

create table USER_ROLES(
	USER_NAME varchar(15) not null,
	ROLE_NAME varchar(15) not null,
	primary key (USER_NAME, ROLE_NAME)
);

insert into USERS(USER_NAME, USER_PASS, NAME, STREET_ADDRESS, ZIP_CODE, CITY, COUNTRY) 
     VALUES('tomcat','tacmot','Tom Cat','Apache Road', '34 567', 'Petaluma', 'USA');
insert into USERS(USER_NAME, USER_PASS, NAME, STREET_ADDRESS, ZIP_CODE, CITY, COUNTRY) 
     VALUES('gyro','glurk','Gyro Gearloose','Duck Road', '78 901', 'Ducksbury', 'USA');
insert into USERS(USER_NAME, USER_PASS, NAME, STREET_ADDRESS, ZIP_CODE, CITY, COUNTRY) 
     VALUES('admin', 'glurk','System user', 'Polacksbacken', '752 37', 'Uppsala', 'Sweden');

insert into USER_ROLES(USER_NAME, ROLE_NAME) VALUES('tomcat','tomcat');
insert into USER_ROLES(USER_NAME, ROLE_NAME) VALUES('gyro', 'tomcat');
insert into USER_ROLES(USER_NAME, ROLE_NAME) VALUES('admin','manager');
insert into USER_ROLES(USER_NAME, ROLE_NAME) VALUES('admin','admin');
insert into USER_ROLES(USER_NAME, ROLE_NAME) VALUES('admin','tomcat');


