-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 03:05 PM
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
-- Database: `rfidattendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(80) NOT NULL,
  `admin_pwd` longtext NOT NULL,
  `roleid` varchar(255) DEFAULT NULL COMMENT 'role_id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_name`, `admin_email`, `admin_pwd`, `roleid`) VALUES
(0, 'user', 'user@gmail.com', '$2y$10$89uX3LBy4mlU/DcBveQ1l.32nSianDP/E1MfUh.Z.6B4Z0ql3y7PK', '3'),
(1, 'Admin', 'admin@gmail.com', '$2y$10$89uX3LBy4mlU/DcBveQ1l.32nSianDP/E1MfUh.Z.6B4Z0ql3y7PK', '1');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `device_name` varchar(50) NOT NULL,
  `device_dep` varchar(20) NOT NULL,
  `device_uid` text NOT NULL,
  `device_date` date NOT NULL,
  `device_mode` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `device_name`, `device_dep`, `device_uid`, `device_date`, `device_mode`) VALUES
(1, 'ADMIN', 'BSCS', '424b8af2d53545cd', '2024-04-05', 1),
(4, 'BSBA', 'ACCOUNTING', 'f55cfe6c2f06d7bf', '2024-04-10', 1),
(5, 'BSN', 'NURSING', 'c93080ec3f675356', '2024-04-10', 1),
(7, 'BSEd', 'EDUCATION', 'f60194922bec63f8', '2024-04-10', 0),
(10, 'staffs', 'employees', 'dec1869332c2637e', '2024-04-19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `user_roles` (`id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'User');

-- Add `role_id` column to `users` table
ALTER TABLE `users`
  ADD COLUMN `role_id` int(11) NOT NULL DEFAULT 2 COMMENT 'user role' AFTER `add_card`;

-- Update existing users' role to 'User'
UPDATE `users` SET `role_id` = 2;
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT 'None',
  `serialnumber` double NOT NULL DEFAULT 0,
  `gender` varchar(10) NOT NULL DEFAULT 'None',
  `email` varchar(50) NOT NULL DEFAULT 'None',
  `card_uid` varchar(30) NOT NULL,
  `card_select` tinyint(1) NOT NULL DEFAULT 0,
  `user_date` date NOT NULL,
  `device_uid` varchar(20) NOT NULL DEFAULT '0',
  `device_dep` varchar(20) NOT NULL DEFAULT '0',
  `add_card` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `serialnumber`, `gender`, `email`, `card_uid`, `card_select`, `user_date`, `device_uid`, `device_dep`, `add_card`) VALUES
(6, 'Student 2', 2, 'Female', 'None', '19515122340', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(7, 'Student 3', 3, 'Male', 'None', '192179841', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(8, 'Student 4', 4, 'Male', 'None', '2432183941', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(9, 'Student 6', 6, 'Male', 'None', '1471177241', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(10, 'Student 7', 7, 'Male', 'None', '1631294741', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(11, 'Student 8', 8, 'Male', 'None', '22755541', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(12, 'Student 5', 5, 'Male', 'None', '17910521938', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(13, 'Student 9', 9, 'Male', 'None', '3524115240', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(14, 'Student 10', 10, 'Female', 'None', '2461891593', 0, '2024-04-11', '424b8af2d53545cd', 'BSCS', 1),
(15, 'Student 11', 11, 'Male', 'None', '13122617939', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(16, 'Student 12', 12, 'Female', 'None', '24315425239', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(17, 'Student 13', 13, 'Female', 'None', '13114916541', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(18, 'Student 14', 14, 'Female', 'None', '1952014741', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(19, 'Student 15', 15, 'Male', 'None', '32616441', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(20, 'Student 16', 16, 'Male', 'None', '179374541', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(21, 'Student 17', 17, 'Male', 'None', '1631583041', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(22, 'Student 18', 18, 'Male', 'None', '2111323440', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(23, 'Student 19', 19, 'Female', 'None', '515722740', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(24, 'Student 20', 20, 'Female', 'None', '243014840', 0, '2024-04-11', 'f55cfe6c2f06d7bf', 'ACCOUNTING', 1),
(25, 'Student 21', 21, 'Male', 'None', '21115425240', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(26, 'Student 22', 22, 'Female', 'None', '2432231041', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(27, 'Student 23', 23, 'Male', 'None', '512285441', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(28, 'Student 24', 24, 'Male', 'None', '21113317841', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(29, 'Student 25', 25, 'Female', 'None', '994710339', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(30, 'Student 26', 26, 'Male', 'None', '19512123540', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(31, 'Student 27', 27, 'Male', 'None', '1472098341', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(32, 'Student 28', 28, 'Male', 'None', '115896041', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(33, 'Student 29', 29, 'Female', 'None', '1312472240', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(34, 'Student 30', 30, 'Male', 'None', '5118319341', 0, '2024-04-11', 'c93080ec3f675356', 'NURSING', 1),
(35, 'student 1', 1, 'Male', 'None', '192267841', 1, '2024-04-16', '424b8af2d53545cd', 'BSCS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_logs`
--

CREATE TABLE `users_logs` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `serialnumber` double NOT NULL,
  `card_uid` varchar(30) NOT NULL,
  `device_uid` varchar(20) NOT NULL,
  `device_dep` varchar(20) NOT NULL,
  `checkindate` date NOT NULL,
  `timein` time NOT NULL,
  `timeout` time NOT NULL,
  `card_out` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_logs`
--

INSERT INTO `users_logs` (`id`, `username`, `serialnumber`, `card_uid`, `device_uid`, `device_dep`, `checkindate`, `timein`, `timeout`, `card_out`) VALUES
(1, 'try', 3, '202422454', '424b8af2d53545cd', 'BSCS', '2024-04-05', '16:14:20', '00:00:00', 0),
(2, 'gekyume', 2, '17720517429', '424b8af2d53545cd', 'BSCS', '2024-04-05', '16:14:31', '00:00:00', 0),
(3, 'jericho c', 1, '1081111126', '424b8af2d53545cd', 'BSCS', '2024-04-05', '16:14:36', '00:00:00', 0),
(4, 'gekyume', 2, '17720517429', '424b8af2d53545cd', 'BSCS', '2024-04-06', '04:24:41', '04:26:01', 1),
(5, 'jericho c', 1, '1081111126', '424b8af2d53545cd', 'BSCS', '2024-04-06', '04:24:57', '04:25:57', 1),
(6, 'try', 3, '202422454', '424b8af2d53545cd', 'BSCS', '2024-04-06', '04:29:06', '04:31:26', 1),
(7, 'try', 3, '202422454', '424b8af2d53545cd', 'BSCS', '2024-04-06', '04:31:47', '04:32:04', 1),
(8, 'try', 3, '202422454', '424b8af2d53545cd', 'BSCS', '2024-04-06', '04:32:14', '00:00:00', 0),
(9, 'try', 3, '202422454', '424b8af2d53545cd', 'BSCS', '2024-04-07', '07:27:06', '07:28:56', 1),
(10, 'jericho c', 1, '1081111126', '424b8af2d53545cd', 'BSCS', '2024-04-07', '07:27:23', '07:28:59', 1),
(11, 'gekyume', 2, '17720517429', '424b8af2d53545cd', 'BSCS', '2024-04-07', '07:27:28', '07:29:12', 1),
(12, 'try', 3, '202422454', '424b8af2d53545cd', 'BSCS', '2024-04-07', '07:29:15', '00:00:00', 0),
(13, 'try', 3, '202422454', '424b8af2d53545cd', 'BSCS', '2024-04-09', '05:34:25', '00:00:00', 0),
(14, 'gekyume', 2, '17720517429', '424b8af2d53545cd', 'BSCS', '2024-04-09', '05:35:16', '00:00:00', 0),
(15, 'jericho c', 1, '1081111126', '424b8af2d53545cd', 'BSCS', '2024-04-09', '05:35:23', '05:35:35', 1),
(16, 'Student 10', 10, '2461891593', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:55:45', '08:56:32', 1),
(17, 'Student 9', 9, '3524115240', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:55:48', '08:56:36', 1),
(18, 'Student 7', 7, '1631294741', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:55:49', '08:56:44', 1),
(19, 'Student 5', 5, '17910521938', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:55:50', '08:56:54', 1),
(20, 'Student 4', 4, '2432183941', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:55:52', '08:56:59', 1),
(21, 'Student 2', 2, '19515122340', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:55:53', '08:57:09', 1),
(22, 'Student 3', 3, '192179841', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:56:07', '08:57:04', 1),
(23, 'Student 1', 1, '192267841', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:56:10', '08:57:14', 1),
(24, 'Student 6', 6, '1471177241', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:56:20', '08:56:50', 1),
(25, 'Student 8', 8, '22755541', '424b8af2d53545cd', 'BSCS', '2024-04-12', '08:56:26', '08:56:40', 1),
(26, 'Student 21', 21, '21115425240', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:24:47', '09:25:47', 1),
(27, 'Student 22', 22, '2432231041', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:24:49', '09:25:50', 1),
(28, 'Student 24', 24, '21113317841', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:24:52', '09:26:20', 1),
(29, 'Student 25', 25, '994710339', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:24:54', '09:26:19', 1),
(30, 'Student 26', 26, '19512123540', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:25:00', '09:26:18', 1),
(31, 'Student 27', 27, '1472098341', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:25:02', '09:26:29', 1),
(32, 'Student 28', 28, '115896041', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:25:03', '09:26:16', 1),
(33, 'Student 30', 30, '5118319341', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:25:05', '09:26:14', 1),
(34, 'Student 29', 29, '1312472240', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:25:12', '09:26:15', 1),
(35, 'Student 23', 23, '512285441', 'c93080ec3f675356', 'NURSING', '2024-04-12', '09:25:40', '09:26:49', 1),
(36, 'student 1', 1, '192267841', '424b8af2d53545cd', 'BSCS', '2024-04-17', '04:28:36', '04:28:56', 1),
(37, 'Student 2', 2, '19515122340', '424b8af2d53545cd', 'BSCS', '2024-04-17', '04:28:39', '04:29:55', 1),
(38, 'Student 4', 4, '2432183941', '424b8af2d53545cd', 'BSCS', '2024-04-17', '04:28:41', '04:28:57', 1),
(39, 'Student 5', 5, '17910521938', '424b8af2d53545cd', 'BSCS', '2024-04-17', '04:28:43', '04:29:50', 1),
(40, 'student 1', 1, '192267841', '424b8af2d53545cd', 'BSCS', '2024-04-18', '10:32:44', '10:45:09', 1),
(41, 'student 1', 1, '192267841', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:39:30', '04:41:08', 1),
(42, 'Student 4', 4, '2432183941', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:39:32', '04:41:11', 1),
(43, 'Student 2', 2, '19515122340', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:40:34', '04:41:10', 1),
(44, 'Student 3', 3, '192179841', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:40:36', '04:41:52', 1),
(45, 'Student 6', 6, '1471177241', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:45:05', '04:46:28', 1),
(46, 'Student 7', 7, '1631294741', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:45:06', '04:46:56', 1),
(47, 'Student 9', 9, '3524115240', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:45:08', '00:00:00', 0),
(48, 'Student 10', 10, '2461891593', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:45:21', '04:45:23', 1),
(49, 'Student 5', 5, '17910521938', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:45:29', '00:00:00', 0),
(50, 'Student 8', 8, '22755541', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:45:38', '00:00:00', 0),
(51, 'Student 10', 10, '2461891593', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:46:58', '04:47:07', 1),
(52, 'Student 7', 7, '1631294741', '424b8af2d53545cd', 'BSCS', '2024-04-20', '04:47:00', '00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'role_id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
