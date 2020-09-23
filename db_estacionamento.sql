-- MySQL Script generated by MySQL Workbench
-- Thu Sep 17 20:32:27 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema estacionamento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema estacionamento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `estacionamento` DEFAULT CHARACTER SET utf8 ;
USE `estacionamento` ;

-- -----------------------------------------------------
-- Table `estacionamento`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`Veiculo` (
  `id_veiculo` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(7) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  UNIQUE INDEX `placa_UNIQUE` (`placa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estacionamento`.`Preco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`Preco` (
  `id_preco` INT NOT NULL AUTO_INCREMENT,
  `valor` DOUBLE NOT NULL,
  `bandeira` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_preco`),
  UNIQUE INDEX `bandeira_UNIQUE` (`bandeira` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estacionamento`.`Vagas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`Vagas` (
  `id_vagas` INT NOT NULL AUTO_INCREMENT,
  `numero_vaga` VARCHAR(45) NOT NULL,
  `Preco_id_preco` INT NOT NULL,
  PRIMARY KEY (`id_vagas`),
  UNIQUE INDEX `numero_vaga_UNIQUE` (`numero_vaga` ASC) VISIBLE,
  INDEX `fk_Vagas_Preco_idx` (`Preco_id_preco` ASC) VISIBLE,
  CONSTRAINT `fk_Vagas_Preco`
    FOREIGN KEY (`Preco_id_preco`)
    REFERENCES `estacionamento`.`Preco` (`id_preco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estacionamento`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`Usuarios` (
  `id_usuarios` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estacionamento`.`Alocacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estacionamento`.`Alocacao` (
  `id_alocacao` INT NOT NULL AUTO_INCREMENT,
  `entrada` TIMESTAMP(2) NOT NULL,
  `saida` TIMESTAMP(2),
  `Veiculo_id_veiculo` INT NOT NULL,
  `Vagas_id_vagas` INT NOT NULL,
  `Usuarios_id_usuarios` INT NOT NULL,
  PRIMARY KEY (`id_alocacao`),
  INDEX `fk_Alocacao_Veiculo1_idx` (`Veiculo_id_veiculo` ASC) VISIBLE,
  INDEX `fk_Alocacao_Vagas1_idx` (`Vagas_id_vagas` ASC) VISIBLE,
  INDEX `fk_Alocacao_Usuarios1_idx` (`Usuarios_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Alocacao_Veiculo1`
    FOREIGN KEY (`Veiculo_id_veiculo`)
    REFERENCES `estacionamento`.`Veiculo` (`id_veiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alocacao_Vagas1`
    FOREIGN KEY (`Vagas_id_vagas`)
    REFERENCES `estacionamento`.`Vagas` (`id_vagas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alocacao_Usuarios1`
    FOREIGN KEY (`Usuarios_id_usuarios`)
    REFERENCES `estacionamento`.`Usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
