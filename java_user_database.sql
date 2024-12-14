-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2024 at 03:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_user_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(100) NOT NULL,
  `Hospital` varchar(100) NOT NULL,
  `Doctor` varchar(100) NOT NULL,
  `Month` varchar(10) NOT NULL,
  `Day` int(10) NOT NULL,
  `Year` int(10) NOT NULL,
  `Time` varchar(10) NOT NULL,
  `Purpose` varchar(100) NOT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `Hospital`, `Doctor`, `Month`, `Day`, `Year`, `Time`, `Purpose`, `Name`) VALUES
(29, 'Misamis Oriental Provincial Hospital-Claveria', 'Doc Analyn Santos', 'January ', 1, 2024, '8:00 AM', 'Check-up', 'julfelyn'),
(30, 'Misamis Oriental Provincial Hospital-Claveria', 'Doc Analyn Santos', 'January ', 1, 2024, '8:00 AM', 'Check-up', 'mary rose'),
(31, 'Maria Reyna- Xavier Hospital', 'Doc Coleen Trinidad', 'January ', 1, 2025, '10:00 AM', 'Check-up', 'Hazel'),
(32, 'Misamis Oriental Provincial Hospital-Claveria', 'Doc Analyn Santos', 'January ', 1, 2025, '10:00 AM', 'Check-up', 'User'),
(33, 'Misamis Oriental Provincial Hospital-Claveria', 'Doc Analyn Santos', 'April', 2, 2025, '1:00 PM', 'Check-up', 'Maryan');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `Email` varchar(127) NOT NULL,
  `password` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `Email`, `password`) VALUES
(1, 'analyn.santos@gmail.com', 'weee'),
(2, 'zoe.yap@gmail.com', 'zoe456'),
(3, 'Coleen@gmail.com', 'coco');

-- --------------------------------------------------------

--
-- Table structure for table `doc_hospital`
--

CREATE TABLE `doc_hospital` (
  `id` int(10) NOT NULL,
  `Hospital` varchar(200) NOT NULL,
  `Doctor_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doc_hospital`
--

INSERT INTO `doc_hospital` (`id`, `Hospital`, `Doctor_Name`) VALUES
(6, 'Northern Mindanao Medical Center', 'Doc Zoe Yap'),
(7, 'Maria Reyna- Xavier Hospital', 'Doc Coleen Trinidad'),
(8, 'Misamis Oriental Provincial Hospital-Claveria', 'Doc Analyn Santos');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `appointment_id` int(100) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `notification_status` enum('Pending','Sent','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `records_data`
--

CREATE TABLE `records_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Name` varchar(127) NOT NULL,
  `Address` varchar(127) NOT NULL,
  `PhoneNumber` varchar(127) NOT NULL,
  `Age` varchar(127) NOT NULL,
  `BloodType` varchar(127) NOT NULL,
  `Height` varchar(127) NOT NULL,
  `Weight` varchar(127) NOT NULL,
  `Profile_Pic` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `records_data`
--

INSERT INTO `records_data` (`id`, `user_id`, `Name`, `Address`, `PhoneNumber`, `Age`, `BloodType`, `Height`, `Weight`, `Profile_Pic`) VALUES
(25, 18, 'Julfelyn', 'claveria', '111', '20', 'O', '5', '37', NULL),
(26, 20, 'mary rose', 'claveria', '091111', '19', 'A', '5', '45', NULL),
(27, 21, 'Hazel Precillas', 'Claveria', '09338448', '19', 'O', '162', '50', NULL),
(28, 22, 'Franny', 'Claveria', '0935455572', '19', 'O', '154', '50', NULL),
(29, 23, 'Marianne Clet', 'Claveria', '09354444444', '20', 'AB+', '152', '56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Email` varchar(127) NOT NULL,
  `password` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Email`, `password`) VALUES
(18, 'julfelyn', 'lamo'),
(19, 'julfelyn', '123'),
(20, 'mary rose', '456'),
(21, 'Hazel', 'engak'),
(22, 'User', '1234'),
(23, 'Maryan', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doc_hospital`
--
ALTER TABLE `doc_hospital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `records_data`
--
ALTER TABLE `records_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doc_hospital`
--
ALTER TABLE `doc_hospital`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `appointment_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `records_data`
--
ALTER TABLE `records_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `records_data`
--
ALTER TABLE `records_data`
  ADD CONSTRAINT `records_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
