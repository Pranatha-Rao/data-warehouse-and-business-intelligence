
DROP TABLE if exists EmployeeDeptHistory_scd 
;

CREATE TABLE EmployeeDeptHistory_scd 
(
  EmployeeDeptHistoryPK int IDENTITY(1,1) NOT NULL,
  EmployeeID int NOT NULL,
  FirstName varchar(36) NOT NULL,
  MiddleName varchar(36) DEFAULT NULL,
  LastName varchar(36) NOT NULL,
  Shift varchar(20) NOT NULL,
  Department varchar(80) NOT NULL,
  GroupName varchar(40) NOT NULL,

    DI_Tool       varchar(40)      NOT NULL default 'what_DI_Tool?',
    DI_Job_ID 	 varchar(40) NOT NULL DEFAULT 'no_job_id',
    DI_Create_Date 	 datetime NOT NULL DEFAULT getdate(),
    DI_Modified_Date  datetime NOT NULL DEFAULT getdate(),

  scd_start             date NOT NULL,  
  scd_end              date  NULL,
  scd_version        int NOT NULL,
  scd_active           int NOT NULL,

  PRIMARY KEY (EmployeeDeptHistoryPK)
);