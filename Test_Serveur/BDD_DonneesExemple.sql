
-- -----------------------------------------------------
-- Data for table `commerces`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `commerces` (`id`, `nom`, `adresse`, `code_postal`, `ville`, `logo`, `description`, `login`, `password`, `email`, `actif`) VALUES (1, 'Pizzeria Guiseppino', '26 Rue Paillot de Montabert', '10000', 'Troyes', NULL, NULL, 'guiseppino', 'd36288dc5f61931e8d0558ed8aaec4b468411fff', 'contact@guiseppino.fr', 1);
INSERT INTO `commerces` (`id`, `nom`, `adresse`, `code_postal`, `ville`, `logo`, `description`, `login`, `password`, `email`, `actif`) VALUES (2, 'Urbain IV', '69 Rue Urbain IV', '10000', 'Troyes', NULL, NULL, 'urbainIV', 'd36288dc5f61931e8d0558ed8aaec4b468411fff', 'contact@urbain.fr', 1);
INSERT INTO `commerces` (`id`, `nom`, `adresse`, `code_postal`, `ville`, `logo`, `description`, `login`, `password`, `email`, `actif`) VALUES (3, 'Pulp Sandwiches', '74 Rue Urbain IV', '10000', 'Troyes', NULL, NULL, 'pulp', 'd36288dc5f61931e8d0558ed8aaec4b468411fff', 'contact@pulp.fr', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `utilisateurs`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `utilisateurs` (`id`, `prenom`, `nom`, `admin`, `login`, `password`, `email`, `actif`) VALUES (1, 'Jérémie', 'Jalouzet', 1, 'jeremie', 'd36288dc5f61931e8d0558ed8aaec4b468411fff', 'jeremie.jalouzet@utt.fr', 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `commerces_categories`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `commerces_categories` (`id`, `nom`, `icone`) VALUES (1, 'Restauration', NULL);
INSERT INTO `commerces_categories` (`id`, `nom`, `icone`) VALUES (2, 'Prêt-à-porter', NULL);
INSERT INTO `commerces_categories` (`id`, `nom`, `icone`) VALUES (3, 'Alimentation', NULL);
INSERT INTO `commerces_categories` (`id`, `nom`, `icone`) VALUES (4, 'Culture', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `commerces_sous_categories`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (1, 'Brasserie', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (2, 'Restauration rapide', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (3, 'Crêperie', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (4, 'Pizzeria', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (5, 'Fruits de mer', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (6, 'Cuisine traditionnelle', '', 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (7, 'Cuisine chinoise', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (8, 'Cuisine indienne', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (9, 'Gastronomique', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (10, 'Chaussures', NULL, 2);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (11, 'Mode Homme', NULL, 2);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (12, 'Mode Femme', NULL, 2);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (13, 'Livres', NULL, 4);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (14, 'CD', NULL, 4);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (15, 'Pâtes', NULL, 1);
INSERT INTO `commerces_sous_categories` (`id`, `nom`, `icone`, `categorie_id`) VALUES (16, 'Cuisine italienne', NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `commerces_possede_categorie`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `commerces_possede_categorie` (`commerce_id`, `categorie_id`) VALUES (1, 1);
INSERT INTO `commerces_possede_categorie` (`commerce_id`, `categorie_id`) VALUES (1, 2);
INSERT INTO `commerces_possede_categorie` (`commerce_id`, `categorie_id`) VALUES (1, 3);

COMMIT;

-- -----------------------------------------------------
-- Data for table `commerces_possede_sous_categorie`
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `commerces_possede_sous_categorie` (`commerce_id`, `sous_categorie_id`) VALUES (3, 2);
INSERT INTO `commerces_possede_sous_categorie` (`commerce_id`, `sous_categorie_id`) VALUES (1, 4);
INSERT INTO `commerces_possede_sous_categorie` (`commerce_id`, `sous_categorie_id`) VALUES (1, 15);
INSERT INTO `commerces_possede_sous_categorie` (`commerce_id`, `sous_categorie_id`) VALUES (1, 16);
INSERT INTO `commerces_possede_sous_categorie` (`commerce_id`, `sous_categorie_id`) VALUES (2, 6);

COMMIT;
