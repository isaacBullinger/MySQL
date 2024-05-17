-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT NOT NULL,
  `faculty_fname` VARCHAR(45) NOT NULL,
  `faculty_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`faculty_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`college`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`college` (
  `college_id` INT NOT NULL,
  `college` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT NOT NULL,
  `department` VARCHAR(100) NOT NULL,
  `department_code` VARCHAR(10) NOT NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_department_college1_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_college1`
    FOREIGN KEY (`college_id`)
    REFERENCES `university`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT NOT NULL,
  `course_num` INT NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credits` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT NOT NULL,
  `term` VARCHAR(10) NOT NULL,
  `year` YEAR(4) NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL,
  `section` INT NOT NULL,
  `capacity` INT NOT NULL,
  `course_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `term_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` ENUM('F', 'M') NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `section_id`),
  INDEX `fk_student_has_section_section1_idx` (`section_id` ASC) VISIBLE,
  INDEX `fk_student_has_section_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_section_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_section_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Fill College table --

INSERT INTO college VALUES
	(1,'College of Physical Science and Engineering'),
    (2,'College of Business and Communication'),
    (3,'College of Language and Letters');

-- Fill Department table --

INSERT INTO department VALUES
	(11,'Computer Information Technology','CIT',1),
    (12,'Economics','ECON',2),
    (13,'Humanities and Philosophy','HUM',3);
    
-- Fill Course table --

INSERT INTO course VALUES
	(21,111,'Intro to Databases',3,11),
    (22,388,'Econometrics',4,12),
    (23,150,'Micro Economics',3,12),
    (24,376,'Classical Heritage',2,13);

-- Fill Enrollment table --

INSERT INTO faculty VALUES
	(31,'Marty','Morring'),
    (32,'Nate','Norris'),
    (33,'Ben','Barrius'),
    (34,'John','Jensen'),
    (35,'Bill','Barney');

-- Fill Term table --

INSERT INTO term VALUES
	(41,'Fall','2019'),
    (42,'Winter','2018');

-- Fill Student table --

INSERT INTO student VALUES
	(50,'Paul','Miller','M','Dallas','TX','1996-02-22'),
    (51,'Katie','Smith','F','Provo','UT','1995-07-22'),
	(52,'Kelly','Jones','F','Provo','UT','1998-06-22'),
    (53,'Devon','Merrill','M','Mesa','AZ','2000-07-22'),
    (54,'Mandy','Murdock','F','Topeka','KS','1996-11-22'),
    (55,'Alece','Adams','F','Rigby','ID','1997-05-22'),
    (56,'Bryce','Carlson','M','Bozeman','MT','1997-11-22'),
    (57,'Preston','Larsen','M','Decatur','TN','1996-09-22'),
    (58,'Julia','Madsen','F','Rexburg','ID','1998-09-22'),
    (59,'Susan','Sorensen','F','Mesa','AZ','1998-08-09');

-- Fill Section table --

INSERT INTO section VALUES
	(60,1,30,21,31,41), -- CIT 111 1 Fall id number capacity course faculty term
	(61,1,50,23,32,41), -- ECON 150 1 Fall
    (62,2,50,23,32,41), -- ECON 150 2 Fall
    (63,1,35,22,33,41), -- ECON 388 1 Fall
    (64,1,30,24,34,41), -- HUM 376 1 Fall
    (65,2,30,21,31,42), -- CIT 111 2 Winter
    (66,3,35,21,35,42), -- CIT 111 3 Winter
    (67,1,50,23,32,42), -- ECON 150 1 Winter
    (68,2,50,23,32,42), -- ECON 150 2 Winter
    (69,1,30,24,34,42); -- HUM 376 1 Winter

-- Fill Enrollment table --

INSERT INTO enrollment VALUES
	(55,66),
    (56,65),
    (56,67),
    (56,69),
    (53,64),
    (58,68),
    (51,63),
    (52,63),
    (54,63),
    (54,64),
    (50,60),
    (50,62),
    (57,68),
    (59,65);