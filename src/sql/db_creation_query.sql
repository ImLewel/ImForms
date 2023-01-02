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
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `id` INT NOT NULL,
  `name` ENUM('Respondent', 'Interviewer') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `role_id`),
  INDEX `fk_users_role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`quizes` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`questions` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `help_text` VARCHAR(45) NOT NULL,
  `required` TINYINT NOT NULL,
  `quizes_id` INT NOT NULL,
  PRIMARY KEY (`id`, `quizes_id`),
  INDEX `fk_questions_quizes1_idx` (`quizes_id` ASC) VISIBLE,
  CONSTRAINT `fk_questions_quizes1`
    FOREIGN KEY (`quizes_id`)
    REFERENCES `mydb`.`quizes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`options` (
  `id` INT NOT NULL,
  `text` VARCHAR(45) NOT NULL,
  `iscorrect` TINYINT NULL,
  `questions_id` INT NOT NULL,
  PRIMARY KEY (`id`, `questions_id`),
  INDEX `fk_options_questions1_idx` (`questions_id` ASC) VISIBLE,
  CONSTRAINT `fk_options_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `mydb`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`results` (
  `id` INT NOT NULL,
  `options_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `users_role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `options_id`, `users_id`, `users_role_id`),
  INDEX `fk_results_options1_idx` (`options_id` ASC) VISIBLE,
  INDEX `fk_results_users1_idx` (`users_id` ASC, `users_role_id` ASC) VISIBLE,
  CONSTRAINT `fk_results_options1`
    FOREIGN KEY (`options_id`)
    REFERENCES `mydb`.`options` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_results_users1`
    FOREIGN KEY (`users_id` , `users_role_id`)
    REFERENCES `mydb`.`users` (`id` , `role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`State`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`State` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actionType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actionType` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actions` (
  `id` INT NOT NULL,
  `actedAt` DATETIME NOT NULL,
  `State_id` INT NOT NULL,
  `actionType_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_actions_State1_idx` (`State_id` ASC) VISIBLE,
  INDEX `fk_actions_actionType1_idx` (`actionType_id` ASC) VISIBLE,
  CONSTRAINT `fk_actions_State1`
    FOREIGN KEY (`State_id`)
    REFERENCES `mydb`.`State` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actions_actionType1`
    FOREIGN KEY (`actionType_id`)
    REFERENCES `mydb`.`actionType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`groups` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `creatorId` INT NOT NULL,
  `actions_id` INT NOT NULL,
  `users_Roles_id` INT NOT NULL,
  `quizes_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `users_role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `actions_id`, `users_Roles_id`, `quizes_id`, `users_id`, `users_role_id`),
  INDEX `fk_groups_actions1_idx` (`actions_id` ASC) VISIBLE,
  INDEX `fk_groups_quizes1_idx` (`quizes_id` ASC) VISIBLE,
  INDEX `fk_groups_users1_idx` (`users_id` ASC, `users_role_id` ASC) VISIBLE,
  CONSTRAINT `fk_groups_actions1`
    FOREIGN KEY (`actions_id`)
    REFERENCES `mydb`.`actions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_groups_quizes1`
    FOREIGN KEY (`quizes_id`)
    REFERENCES `mydb`.`quizes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_groups_users1`
    FOREIGN KEY (`users_id` , `users_role_id`)
    REFERENCES `mydb`.`users` (`id` , `role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
