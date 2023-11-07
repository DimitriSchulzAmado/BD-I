CREATE TABLE IF NOT EXISTS `mydb`.`Estrela` (
  `idEstrela` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `massa` FLOAT NOT NULL,
  `tamanho` DOUBLE NOT NULL,
  `luminosidade` DECIMAL NOT NULL,
  `nome_galaxia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstrela`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Planeta` (
  `idPlaneta` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `massa` FLOAT NOT NULL,
  `tamanho` DOUBLE NOT NULL,
  `habitavel` CHAR(1) NOT NULL DEFAULT 'S or N',
  `Estrela_idEstrela` INT NOT NULL,
  PRIMARY KEY (`idPlaneta`, `Estrela_idEstrela`),
  CONSTRAINT `fk_Planeta_Estrela`
    FOREIGN KEY (`Estrela_idEstrela`)
    REFERENCES `mydb`.`Estrela` (`idEstrela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Nave` (
  `idNave` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `origem` VARCHAR(45) NOT NULL,
  `destino` VARCHAR(45) NOT NULL,
  `Planeta_idPlaneta` INT NOT NULL,
  `Planeta_Estrela_idEstrela` INT NOT NULL,
  PRIMARY KEY (`idNave`),
  CONSTRAINT `fk_Nave_Planeta1`
    FOREIGN KEY (`Planeta_idPlaneta` , `Planeta_Estrela_idEstrela`)
    REFERENCES `mydb`.`Planeta` (`idPlaneta` , `Estrela_idEstrela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Passageiro` (
  `idPassageiro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` CHAR(1) NOT NULL DEFAULT 'M or F',
  `profissao` VARCHAR(45) NULL,
  `Nave_idNave` INT NOT NULL,
  PRIMARY KEY (`idPassageiro`, `Nave_idNave`),
  CONSTRAINT `fk_Passageiro_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Tripulantes` (
  `idTripulantes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `sexo` CHAR(1) NOT NULL DEFAULT 'M or F',
  `especializacao` VARCHAR(45) NOT NULL,
  `supervisor` VARCHAR(45) NOT NULL,
  `Nave_idNave` INT NOT NULL,
  PRIMARY KEY (`idTripulantes`, `Nave_idNave`),
  CONSTRAINT `fk_Tripulantes_Nave1`
    FOREIGN KEY (`Nave_idNave`)
    REFERENCES `mydb`.`Nave` (`idNave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
