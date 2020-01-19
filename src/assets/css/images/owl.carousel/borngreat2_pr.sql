-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 10.123.0.61:3308
-- Generation Time: Jan 01, 2020 at 10:21 AM
-- Server version: 5.7.23
-- PHP Version: 7.0.33-0+deb9u6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `borngreat2_pr`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `admin_log_name` varchar(30) NOT NULL,
  `admin_pass` varchar(50) NOT NULL,
  `admin_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`id`, `admin_log_name`, `admin_pass`, `admin_name`) VALUES
(1, 'adcdef', 'admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin` int(11) NOT NULL,
  `msg` text NOT NULL,
  `sender_name` varchar(30) NOT NULL,
  `date_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `img_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`id`, `user_id`, `admin`, `msg`, `sender_name`, `date_timestamp`, `img_url`) VALUES
(1, 11, 1, 'gi', 'ccbv', '2019-09-13 19:26:35', ''),
(2, 11, 1, 'hey', 'admin', '2019-09-13 19:35:02', ''),
(3, 11, 1, 'fdg', 'ccbv', '2019-09-13 20:03:15', ''),
(4, 11, 1, 'fdgdfg', 'ccbv', '2019-09-13 20:03:16', ''),
(5, 11, 1, 'fghdf\'dfg\'dg\'', 'ccbv', '2019-09-13 20:03:18', ''),
(6, 13, 1, 'Hi', 'Ggg', '2019-10-20 13:19:29', ''),
(7, 13, 1, 'Gu', 'Ggg', '2019-10-20 13:21:29', ''),
(8, 15, 1, 'hi', 'hui', '2020-01-01 09:19:45', ''),
(9, 15, 1, 'hi', 'admin', '2020-01-01 10:07:58', ''),
(10, 15, 1, 'yes', 'hui', '2020-01-01 10:13:51', ''),
(11, 15, 1, 'lp', 'hui', '2020-01-01 10:17:06', '');

-- --------------------------------------------------------

--
-- Table structure for table `chat_session`
--

CREATE TABLE `chat_session` (
  `id` int(11) NOT NULL,
  `rep_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `status` int(11) NOT NULL,
  `img_path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_session`
--

INSERT INTO `chat_session` (`id`, `rep_id`, `user_id`, `status`, `img_path`) VALUES
(1, 1, 2, 0, ''),
(2, 0, 3, 0, ''),
(3, 0, 4, 0, ''),
(4, 0, 5, 0, ''),
(5, 0, 6, 0, ''),
(6, 0, 7, 0, ''),
(7, 0, 8, 0, ''),
(8, 0, 9, 0, ''),
(9, 0, 10, 0, ''),
(10, 1, 11, 0, ''),
(11, 0, 12, 0, ''),
(12, 0, 13, 0, ''),
(13, 0, 14, 0, ''),
(14, 1, 15, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `age` int(10) NOT NULL,
  `profile_pic` varchar(500) NOT NULL DEFAULT 'http://chatwithbiebernow.com/assets/img/user_profile.jpg',
  `gender` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `age`, `profile_pic`, `gender`) VALUES
(2, 'test1', 0, 'http://chatwithbiebernow.com/assets/img/user_profile.jpg', NULL),
(12, 'yallo', 0, '', 'girl'),
(13, 'Ggg', 0, '', 'girl'),
(14, 'Gbh', 0, '', ''),
(15, 'hui', 0, 'http://chatwithbiebernow.com/assets/img/user_profile.jpg', 'boy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_session`
--
ALTER TABLE `chat_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chat_session`
--
ALTER TABLE `chat_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
