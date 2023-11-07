CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `matricula` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `curso` VARCHAR(45) NOT NULL,
  `periodo` INT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`materia` (
  `nome` INT NOT NULL,
  `professor` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Aluno_has_materia` (
  `Aluno_matricula` INT NOT NULL,
  `materia_nome` INT NOT NULL,
  PRIMARY KEY (`Aluno_matricula`, `materia_nome`),
  INDEX `fk_Aluno_has_materia_materia1_idx` (`materia_nome` ASC) VISIBLE,
  INDEX `fk_Aluno_has_materia_Aluno_idx` (`Aluno_matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_has_materia_Aluno`
    FOREIGN KEY (`Aluno_matricula`)
    REFERENCES `mydb`.`Aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_materia_materia1`
    FOREIGN KEY (`materia_nome`)
    REFERENCES `mydb`.`materia` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
