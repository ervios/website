SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Division`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Division` (
  `div_id` INT NOT NULL ,
  `div_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`div_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Team`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Team` (
  `team_id` INT NOT NULL ,
  `div_id` INT NOT NULL ,
  `teamname` VARCHAR(45) NOT NULL ,
  `home_turf` VARCHAR(45) NULL ,
  `team_seasons` VARCHAR(45) NULL ,
  `placed` VARCHAR(45) NULL ,
  `jerseycolor` VARCHAR(45) NULL ,
  PRIMARY KEY (`team_id`) ,
  INDEX `div_id_idx` (`div_id` ASC) ,
  CONSTRAINT `div_id`
    FOREIGN KEY (`div_id` )
    REFERENCES `mydb`.`Division` (`div_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Player`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Player` (
  `player_id` INT NOT NULL AUTO_INCREMENT ,
  `team_id` INT NOT NULL ,
  `player_name` VARCHAR(45) NOT NULL ,
  `captain` TINYINT(1) NULL ,
  `born` YEAR NULL ,
  `playerSeason` INT NULL ,
  `scoredGoals` INT NULL ,
  PRIMARY KEY (`player_id`) ,
  INDEX `team_id_idx` (`team_id` ASC) ,
  CONSTRAINT `team_id`
    FOREIGN KEY (`team_id` )
    REFERENCES `mydb`.`Team` (`team_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MatchResult`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`MatchResult` (
  `match_id` INT NOT NULL ,
  `team_oneID` INT NOT NULL ,
  `team_twoID` INT NOT NULL ,
  `teamonescore` INT NOT NULL ,
  `teamtwoscore` INT NOT NULL ,
  `date` DATE NOT NULL ,
  PRIMARY KEY (`match_id`) ,
  INDEX `team_id_One_idx` (`team_oneID` ASC) ,
  INDEX `team_id_Two_idx` (`team_twoID` ASC) ,
  CONSTRAINT `team_id_One`
    FOREIGN KEY (`team_oneID` )
    REFERENCES `mydb`.`Team` (`team_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `team_id_Two`
    FOREIGN KEY (`team_twoID` )
    REFERENCES `mydb`.`Team` (`team_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`User` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `user_name` VARCHAR(45) NOT NULL ,
  `user_pass` VARCHAR(45) NOT NULL ,
  `user_firstName` VARCHAR(45) NOT NULL ,
  `user_surName` VARCHAR(45) NOT NULL ,
  `user_email` VARCHAR(45) NULL ,
  `user_telnr` INT NULL ,
  PRIMARY KEY (`user_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TeamAdmin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`TeamAdmin` (
  `admin_id` INT NOT NULL AUTO_INCREMENT ,
  `user_id` INT NOT NULL ,
  `team_id` INT NOT NULL ,
  PRIMARY KEY (`admin_id`) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  INDEX `team_id_idx` (`team_id` ASC) ,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id` )
    REFERENCES `mydb`.`User` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `team_id`
    FOREIGN KEY (`team_id` )
    REFERENCES `mydb`.`Team` (`team_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
