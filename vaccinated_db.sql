-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2021 at 11:14 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaccinated_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `individual_list`
--

CREATE TABLE `individual_list` (
  `id` int(30) NOT NULL,
  `tracking_code` varchar(50) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text NOT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=Partially Vaccinated, 2= Fully Vaccinated',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `individual_list`
--

INSERT INTO `individual_list` (`id`, `tracking_code`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `contact`, `address`, `status`, `date_created`, `date_updated`) VALUES
(1, '133632365921974', 'Samantha Jane', 'D', 'Lou', 'Female', '1997-06-23', '09123456789', 'Sample Address only, here city', 2, '2021-10-18 16:00:22', '2021-10-18 17:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Centralize Vaccination Tracker System - PHP'),
(6, 'short_name', 'CVTS - PHP'),
(11, 'logo', 'uploads/logo-1634524879.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1634524906.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `location_id` int(30) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `location_id`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, NULL, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(3, 'John', 'Smith', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'uploads/avatar-3.png?v=1634528899', NULL, 2, 2, '2021-10-18 11:38:39', '2021-10-18 11:48:19'),
(4, 'Clairry', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-4.png?v=1634529434', NULL, 2, 1, '2021-10-18 11:57:14', '2021-10-18 17:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `vaccination_location_list`
--

CREATE TABLE `vaccination_location_list` (
  `id` int(30) NOT NULL,
  `location` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccination_location_list`
--

INSERT INTO `vaccination_location_list` (`id`, `location`, `status`, `date_created`) VALUES
(1, 'Vaccine Area 101, Bacolod Cit, Neg. Occ.', 1, '2021-10-18 11:16:32'),
(2, 'Vaccine Area 102, Bacolod City, Negros Occidental', 1, '2021-10-18 11:20:21'),
(3, 'Vaccine Area 103, Talisay City, Negross Occidental', 1, '2021-10-18 11:20:42'),
(4, 'Vaccine Area 104, Silay City, Negros Occidental', 1, '2021-10-18 11:21:06');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_history_list`
--

CREATE TABLE `vaccine_history_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `individual_id` int(30) NOT NULL,
  `vaccine_id` int(30) NOT NULL,
  `location_id` int(30) NOT NULL,
  `vaccination_type` varchar(50) NOT NULL,
  `vaccinated_by` text NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine_history_list`
--

INSERT INTO `vaccine_history_list` (`id`, `user_id`, `individual_id`, `vaccine_id`, `location_id`, `vaccination_type`, `vaccinated_by`, `remarks`, `date_created`, `date_updated`) VALUES
(1, 1, 1, 1, 4, '1st Dose', 'Dr. Juan Batumbakal', 'Sample Only', '2021-10-18 16:00:22', '2021-10-18 16:07:49'),
(8, 1, 1, 5, 1, '2nd Dose', 'Sample Only', 'Final Dose', '2021-10-18 17:01:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_list`
--

CREATE TABLE `vaccine_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine_list`
--

INSERT INTO `vaccine_list` (`id`, `name`, `status`, `date_created`) VALUES
(1, 'Pfizer-BioNTech', 1, '2021-10-18 11:05:20'),
(2, 'Moderna', 1, '2021-10-18 11:05:24'),
(3, 'Johnson & Johnson’s Janssen', 1, '2021-10-18 11:05:30'),
(4, 'AstraZeneca', 1, '2021-10-18 11:07:42'),
(5, 'Sinovac', 1, '2021-10-18 11:08:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `individual_list`
--
ALTER TABLE `individual_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `vaccination_location_list`
--
ALTER TABLE `vaccination_location_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vaccine_id` (`vaccine_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `individual_id` (`individual_id`);

--
-- Indexes for table `vaccine_list`
--
ALTER TABLE `vaccine_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `individual_list`
--
ALTER TABLE `individual_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vaccination_location_list`
--
ALTER TABLE `vaccination_location_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `vaccine_list`
--
ALTER TABLE `vaccine_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vaccine_history_list`
--
ALTER TABLE `vaccine_history_list`
  ADD CONSTRAINT `vaccine_history_list_ibfk_1` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vaccine_history_list_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `vaccination_location_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vaccine_history_list_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vaccine_history_list_ibfk_7` FOREIGN KEY (`individual_id`) REFERENCES `individual_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
