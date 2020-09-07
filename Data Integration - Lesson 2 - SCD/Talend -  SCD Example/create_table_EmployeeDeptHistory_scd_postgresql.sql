

DROP TABLE if exists EmployeeDeptHistory_scd 
;

CREATE SEQUENCE EmployeeDeptHistory_scd_seq;

CREATE TABLE EmployeeDeptHistory_scd 
(
  EmployeeDeptHistoryPK int DEFAULT NEXTVAL ('EmployeeDeptHistory_scd_seq') NOT NULL,
  EmployeeID int NOT NULL,
  FirstName varchar(36) NOT NULL,
  MiddleName varchar(36) DEFAULT NULL,
  LastName varchar(36) NOT NULL,
  Shift varchar(20) NOT NULL,
  Department varchar(80) NOT NULL,
  GroupName varchar(40) NOT NULL,

    DI_Tool       varchar(40)      NOT NULL default 'what_DI_Tool?',
    DI_Job_ID 	 varchar(40) NOT NULL DEFAULT 'no_job_id',
    DI_Create_Date 	 timestamp(3) NOT NULL DEFAULT now(),
    DI_Modified_Date  timestamp(3) NOT NULL DEFAULT now(),

  scd_start             date NOT NULL,  
  scd_end              date  NULL,
  scd_version        int NOT NULL,
  scd_active           int NOT NULL,

  PRIMARY KEY (EmployeeDeptHistoryPK)
);
