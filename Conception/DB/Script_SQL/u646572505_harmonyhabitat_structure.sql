-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 20 nov. 2023 à 10:20
-- Version du serveur : 10.6.15-MariaDB-cll-lve
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `u646572505_harmonyhabitat`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `commune_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '(DC2Type:datetime_immutable)',
  `score` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE `commune` (
  `id` int(11) NOT NULL,
  `position_id` int(11) DEFAULT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `code_commune` varchar(10) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `nom_commune` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `crime`
--

CREATE TABLE `crime` (
  `id` int(11) NOT NULL,
  `commune_id` int(11) DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `annee_crime` varchar(255) NOT NULL,
  `nb_crime` int(11) NOT NULL,
  `taux_pour_mille` decimal(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `crime_categorie`
--

CREATE TABLE `crime_categorie` (
  `id` int(11) NOT NULL,
  `categorie` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `code_departement` varchar(4) NOT NULL,
  `nom_departement` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

CREATE TABLE `ecole` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `commune_id` int(11) DEFAULT NULL,
  `nom_ecole` varchar(80) NOT NULL,
  `nom_commune_ecole` varchar(80) NOT NULL,
  `numero_uai_ecole` varchar(12) NOT NULL,
  `rue_adresse_ecole` varchar(255) NOT NULL,
  `code_postal_adresse_ecole` varchar(10) NOT NULL,
  `ville_adresse_ecole` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ecole_categorie`
--

CREATE TABLE `ecole_categorie` (
  `id` int(11) NOT NULL,
  `categorie` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `commune_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `immo_categorie`
--

CREATE TABLE `immo_categorie` (
  `id` int(11) NOT NULL,
  `categorie` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `immo_prix`
--

CREATE TABLE `immo_prix` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `commune_id` int(11) DEFAULT NULL,
  `prix_m2` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `position_gps`
--

CREATE TABLE `position_gps` (
  `id` int(11) NOT NULL,
  `latitude` decimal(13,10) NOT NULL,
  `longitude` decimal(13,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `code_region` varchar(4) NOT NULL,
  `nom_region` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `pseudo` varchar(25) DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`),
  ADD KEY `IDX_9474526C131A4F72` (`commune_id`);

--
-- Index pour la table `commune`
--
ALTER TABLE `commune`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E2E2D1EEDD842E46` (`position_id`),
  ADD KEY `IDX_E2E2D1EECCF9E01E` (`departement_id`),
  ADD KEY `IDX_E2E2D1EE98260155` (`region_id`);

--
-- Index pour la table `crime`
--
ALTER TABLE `crime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_730BE205131A4F72` (`commune_id`),
  ADD KEY `IDX_730BE205BCF5E72D` (`categorie_id`);

--
-- Index pour la table `crime_categorie`
--
ALTER TABLE `crime_categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C1765B6398260155` (`region_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9786AACBCF5E72D` (`categorie_id`),
  ADD KEY `IDX_9786AACDD842E46` (`position_id`),
  ADD KEY `IDX_9786AAC131A4F72` (`commune_id`);

--
-- Index pour la table `ecole_categorie`
--
ALTER TABLE `ecole_categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_68C58ED9A76ED395` (`user_id`),
  ADD KEY `IDX_68C58ED9131A4F72` (`commune_id`);

--
-- Index pour la table `immo_categorie`
--
ALTER TABLE `immo_categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `immo_prix`
--
ALTER TABLE `immo_prix`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_220C6BC9BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_220C6BC9131A4F72` (`commune_id`);

--
-- Index pour la table `position_gps`
--
ALTER TABLE `position_gps`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commune`
--
ALTER TABLE `commune`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `crime`
--
ALTER TABLE `crime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `crime_categorie`
--
ALTER TABLE `crime_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ecole`
--
ALTER TABLE `ecole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ecole_categorie`
--
ALTER TABLE `ecole_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `immo_categorie`
--
ALTER TABLE `immo_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `immo_prix`
--
ALTER TABLE `immo_prix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `position_gps`
--
ALTER TABLE `position_gps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C131A4F72` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `FK_E2E2D1EE98260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `FK_E2E2D1EECCF9E01E` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`id`),
  ADD CONSTRAINT `FK_E2E2D1EEDD842E46` FOREIGN KEY (`position_id`) REFERENCES `position_gps` (`id`);

--
-- Contraintes pour la table `crime`
--
ALTER TABLE `crime`
  ADD CONSTRAINT `FK_730BE205131A4F72` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`),
  ADD CONSTRAINT `FK_730BE205BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `crime_categorie` (`id`);

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `FK_C1765B6398260155` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

--
-- Contraintes pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD CONSTRAINT `FK_9786AAC131A4F72` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`),
  ADD CONSTRAINT `FK_9786AACBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `ecole_categorie` (`id`),
  ADD CONSTRAINT `FK_9786AACDD842E46` FOREIGN KEY (`position_id`) REFERENCES `position_gps` (`id`);

--
-- Contraintes pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `FK_68C58ED9131A4F72` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`),
  ADD CONSTRAINT `FK_68C58ED9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `immo_prix`
--
ALTER TABLE `immo_prix`
  ADD CONSTRAINT `FK_220C6BC9131A4F72` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`),
  ADD CONSTRAINT `FK_220C6BC9BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `immo_categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
