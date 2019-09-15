-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 12, 2019 at 07:57 AM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `jobskee`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` tinyint(4) NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'almuhayshi@tetco.sa', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `base_url` text,
  `secrete` text,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `name`, `base_url`, `secrete`, `createdOn`) VALUES
(1, 'ASAS API', 'http://192.168.100.4:8999/api/', '1CA756A2D8B571BBBF97BBB936175', '2019-09-09 11:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cover_letter` text COLLATE utf8_unicode_ci,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `websites` text COLLATE utf8_unicode_ci,
  `attachment` text COLLATE utf8_unicode_ci,
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `bid` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `job_id`, `user_id`, `cover_letter`, `full_name`, `email`, `location`, `websites`, `attachment`, `token`, `created`, `bid`) VALUES
(1, 12, 1, 'I am ', 'Ahmed Almuhayshi', 'freelancer@tetco.sa', '', 'http://localhost:8888/jobskee/apply/13', '', '0756bc9748a65760eebec84db8efeea4', '2019-09-11 18:00:30', 212),
(2, 2, NULL, 'test', 'ahmed almuhayshi', 'email', NULL, NULL, NULL, '', '0000-00-00 00:00:00', NULL),
(3, 13, NULL, 'fsdsdf', 'ahmed', 'a@tetco.sa', '', 'ahmed', '', 'ed54e364487d6ce1436407ffed4750da', '2019-09-03 05:00:20', 223);

-- --------------------------------------------------------

--
-- Table structure for table `banlist`
--

CREATE TABLE `banlist` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `name`, `url`, `content`) VALUES
(1, 'AddThis', 'addthis', '<script type=\"text/javascript\" src=\"//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-541e6f810d78ec0c\"></script>\n<div class=\"addthis_sharing_toolbox\"></div>');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `Code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `ArabicName` text COLLATE utf8_unicode_ci,
  `description` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `Code`, `name`, `ArabicName`, `description`, `url`, `sort`) VALUES
(1, 'A000', 'Islamic Studies', 'تخصصات الدراسات الإسلامية والشرعية', NULL, 'IslamicStudies', 1),
(2, 'B000', 'Human Studies', 'تخصصات الآداب والعلوم الاجتماعية والإنسانية', NULL, 'HumanStudies', 2),
(3, 'C000', 'Business', 'تخصصات مجموعة الاقتصاد والإدارة', NULL, 'Business', 3),
(4, 'D000', 'Teaching', 'تخصصات مجموعة  التربية والتعليم', NULL, 'Teaching', 4),
(5, 'E000', 'Art', ' تخصصات الفنون والاقتصاد المنزلي', NULL, 'Art', 5),
(6, 'F000', 'Natural Science', 'تخصصات مجموعة العلوم الطبيعية', NULL, 'NaturalScience', 6),
(7, 'G000', 'Engineering', 'تخصصات العلوم الهندسية', NULL, 'Engineering', 7),
(8, 'H000', 'Human Medical', 'تخصصات الطب البشرى', NULL, 'HumanMedical', 8),
(9, 'I000', 'Dental Medical', ' تخصصات طب الأسنان', NULL, 'DentalMedical', 9),
(10, 'J000', 'Pharmacy', 'تخصصات العلوم الصيدلية ', NULL, 'Pharmacy', 10),
(11, 'K000', 'Natural Medical', 'تخصصات العلوم الطبية التطبيقية ', NULL, 'NaturalMedical', 11),
(12, 'L000', 'Political Studies', 'تخصصات القانون والعلوم السياسية', NULL, 'PoliticalStudies', 12),
(13, 'M000', 'Plants Studies', 'تخصصات العلوم الزراعية والغذائية والبيئية', NULL, 'Plants Studies', 13),
(14, 'N000', 'Computer Technology', 'تخصصات الحاسب و تقنية المعلومات', NULL, 'ComputerTechnology', 14),
(15, 'O000', 'Technical Studies', 'تخصصات الكليات التقنية والصناعية', NULL, 'TechnicalStudies', 15),
(16, 'P000', 'Others ', 'تخصصات أخرى', NULL, 'Others ', 16),
(17, 'AB00', 'Dean', 'الحديث', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `description`, `url`, `sort`) VALUES
(1, 'Anywhere', 'Find the best jobs here!', 'anywhere', 1),
(2, 'Manila', 'Find the best Manila jobs here!', 'manila', 2),
(3, 'Madrid', 'Find the best Madrid jobs here!', 'madrid', 3),
(4, 'Frankfurt', 'Find the best Frankfurt jobs here!', 'frankfurt', 4),
(5, 'Beijing', 'Find the best Beijing jobs here!', 'beijing', 5),
(6, 'New York', 'Find the best New York jobs here!', 'new-york', 6);

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` text COLLATE utf8_unicode_ci,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` tinyint(4) DEFAULT NULL,
  `city` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `perks` text COLLATE utf8_unicode_ci,
  `how_to_apply` text COLLATE utf8_unicode_ci,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8_unicode_ci,
  `url` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL,
  `token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `bid` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `user_id`, `title`, `category`, `city`, `description`, `perks`, `how_to_apply`, `company_name`, `logo`, `url`, `email`, `is_featured`, `token`, `status`, `created`, `bid`) VALUES
(1, 2, 'Test', 1, 2, 'Make a sample website', 'tt', '', 'Tet', '', '', 'almuhayshi@tetco.sa', 0, '8311dfd67bc2bad6a4a06bcb157599fb', 1, '2019-08-20 23:59:24', 200),
(2, 3, 'testing', 4, 1, 'testing another job', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 30),
(10, NULL, 'PHP Freelancing', 1, 1, 'This is a php project to build a simple website', '', '', 'Tetco', '', 'http://localhost:8888/jobskee/user/jobs/new', 'ahmed@tetco.sa', 0, '79188cb1336534ee7fee95d1a2d1327b', 1, '2019-09-03 03:52:10', 200),
(11, NULL, 'sdfdsfds', 1, 1, 'dsfdsfsd', '', '', 'dsfdsfs', '', 'http://localhost:8888/jobskee/user/jobs/new', 'ahmed@tetco.sa', 0, '6040d245a929f28500fd37037ddf0f7b', 1, '2019-09-03 03:54:24', 33),
(12, 3, 'PHP Master Test', 1, 1, 'dsfafafd', '', '', 'com', '', 'http://localhost:8888/jobskee/user/jobs/new', 'a@tetco.sa', 0, '34423acce833a8dd24a5c88b8741221d', 1, '2019-09-03 04:01:21', 222),
(13, NULL, 'dfdasfa', 1, 1, 'sdfadsfsad', '', '', 'asdf', '', 'http://localhost:8888/jobskee/user/jobs/new', 'ahmed@tetco.sa', 0, '8a84d8f26d71ba87c466d8d111c3fd11', 1, '2019-09-03 04:22:54', 33),
(14, NULL, 'testing 3', 9, 2, 'wefdsfsf', '', '', 'com', '', 'http://localhost:8888/jobskee/user/jobs/new', 'al@tetco.sa', 0, 'c74ca416d3c75a06ba027bf70775ebd5', 1, '2019-09-11 17:24:04', 233),
(15, NULL, 'testing 3', 9, 2, 'wefdsfsf', '', '', 'com', '', 'http://localhost:8888/jobskee/user/jobs/new', 'al@tetco.sa', 0, 'c74ca416d3c75a06ba027bf70775ebd5', 1, '2019-09-11 17:24:04', 233),
(16, NULL, 'ewrwe', 1, 3, 'were', '', '', 'comp', '', 'http://localhost:8888/jobskee/user/jobs/new', 'aa@tetco.sa', 0, '1bfaf3796de14b7ed0c738ecbfa2d5aa', 1, '2019-09-11 17:41:24', 200);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `description`, `url`, `content`) VALUES
(1, 'About', 'About', 'about', 'about'),
(2, 'Contact', 'Contact us', 'contact', 'contact us'),
(3, 'Terms', 'Terms', 'terms', 'terms'),
(13, 'Conditions', 'Conditions', 'conditions', 'conditions'),
(14, 'profile', 'user profile page ', 'profile', 'profile');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `city_id` tinyint(4) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_sent` datetime DEFAULT NULL,
  `is_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `secondname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `group_id`, `username`, `password`, `firstname`, `secondname`, `lastname`, `email`, `mobile`, `image`, `status`, `created`) VALUES
(1, 1, 'freelancer', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Ahmed', 'Hassan', 'Almuhayshi', 'freelancer@tetco.sa', NULL, '', 1, '2019-08-01 00:00:00'),
(3, 2, 'job', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Requester ', NULL, 'a', 'jobrequster@tetco.sa', NULL, '', 1, '2019-08-26 00:00:00'),
(24, 1, 's', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'احمد', 'حسن', 'المحيشي', 'almuhayshi@gmail.sa', '0563097595', '', 1, '2019-09-12 04:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE `user_category` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_category`
--

INSERT INTO `user_category` (`id`, `user_id`, `category_id`) VALUES
(1, 1, 1),
(6, 24, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `name`, `description`, `permission`) VALUES
(1, 'FreeLancer', 'This group give the user the ability to apply for a freelancing job ', '{\"pages\": [\"applications\",\"jobs\",\"search\",\"subscriptions\",\"user\"],\"editor\": false,\"jobPoster\": false,\"jobApplicant\":true }'),
(2, 'Employer', 'This group gives the user the ability to pos jobs and hire freelancers ', '{\n  \"pages\": [\n    \"applications\",\"jobs\",\"search\",\"subscriptions\",\"user\"\n  ],\n  \"editor\": false,\n  \"jobPoster\": true,\n  \"jobApplicant\":false\n}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user_category`
--
ALTER TABLE `user_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `banlist`
--
ALTER TABLE `banlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user_category`
--
ALTER TABLE `user_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;