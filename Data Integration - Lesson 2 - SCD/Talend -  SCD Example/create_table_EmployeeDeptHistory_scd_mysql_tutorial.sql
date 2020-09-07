CREATE TABLE EmployeeDeptHistory_scd 
(
  `EmployeeDeptHistoryPK` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int NOT NULL,
  `FirstName` varchar(36) NOT NULL,
  `MiddleName` varchar(36) DEFAULT NULL,
  `LastName` varchar(36) NOT NULL,
  `Shift` varchar(20) NOT NULL,
  `Department` varchar(80) NOT NULL,
  `GroupName` varchar(40) NOT NULL,
  `scd_start` date NOT NULL,  
  `scd_end` date  DEFAULT NULL,
  `scd_version` int NOT NULL,
  `scd_active` int NOT NULL,
  PRIMARY KEY (`EmployeeDeptHistoryPK`)
);