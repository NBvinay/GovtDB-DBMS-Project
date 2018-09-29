-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2018 at 05:50 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `govtdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `employment details`
--

CREATE TABLE `employment details` (
  `Aadhar Number` bigint(20) NOT NULL,
  `Company Name` varchar(100) NOT NULL,
  `Salary` int(10) NOT NULL,
  `Date_of_joining` date NOT NULL,
  `Status` text NOT NULL,
  `Job` text NOT NULL,
  `Date of resignation/retirement` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal_info`
--

CREATE TABLE `personal_info` (
  `Aadhar Number` bigint(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Full Name` text NOT NULL,
  `Father's Name` text NOT NULL,
  `Mother's Name` text NOT NULL,
  `DOB` date NOT NULL,
  `Gender` char(1) NOT NULL,
  `Email-id` varchar(100) NOT NULL,
  `Present Address` varchar(100) NOT NULL,
  `Qualifications` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `property_details`
--

CREATE TABLE `property_details` (
  `Aadhar Number` bigint(20) NOT NULL,
  `No. of properties owned` int(10) NOT NULL,
  `Katha` text NOT NULL,
  `City` text NOT NULL,
  `Postal Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `Aadhar Number` bigint(20) NOT NULL,
  `Value` int(10) NOT NULL,
  `Property Tax` bigint(20) NOT NULL,
  `Salary` int(10) NOT NULL,
  `Income Tax` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details`
--

CREATE TABLE `vehicle_details` (
  `Aadhar Number` bigint(20) NOT NULL,
  `License No.` text NOT NULL,
  `No. of vehicles owned` int(10) NOT NULL,
  `Registration Number` text NOT NULL,
  `Vehicle Number` text NOT NULL,
  `Insurance Number` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employment details`
--
ALTER TABLE `employment details`
  ADD PRIMARY KEY (`Salary`),
  ADD KEY `Aadhar Number` (`Aadhar Number`);

--
-- Indexes for table `personal_info`
--
ALTER TABLE `personal_info`
  ADD PRIMARY KEY (`Aadhar Number`);

--
-- Indexes for table `property_details`
--
ALTER TABLE `property_details`
  ADD KEY `Aadhar Number` (`Aadhar Number`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD KEY `Aadhar Number` (`Aadhar Number`),
  ADD KEY `Salary` (`Salary`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD KEY `Aadhar Number` (`Aadhar Number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employment details`
--
ALTER TABLE `employment details`
  ADD CONSTRAINT `employment details_ibfk_1` FOREIGN KEY (`Aadhar Number`) REFERENCES `personal_info` (`Aadhar Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `property_details`
--
ALTER TABLE `property_details`
  ADD CONSTRAINT `property_details_ibfk_1` FOREIGN KEY (`Aadhar Number`) REFERENCES `personal_info` (`Aadhar Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax`
--
ALTER TABLE `tax`
  ADD CONSTRAINT `tax_ibfk_1` FOREIGN KEY (`Aadhar Number`) REFERENCES `personal_info` (`Aadhar Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tax_ibfk_2` FOREIGN KEY (`Salary`) REFERENCES `employment details` (`Salary`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD CONSTRAINT `vehicle_details_ibfk_1` FOREIGN KEY (`Aadhar Number`) REFERENCES `personal_info` (`Aadhar Number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
