-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2026 at 04:25 AM
-- Server version: 9.5.0
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `univents_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `clubadvisor`
--

CREATE TABLE `clubadvisor` (
  `advisorID` varchar(6) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `office` varchar(50) DEFAULT NULL,
  `phoneNo` int DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clubadvisor`
--

INSERT INTO `clubadvisor` (`advisorID`, `name`, `email`, `password`, `office`, `phoneNo`, `title`) VALUES
('ADV001', 'Dr. Aisyah binti Rahman', 'aisyah.rahman@umt.edu.my', 'Comtech123!', 'Office 101', 96688111, 'Lecturer');

-- --------------------------------------------------------

--
-- Table structure for table `clubcommittee`
--

CREATE TABLE `clubcommittee` (
  `committeeID` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clubcommittee`
--

INSERT INTO `clubcommittee` (`committeeID`, `name`, `email`, `password`, `phoneNo`, `position`, `program`, `year`) VALUES
('S75871', 'CHE KU NURULHUDA BINTI CHE KU SAIFUL MUZAHAR', 's75871@ocean.umt.edu.my', 'Huda@123', '011223344556', 'Club President', 'Sarjana Muda Sains Komputer (Kejuruteraan Perisian) dengan Kepujian', 2),
('UK10002', 'Siti Nurhaliza', 'siti@committee.edu.my', 'Comtech123!', '0198765432', 'Setiausaha', 'Computer Science', 3),
('UK10004', 'Wong Mei Ling', 'wong@committee.edu.my', 'Comtech123!', '0176655443', 'Bendahari', 'Computer Science', 4),
('UK1002', 'Siti Nurhaliza', 'siti.n@umt.edu.my', 'password123', '0198765432', 'Secretary', 'N/A', 3),
('UK1004', 'Mohd Ridzuan', 'ridzuan.m@umt.edu.my', 'password123', '0133344455', 'Treasurer', 'N/A', 4);

-- --------------------------------------------------------

--
-- Table structure for table `clubmember`
--

CREATE TABLE `clubmember` (
  `memberID` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `program` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clubmember`
--

INSERT INTO `clubmember` (`memberID`, `name`, `email`, `password`, `phoneNo`, `program`, `year`) VALUES
('S12342', 'Nur Zahra Alisya binti Kamarul', 'Zahra@gmail.com', 'dL7UG8f869', '01223312121', 'Bachelor of Science (Nautical Science and Maritime Transportation) with Honours', 1),
('UK10003', 'Muthusamy', 'muthu@student.edu.my', 'Comtech123!', '0112233445', 'Sarjana Muda Sains Komputer dengan Informatik Maritim (Kepujian)', 1),
('UK10005', 'Ali Bin Abu', 'ali@student.edu.my', 'Comtech123!', '0134455667', 'Sarjana Muda Sains Komputer (Komputeran Mudah Alih) dengan Kepujian', 2),
('UK1001', 'Ahmad Danial', 'ahmad.d@umt.edu.my', 'Comtech123!', '0123456789', 'Software Engineering', 2),
('UK1003', 'Tan Wei Ming', 'tan.w@umt.edu.my', '1234', '0176543210', 'Maritime Informatics', 1),
('UK1005', 'Nurul Huda', 'huda.n@umt.edu.my', 'Comtech123!', '0112233445', 'Mobile Computing', 2);

-- --------------------------------------------------------

--
-- Table structure for table `club_event`
--

CREATE TABLE `club_event` (
  `eventID` int NOT NULL,
  `eventName` varchar(100) DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `description` text,
  `eventAJKs` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'PENDING',
  `capacity` int NOT NULL,
  `advisorComment` varchar(1000) DEFAULT NULL,
  `committeeID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `club_event`
--

INSERT INTO `club_event` (`eventID`, `eventName`, `eventDate`, `startTime`, `endTime`, `venue`, `description`, `eventAJKs`, `status`, `capacity`, `advisorComment`, `committeeID`) VALUES
(6, 'Introduction to Python Workshop', '2026-10-15', '14:00:00', '17:00:00', 'Computer Lab A', 'A beginner-friendly workshop focusing on Python fundamentals and data structures.', 'Ali (Director), Siti (Logistics)', 'Approved', 30, 'Good event!', 'C001'),
(7, 'Annual COMTECH Alumni Mixer', '2026-11-05', '19:00:00', '22:00:00', 'Main University Hall', 'Networking evening connecting current students with successful COMTECH alumni in the tech industry.', 'Ahmad (Protocol), Farah (Catering)', 'Approved', 120, 'The date is not suitable because students have Midterm Examination. Resubmit new event proposal with new date.', 'C002'),
(8, 'Cybersecurity Capture The Flag', '2026-11-20', '09:00:00', '18:00:00', 'Innovation Center', 'A 9-hour intensive CTF competition testing penetration testing and cryptography skills.', 'Omar (Tech Lead), Zainab (Prizes)', 'Approved', 50, 'sdnfsn', 'C003'),
(9, 'End of Semester Bowling Night', '2026-12-01', '20:00:00', '23:00:00', 'Strike Zone Bowling Alley', 'A casual recreational night for club members to de-stress before finals week.', 'Hassan (Social), Noor (Transport)', 'Rejected', 40, 'The date is not suitable because students have Midterm Examination. Resubmit new event proposal with new date.', 'C001'),
(10, 'Data Science Hackathon', '2026-06-15', '15:00:00', '16:00:00', 'Computer Lab B', 'Competitive coding challenge. International Merit Mystar', 'Zaid (Head of Tech)', 'Approved', 50, 'Good program\n', 'S75871'),
(11, 'Web Dev Seminar', '2026-06-15', '15:00:00', '16:00:00', 'Seminar Room 1', 'Goals: Building responsive websites. ', 'Fatima (Speaker), Ali (Director)', 'Approved', 40, 'Good Program', 'S75871'),
(13, 'Data Science Hackathon', '2026-07-07', '14:05:00', '18:02:00', 'DSM', 'ddf', 'Ali (Director), Aminah(secretary)', 'Rejected', 50, 'Duplicate value', 'S75871'),
(16, 'Gala Night', '2026-06-23', '20:59:00', '12:00:00', 'DSM', 'Theme: Around The World. \nAvoid wearing revealing clothes.\nMerit MyStar is provided! \nBring your matric card to scan the attendance and Merit.  \n', 'Ali (Director), Aminah(secretary)', 'Pending Approval', 100, NULL, 'S75871'),
(17, 'Gala Night', '2026-06-23', '11:41:00', '13:43:00', 'DSM', 'Dinner', 'Ali (Director), Aminah(secretary)', 'Pending Approval', 100, NULL, 'S75871');

-- --------------------------------------------------------

--
-- Table structure for table `event_registration`
--

CREATE TABLE `event_registration` (
  `registrationID` int NOT NULL,
  `eventID` int NOT NULL,
  `memberID` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT 'Confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `event_registration`
--

INSERT INTO `event_registration` (`registrationID`, `eventID`, `memberID`, `status`) VALUES
(2, 6, 'UK1001', 'Confirmed'),
(5, 10, 'UK1003', 'Confirmed'),
(10, 7, 'UK1003', 'Confirmed'),
(11, 6, 'UK1003', 'Confirmed'),
(12, 8, 'UK1003', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackID` int NOT NULL,
  `eventID` int NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `rating` int NOT NULL,
  `comment` text NOT NULL,
  `submissionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackID`, `eventID`, `memberID`, `name`, `rating`, `comment`, `submissionDate`) VALUES
(4, 10, 'UK1003', NULL, 5, 'Good program!', '2026-06-24');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_replies`
--

CREATE TABLE `feedback_replies` (
  `replyID` int NOT NULL,
  `feedbackID` int NOT NULL,
  `replierID` varchar(20) NOT NULL,
  `replierRole` varchar(20) NOT NULL,
  `replyText` text NOT NULL,
  `replyDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback_replies`
--

INSERT INTO `feedback_replies` (`replyID`, `feedbackID`, `replierID`, `replierRole`, `replyText`, `replyDate`) VALUES
(3, 4, 'S75871', 'COMMITTEE', 'Thank you!', '2026-06-24'),
(4, 4, 'ADV001', 'ADVISOR', 'Next time, we can do another one!\r\n', '2026-06-24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` varchar(50) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `program` varchar(150) DEFAULT NULL,
  `studyYear` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `fullName`, `email`, `password`, `phoneNo`, `role`, `position`, `program`, `studyYear`) VALUES
('S12342', 'Nur Zahra Alisya binti Kamarul', 'Zahra@gmail.com', 'dL7UG8f869', NULL, 'MEMBER', NULL, NULL, NULL),
('UK10002', 'Siti Nurhaliza', 'siti@committee.edu.my', 'Comtech123!', NULL, 'COMMITTEE', NULL, NULL, NULL),
('UK10003', 'Muthusamy', 'muthu@student.edu.my', 'Comtech123!', NULL, 'MEMBER', NULL, NULL, NULL),
('UK10004', 'Wong Mei Ling', 'wong@committee.edu.my', 'Comtech123!', NULL, 'COMMITTEE', NULL, NULL, NULL),
('UK10005', 'Ali Bin Abu', 'ali@student.edu.my', 'Comtech123!', NULL, 'MEMBER', NULL, NULL, NULL),
('UK1002', 'Siti Nurhaliza', 'siti.n@umt.edu.my', 'password123', NULL, 'COMMITTEE', NULL, NULL, NULL),
('UK1004', 'Mohd Ridzuan', 'ridzuan.m@umt.edu.my', 'password123', NULL, 'COMMITTEE', NULL, NULL, NULL),
('UK1005', 'Nurul Huda', 'huda.n@umt.edu.my', 'Comtech123!', NULL, 'MEMBER', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clubadvisor`
--
ALTER TABLE `clubadvisor`
  ADD PRIMARY KEY (`advisorID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `clubcommittee`
--
ALTER TABLE `clubcommittee`
  ADD PRIMARY KEY (`committeeID`);

--
-- Indexes for table `clubmember`
--
ALTER TABLE `clubmember`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `club_event`
--
ALTER TABLE `club_event`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `event_registration`
--
ALTER TABLE `event_registration`
  ADD PRIMARY KEY (`registrationID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackID`);

--
-- Indexes for table `feedback_replies`
--
ALTER TABLE `feedback_replies`
  ADD PRIMARY KEY (`replyID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `club_event`
--
ALTER TABLE `club_event`
  MODIFY `eventID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `event_registration`
--
ALTER TABLE `event_registration`
  MODIFY `registrationID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback_replies`
--
ALTER TABLE `feedback_replies`
  MODIFY `replyID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
