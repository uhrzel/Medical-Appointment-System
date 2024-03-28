-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2024 at 03:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@admin.com', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appoid` int(11) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  `status` text NOT NULL DEFAULT 'pending'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`, `status`) VALUES
(7, 1, 1, 1, '2023-05-28', 'approved'),
(8, 11, 1, 9, '2023-05-29', 'approved'),
(11, 6, 1, 25, '2023-06-03', 'approved'),
(13, 6, 1, 26, '2024-03-28', 'pending'),
(14, 6, 1, 27, '2024-03-28', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docid` int(11) NOT NULL,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docid`, `docemail`, `docname`, `docpassword`, `docnic`, `doctel`, `specialties`) VALUES
(14, 'Arzeljrz17@gmail.com', 'kap nino', 'doctor', '133', '090909678324', 2);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_logs`
--

CREATE TABLE `doctor_logs` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `logs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_logs`
--

INSERT INTO `doctor_logs` (`id`, `email`, `date`, `logs`) VALUES
(2, 'doctor@gmail.com', '2023-05-28 15:53:06', 'login'),
(3, 'doctor@gmail.com', '2023-05-28 15:53:25', 'logged out'),
(4, 'doctor@gmail.com', '2023-05-28 21:16:56', 'login'),
(5, 'doctor@gmail.com', '2023-05-28 23:34:04', 'logged out'),
(6, 'arzeljrz17@gmail.com', '2023-05-30 00:00:38', 'login'),
(7, 'arzeljrz17@gmail.com', '2023-05-30 00:00:47', 'logged out'),
(8, 'arzeljrz17@gmail.com', '2023-05-30 11:35:07', 'login'),
(9, 'arzeljrz17@gmail.com', '2023-05-30 11:36:18', 'login'),
(10, 'arzeljrz17@gmail.com', '2023-05-30 11:38:24', 'login'),
(11, 'arzeljrz17@gmail.com', '2023-05-30 11:38:35', 'logged out'),
(12, 'arzeljrz@gmail.com', '2023-05-30 11:47:11', 'login'),
(13, 'arzeljrz@gmail.com', '2023-05-30 11:47:22', 'logged out'),
(14, 'arzeljrz17@gmail.com', '2023-06-02 02:16:11', 'login'),
(15, 'arzeljrz17@gmail.com', '2023-06-02 02:16:36', 'logged out'),
(16, 'arzeljrz17@gmail.com', '2023-06-02 05:30:38', 'login'),
(17, 'arzeljrz17@gmail.com', '2023-06-02 05:30:51', 'logged out'),
(18, 'Arzeljrz17@gmail.com', '2023-06-02 05:42:17', 'login'),
(19, 'arzeljrz17@gmail.com', '2023-06-02 05:42:44', 'login'),
(20, 'arzeljrz17@gmail.com', '2023-06-02 05:45:27', 'logged out'),
(21, 'arzeljrz17@gmail.com', '2023-06-02 05:45:35', 'logged out'),
(22, 'arzeljrz17@gmail.com', '2023-06-02 05:46:59', 'logged out'),
(23, 'arzeljrz17@gmail.com', '2023-06-02 05:46:59', 'logged out'),
(24, 'arzeljrz17@gmail.com', '2023-06-02 05:46:59', 'logged out'),
(25, 'arzeljrz17@gmail.com', '2023-06-02 05:48:48', 'logged out'),
(26, 'arzeljrz17@gmail.com', '2023-06-02 05:49:15', 'logged out'),
(27, 'arzeljrz17@gmail.com', '2023-06-02 09:17:58', 'login'),
(28, 'arzeljrz17@gmail.com', '2023-06-02 09:18:42', 'logged out'),
(29, 'arzeljrz17@gmail.com', '2023-06-02 09:18:42', 'logged out'),
(30, 'arzeljrz17@gmail.com', '2023-06-03 09:46:17', 'login'),
(31, 'arzeljrz17@gmail.com', '2023-06-03 09:46:58', 'logged out'),
(32, 'arzeljrz17@gmail.com', '2023-06-03 09:49:22', 'login'),
(33, 'arzeljrz17@gmail.com', '2023-06-03 09:49:45', 'logged out'),
(34, 'arzeljrz17@gmail.com', '2023-06-03 10:31:32', 'login'),
(35, 'arzeljrz17@gmail.com', '2023-06-03 10:33:05', 'logged out'),
(36, 'arzeljrz17@gmail.com', '2023-06-03 21:39:56', 'login'),
(37, 'arzeljrz17@gmail.com', '2023-06-03 21:40:01', 'logged out'),
(38, 'arzeljrz17@gmail.com', '2024-03-28 21:57:12', 'login'),
(39, 'arzeljrz17@gmail.com', '2024-03-28 21:57:17', 'logged out'),
(40, 'arzeljrz17@gmail.com', '2024-03-28 21:57:35', 'login'),
(41, 'arzeljrz17@gmail.com', '2024-03-28 22:06:51', 'login'),
(42, 'arzeljrz17@gmail.com', '2024-03-28 22:06:57', 'logged out'),
(43, 'arzeljrz17@gmail.com', '2024-03-28 22:11:06', 'login'),
(44, 'arzeljrz17@gmail.com', '2024-03-28 22:11:33', 'logged out'),
(45, 'arzeljrz17@gmail.com', '2024-03-28 22:11:57', 'login'),
(46, 'arzeljrz17@gmail.com', '2024-03-28 22:12:34', 'logged out'),
(47, 'arzeljrz17@gmail.com', '2024-03-28 22:14:31', 'login');

-- --------------------------------------------------------

--
-- Table structure for table `medical`
--

CREATE TABLE `medical` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `blood_sugar` text NOT NULL,
  `blood_pressure` text NOT NULL,
  `weight` text NOT NULL,
  `body_temp` text NOT NULL,
  `prescription` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical`
--

INSERT INTO `medical` (`id`, `patient_id`, `doctor_id`, `blood_sugar`, `blood_pressure`, `weight`, `body_temp`, `prescription`, `date`) VALUES
(2, 10, 1, 'Sequi quas sunt eius', 'Voluptatem facere q', 'Similique voluptatum', 'Impedit necessitati', 'Nisi alias debitis d', '2023-05-28 23:32:25'),
(3, 10, 1, 'Numquam Nam accusamu', 'Sed et cumque ut ill', 'Aute magnam non eos ', 'Et ad hic fugiat eu', 'Ab soluta quis ipsa', '2023-05-28 23:33:51'),
(4, 1, 1, 'Sit beatae consequat', 'Ut et asperiores sim', 'Et fugiat consequatu', 'Sapiente eveniet of', 'Incididunt voluptati', '2023-05-28 23:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `otp_code` int(11) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `otp_code`, `email`) VALUES
(38, 738797, 'esmafea@gmail.com'),
(39, 603710, 'Arzelfb@gmail.com'),
(40, 997779, 'Arzelfb@gmail.com'),
(41, 516674, 'arzelfb@gmail.com'),
(42, 314789, 'arzelfb@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(6, 'cypheruhrzel@gmail.com', 'arzel masakiton', 'patient', 'polomolok', '0000000000', '2000-01-01', '0120000000');

-- --------------------------------------------------------

--
-- Table structure for table `patient_logs`
--

CREATE TABLE `patient_logs` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `logs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_logs`
--

INSERT INTO `patient_logs` (`id`, `email`, `date`, `logs`) VALUES
(2, 'patient1@gmail.com', '2023-05-28 15:48:01', 'login'),
(3, 'patient1@gmail.com', '2023-05-28 15:48:08', 'logged out'),
(4, 'patient2@gmail.com', '2023-05-28 15:50:10', 'login'),
(5, 'patient2@gmail.com', '2023-05-28 15:52:42', 'logged out'),
(6, 'patient1@gmail.com', '2023-05-28 15:55:08', 'login'),
(7, 'patient1@gmail.com', '2023-05-28 16:10:43', 'logged out'),
(8, 'ortegacanillo76@gmail.com', '2023-05-28 16:20:35', 'login'),
(9, 'ortegacanillo76@gmail.com', '2023-05-28 16:20:56', 'logged out'),
(10, 'ortegacanillo76@gmail.com', '2023-05-28 23:34:19', 'login'),
(11, 'ortegacanillo76@gmail.com', '2023-05-28 23:50:45', 'logged out'),
(12, 'patient1@gmail.com', '2023-05-28 23:50:48', 'login'),
(13, 'patient2@gmail.com', '2023-05-28 23:50:58', 'login'),
(14, 'cypheruhrzel@gmail.com', '2023-05-30 00:00:02', 'login'),
(15, 'cypheruhrzel@gmail.com', '2023-05-30 00:00:08', 'logged out'),
(16, 'cypheruhrzel@gmail.com', '2023-05-30 00:01:00', 'login'),
(17, 'cypheruhrzel@gmail.com', '2023-05-30 11:38:46', 'login'),
(18, 'cypheruhrzel@gmail.com', '2023-05-30 11:41:37', 'login'),
(19, 'cypheruhrzel@gmail.com', '2023-05-30 11:41:59', 'logged out'),
(20, 'cypheruhrzel@gmail.com', '2023-06-02 02:16:43', 'login'),
(21, 'cypheruhrzel@gmail.com', '2023-06-02 02:19:27', 'logged out'),
(22, 'cypheruhrzel@gmail.com', '2023-06-02 05:06:49', 'login'),
(23, 'esmafea@gmail.com', '2023-06-02 05:37:18', 'login'),
(24, 'esmafea@gmail.com', '2023-06-02 05:39:39', 'logged out'),
(25, 'cypheruhrzel@gmail.com', '2023-06-02 05:39:48', 'login'),
(26, 'cypheruhrzel@gmail.com', '2023-06-02 05:41:50', 'login'),
(27, 'cypheruhrzel@gmail.com', '2023-06-02 05:42:04', 'logged out'),
(28, 'cypheruhrzel@gmail.com', '2023-06-02 05:42:36', 'logged out'),
(29, 'cypheruhrzel@gmail.com', '2023-06-02 09:20:53', 'login'),
(30, 'cypheruhrzel@gmail.com', '2023-06-02 09:21:55', 'logged out'),
(31, 'cypheruhrzel@gmail.com', '2023-06-03 09:43:39', 'login'),
(32, 'cypheruhrzel@gmail.com', '2023-06-03 09:43:48', 'logged out'),
(33, 'cypheruhrzel@gmail.com', '2023-06-03 09:45:58', 'login'),
(34, 'cypheruhrzel@gmail.com', '2023-06-03 09:46:12', 'logged out'),
(35, 'cypheruhrzel@gmail.com', '2023-06-03 09:47:05', 'login'),
(36, 'cypheruhrzel@gmail.com', '2023-06-03 09:48:11', 'logged out'),
(37, 'cypheruhrzel@gmail.com', '2023-06-03 09:48:22', 'login'),
(38, 'cypheruhrzel@gmail.com', '2023-06-03 09:49:03', 'login'),
(39, 'cypheruhrzel@gmail.com', '2023-06-03 09:49:14', 'logged out'),
(40, 'cypheruhrzel@gmail.com', '2023-06-03 10:29:49', 'login'),
(41, 'cypheruhrzel@gmail.com', '2023-06-03 10:31:20', 'logged out'),
(42, 'cypheruhrzel@gmail.com', '2023-06-03 10:33:33', 'login'),
(43, 'cypheruhrzel@gmail.com', '2023-06-03 10:37:14', 'logged out'),
(44, 'cypheruhrzel@gmail.com', '2024-03-28 21:57:21', 'login'),
(45, 'cypheruhrzel@gmail.com', '2024-03-28 21:57:28', 'logged out'),
(46, 'cypheruhrzel@gmail.com', '2024-03-28 22:07:08', 'login'),
(47, 'cypheruhrzel@gmail.com', '2024-03-28 22:07:21', 'logged out'),
(48, 'cypheruhrzel@gmail.com', '2024-03-28 22:11:40', 'login'),
(49, 'cypheruhrzel@gmail.com', '2024-03-28 22:11:53', 'logged out'),
(50, 'cypheruhrzel@gmail.com', '2024-03-28 22:13:59', 'login'),
(51, 'cypheruhrzel@gmail.com', '2024-03-28 22:14:17', 'logged out');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleid` int(11) NOT NULL,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(23, '14', 'tanggal ulo', '2023-06-09', '21:06:00', 2),
(27, '14', '21', '2024-03-29', '22:10:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(2, 'Allergology'),
(5, 'Cardiology'),
(6, 'Child psychiatry'),
(13, 'Dermatology'),
(29, 'Neurology'),
(39, 'Pathology'),
(42, 'Plastic surgery'),
(45, 'Psychiatry'),
(47, 'Radiology'),
(51, 'Stomatology');

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

CREATE TABLE `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`, `status`) VALUES
('admin@admin.com', 'a', 1),
('Arzeljrz17@gmail.com', 'd', 1),
('cypheruhrzel@gmail.com', 'p', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aemail`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appoid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `scheduleid` (`scheduleid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `specialties` (`specialties`);

--
-- Indexes for table `doctor_logs`
--
ALTER TABLE `doctor_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical`
--
ALTER TABLE `medical`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `patient_logs`
--
ALTER TABLE `patient_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleid`),
  ADD KEY `docid` (`docid`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webuser`
--
ALTER TABLE `webuser`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `doctor_logs`
--
ALTER TABLE `doctor_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `medical`
--
ALTER TABLE `medical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `patient_logs`
--
ALTER TABLE `patient_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
