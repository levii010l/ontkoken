-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2026 at 11:42 AM
-- Server version: 10.6.23-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ontkoken`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredienten`
--

CREATE TABLE `ingredienten` (
  `ingredient_id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `eenheid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producten`
--

CREATE TABLE `producten` (
  `product_id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `inhoud` decimal(10,0) NOT NULL,
  `eenheid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_prijzen`
--

CREATE TABLE `product_prijzen` (
  `prijs_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `winkel_id` int(11) NOT NULL,
  `prijs` decimal(10,0) NOT NULL,
  `actie_prijs` decimal(10,0) NOT NULL,
  `actie_van` datetime NOT NULL,
  `actie_tot` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recepten`
--

CREATE TABLE `recepten` (
  `recept_id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `beschrijving` text NOT NULL,
  `bereiding` text NOT NULL,
  `bereidingstijd` int(11) NOT NULL,
  `porties` int(11) NOT NULL,
  `afbeelding_url` varchar(255) NOT NULL,
  `aangemaakt_op` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recept_ingredienten`
--

CREATE TABLE `recept_ingredienten` (
  `recept_ingredient_id` int(11) NOT NULL,
  `recept_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `hoeveelheid` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `winkels`
--

CREATE TABLE `winkels` (
  `winkel_id` int(11) NOT NULL,
  `naam` varchar(255) NOT NULL,
  `website_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredienten`
--
ALTER TABLE `ingredienten`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `producten`
--
ALTER TABLE `producten`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_prijzen`
--
ALTER TABLE `product_prijzen`
  ADD PRIMARY KEY (`prijs_id`);

--
-- Indexes for table `recepten`
--
ALTER TABLE `recepten`
  ADD PRIMARY KEY (`recept_id`);

--
-- Indexes for table `recept_ingredienten`
--
ALTER TABLE `recept_ingredienten`
  ADD PRIMARY KEY (`recept_ingredient_id`);

--
-- Indexes for table `winkels`
--
ALTER TABLE `winkels`
  ADD PRIMARY KEY (`winkel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredienten`
--
ALTER TABLE `ingredienten`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producten`
--
ALTER TABLE `producten`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_prijzen`
--
ALTER TABLE `product_prijzen`
  MODIFY `prijs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recepten`
--
ALTER TABLE `recepten`
  MODIFY `recept_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recept_ingredienten`
--
ALTER TABLE `recept_ingredienten`
  MODIFY `recept_ingredient_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `winkels`
--
ALTER TABLE `winkels`
  MODIFY `winkel_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
