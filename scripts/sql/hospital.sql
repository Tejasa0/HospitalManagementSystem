-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 10:12 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `patient_name` varchar(30) NOT NULL,
  `doctor_name` varchar(30) NOT NULL,
  `appointment_date` date NOT NULL,
  `prescription` varchar(100) NOT NULL,
  `confirmed` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `patient_name`, `doctor_name`, `appointment_date`, `prescription`, `confirmed`) VALUES
(3, 'Tejas', 'Nitin', '2024-04-30', 'prescribed', 'confirmed'),
(4, 'Teja', 'Nitin', '2024-05-02', 'Yes', 'confirmed'),
(5, 'Tejas', 'Nitin', '2024-04-30', 'prescribed', 'confirmed'),
(7, 'Tejas', 'Nitin', '2024-04-19', 'Yes', 'Not yet confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `patient_name` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `invoiceid` int(11) NOT NULL,
  `appointmentid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(11) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `appointmentID` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `doctor_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `patient_name`, `appointmentID`, `description`, `doctor_name`) VALUES
(1, 'Tejas', 2, 'snxjhsdxjhdc', 'nitin'),
(2, 'Tejas', 3, 'hjbhbhv', 'nitin'),
(3, 'Tejas', 5, '\r\n\r\nAntibiotic:\r\n\r\nCiprofloxacin 500mg orally twice daily for 10-14 days\r\nOR\r\nCeftriaxone 1g intravenously once daily for 10-14 days\r\nOR\r\nAzithromycin 500mg orally once daily for 10-14 days\r\nFever and Pain Management:\r\n\r\nAcetaminophen (Tylenol) 500mg orally every 4-6 hours as needed for fever and discomfort\r\nOR\r\nIbuprofen (Advil, Motrin) 400mg orally every 6-8 hours as needed for fever and discomfort (avoid if there are stomach issues)\r\nHydration:\r\n\r\nEncourage adequate fluid intake, including water, oral rehydration solutions, and clear soups.', 'nitin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
