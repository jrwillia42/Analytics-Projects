-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Vending
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Vending
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vending` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema HR
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Sales
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema SQLTutorial
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Stats
-- -----------------------------------------------------
USE `Vending` ;

-- -----------------------------------------------------
-- Table `Vending`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vending`.`Customers` ;

CREATE TABLE IF NOT EXISTS `Vending`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CompanyName` VARCHAR(45) NULL,
  `ContactName` VARCHAR(45) NULL,
  `ContactTitle` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Region` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Fax` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vending`.`Shippers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vending`.`Shippers` ;

CREATE TABLE IF NOT EXISTS `Vending`.`Shippers` (
  `ShipperID` INT NOT NULL,
  `CompanyName` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`ShipperID`),
  UNIQUE INDEX `ShipperID_UNIQUE` (`ShipperID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vending`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vending`.`Orders` ;

CREATE TABLE IF NOT EXISTS `Vending`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NULL,
  `EmployeeID` INT NULL,
  `OrderDate` DATE NULL,
  `RequiredDate` DATE NULL,
  `ShippedDate` DATE NULL,
  `ShipperID` INT NULL,
  `Freight` DECIMAL NULL,
  `ShipName` VARCHAR(45) NULL,
  `ShipAddress` VARCHAR(45) NULL,
  `ShipCity` VARCHAR(45) NULL,
  `ShipRegion` VARCHAR(45) NULL,
  `ShipPostalCode` VARCHAR(45) NULL,
  `ShipCountry` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC),
  INDEX `fk_Orders_Customers_idx` (`CustomerID` ASC),
  INDEX `fk_Orders_Shipper_idx` (`ShipperID` ASC),
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Vending`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Shipper`
    FOREIGN KEY (`ShipperID`)
    REFERENCES `Vending`.`Shippers` (`ShipperID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vending`.`OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vending`.`OrderDetails` ;

CREATE TABLE IF NOT EXISTS `Vending`.`OrderDetails` (
  `OrderID` INT NOT NULL,
  `ProductID` VARCHAR(45) NULL,
  `UnitPrice` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  `Discount` VARCHAR(45) NULL,
  INDEX `fk_OrderDetails_Orders_idx` (`OrderID` ASC),
  CONSTRAINT `fk_OrderDetails_Orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `Vending`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
