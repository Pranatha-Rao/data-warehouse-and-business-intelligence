
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE EmployeeDeptHistory_scd';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/ 

CREATE TABLE EmployeeDeptHistory_scd 
(
  EmployeeDeptHistoryPK number(10)  NOT NULL,
  EmployeeID number(10) NOT NULL,
  FirstName varchar2(36) NOT NULL,
  MiddleName varchar2(36) DEFAULT NULL,
  LastName varchar2(36) NOT NULL,
  Shift varchar2(20) NOT NULL,
  Department varchar2(80) NOT NULL,
  GroupName varchar2(40) NOT NULL,

    DI_Tool       varchar2(40) default 'what_DI_Tool?'      NOT NULL,
    DI_Job_ID 	 varchar2(40) DEFAULT 'no_job_id' NOT NULL,
    DI_Create_Date 	 timestamp(3) DEFAULT systimestamp NOT NULL ,
    DI_Modified_Date  timestamp(3) DEFAULT systimestamp NOT NULL ,

  scd_start             date NOT NULL,  
  scd_end              date  NULL,
  scd_version        number(10) NOT NULL,
  scd_active           number(10) NOT NULL,

  PRIMARY KEY (EmployeeDeptHistoryPK)
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE EmployeeDeptHistory_scd_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER EmployeeDeptHistory_scd_seq_tr
 BEFORE INSERT ON EmployeeDeptHistory_scd FOR EACH ROW
 WHEN (NEW.EmployeeDeptHistoryPK IS NULL)
BEGIN
 SELECT EmployeeDeptHistory_scd_seq.NEXTVAL INTO :NEW.EmployeeDeptHistoryPK FROM DUAL;
END;
/
