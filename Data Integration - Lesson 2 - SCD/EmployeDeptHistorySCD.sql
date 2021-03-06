-- INFO7370, Rick Sherman, 2019-02-28


-- SQL Server

-- drop TABLE EmployeeDeptHistorySCD;

CREATE TABLE  EmployeePayHistorySCD
(   
                 EmployeepayHistorySCD_SK int  not null,
	EmployeeID int NOT NULL,
	EmployeeLastName varchar(50) NOT NULL,
	EmployeeFirstName varchar(50) NOT NULL,
	EmployeeJobTitle varchar(50) NOT NULL,
                 DepartmentID int NOT NULL,
                 ShiftID   int NOT NULL,
	-- ModifiedDate datetime NOT NULL,

	scd_start datetime not null,
	scd_end datetime  null,
	scd_version int not null,
	scd_active int not null
PRIMARY KEY  (EmployeePayHistorySCD_SK)
)
;

-- MySQL 

-- drop TABLE  EmployeeDeptHistorySCD;

CREATE TABLE  EmployeeDeptHistorySCD
(   
          EmployeeDeptHistorySCD_SK int  not null,
	EmployeeID int NOT NULL,
	EmployeeLastName varchar(50) NOT NULL,
	EmployeeFirstName varchar(50) NOT NULL,
	EmployeeJobTitle varchar(50) NOT NULL,
                 DepartmentID int NOT NULL,
                 ShiftID   int NOT NULL,
	-- ModifiedDate datetime(3) NOT NULL,

	scd_start datetime(3) not null,
	scd_end datetime(3)  null,
	scd_version int not null,
	scd_active int not null,
PRIMARY KEY  (EmployeeDeptHistorySCD_SK)
)
;

-- PostgreSQL 

-- drop TABLE  EmployeeDeptHistorySCD;

CREATE TABLE  EmployeeDeptHistorySCD
(   
          EmployeeDeptHistorySCD_SK int  not null,
	EmployeeID int NOT NULL,
	EmployeeLastName varchar(50) NOT NULL,
	EmployeeFirstName varchar(50) NOT NULL,
	EmployeeJobTitle varchar(50) NOT NULL,
                  DepartmentID int NOT NULL,
                 ShiftID   int NOT NULL,
	-- ModifiedDate timestamp(3) NOT NULL,

	scd_start timestamp(3) not null,
	scd_end timestamp(3)  null,
	scd_version int not null,
	scd_active int not null,
PRIMARY KEY  (EmployeeDeptHistorySCD_SK)
)
;

-- Oracle

-- drop TABLE  EmployeeDeptHistorySCD;

CREATE TABLE  EmployeeDeptHistorySCD
(   
          EmployeeDeptHistorySCD_SK number(10)  not null,
	EmployeeID number(10) NOT NULL,
	EmployeeLastName varchar2(50) NOT NULL,
	EmployeeFirstName varchar2(50) NOT NULL,
	EmployeeJobTitle varchar2(50) NOT NULL,
                 DepartmentID number(10) NOT NULL,
                  ShiftID   number(10) NOT NULL,
	-- ModifiedDate timestamp(3) NOT NULL,

	scd_start timestamp(3) not null,
	scd_end timestamp(3)  null,
	scd_version number(10) not null,
	scd_active number(10) not null,
PRIMARY KEY  (EmployeeDeptHistorySCD_SK)
)
;


