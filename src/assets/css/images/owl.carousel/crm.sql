-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2019 at 05:48 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cdr_contact`
--

CREATE TABLE `cdr_contact` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `officephone` varchar(250) DEFAULT NULL,
  `website` varchar(250) DEFAULT NULL,
  `fax` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `billing_street` text DEFAULT NULL,
  `billing_city` varchar(250) DEFAULT NULL,
  `billing_state` varchar(250) DEFAULT NULL,
  `billing_postalcode` varchar(250) DEFAULT NULL,
  `billing_country` varchar(250) DEFAULT NULL,
  `shipping_street` text DEFAULT NULL,
  `shipping_city` varchar(250) DEFAULT NULL,
  `shipping_state` varchar(250) DEFAULT NULL,
  `shipping_postalcode` varchar(250) DEFAULT NULL,
  `shipping_country` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `officephone`, `website`, `fax`, `email`, `billing_street`, `billing_city`, `billing_state`, `billing_postalcode`, `billing_country`, `shipping_street`, `shipping_city`, `shipping_state`, `shipping_postalcode`, `shipping_country`, `description`, `assign_id`, `enterprise_id`, `created_at`, `updated_at`) VALUES
(1, 'Customer1', NULL, NULL, NULL, 'test@test.com', 'Tres', 'luck', 'uttar pradesh', '226016', 'hvb', 'Tres', 'luck', 'uttar pradesh', '226016', NULL, NULL, NULL, 1, NULL, NULL),
(3, 'gygy', NULL, NULL, NULL, 'fhg@hfhg.nomy', 'Tres', 'luck', 'uttar pradesh', '226016', 'hvb', 'Tres', NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `officephone` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `accountname` varchar(250) DEFAULT NULL,
  `website` varchar(250) DEFAULT NULL,
  `fax` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `primary_street` text DEFAULT NULL,
  `primary_city` varchar(250) DEFAULT NULL,
  `primary_state` varchar(250) DEFAULT NULL,
  `primary_postalcode` varchar(250) DEFAULT NULL,
  `primary_country` varchar(250) DEFAULT NULL,
  `other_street` text DEFAULT NULL,
  `other_city` varchar(250) DEFAULT NULL,
  `other_state` varchar(250) DEFAULT NULL,
  `other_postalcode` varchar(250) DEFAULT NULL,
  `other_country` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `source` varchar(250) DEFAULT NULL,
  `descr_status` varchar(250) DEFAULT NULL,
  `oportunity_amount` varchar(250) DEFAULT NULL,
  `reference_by` varchar(250) DEFAULT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `campaign` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `source_descr` text DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `first_name`, `last_name`, `officephone`, `mobile`, `accountname`, `website`, `fax`, `email`, `primary_street`, `primary_city`, `primary_state`, `primary_postalcode`, `primary_country`, `other_street`, `other_city`, `other_state`, `other_postalcode`, `other_country`, `status`, `source`, `descr_status`, `oportunity_amount`, `reference_by`, `assign_id`, `campaign`, `description`, `source_descr`, `enterprise_id`, `created_at`, `updated_at`) VALUES
(1, 'Mohd', 'Mobeen', NULL, NULL, NULL, NULL, NULL, 'mobeen.myth@gmail.com', '247/32 Vihan Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'dgfh', 'gfdg', '08739015922', NULL, NULL, NULL, NULL, NULL, 'gfnnn\ncgfb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Existing Customer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'John', 'Doe', NULL, NULL, NULL, NULL, NULL, NULL, 'PO Box 9999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Word of mouth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'rr', 'fgh', NULL, NULL, NULL, NULL, NULL, 'ert@dfgd.yj', '247/32 Vihan Group', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'gygy', 'hngn', NULL, NULL, NULL, NULL, NULL, 'admin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, NULL, NULL),
(6, 'gygy', 'hngn', '3004562153', '3004562153', NULL, NULL, NULL, 'mobeen.myt@gmail.com', 'Tres', 'luck', 'uttar pradesh', '226016', 'india', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, NULL, NULL),
(7, 'gygy', 'hngn', '3004562153', '3004562153', NULL, NULL, NULL, 'mobeen.my@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, NULL, NULL),
(8, 'gygy', 'hngn', '3004562153', '3004562153', NULL, NULL, NULL, 'mobeen.m@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, NULL, NULL),
(9, 'Frest', 'Last', NULL, NULL, NULL, NULL, NULL, 'james@metro2.pro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, NULL, NULL),
(10, 'Shef', 'Ramulen', NULL, NULL, NULL, NULL, NULL, 'singh.smyth@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `prioroty` varchar(250) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `related_to` int(11) DEFAULT NULL COMMENT 'related task id',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `enterprise_id`, `assign_id`, `subject`, `description`, `prioroty`, `contact_id`, `related_to`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'gygy', NULL, 'high', NULL, NULL, '2019-11-30', '2019-12-26', 'pending', NULL, NULL),
(3, 1, 5, 'Task1', NULL, 'high', NULL, NULL, '2019-11-30', '2019-12-26', 'pending', NULL, NULL),
(4, 1, 5, 'Task2', NULL, 'high', NULL, NULL, '2019-11-30', '2020-12-24', 'pending', NULL, NULL),
(5, 1, 5, 'Task3', NULL, 'high', NULL, NULL, '2019-11-30', '2020-12-31', 'progress', NULL, NULL),
(6, 1, 5, 'Task4', NULL, 'high', NULL, NULL, '2019-11-30', '2020-12-31', 'progress', NULL, NULL),
(7, 1, 5, 'Task5', NULL, 'high', NULL, NULL, '2019-11-30', '2020-12-31', 'progress', NULL, NULL),
(8, 1, 5, 'Task6', NULL, 'high', NULL, NULL, '2019-11-30', '2020-12-31', 'progress', NULL, NULL),
(9, 1, 4, 'Task7', 'Gyuij', 'high', NULL, 4, '2019-12-25', '2020-07-13', 'progress', NULL, NULL),
(10, 1, 3, 'gygy-09', 'frt', 'high', NULL, 6, '2019-12-27', '2020-01-04', 'completed', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cred_pass` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `added_by` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `cred_pass`, `remember_token`, `role`, `added_by`, `enterprise_id`, `api_token`, `created_at`, `updated_at`) VALUES
(2, 'Admin', NULL, NULL, 'admin@gmail.com', NULL, '$2y$10$WdBx31ddGvE8glUJ5rlw1OKrN95HxQxmhZ4eW0/y5BiKYQ6TxEPuO', NULL, NULL, NULL, NULL, 1, NULL, '2019-10-10 04:32:31', '2019-10-10 04:32:31'),
(3, 'test rtes', 'test', 'rtes', 'test@gmail.com', NULL, '$2y$10$7x6KgWUx4eJCQHnoTQYRb.k/0BveFaBNG1EbL457IrIc56rBPmKda', NULL, NULL, 'customer', 2, 1, NULL, NULL, NULL),
(4, ' Mobeen', NULL, 'Mobeen', 'mobeen.myth@gmail.com', NULL, '$2y$10$URs8/IKoeOGCqpdAHMaokuIWcFE2ORbIDShLdXEvMBQxqSt3aHsVO', NULL, NULL, 'user', 2, 1, NULL, NULL, NULL),
(5, 'gygy gygy', 'gygy', 'gygy', 'dfg@hgfh.com', NULL, '$2y$10$C/jc/DcvaBE7bYzP753HHuL8/ex.GCU02HqzmxS6PRiuCkiZh3de2', NULL, NULL, 'user', 2, 1, NULL, NULL, NULL),
(6, 'gygy gygy', 'gygy', 'gygy', 'dfg@hgfh.com1', NULL, '$2y$10$tONe0AxlFoDm/X.PBC0bBewh/UEapuLFO7oU4vLsCjBJmVs5EADUe', '123456', NULL, 'user', 2, 1, NULL, NULL, '2019-12-29 06:56:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cdr_contact`
--
ALTER TABLE `cdr_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cdr_contact`
--
ALTER TABLE `cdr_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
