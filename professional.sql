-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 11 2022 г., 12:42
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `professional`
--
CREATE DATABASE IF NOT EXISTS `professional` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `professional`;

-- --------------------------------------------------------

--
-- Структура таблицы `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `participant`
--

INSERT INTO `participant` (`id`, `name`) VALUES
(1, 'Саша'),
(2, 'Дима');

-- --------------------------------------------------------

--
-- Структура таблицы `prize`
--

CREATE TABLE IF NOT EXISTS `prize` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `prize`
--

INSERT INTO `prize` (`id`, `description`) VALUES
(1, 'Сковорода');

-- --------------------------------------------------------

--
-- Структура таблицы `promo`
--

CREATE TABLE IF NOT EXISTS `promo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `promo`
--

INSERT INTO `promo` (`id`, `name`, `description`) VALUES
(1, 'акция', 'скидка 100% на  саахар'),
(4, 'Акция 3', NULL),
(5, 'Акция 4', 'Описание 2'),
(6, 'Акция 5', NULL),
(7, 'Акция 2', 'Описание 2'),
(8, 'Акция 2', 'Описание 2'),
(9, 'Акция 11', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `promo_participant`
--

CREATE TABLE IF NOT EXISTS `promo_participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `promo_id` int NOT NULL,
  `participant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promo_participant_ibfk_1` (`participant_id`),
  KEY `promo_participant_ibfk_2` (`promo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `promo_prize`
--

CREATE TABLE IF NOT EXISTS `promo_prize` (
  `id` int NOT NULL AUTO_INCREMENT,
  `promo_id` int NOT NULL,
  `prize_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promo_prize_ibfk_1` (`promo_id`),
  KEY `promo_prize_ibfk_2` (`prize_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `winner` int NOT NULL,
  `prize` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `winner` (`winner`),
  KEY `prize` (`prize`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `promo_participant`
--
ALTER TABLE `promo_participant`
  ADD CONSTRAINT `promo_participant_ibfk_1` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promo_participant_ibfk_2` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `promo_prize`
--
ALTER TABLE `promo_prize`
  ADD CONSTRAINT `promo_prize_ibfk_1` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promo_prize_ibfk_2` FOREIGN KEY (`prize_id`) REFERENCES `prize` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`winner`) REFERENCES `participant` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`prize`) REFERENCES `prize` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
