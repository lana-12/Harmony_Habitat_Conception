-- harmony_habitat.emploi_categorie definition

CREATE TABLE `emploi_categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emploi_categorie_code_UN` (`code`),
  UNIQUE KEY `emploi_categorie_libelle_UN` (`libelle`)
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
