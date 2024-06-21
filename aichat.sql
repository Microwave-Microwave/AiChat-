-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 09:17 PM
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
-- Database: `aichat`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `d_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `user_id`, `d_time`) VALUES
(1, 'Haiii :3', 1, '2024-06-21 18:40:03'),
(2, 'Hello everyone!', 2, '2024-06-21 18:41:00'),
(3, 'Just joined this chat.', 3, '2024-06-21 18:42:00'),
(4, 'What\'s up?', 4, '2024-06-21 18:43:00'),
(5, 'Having a great day!', 5, '2024-06-21 18:44:00'),
(6, 'Looking forward to the weekend.', 6, '2024-06-21 18:45:00'),
(7, 'Anyone here into gaming?', 7, '2024-06-21 18:46:00'),
(8, 'Just finished a great book!', 8, '2024-06-21 18:47:00'),
(9, 'Can\'t wait for the next meetup.', 9, '2024-06-21 18:48:00'),
(10, 'Hi all!', 10, '2024-06-21 18:49:00'),
(11, 'Enjoying some music right now.', 2, '2024-06-21 18:50:00'),
(12, 'Working on a new project.', 3, '2024-06-21 18:51:00'),
(13, 'Anyone here from New York?', 4, '2024-06-21 18:52:00'),
(14, 'Just started learning to code.', 5, '2024-06-21 18:53:00'),
(15, 'Had a great workout today.', 6, '2024-06-21 18:54:00'),
(16, 'Cooking dinner now.', 7, '2024-06-21 18:55:00'),
(17, 'Watching a movie.', 8, '2024-06-21 18:56:00'),
(18, 'Planning a trip next month.', 9, '2024-06-21 18:57:00'),
(19, 'Just got a new pet!', 10, '2024-06-21 18:58:00'),
(20, 'Reading the news.', 2, '2024-06-21 18:59:00'),
(21, 'Good night everyone!', 3, '2024-06-21 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'Martin', 'meow'),
(2, 'Alice', 'Wh!sker$123'),
(3, 'Bob', 'B@rker#456'),
(4, 'Charlie', 'Purrfect789'),
(5, 'David', 'Me0wM@st3r'),
(6, 'Eve', 'F3l!neF@ncY'),
(7, 'Frank', 'T@ilTw!st3r'),
(8, 'Grace', 'C@tNap$456'),
(9, 'Heidi', 'N!ghtP@w$'),
(10, 'Ivan', 'Cl@wD@ncer'),
(11, 'Judy', 'P@wPr!nc3ss'),
(12, 'hihihaha', '$2y$10$tC9ed2S/GuBlb8a4BeHVTOeix'),
(14, 'hihihaha', 'fake'),
(15, 'faggot', 'faggot123'),
(16, 'meow', '$2y$10$rDjCaMWyQ1qyZbaWGPfS6usP7'),
(17, 'meow2', '$2y$10$uzyq9FbPmm84srAaX2c/WepcJ'),
(18, 'meow3', 'meow');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `connection` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `connection` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
