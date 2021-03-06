-- INFO7370, Rick Sherman, 2020-06-18
-- create EmployeeDeptHistoryBriefSCD for four relational db

-- SQL Server

-- drop TABLE EmployeeDeptHistoryBriefSCD;

CREATE TABLE  EmployeeDeptHistoryBriefSCD
(   
                  EmployeeDeptHistoryBriefSCD_SK int  not null,
                  EmployeeID int NOT NULL,  -- called the durable key
                  DepartmentID int NOT NULL,
                  ShiftID   int NOT NULL,
	-- ModifiedDate datetime NOT NULL,

	scd_start datetime not null,
	scd_end datetime  null,
	scd_version int not null,
	scd_active int not null
PRIMARY KEY  (EmployeeDeptHistoryBriefSCD_SK)
)
;

-- MySQL 

-- drop TABLE  EmployeeDeptHistoryBriefSCD;

CREATE TABLE  EmployeeDeptHistoryBriefSCD
(   
          EmployeeDeptHistoryBriefSCD_SK int  not null,
          EmployeeID int NOT NULL,
          DepartmentID int NOT NULL,
          ShiftID   int NOT NULL,
         --  ModifiedDate datetime(3) NOT NULL,

	scd_start datetime(3) not null,
	scd_end datetime(3)  null,
	scd_version int not null,
	scd_active int not null,
PRIMARY KEY  (EmployeeDeptHistoryBriefSCD_SK)
)
;

-- PostgreSQL 

-- drop TABLE  EmployeeDeptHistoryBriefSCD;

CREATE TABLE  EmployeeDeptHistoryBriefSCD
(   
          EmployeeDeptHistoryBriefSCD_SK int  not null,
	EmployeeID int NOT NULL,
          DepartmentID int NOT NULL,
          ShiftID   int NOT NULL,
	-- ModifiedDate timestamp(3) NOT NULL,

	scd_start timestamp(3) not null,
	scd_end timestamp(3)  null,
	scd_version int not null,
	scd_active int not null,
PRIMARY KEY  (EmployeeDeptHistoryBriefSCD_SK)
)
;

-- Oracle

-- drop TABLE  EmployeeDeptHistoryBriefSCD;

CREATE TABLE  EmployeeDeptHistoryBriefSCD
(   
          EmployeeDeptHistoryBriefSCD_SK number(10)  not null,
	EmployeeID number(10) NOT NULL,
          DepartmentID number(10) NOT NULL,
          ShiftID   number(10) NOT NULL,
	-- ModifiedDate timestamp(3) NOT NULL,

	scd_start timestamp(3) not null,
	scd_end timestamp(3)  null,
	scd_version number(10) not null,
	scd_active number(10) not null,
PRIMARY KEY  (EmployeeDeptHistoryBriefSCD_SK);



