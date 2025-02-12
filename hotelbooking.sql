-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2025 at 06:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `email`, `phone`) VALUES
('admin', 'admin', 'admin@gmail.com', '8240171538');

-- --------------------------------------------------------

--
-- Table structure for table `booking_data`
--

CREATE TABLE `booking_data` (
  `booking_id` int(11) NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `guest_phone` varchar(15) NOT NULL,
  `guest_email` varchar(100) NOT NULL,
  `checkIn` varchar(20) NOT NULL,
  `checkOut` varchar(20) NOT NULL,
  `room_type` varchar(20) NOT NULL,
  `num_rooms` int(11) NOT NULL CHECK (`num_rooms` > 0),
  `base_price` decimal(10,2) NOT NULL,
  `gst_amount` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `booking_time` datetime DEFAULT current_timestamp(),
  `status` enum('Upcoming','Active','Completed','Cancelled') DEFAULT 'Upcoming'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_data`
--

INSERT INTO `booking_data` (`booking_id`, `guest_name`, `guest_phone`, `guest_email`, `checkIn`, `checkOut`, `room_type`, `num_rooms`, `base_price`, `gst_amount`, `total_price`, `booking_time`, `status`) VALUES
(3, 'yurhighness', '2345678913', 'yurhighness19@gmail.com', '13-Feb-2025', '15-Feb-2025', 'Ac', 2, 3000.00, 540.00, 3540.00, '2025-02-12 18:00:58', 'Upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `total_Ac_rooms` int(11) NOT NULL,
  `total_NonAc_rooms` int(11) NOT NULL,
  `available_rooms` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`total_Ac_rooms`, `total_NonAc_rooms`, `available_rooms`) VALUES
(50, 60, 110);

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `registration_date` date NOT NULL DEFAULT curdate(),
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`username`, `password`, `email`, `phone`, `registration_date`, `last_login`) VALUES
('souvick ghosh', '12345', 'souvickghosh@gmail.com', '8723813547', '0000-00-00', NULL),
('yur highness', '123456', 'yurhighness19@gmail.com', '082401 71538', '2025-02-12', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `booking_data`
--
ALTER TABLE `booking_data`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_data`
--
ALTER TABLE `booking_data`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
