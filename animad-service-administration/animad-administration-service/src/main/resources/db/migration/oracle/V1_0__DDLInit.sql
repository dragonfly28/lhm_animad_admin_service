	-- This file is for ORACLE

	--**************************
	--Tables
	--**************************
	
	create table Enclosure (
	oid varchar(36),
	name varchar(30) not null, 
	cleaningtime TIMESTAMP not null, 
	primary key (oid));
	
	create table Animal (
	oid varchar(36),
	name varchar(30) not null, 
	species varchar(255) not null, 
	birthday TIMESTAMP not null, 
	gender varchar(255) not null, 
	weight NUMBER(19, 9) not null, 
	alive NUMBER(1) not null, 
	primary key (oid));
	
	create table Keeper (
	oid varchar(36),
	firstname varchar(30) not null, 
	lastname varchar(30) not null, 
	employmentdate TIMESTAMP not null, 
	birthday TIMESTAMP not null, 
	salary NUMBER(19, 0) not null, 
	primary key (oid));
	
	--Enclosure_AnimalList Relation Table
	create table Enclosure_AnimalList (
	enclosure_oid varchar(36) not null, 
	animalList_oid varchar(36) not null unique, 
	order_index bigint,
	primary key ( enclosure_oid, animalList_oid));
	
	alter table Enclosure_AnimalList 
	add constraint FK_enclosure_animalList_TO_animalList 
	foreign key (animalList_oid) 
	references Animal;
	
	alter table Enclosure_AnimalList 
	add constraint FK_enclosure_animalList_TO_enclosure 
	foreign key (enclosure_oid) 
	references Enclosure;
	
	
	--Animal_KeeperList Relation Table
	create table Animal_KeeperList (
	animal_oid varchar(36) not null, 
	keeperList_oid varchar(36) not null, 
	order_index bigint,
	primary key ( animal_oid, keeperList_oid));
	
	alter table Animal_KeeperList 
	add constraint FK_animal_keeperList_TO_keeperList 
	foreign key (keeperList_oid) 
	references Keeper;
	
	alter table Animal_KeeperList 
	add constraint FK_animal_keeperList_TO_animal 
	foreign key (animal_oid) 
	references Animal;
	
	
	
