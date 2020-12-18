
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `vacation`
--

CREATE TABLE `vacation` (
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `activefrom` date DEFAULT NULL,
  `activeuntil` date DEFAULT '2040-01-01',
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `interval_time` int(10) UNSIGNED NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` date NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Postfix Admin - Virtual Vacation';

-- --------------------------------------------------------

--
-- Table structure for table `vacation_notification`
--

CREATE TABLE `vacation_notification` (
  `on_vacation` varchar(255) NOT NULL,
  `notified` varchar(255) NOT NULL,
  `notified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vacation`
--
ALTER TABLE `vacation`
  ADD PRIMARY KEY (`email`),
  ADD KEY `email` (`email`),
  ADD KEY `vacation_email_active` (`email`,`active`) USING BTREE;

--
-- Indexes for table `vacation_notification`
--
ALTER TABLE `vacation_notification`
  ADD PRIMARY KEY (`on_vacation`,`notified`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vacation_notification`
--
ALTER TABLE `vacation_notification`
  ADD CONSTRAINT `vacation_notification_pkey` FOREIGN KEY (`on_vacation`) REFERENCES `vacation` (`email`) ON DELETE CASCADE ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
