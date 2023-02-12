-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 07 fév. 2023 à 15:22
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `maquette`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `login`, `password`) VALUES
(1, 'admin', '$2y$10$uCovrAGDJ0xLTIBaU1Abt.WZ6L8ezFvi6WDvae.kykBhTetbTVDua');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `prenom`, `nom`, `status`) VALUES
(1, 'Paul', 'Smith', 1),
(4, 'Smith', 'Paul', 1),
(3, 'Antoine', 'Marc', 1),
(5, 'test', 'Aurelie', 1),
(6, 'Toto1', 'Toto1', 0),
(7, 'Paul', 'Hochon', 1),
(8, 'Alfred', 'Basha', 1),
(9, 'Alfred', 'Toto1', 0);

-- --------------------------------------------------------

--
-- Structure de la table `liaisons`
--

DROP TABLE IF EXISTS `liaisons`;
CREATE TABLE IF NOT EXISTS `liaisons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_id` int NOT NULL,
  `message_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `liaisons`
--

INSERT INTO `liaisons` (`id`, `contact_id`, `message_id`) VALUES
(1, 4, 5),
(2, 6, 6),
(3, 4, 7),
(4, 7, 8),
(5, 7, 9),
(6, 8, 11),
(7, 8, 12),
(8, 9, 13),
(9, 9, 14),
(10, 9, 15),
(11, 9, 16),
(12, 9, 17),
(13, 9, 18),
(14, 9, 19),
(15, 9, 20),
(16, 9, 21),
(17, 9, 22),
(18, 9, 23),
(19, 9, 24),
(20, 9, 25),
(21, 9, 26),
(22, 9, 27),
(23, 9, 28),
(24, 9, 29),
(25, 9, 30),
(26, 9, 31),
(27, 9, 32),
(28, 8, 33);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `date` varchar(10) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `text`, `date`, `status`) VALUES
(1, 'Coucou', '123', 1),
(2, 'Recoucou', '1668874689', 1),
(3, ':message', '1668874779', 1),
(4, 'Coucou3', '1668874870', 1),
(5, 'C\'est encore moi', '1668875525', 0),
(6, 'sqfgsfgqsfgqsg', '1668876084', 0),
(7, 'Toujours là', '1668876169', 0),
(8, '    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti accusantium eos, quod quas amet libero tempore eligendi, deleniti non, sapiente officia dicta sint fugiat voluptatibus eveniet adipisci laudantium quaerat repudiandae!\r\n    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti accusantium eos, quod quas amet libero tempore eligendi, deleniti non, sapiente officia dicta sint fugiat voluptatibus eveniet adipisci laudantium quaerat repudiandae!    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti accusantium eos, quod quas amet libero tempore eligendi, deleniti non, sapiente officia dicta sint fugiat voluptatibus eveniet adipisci laudantium quaerat repudiandae!    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti accusantium eos, quod quas amet libero tempore eligendi, deleniti non, sapiente officia dicta sint fugiat voluptatibus eveniet adipisci laudantium quaerat repudiandae!\r\n\r\n\r\n', '1668938015', 1),
(9, 'Un nouveau message', '1669570902', 1),
(10, 'مرحبا انها انا', '123', 1),
(11, 'كيف حالكم يا أصدقاء؟', '1675773992', 1),
(12, 'How are you doing ?', '1675774657', 1),
(13, 'تم ارسال رسالتك.', '1675777855', 1),
(14, 'تم ارسال رسالتك.', '1675777894', 1),
(15, 'تم ارسال رسالتك.', '1675777898', 1),
(16, 'تم ارسال رسالتك.', '1675777899', 1),
(17, 'تم ارسال رسالتك.', '1675782182', 1),
(18, 'تم ارسال رسالتك.', '1675782450', 1),
(19, 'تم ارسال رسالتك.', '1675782456', 1),
(20, 'تم ارسال رسالتك.', '1675782458', 1),
(21, 'تم ارسال رسالتك.', '1675782630', 1),
(22, 'تم ارسال رسالتك.', '1675782632', 1),
(23, 'تم ارسال رسالتك.', '1675782636', 1),
(24, 'تم ارسال رسالتك.', '1675782637', 1),
(25, 'تم ارسال رسالتك.', '1675782684', 1),
(26, 'تم ارسال رسالتك.', '1675782686', 1),
(27, 'تم ارسال رسالتك.', '1675782689', 1),
(28, 'تم ارسال رسالتك.', '1675782690', 1),
(29, 'تم ارسال رسالتك.', '1675782696', 1),
(30, 'تم ارسال رسالتك.', '1675782699', 1),
(31, 'تم ارسال رسالتك.', '1675782740', 1),
(32, 'تم ارسال رسالتك.', '1675782829', 0),
(33, 'Coucou', '1675782872', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
