-- harmony_habitat.region definition

CREATE TABLE `region` (
  `id_region` int(11) NOT NULL AUTO_INCREMENT,
  `code_region` varchar(4) NOT NULL,
  `nom_region` varchar(60) NOT NULL,
  PRIMARY KEY (`id_region`),
  UNIQUE KEY `code_region` (`code_region`)
);


-- harmony_habitat.departement definition

CREATE TABLE `departement` (
  `id_departement` int(11) NOT NULL AUTO_INCREMENT,
  `code_departement` varchar(4) NOT NULL,
  `nom_departement` varchar(40) DEFAULT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id_departement`),
  UNIQUE KEY `code_departement` (`code_departement`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`)
);


-- harmony_habitat.position_gps definition

CREATE TABLE `position_gps` (
  `id_position` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` decimal(13,10) NOT NULL,
  `longitude` decimal(13,10) NOT NULL,
  PRIMARY KEY (`id_position`)
);


-- harmony_habitat.commune definition

CREATE TABLE `commune` (
  `id_commune` int(11) NOT NULL AUTO_INCREMENT,
  `code_commune` varchar(10) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `nom_commune` varchar(80) NOT NULL,
  `id_position` int(11) NOT NULL,
  `id_departement` int(11) NOT NULL,
  `id_region` int(11) NOT NULL,
  PRIMARY KEY (`id_commune`),
  UNIQUE KEY `code_commune` (`code_commune`),
  KEY `id_position` (`id_position`),
  KEY `id_departement` (`id_departement`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `commune_ibfk_1` FOREIGN KEY (`id_position`) REFERENCES `position_gps` (`id_position`),
  CONSTRAINT `commune_ibfk_2` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_departement`),
  CONSTRAINT `commune_ibfk_3` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`)
);

-- harmony_habitat.crime_categorie definition

CREATE TABLE `crime_categorie` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(80) NOT NULL,
  PRIMARY KEY (`id_categorie`),
  UNIQUE KEY `categorie` (`categorie`)
);

-- harmony_habitat.crime definition

CREATE TABLE `crime` (
  `id_crime` int(11) NOT NULL AUTO_INCREMENT,
  `annee_crime` varchar(4) NOT NULL,
  `nb_crime` int(11) NOT NULL,
  `taux_pour_mille` decimal(10,6) NOT NULL,
  `id_commune` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_crime`),
  KEY `id_commune` (`id_commune`),
  KEY `id_categorie` (`id_categorie`),
  CONSTRAINT `crime_ibfk_1` FOREIGN KEY (`id_commune`) REFERENCES `commune` (`id_commune`),
  CONSTRAINT `crime_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `crime_categorie` (`id_categorie`)
);

