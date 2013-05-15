-- -----------------------------------------------------
-- Table `commerces`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerces` ;

CREATE  TABLE IF NOT EXISTS `commerces` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(255) NOT NULL ,
  `adresse` VARCHAR(255) NULL ,
  `code_postal` VARCHAR(30) NULL ,
  `ville` VARCHAR(100) NULL ,
  `logo` VARCHAR(255) NULL ,
  `description` TEXT NULL ,
  `login` VARCHAR(50) NOT NULL ,
  `password` VARCHAR(50) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `actif` TINYINT(1) NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `commerces_uq_login` (`login` ASC) ,
  UNIQUE INDEX `commerces_uq_email` (`email` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `utilisateurs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `utilisateurs` ;

CREATE  TABLE IF NOT EXISTS `utilisateurs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `prenom` VARCHAR(100) NULL ,
  `nom` VARCHAR(100) NULL ,
  `admin` TINYINT(1) NOT NULL DEFAULT 0 ,
  `login` VARCHAR(50) NOT NULL ,
  `password` VARCHAR(50) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `actif` TINYINT(1) NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `utilisateurs_uq_login` (`login` ASC) ,
  UNIQUE INDEX `utilisateurs_uq_email` (`email` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `commerces_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerces_categories` ;

CREATE  TABLE IF NOT EXISTS `commerces_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(100) NOT NULL ,
  `icone` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `commerces_categories_uq_nom` (`nom` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `commerces_sous_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerces_sous_categories` ;

CREATE  TABLE IF NOT EXISTS `commerces_sous_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(100) NOT NULL ,
  `icone` VARCHAR(255) NULL ,
  `categorie_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `commerces_sous_categories_uq_nom` (`nom` ASC) ,
  INDEX `commerces_sous_categories_idx_categorie` (`categorie_id` ASC) ,
  CONSTRAINT `commerces_sous_categories_fk_categorie`
    FOREIGN KEY (`categorie_id` )
    REFERENCES `commerces_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `commerces_possede_categorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerces_possede_categorie` ;

CREATE  TABLE IF NOT EXISTS `commerces_possede_categorie` (
  `commerce_id` INT UNSIGNED NOT NULL ,
  `categorie_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`commerce_id`, `categorie_id`) ,
  INDEX `commerces_possede_categorie_idx_categorie` (`categorie_id` ASC) ,
  INDEX `commerces_possede_categorie_idx_commerce` (`commerce_id` ASC) ,
  CONSTRAINT `commerces_possede_categorie_fk_commerce`
    FOREIGN KEY (`commerce_id` )
    REFERENCES `commerces` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `commerces_possede_categorie_fk_categorie`
    FOREIGN KEY (`categorie_id` )
    REFERENCES `commerces_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `commerces_possede_sous_categorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerces_possede_sous_categorie` ;

CREATE  TABLE IF NOT EXISTS `commerces_possede_sous_categorie` (
  `commerce_id` INT UNSIGNED NOT NULL ,
  `sous_categorie_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`commerce_id`, `sous_categorie_id`) ,
  INDEX `commerces_possede_sous_categorie_idx_categorie` (`sous_categorie_id` ASC) ,
  INDEX `commerces_possede_sous_categorie_idx_commerce` (`commerce_id` ASC) ,
  CONSTRAINT `commerces_possede_sous_categorie_fk_commerce`
    FOREIGN KEY (`commerce_id` )
    REFERENCES `commerces` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `commerces_possede_sous_categorie_fk_categorie`
    FOREIGN KEY (`sous_categorie_id` )
    REFERENCES `commerces_sous_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `evenements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evenements` ;

CREATE  TABLE IF NOT EXISTS `evenements` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(255) NULL ,
  `description` TEXT NULL ,
  `date_creation` DATETIME NULL ,
  `date_debut` DATETIME NULL ,
  `date_fin` DATETIME NULL ,
  `commerce_id` INT UNSIGNED NOT NULL ,
  `adresse` VARCHAR(255) NULL ,
  `code_postal` VARCHAR(30) NULL ,
  `ville` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `evenements_idx_commerce` (`commerce_id` ASC) ,
  CONSTRAINT `evenements_fk_commerce`
    FOREIGN KEY (`commerce_id` )
    REFERENCES `commerces` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `evenements_condition_categorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evenements_condition_categorie` ;

CREATE  TABLE IF NOT EXISTS `evenements_condition_categorie` (
  `categorie_id` INT UNSIGNED NOT NULL ,
  `evenement_id` INT UNSIGNED NOT NULL ,
  `minimum` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`categorie_id`, `evenement_id`) ,
  INDEX `evenements_condition_categorie_idx_evenement` (`evenement_id` ASC) ,
  INDEX `evenements_condition_categorie_idx_commerce` (`categorie_id` ASC) ,
  CONSTRAINT `evenements_condition_categorie_fk_categorie`
    FOREIGN KEY (`categorie_id` )
    REFERENCES `commerces_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `evenements_condition_categorie_fk_evenement`
    FOREIGN KEY (`evenement_id` )
    REFERENCES `evenements` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `evenements_condition_sous_categorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evenements_condition_sous_categorie` ;

CREATE  TABLE IF NOT EXISTS `evenements_condition_sous_categorie` (
  `evenement_id` INT UNSIGNED NOT NULL ,
  `sous_categorie_id` INT UNSIGNED NOT NULL ,
  `minimum` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`evenement_id`, `sous_categorie_id`) ,
  INDEX `evenements_condition_sous_categorie_idx_sous_categorie` (`sous_categorie_id` ASC) ,
  INDEX `evenements_condition_sous_categorie_idx_evenement` (`evenement_id` ASC) ,
  CONSTRAINT `evenements_condition_sous_categorie_fk_evenement`
    FOREIGN KEY (`evenement_id` )
    REFERENCES `evenements` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `evenements_condition_sous_categorie_fk_sous_categorie`
    FOREIGN KEY (`sous_categorie_id` )
    REFERENCES `commerces_sous_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `utilisateurs_scans`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `utilisateurs_scans` ;

CREATE  TABLE IF NOT EXISTS `utilisateurs_scans` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `utilisateur_id` INT UNSIGNED NOT NULL ,
  `commerce_id` INT UNSIGNED NOT NULL ,
  `categorie_id` INT UNSIGNED NOT NULL ,
  `article` VARCHAR(255) NULL ,
  `points` INT NOT NULL DEFAULT 0 ,
  `date_scan` DATETIME NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `utilisateurs_scans_idx_utilisateur` (`utilisateur_id` ASC) ,
  INDEX `utilisateurs_scans_idx_categorie` (`categorie_id` ASC) ,
  INDEX `utilisateurs_scans_idx_commerce` (`commerce_id` ASC) ,
  CONSTRAINT `utilisateurs_scans_fk_categorie`
    FOREIGN KEY (`categorie_id` )
    REFERENCES `commerces_categories` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `utilisateurs_scans_fk_utilisateur`
    FOREIGN KEY (`utilisateur_id` )
    REFERENCES `utilisateurs` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `utilisateurs_scans_fk_commerce`
    FOREIGN KEY (`commerce_id` )
    REFERENCES `commerces` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `commerces_avis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `commerces_avis` ;

CREATE  TABLE IF NOT EXISTS `commerces_avis` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `commerce_id` INT UNSIGNED NOT NULL ,
  `utilisateur_id` INT UNSIGNED NOT NULL ,
  `note` TINYINT NULL ,
  `commentaire` TEXT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `commerces_avis_idx_commerce` (`commerce_id` ASC) ,
  INDEX `commerces_avis_idx_utilisateur` (`utilisateur_id` ASC) ,
  CONSTRAINT `commerces_avis_fk_commerce`
    FOREIGN KEY (`commerce_id` )
    REFERENCES `commerces` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `commerces_avis_fk_utilisateur`
    FOREIGN KEY (`utilisateur_id` )
    REFERENCES `utilisateurs` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;
