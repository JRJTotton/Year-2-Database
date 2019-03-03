SET
    @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;
SET
    @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;
SET
    @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';
    -- -------------------------------------
    -- Table 'Emergency Contact'
    -- -------------------------------------
DROP TABLE IF EXISTS
    `EmergencyContact`;
CREATE TABLE IF NOT EXISTS `EmergencyContact`(
    `EmergencyContactID` BIGINT NOT NULL AUTO_INCREMENT,
    `Forename` VARCHAR(20) NOT NULL,
    `Surname` VARCHAR(30) NOT NULL,
    `PhoneNumber` INT(11) NOT NULL,
    PRIMARY KEY(`EmergencyContactID`),
    INDEX `EmergencyContactID`(`EmergencyContactID` ASC),
    INDEX `Surname`(`Surname` ASC)
);

-- -------------------------------------
-- Table 'Building'
-- -------------------------------------
DROP TABLE IF EXISTS
    `Building`;
CREATE TABLE IF NOT EXISTS `Building`(
    `BuildingID` BIGINT NOT NULL AUTO_INCREMENT,
    `Town` VARCHAR(30) NOT NULL,
    `Street` VARCHAR(30) NOT NULL,
    `PostCode` VARCHAR(8) NOT NULL,
    PRIMARY KEY(`BuildingID`),
    INDEX `BuildingID`(`BuildingID` ASC)
);
-- -------------------------------------
-- Table 'Employee'
-- -------------------------------------
DROP TABLE IF EXISTS
    `Employee`;
CREATE TABLE IF NOT EXISTS `Employee`(
    `EmployeeID` BIGINT NOT NULL AUTO_INCREMENT,
    `Salary` INT(10),
    `BankDetails` INT(30),
    PRIMARY KEY(`EmployeeID`),
    INDEX `EmployeeID`(`EmployeeID` ASC)
);
-- -------------------------------------
-- Table 'Technician'
-- -------------------------------------
DROP TABLE IF EXISTS
    `Technician`;
CREATE TABLE IF NOT EXISTS `Technician`(
    `TechnicianID` BIGINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(`TechnicianID`),
    INDEX `TechnicianID`(`TechnicianID` ASC)
);
-- -------------------------------------
-- Table 'Skill'
-- -------------------------------------
DROP TABLE IF EXISTS
    `Skill`;
CREATE TABLE IF NOT EXISTS `Skill`(
    `SkillID` BIGINT NOT NULL AUTO_INCREMENT,
    `SkillName` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`SkillID`),
    INDEX `SkillID`(`SkillID` ASC)
);
-- -------------------------------------
-- Table 'Person'
-- -------------------------------------
  DROP TABLE IF EXISTS
      `Person`;
  CREATE TABLE IF NOT EXISTS `Person`(
      `PersonID` BIGINT NOT NULL AUTO_INCREMENT,
      `Forename` VARCHAR(20) NOT NULL,
      `Surname` VARCHAR(30) NOT NULL,
      `ContactNumber` INT(11) NOT NULL,
      `EmergencyContactID` BIGINT NOT NULL,
      `DateOfBirth` DATE NOT NULL,
      PRIMARY KEY(`PersonID`),
      INDEX `PersonID`(`PersonID` ASC),
      INDEX `Surname`(`Surname` ASC),
      INDEX `EmergencyContactID`(`EmergencyContactID` ASC),
      CONSTRAINT `fk_Person_EmergencyContactID` FOREIGN KEY(`EmergencyContactID`) REFERENCES EmergencyContact(`EmergencyContactID`)
  );
-- -------------------------------------
-- Table 'Manager'
-- -------------------------------------
DROP TABLE IF EXISTS
    `Manager`;
CREATE TABLE IF NOT EXISTS `Manager`(
    `ManagerID` BIGINT NOT NULL AUTO_INCREMENT,
    `Office` BOOLEAN NOT NULL,
    `EmployeeID` BIGINT NOT NULL,
    PRIMARY KEY(`ManagerID`),
    INDEX `ManagerID`(`ManagerID` ASC),
    INDEX `EmployeeID` (`EmployeeID` ASC),
    CONSTRAINT `fk_Manager_EmployeeID` FOREIGN KEY(`EmployeeID`) REFERENCES Employee(`EmployeeID`)
);
-- -------------------------------------
-- Table 'Apartment'
-- -------------------------------------
DROP TABLE IF EXISTS
    `Apartment`;
CREATE TABLE IF NOT EXISTS `Apartment`(
    `ApartmentID` BIGINT NOT NULL AUTO_INCREMENT,
    `ManagerID` BIGINT NOT NULL,
    `Apartment_Number` INT(4) NOT NULL,
    `No_Bedrooms` INT(2) NOT NULL,
    `No_Bathrooms` INT(2) NOT NULL,
    `Total_Area` INT(8) NOT NULL,
    `BuildingID` BIGINT NOT NULL,
    PRIMARY KEY(`ApartmentID`),
    INDEX `ApartmentID`(`ApartmentID` ASC),
    INDEX `ManagerID`(`ManagerID` ASC),
    INDEX `BuildingID`(`BuildingID` ASC),
    CONSTRAINT `fk_Apartment_ManagerID` FOREIGN KEY(`ManagerID`) REFERENCES Manager(`ManagerID`),
    CONSTRAINT `fk_Apartment_BuidlingID` FOREIGN KEY(`BuildingID`) REFERENCES Building(`BuildingID`)
);
-- -------------------------------------
-- Table 'Lease Agreement'
-- -------------------------------------
DROP TABLE IF EXISTS
    `LeaseAgreement`;
CREATE TABLE IF NOT EXISTS `LeaseAgreement`(
    `LeaseID` BIGINT NOT NULL AUTO_INCREMENT,
    `Start_Date` DATE NOT NULL,
    `ExpectedDuration` VARCHAR(20) NOT NULL,
    `MonthlyRent` INT NOT NULL,
    `Expired` BOOLEAN NOT NULL,
    `ManagerID` BIGINT NOT NULL,
    `ApartmentID` BIGINT NOT NULL,
    PRIMARY KEY(`LeaseID`),
    INDEX `LeaseID`(`LeaseID` ASC),
    INDEX `ManagerID`(`ManagerID` ASC),
    INDEX `ApartmentID`(`ApartmentID` ASC),
    CONSTRAINT `fk_LeaseAgreement_ManagerID` FOREIGN KEY(`ManagerID`) REFERENCES Manager(`ManagerID`),
    CONSTRAINT `fk_LeaseAgreement_ApartmentID` FOREIGN KEY(`ApartmentID`) REFERENCES Apartment(`ApartmentID`)
);
-- -------------------------------------
-- Table 'Tenant'
-- -------------------------------------
DROP TABLE IF EXISTS
    `Tenant`;
CREATE TABLE IF NOT EXISTS `Tenant`(
    `TenantID` BIGINT NOT NULL AUTO_INCREMENT,
    `BankDetails` INT(30) NOT NULL,
    `ExpectedDuration` VARCHAR(20) NOT NULL,
    `ApartmentID` BIGINT NOT NULL,
    PRIMARY KEY(`TenantID`),
    INDEX `TenantID`(`TenantID` ASC),
    INDEX `ApartmentID` (`ApartmentID` ASC),
    CONSTRAINT `fk_Tenant_ApartmentID` FOREIGN KEY(`ApartmentID`) REFERENCES LeaseAgreement(`ApartmentID`)
);
SET
    FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET
    UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
