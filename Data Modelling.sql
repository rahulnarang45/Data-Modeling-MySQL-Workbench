-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema Seattle
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`LIST REGISTRATION TABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LIST REGISTRATION TABLE` (
  `listing_id` INT NOT NULL,
  `listing_url` VARCHAR(45) NULL,
  `name` VARCHAR(150) NULL,
  PRIMARY KEY (`listing_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DESCRIPTION TABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DESCRIPTION TABLE` (
  `Description_id` INT NOT NULL,
  `summary` VARCHAR(1000) NULL,
  `space` VARCHAR(1000) NULL,
  `description` VARCHAR(1000) NULL,
  `LIST REGISTRATION TABLE_listing_id` INT NOT NULL,
  PRIMARY KEY (`Description_id`),
  INDEX `fk_DESCRIPTION TABLE_LIST REGISTRATION TABLE1_idx` (`LIST REGISTRATION TABLE_listing_id` ASC) VISIBLE,
  CONSTRAINT `fk_DESCRIPTION TABLE_LIST REGISTRATION TABLE1`
    FOREIGN KEY (`LIST REGISTRATION TABLE_listing_id`)
    REFERENCES `mydb`.`LIST REGISTRATION TABLE` (`listing_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PROMOTION TABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PROMOTION TABLE` (
  `Promotion_Id` INT NOT NULL,
  `neighborhood_overview` VARCHAR(1000) NULL,
  `notes` VARCHAR(45) NULL,
  `transit` VARCHAR(45) NULL,
  `DESCRIPTION TABLE_Description_id` INT NOT NULL,
  PRIMARY KEY (`Promotion_Id`),
  INDEX `fk_PROMOTION TABLE_DESCRIPTION TABLE1_idx` (`DESCRIPTION TABLE_Description_id` ASC) VISIBLE,
  CONSTRAINT `fk_PROMOTION TABLE_DESCRIPTION TABLE1`
    FOREIGN KEY (`DESCRIPTION TABLE_Description_id`)
    REFERENCES `mydb`.`DESCRIPTION TABLE` (`Description_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HOST TABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HOST TABLE` (
  `Host_Id` INT NOT NULL,
  `Host_Name` VARCHAR(45) NULL,
  `Host_About` VARCHAR(500) NULL,
  `Host_response_time` VARCHAR(45) NULL,
  `Host_Response_Rate` DECIMAL(5,2) NULL,
  `Host_Acceptance_Rate` DECIMAL(5,2) NULL,
  `host_is_superhost` VARCHAR(45) NULL,
  `host_listing_count` INT NULL,
  `hots_total` INT NULL,
  `host_identity_verified` VARCHAR(45) NULL,
  `host_street` VARCHAR(45) NULL,
  `host_city` VARCHAR(45) NULL,
  `host_state` VARCHAR(45) NULL,
  `host_zipcode` INT NULL,
  PRIMARY KEY (`Host_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HOST AIRBNB TABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HOST AIRBNB TABLE` (
  `host no` INT NOT NULL,
  `host_url` VARCHAR(150) NULL,
  `host_name` VARCHAR(150) NULL,
  `host_since` DATE NULL,
  `host_location` VARCHAR(150) NULL,
  `host_about` VARCHAR(1000) NULL,
  `host_response_time` VARCHAR(150) NULL,
  `HOST TABLE_Host_Id` INT NOT NULL,
  PRIMARY KEY (`host no`, `HOST TABLE_Host_Id`),
  INDEX `fk_HOST AIRBNB TABLE_HOST TABLE_idx` (`HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_HOST AIRBNB TABLE_HOST TABLE`
    FOREIGN KEY (`HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST TABLE` (`Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Location_Verfication_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Location_Verfication_table` (
  `Location_ID` INT NOT NULL,
  `latitude` VARCHAR(45) NULL,
  `longitude` VARCHAR(45) NULL,
  `is_location` VARCHAR(45) NULL,
  `HOST AIRBNB TABLE_host no` INT NOT NULL,
  `HOST AIRBNB TABLE_HOST TABLE_Host_Id` INT NOT NULL,
  `Accomodates` INT NULL,
  `Bathroom` INT NULL,
  `Bedroom` INT NULL,
  `Beds` INT NULL,
  `Bed_Type` VARCHAR(45) NULL,
  PRIMARY KEY (`Location_ID`),
  INDEX `fk_Location_Verfication_table_HOST AIRBNB TABLE1_idx` (`HOST AIRBNB TABLE_host no` ASC, `HOST AIRBNB TABLE_HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Location_Verfication_table_HOST AIRBNB TABLE1`
    FOREIGN KEY (`HOST AIRBNB TABLE_host no` , `HOST AIRBNB TABLE_HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST AIRBNB TABLE` (`host no` , `HOST TABLE_Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Property and room type table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Property and room type table` (
  `Type` VARCHAR(45) NULL,
  `P ID` INT NOT NULL,
  PRIMARY KEY (`P ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `room_type` VARCHAR(45) NOT NULL,
  `R_Id` INT NOT NULL,
  PRIMARY KEY (`R_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FEE AND SERVICE TABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FEE AND SERVICE TABLE` (
  `Fees_Id` INT NOT NULL,
  `weekly_price($)` VARCHAR(45) NULL,
  `monthly_price($)` VARCHAR(45) NULL,
  `security_deposit` VARCHAR(45) NULL,
  `cleaning_fee` VARCHAR(45) NULL,
  `guests_included` INT NULL,
  `extra_people` VARCHAR(45) NULL,
  `HOST AIRBNB TABLE_host no` INT NOT NULL,
  `HOST AIRBNB TABLE_HOST TABLE_Host_Id` INT NOT NULL,
  PRIMARY KEY (`Fees_Id`),
  INDEX `fk_FEE AND SERVICE TABLE_HOST AIRBNB TABLE1_idx` (`HOST AIRBNB TABLE_host no` ASC, `HOST AIRBNB TABLE_HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_FEE AND SERVICE TABLE_HOST AIRBNB TABLE1`
    FOREIGN KEY (`HOST AIRBNB TABLE_host no` , `HOST AIRBNB TABLE_HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST AIRBNB TABLE` (`host no` , `HOST TABLE_Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Day_Night_Capacity_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Day_Night_Capacity_table` (
  `DN_id` INT NOT NULL,
  `Min_Nights` VARCHAR(45) NULL,
  `Max_nights` VARCHAR(45) NULL,
  `HOST AIRBNB TABLE_host no` INT NOT NULL,
  `HOST AIRBNB TABLE_HOST TABLE_Host_Id` INT NOT NULL,
  PRIMARY KEY (`DN_id`),
  INDEX `fk_Day_Night_Capacity_table_HOST AIRBNB TABLE1_idx` (`HOST AIRBNB TABLE_host no` ASC, `HOST AIRBNB TABLE_HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Day_Night_Capacity_table_HOST AIRBNB TABLE1`
    FOREIGN KEY (`HOST AIRBNB TABLE_host no` , `HOST AIRBNB TABLE_HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST AIRBNB TABLE` (`host no` , `HOST TABLE_Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Time_period_Availability_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Time_period_Availability_Table` (
  `TP_id` INT NOT NULL,
  `has_availability` VARCHAR(45) NULL,
  `availability_30` INT NULL,
  `availability_60` INT NULL,
  `availability_90` INT NULL,
  `availability_365` INT NULL,
  `HOST AIRBNB TABLE_host no` INT NOT NULL,
  `HOST AIRBNB TABLE_HOST TABLE_Host_Id` INT NOT NULL,
  PRIMARY KEY (`TP_id`),
  INDEX `fk_Time_period_Availability_Table_HOST AIRBNB TABLE1_idx` (`HOST AIRBNB TABLE_host no` ASC, `HOST AIRBNB TABLE_HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Time_period_Availability_Table_HOST AIRBNB TABLE1`
    FOREIGN KEY (`HOST AIRBNB TABLE_host no` , `HOST AIRBNB TABLE_HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST AIRBNB TABLE` (`host no` , `HOST TABLE_Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`review_score_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`review_score_table` (
  `score_id` INT NOT NULL,
  `review_score_rating` INT NULL,
  `review_scores_accuracy` INT NULL,
  `review_scores_cleanliness` INT NULL,
  `review_scores_checkin` INT NULL,
  `review_scores_communication` INT NULL,
  `review_scores_location` INT NULL,
  `review_scores_value` INT NULL,
  `review_per_month` DECIMAL(5,2) NULL,
  `HOST AIRBNB TABLE_host no` INT NOT NULL,
  `HOST AIRBNB TABLE_HOST TABLE_Host_Id` INT NOT NULL,
  PRIMARY KEY (`score_id`),
  INDEX `fk_review_score_table_HOST AIRBNB TABLE1_idx` (`HOST AIRBNB TABLE_host no` ASC, `HOST AIRBNB TABLE_HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_review_score_table_HOST AIRBNB TABLE1`
    FOREIGN KEY (`HOST AIRBNB TABLE_host no` , `HOST AIRBNB TABLE_HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST AIRBNB TABLE` (`host no` , `HOST TABLE_Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`review_frequency_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`review_frequency_table` (
  `rf_id` INT NOT NULL,
  `no_of_reviews` INT NULL,
  `first_review` DATE NULL,
  `last_review` DATE NULL,
  `HOST AIRBNB TABLE_host no` INT NOT NULL,
  `HOST AIRBNB TABLE_HOST TABLE_Host_Id` INT NOT NULL,
  PRIMARY KEY (`rf_id`),
  INDEX `fk_review_frequency_table_HOST AIRBNB TABLE1_idx` (`HOST AIRBNB TABLE_host no` ASC, `HOST AIRBNB TABLE_HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_review_frequency_table_HOST AIRBNB TABLE1`
    FOREIGN KEY (`HOST AIRBNB TABLE_host no` , `HOST AIRBNB TABLE_HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST AIRBNB TABLE` (`host no` , `HOST TABLE_Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`strictness_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`strictness_table` (
  `stictness_id` INT NOT NULL,
  `cancellation_policy` VARCHAR(45) NULL,
  `require_guest_profile_picture` VARCHAR(45) NULL,
  `require_guest_phone_verification` VARCHAR(45) NULL,
  `calculated_host_listings_count` INT NULL,
  `HOST AIRBNB TABLE_host no` INT NOT NULL,
  `HOST AIRBNB TABLE_HOST TABLE_Host_Id` INT NOT NULL,
  PRIMARY KEY (`stictness_id`),
  INDEX `fk_strictness_table_HOST AIRBNB TABLE1_idx` (`HOST AIRBNB TABLE_host no` ASC, `HOST AIRBNB TABLE_HOST TABLE_Host_Id` ASC) VISIBLE,
  CONSTRAINT `fk_strictness_table_HOST AIRBNB TABLE1`
    FOREIGN KEY (`HOST AIRBNB TABLE_host no` , `HOST AIRBNB TABLE_HOST TABLE_Host_Id`)
    REFERENCES `mydb`.`HOST AIRBNB TABLE` (`host no` , `HOST TABLE_Host_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Location_Verfication_table_has_Property and room type table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Location_Verfication_table_has_Property and room type table` (
  `Location_Verfication_table_Location_ID` INT NOT NULL,
  `Property and room type table_P ID` INT NOT NULL,
  PRIMARY KEY (`Location_Verfication_table_Location_ID`, `Property and room type table_P ID`),
  INDEX `fk_Location_Verfication_table_has_Property and room type ta_idx` (`Property and room type table_P ID` ASC) VISIBLE,
  INDEX `fk_Location_Verfication_table_has_Property and room type ta_idx1` (`Location_Verfication_table_Location_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Location_Verfication_table_has_Property and room type tabl1`
    FOREIGN KEY (`Location_Verfication_table_Location_ID`)
    REFERENCES `mydb`.`Location_Verfication_table` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Location_Verfication_table_has_Property and room type tabl2`
    FOREIGN KEY (`Property and room type table_P ID`)
    REFERENCES `mydb`.`Property and room type table` (`P ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room_has_Location_Verfication_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room_has_Location_Verfication_table` (
  `Room_R_Id` INT NOT NULL,
  `Location_Verfication_table_Location_ID` INT NOT NULL,
  PRIMARY KEY (`Room_R_Id`, `Location_Verfication_table_Location_ID`),
  INDEX `fk_Room_has_Location_Verfication_table_Location_Verfication_idx` (`Location_Verfication_table_Location_ID` ASC) VISIBLE,
  INDEX `fk_Room_has_Location_Verfication_table_Room1_idx` (`Room_R_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Room_has_Location_Verfication_table_Room1`
    FOREIGN KEY (`Room_R_Id`)
    REFERENCES `mydb`.`Room` (`R_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_has_Location_Verfication_table_Location_Verfication_t1`
    FOREIGN KEY (`Location_Verfication_table_Location_ID`)
    REFERENCES `mydb`.`Location_Verfication_table` (`Location_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`listing_Detail_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`listing_Detail_table` (
  `Listing_No` INT NOT NULL,
  `date` DATE NULL,
  `available` VARCHAR(45) NULL,
  `LIST REGISTRATION TABLE_listing_id` INT NOT NULL,
  PRIMARY KEY (`Listing_No`, `LIST REGISTRATION TABLE_listing_id`),
  INDEX `fk_listing_Detail_table_LIST REGISTRATION TABLE1_idx` (`LIST REGISTRATION TABLE_listing_id` ASC) VISIBLE,
  CONSTRAINT `fk_listing_Detail_table_LIST REGISTRATION TABLE1`
    FOREIGN KEY (`LIST REGISTRATION TABLE_listing_id`)
    REFERENCES `mydb`.`LIST REGISTRATION TABLE` (`listing_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lisitng_price`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lisitng_price` (
  `LP_Id` INT NOT NULL,
  `price` VARCHAR(45) NULL,
  `LIST REGISTRATION TABLE_listing_id` INT NOT NULL,
  PRIMARY KEY (`LP_Id`, `LIST REGISTRATION TABLE_listing_id`),
  INDEX `fk_Lisitng_price_LIST REGISTRATION TABLE1_idx` (`LIST REGISTRATION TABLE_listing_id` ASC) VISIBLE,
  CONSTRAINT `fk_Lisitng_price_LIST REGISTRATION TABLE1`
    FOREIGN KEY (`LIST REGISTRATION TABLE_listing_id`)
    REFERENCES `mydb`.`LIST REGISTRATION TABLE` (`listing_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reviewer table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reviewer table` (
  `reviewer_Id` INT NOT NULL,
  `reviewer_name` VARCHAR(45) NULL,
  PRIMARY KEY (`reviewer_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Review_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Review_Table` (
  `Review_No` INT NOT NULL,
  `date` DATE NULL,
  `comments` VARCHAR(500) NULL,
  `Reviewer table_reviewer_Id` INT NOT NULL,
  PRIMARY KEY (`Review_No`, `Reviewer table_reviewer_Id`),
  INDEX `fk_Review_Table_Reviewer table1_idx` (`Reviewer table_reviewer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Table_Reviewer table1`
    FOREIGN KEY (`Reviewer table_reviewer_Id`)
    REFERENCES `mydb`.`Reviewer table` (`reviewer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LR_Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LR_Table` (
  `Id` INT NOT NULL,
  `Review_Table_Review_No` INT NOT NULL,
  PRIMARY KEY (`Id`, `Review_Table_Review_No`),
  INDEX `fk_LR_Table_Review_Table1_idx` (`Review_Table_Review_No` ASC) VISIBLE,
  CONSTRAINT `fk_LR_Table_Review_Table1`
    FOREIGN KEY (`Review_Table_Review_No`)
    REFERENCES `mydb`.`Review_Table` (`Review_No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
