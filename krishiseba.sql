-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2020 at 07:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `krishiseba`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `address`, `email`, `phone`, `designation`, `status`, `updated_at`) VALUES
(1, 'Srabon', 'Dhaka', 'srabon@gmail.com', '01753265885', 'President', 'Active', '2020-03-30 15:11:45'),
(3, 'Shotez', 'Narail', 'shotaz@gmail.com', '0123654788', 'VC', 'Active', '2020-03-30 16:56:56'),
(4, 'Srabon', 'Narail', 'srabon@gmail.com', '01753265885', 'President', 'Active', '2020-04-01 04:31:13'),
(5, 'Bappi', 'Mymensingh', 'bappi@gamil.com', '01256562352', 'VC', 'Active', '2020-04-01 04:53:40'),
(6, 'dr. srabon', 'Mymensingh', 'srabon@gmail.com', '01753265885', 'mbbs fcps', 'Active', '2020-04-07 12:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `total_land` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `farmers`
--

INSERT INTO `farmers` (`id`, `name`, `address`, `phone`, `total_land`, `updated_at`) VALUES
(1, 'Kaiyum', 'Mymensingh', '01753265885', '20', '2020-03-30 19:13:08'),
(2, 'Bappi', 'Narail', '01753265885', '500', '2020-03-30 19:39:54'),
(6, 'Srabon', 'Mymensingh', '01256562352', '40', '2020-04-06 06:19:37'),
(8, 'Bappi', 'Mymensingh', '01753265885', '50', '2020-04-07 08:42:01'),
(9, 'Shotez', 'Narail', '0123654788', '20', '2020-04-07 08:44:38');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `crops` int(20) DEFAULT NULL,
  `cattles` int(20) DEFAULT NULL,
  `fishari` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`id`, `farmer_id`, `crops`, `cattles`, `fishari`) VALUES
(1, 1, 20, 10, 2),
(5, 6, 10, 15, 5),
(7, 2, 5, 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_type` enum('Admin','Manager','Staff','') NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `user_type`, `status`, `updated_at`) VALUES
(12, 'Fahmida Robaet', 'fahmida@gmail.com', '202cb962ac59075b964b07152d234b70', '01987654321', 'Manager', 'Inactive', NULL),
(15, 'Borsha', 'Borsha@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '01236549874', 'Admin', 'Active', NULL),
(16, 'Srabon', 'srabon@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '01753265885', 'Admin', 'Active', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
