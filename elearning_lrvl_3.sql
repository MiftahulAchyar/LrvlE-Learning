-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2017 at 05:37 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning_lrvl_3`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `message`, `created_at`) VALUES
(4, 'guru Telah membuat kursus tes', '2017-12-21 17:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `assingments`
--

CREATE TABLE `assingments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `session_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `closed_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assingments`
--

INSERT INTO `assingments` (`id`, `title`, `description`, `session_id`, `created_time`, `closed_time`) VALUES
(1, 'Mengimplementasikan deceision tree', 'Deskripsi tugas Course ID 1 sesi : 1', 1, '2017-12-01 00:00:00', '2017-12-22 00:00:00'),
(2, 'Mengimplementasikan association rule', 'Deskripsi tugag course 2', 2, '2017-12-01 00:00:00', '2017-12-29 05:38:59'),
(4, 'tes', 'ete\r\n', 1, '2017-12-22 09:19:58', '2017-12-22 09:20:01'),
(5, 'Test assignment', 'Assignment test on Decision Tree', 1, '2017-12-27 07:35:11', '2018-01-04 23:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `course_category_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `course_category_id`, `title`, `description`) VALUES
(1, 10, 1, 'Data Mining', 'Course Data Mining untuk mahasiswa semester 7'),
(2, 4, 1, 'Rekayasa Perangkat Lunak', 'Mata kuliah untuk mempelajari proses pembuatan dan perencanaan software'),
(3, 4, 1, 'Algoritma dan Logika', 'Deskripsi algoritma dan logika'),
(4, 10, 1, 'Bahasa Inggris 1', 'Deskripsi mata kuliah Bahasa Inggris 1'),
(5, 10, 1, 'Ketrampilan Komputer', 'Deskripsi Mata Kuliah ketrampilan komputer'),
(7, 10, 1, 'Matematika Diskrit', 'Deskripsi mata kuliah Matematika Diskrit'),
(8, 10, 1, 'Agama', 'Mata kuliah yang penting untuk membangun sisi religi mahasiswa'),
(9, 10, 1, 'Kewarganegaraan', 'Mata kuliah yang penting untuk membangun moral bangsa'),
(10, 4, 1, 'Konsep Pemograman', 'belajar dasar-dasar pemograman'),
(11, 4, 1, 'Teknologi web', 'Teknologi web danperkembangannya'),
(17, 4, 1, 'tes', 'estes');

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `name`) VALUES
(1, 'Teknik Informatika'),
(2, 'Teknik Elektronika'),
(3, 'Teknik Industri'),
(4, 'Teknik Sipil');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `course_id`, `time`, `group_id`) VALUES
(1, 1, '2017-12-09 15:34:17', 2),
(3, 2, '2017-12-09 15:34:17', 2),
(4, 3, '2017-12-09 15:34:17', 2),
(5, 1, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `group_id` int(11) UNSIGNED DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `time`, `type`, `group_id`, `course_id`) VALUES
(2, 'Mengimplementasikan deceision tree', '2017-12-22 09:47:53', 'ASSIGNMENT', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gradings`
--

CREATE TABLE `gradings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gradings`
--

INSERT INTO `gradings` (`id`, `user_id`, `course_id`, `group_id`, `teacher_id`, `value`) VALUES
(1, 3, 3, 1, 4, 'AB'),
(2, 3, 5, 1, 4, 'C'),
(3, 3, 7, 1, 4, 'E');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, '3 D4 IT B'),
(2, '4 D4 IT B'),
(5, '2 D4 IT A'),
(6, '4 D4 IT A');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `text` text,
  `filepath` varchar(255) DEFAULT NULL,
  `modul_type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `session_id`, `text`, `filepath`, `modul_type`) VALUES
(1, 1, 'Materi Decision Tree', 'files/lessons/2_1_Decision Tree.pdf', 'teori'),
(2, 2, 'Praktikum Assoctiation rule', 'files/lessons/1_1_materi bab 1.pdf', 'praktikum'),
(3, 2, 'Materi Association Rule', 'files/lessons/1_1_Assoc rule.pdf', 'teori'),
(4, 1, 'Praktikum decision tree', 'files/lessons/1_1_materi bab 1.pdf', 'praktikum');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `closed_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `title`, `session_id`, `closed_time`) VALUES
(1, 'Post test decision tree', 1, '2017-12-29 08:44:10'),
(2, 'Post test Association Rule', 2, '2017-12-28 18:19:55'),
(3, 'Post test d3', 1, '2017-12-01 17:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_enrollments`
--

CREATE TABLE `quiz_enrollments` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_enrollments`
--

INSERT INTO `quiz_enrollments` (`id`, `quiz_id`, `user_id`, `score`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 0, '2017-12-27 07:02:06', '2017-12-27 07:02:06'),
(4, 1, 3, 0, '2017-12-27 07:26:29', '2017-12-27 07:26:29');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_multiplechoiches`
--

CREATE TABLE `quiz_multiplechoiches` (
  `id` int(11) NOT NULL,
  `quiz_question_id` int(11) NOT NULL,
  `answer1` text,
  `answer2` text,
  `answer3` text,
  `answer4` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_multiplechoiches`
--

INSERT INTO `quiz_multiplechoiches` (`id`, `quiz_question_id`, `answer1`, `answer2`, `answer3`, `answer4`) VALUES
(1, 1, 'BI3', 'ID3', 'Binary tree', 'B7 Tree'),
(3, 5, 'requirement untuk perusahaan', 'gak tahu', 'i dont care', 'iya'),
(4, 6, '1', '2', '3', '4'),
(5, 8, 'A', 'B', 'C', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL,
  `number_order` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `question` text,
  `answer` text,
  `is_essay` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`id`, `number_order`, `quiz_id`, `question`, `answer`, `is_essay`) VALUES
(1, 1, 1, 'Dimanakah algoritma dibawah ini yang termasuk Algoritma decision tree ?', 'B', 0),
(2, 2, 1, 'Jelaskan algoritma decision tree secara singkat !', 'Bla bla bla', 1),
(3, 1, 2, 'Jelaskan Association Rule secara singkat!', '....', 1),
(5, NULL, 2, 'Mengapa mata kuliah saya penting ?', 'A', 0),
(6, NULL, 2, 'tes', 'A', 0),
(7, NULL, 3, 'Question 1', 'Test answer', 1),
(8, NULL, 3, 'Multiplechoice question', 'C', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_student_answers`
--

CREATE TABLE `quiz_student_answers` (
  `id` int(11) NOT NULL,
  `quiz_question_id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `answer` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_true` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_student_answers`
--

INSERT INTO `quiz_student_answers` (`id`, `quiz_question_id`, `user_id`, `answer`, `created_at`, `updated_at`, `is_true`) VALUES
(4, 1, 3, 'A', '2017-12-27 07:27:01', '2017-12-27 07:27:01', 0),
(5, 2, 3, 'tes jawaban', '2017-12-27 07:27:01', '2017-12-27 07:27:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'student'),
(2, 'teacher'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(10) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `course_id`, `title`, `description`) VALUES
(1, 1, 'Decision Tree', 'Deskripsi Sesi ke satu'),
(2, 1, 'Association rule', 'Deskripsi Sesi Kedua'),
(3, 2, 'Sesi Pertama', 'Deskripsi Sesi Pertama'),
(4, 2, 'Sesi Kedua', 'Deskripsi Sesi Kedua'),
(5, 3, 'Sesi Pertama', 'Deskripsi Sesi Pertama'),
(6, 3, 'Sesi Kedua', 'Deskripsi Sesi Kedua'),
(7, 4, 'Sesi Pertama', 'Deskripsi Sesi Pertama'),
(8, 4, 'Sesi Kedua', 'Deskripsi Sesi Kedua');

-- --------------------------------------------------------

--
-- Table structure for table `student_assignments`
--

CREATE TABLE `student_assignments` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `status` varchar(15) DEFAULT '"SUBMITTED"',
  `grade` int(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_assignments`
--

INSERT INTO `student_assignments` (`id`, `assignment_id`, `file_path`, `created_at`, `updated_at`, `user_id`, `status`, `grade`) VALUES
(4, 1, 'files/student_assignment/3_1.pdf', '2017-12-14 22:52:10', '2017-12-14 22:52:10', 3, '\"SUBMITTED\"', 80),
(5, 4, 'files/student_assignment/3_4.pdf', '2017-12-27 06:51:29', '2017-12-27 06:51:29', 3, '\"SUBMITTED\"', 0),
(6, 2, 'files/student_assignment/3_2.pdf', '2017-12-27 07:25:42', '2017-12-27 07:25:42', 3, '\"SUBMITTED\"', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_path` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `rule_id`, `username`, `password`, `email`, `photo_path`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(3, 0, 'student', '$2y$10$10xIHdt3iqI.7yRc1V5IFeUJ9Cf3oFpxWxO7Vp6.BOq.FwZBrvuHq', 'student@mail.com', NULL, 'tiTPgsExTVtWbO6FhAMYcbB8qXO7DSF4rzkjVDhqZcrbX4hEkPC5gA96gFYv', '2017-12-05 20:22:19', '2017-12-05 20:22:19', 1),
(4, 0, 'bpk guru', '$2y$10$AcuGFipJtasvPB8sbQz56eS0Egne/YODhEXKEfS8yhvOzyZkz6sPa', 'guru@mail.com', NULL, 'f0hERPpJqKN5uWSsY82HtPDgrhfaDhArt3CiOl46C24WxQgaG9jm4MoneNAB', '2017-12-05 20:25:31', '2017-12-24 07:00:27', 2),
(5, 0, 'admin', '$2y$10$10xIHdt3iqI.7yRc1V5IFeUJ9Cf3oFpxWxO7Vp6.BOq.FwZBrvuHq', 'admin@mail.com', NULL, 'TUlVBkufk7I8Gh2KLqFeOxIVWOg5VPwVKTVHYv8zNo1GnlCMRTpZqA7RDPOP', '2017-12-05 20:34:47', '2017-12-05 20:34:47', 3),
(8, 0, 'murid nakal', '$2y$10$LzXtVvPindPVDbyUP41orOYPi1yPbsFgpQH2klDGwHuzuGP.e09.m', 'murid@mail.com', NULL, NULL, '2017-12-19 05:32:09', '2017-12-19 05:32:09', 1),
(10, 0, 'ibu guru', '$2y$10$7A3YnSADxvg8Q8i.P2eAyew/TMpzuJqdrD8mzzD09mK.nEiOzN8VO', 'cantik@mail.com', NULL, '8B88w2CYu8459SkPABVZX9i5K3pwr39SQBLiM7xFDGZk6G8QQQ8o108dWWX3', '2017-12-19 05:52:26', '2017-12-25 21:46:36', 2),
(11, 0, 'rangga rizky', '$2y$10$yYx6UDQu2RsmzFAV2XqYMuN9T3Aw7Gg0zS8VShlbF4fObCPVC.YV.', 'rangga@mail.com', NULL, 'ZSgdWbnNxj9QkdwsHP4MlRf3mEIsj0u6HmLe39aFhJeHUoEmIJ09KCqRbqZL', '2017-12-19 05:53:21', '2017-12-19 06:34:38', 1),
(12, 0, 'Ani', '$2y$10$IJgYeqWqy7.bTs1pISZ4e.kxXCWc8D46McME7g5fd/lXN3c4hueym', 'ani@mail.com', NULL, NULL, '2017-12-24 07:05:25', '2017-12-24 07:05:25', 1),
(13, 0, 'loli chan', '$2y$10$085VtTlobxawvNUxDp26wejIpeQm25pcSAibCvFh9M4QgH7FSZatu', 'loli@mail.com', NULL, '1dzFnsICyJGVE5dGiQfeSFQXRLq9icZd8XxYOunr4IJTTSdSVs08LkjcQxIQ', '2017-12-24 07:05:46', '2017-12-24 07:05:46', 1),
(14, 0, 'milla', '$2y$10$hQTYm08aDaLwrBBJ0gqEFuP477Y5iLn4/tWDwZ1qEIej/SAiNT.oq', 'milla@mail.com', NULL, 'bM4WULSFcukJtQ3yAmnLgxe5lUOA92bz6jOgrOkxhiTkETp9NHtTGdN0aTWR', '2017-12-24 07:06:10', '2017-12-24 07:06:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `group_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 3, '2'),
(2, 11, '1'),
(4, 13, '1'),
(5, 13, '2'),
(6, 14, '2');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assingments`
--
ALTER TABLE `assingments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`course_category_id`),
  ADD KEY `course_category_id` (`course_category_id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `user_id` (`course_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`group_id`);

--
-- Indexes for table `gradings`
--
ALTER TABLE `gradings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `quiz_enrollments`
--
ALTER TABLE `quiz_enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_multiplechoiches`
--
ALTER TABLE `quiz_multiplechoiches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_item_id` (`quiz_question_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz_student_answers`
--
ALTER TABLE `quiz_student_answers`
  ADD PRIMARY KEY (`id`,`quiz_question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_id` (`assignment_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `rule_id` (`rule_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`group_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `assingments`
--
ALTER TABLE `assingments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gradings`
--
ALTER TABLE `gradings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `quiz_enrollments`
--
ALTER TABLE `quiz_enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quiz_multiplechoiches`
--
ALTER TABLE `quiz_multiplechoiches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `quiz_student_answers`
--
ALTER TABLE `quiz_student_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `student_assignments`
--
ALTER TABLE `student_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assingments`
--
ALTER TABLE `assingments`
  ADD CONSTRAINT `assingments_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `gradings`
--
ALTER TABLE `gradings`
  ADD CONSTRAINT `gradings_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `gradings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);

--
-- Constraints for table `quiz_multiplechoiches`
--
ALTER TABLE `quiz_multiplechoiches`
  ADD CONSTRAINT `quiz_multiplechoiches_ibfk_1` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_questions` (`id`);

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `quiz_student_answers`
--
ALTER TABLE `quiz_student_answers`
  ADD CONSTRAINT `quiz_student_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `rules`
--
ALTER TABLE `rules`
  ADD CONSTRAINT `rules_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `student_assignments`
--
ALTER TABLE `student_assignments`
  ADD CONSTRAINT `student_assignments_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assingments` (`id`),
  ADD CONSTRAINT `student_assignments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
