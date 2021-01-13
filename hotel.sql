-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Gen 13, 2021 alle 14:38
-- Versione del server: 5.7.24
-- Versione PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `guests`
--

CREATE TABLE `guests` (
  `gs_id` int(11) NOT NULL,
  `gs_name` varchar(50) NOT NULL,
  `gs_surname` varchar(50) NOT NULL,
  `gs_age` tinyint(4) NOT NULL,
  `gs_res_room` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `res2gs`
--

CREATE TABLE `res2gs` (
  `fk_res_id` int(11) NOT NULL,
  `fk_guest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `reservations`
--

CREATE TABLE `reservations` (
  `res_id` int(11) NOT NULL,
  `res_begin` datetime NOT NULL,
  `res_end` datetime NOT NULL,
  `res_n_guest` tinyint(4) NOT NULL,
  `res_n_room` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `rooms`
--

CREATE TABLE `rooms` (
  `n_room` tinyint(4) NOT NULL,
  `rm_n_bed` tinyint(4) NOT NULL,
  `rm_n_wc` tinyint(4) NOT NULL,
  `rm_wifi` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`gs_id`);

--
-- Indici per le tabelle `res2gs`
--
ALTER TABLE `res2gs`
  ADD KEY `fk_res_id` (`fk_res_id`),
  ADD KEY `fk_gs_id` (`fk_guest_id`);

--
-- Indici per le tabelle `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `fk_n_room` (`res_n_room`);

--
-- Indici per le tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`n_room`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `guests`
--
ALTER TABLE `guests`
  MODIFY `gs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `reservations`
--
ALTER TABLE `reservations`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `res2gs`
--
ALTER TABLE `res2gs`
  ADD CONSTRAINT `fk_gs_id` FOREIGN KEY (`fk_guest_id`) REFERENCES `guests` (`gs_id`),
  ADD CONSTRAINT `fk_res_id` FOREIGN KEY (`fk_res_id`) REFERENCES `reservations` (`res_id`);

--
-- Limiti per la tabella `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_n_room` FOREIGN KEY (`res_n_room`) REFERENCES `rooms` (`n_room`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
