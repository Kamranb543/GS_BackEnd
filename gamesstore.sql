-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2023 at 11:23 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamesstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `created_at`, `updated_at`) VALUES
(5, 'Action', '2023-04-29 03:06:18', NULL),
(6, 'Open World', '2023-04-29 03:06:18', NULL),
(7, 'Stealth', '2023-04-29 03:06:18', NULL),
(8, 'Racing', '2023-04-29 03:06:18', NULL),
(9, 'Adventure', '2023-04-29 03:06:18', NULL),
(10, 'Servival', NULL, NULL),
(11, 'Horror', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2023_04_27_162832_create_products_table', 1),
(26, '2023_04_29_025749_create_categories_table', 2),
(27, '2023_04_29_030012_create_product_categories_table', 2),
(35, '2023_05_01_020801_create_users_table', 3),
(36, '2023_05_19_132507_create_orders_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `userName` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `payment` enum('online','offline') NOT NULL,
  `address` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `userName`, `phone`, `payment`, `address`, `qty`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(16, 'Sufwan', '324', 'offline', 'fsdafasdf', '1', 4, 22, '2023-05-19 14:21:36', '2023-05-19 14:21:36'),
(28, 'Sufwan', '1234567', 'online', 'hafizabad', '2', 4, 23, '2023-06-11 11:57:52', '2023-06-11 11:57:52'),
(30, 'kamran', '1234567890', 'offline', 'karachi', '1', 5, 1, '2023-06-20 10:51:13', '2023-06-20 10:51:13'),
(31, 'kamran', '1234567890', 'offline', 'karachi', '1', 5, 2, '2023-06-20 10:51:13', '2023-06-20 10:51:13'),
(32, 'kamran', '1234567890', 'offline', 'karachi', '1', 5, 4, '2023-06-20 10:51:13', '2023-06-20 10:51:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(68, 'App\\Models\\User', 17, 'userToken', '18ad5440f204c9e8ba5648e33e2144f8525f1b9dc2fc6c56fe16cd0eb9099305', '[\"*\"]', '2023-05-19 01:28:53', NULL, '2023-05-18 12:56:40', '2023-05-19 01:28:53'),
(69, 'App\\Models\\User', 18, 'userToken', '13adfe45d87f48409db3a5fa31c4eadd0ba5e350d945be6928643b0cc9abd754', '[\"*\"]', NULL, NULL, '2023-05-19 01:12:14', '2023-05-19 01:12:14'),
(70, 'App\\Models\\User', 1, 'userToken', '222739ad35fe8fc49f20f1aba487e155104ba21ba88045d67c23328c8ff31d62', '[\"*\"]', NULL, NULL, '2023-05-19 08:38:33', '2023-05-19 08:38:33'),
(71, 'App\\Models\\User', 2, 'userToken', '6b79637c53f642165aab8cf07b8c8719bcfd757a8424a08bdb3bcb497a8150c9', '[\"*\"]', NULL, NULL, '2023-05-19 08:44:12', '2023-05-19 08:44:12'),
(74, 'App\\Models\\User', 3, 'userToken', '18a89d65f0eb99b49708c4f09a256a956d1aa3e9f06cb8141524fd496af876df', '[\"*\"]', '2023-05-19 14:11:10', NULL, '2023-05-19 14:00:33', '2023-05-19 14:11:10'),
(76, 'App\\Models\\User', 4, 'userToken', 'e08e7b74adf98da122e600bcefd8c6e84a06d83c8e54abc46bff73a2ed4886ed', '[\"*\"]', NULL, NULL, '2023-05-25 06:56:33', '2023-05-25 06:56:33'),
(77, 'App\\Models\\User', 4, 'userToken', 'c7fe1dcd114f75251935af8523ed777cb6a92ac29939b4b92243e5d7c26cc28f', '[\"*\"]', '2023-05-25 08:00:35', NULL, '2023-05-25 06:56:34', '2023-05-25 08:00:35'),
(79, 'App\\Models\\User', 4, 'userToken', '956d4d804b074d2127918a6417e3845b8abe7d784f85f9c4f9edd285a3ed3027', '[\"*\"]', '2023-05-29 07:30:18', NULL, '2023-05-29 07:28:37', '2023-05-29 07:30:18'),
(82, 'App\\Models\\User', 4, 'userToken', 'e22ee43dde5d331beb671b0d28a91b0c818a9ac905dc7037184502ae63a3955e', '[\"*\"]', NULL, NULL, '2023-06-11 11:56:09', '2023-06-11 11:56:09'),
(83, 'App\\Models\\User', 4, 'userToken', '89f291af27eb6f00dbe29f239a05b34176a285f36c0196c22f96504b0a147bc7', '[\"*\"]', '2023-06-11 11:57:52', NULL, '2023-06-11 11:56:10', '2023-06-11 11:57:52'),
(84, 'App\\Models\\User', 4, 'userToken', 'f09db4883574e61f90ec82c93d98fbb52476b2968ae20ff3d661debf6cc33188', '[\"*\"]', NULL, NULL, '2023-06-20 08:29:25', '2023-06-20 08:29:25'),
(97, 'App\\Models\\User', 6, 'userToken', 'e190b38b66cde3aea76c5d0fbe944eec19f0526c9ff13b7da46f565d32670393', '[\"*\"]', NULL, NULL, '2023-06-20 12:05:45', '2023-06-20 12:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` varchar(120) NOT NULL,
  `desc` text NOT NULL,
  `sysreq` text NOT NULL,
  `img` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `name`, `price`, `desc`, `sysreq`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Marvel\'s Spider-Man: Miles Morales', '4500', 'Marvel\'s Spider-Man: Miles Morales is a 2020 action-adventure video game developed by Insomniac Games and published by Sony Interactive Entertainment.', 'Requires a 64-bit processor and operating system.\r\nOS: Windows 10 64-bit 1909.\r\nProcessor: Intel Core i3-4160, 3.6 GHz or AMD equivalent.\r\nMemory: 8 GB RAM.\r\nGraphics: NVIDIA GTX 950 or AMD Radeon RX 470.\r\nDirectX: Version 12.\r\nStorage: 75 GB available space.', 'http://127.0.0.1:8000/thumbnail/wp7150802.png', '2023-04-28 00:25:31', '2023-04-28 00:25:31'),
(2, 'Middle-earth: Shadow of Mordor', '4000', 'Middle-earth: Shadow of Mordor is a 2014 action-adventure video game developed by Monolith Productions and published by Warner Bros. Interactive Entertainment. An original story based on the legendarium created by J. R. R.', 'OS: 64-bit: Vista SP2, Win 7 SP1, Win 8.1.\r\nProcessor: Intel Core i5-750, 2.67 GHz | AMD Phenom II X4 965, 3.4 GHz.\r\nMemory: 3 GB RAM.\r\nGraphics: NVIDIA GeForce GTX 460 | AMD Radeon HD 5850.\r\nDirectX: Version 11.\r\nNetwork: Broadband Internet connection.\r\nStorage: 44 GB available space.', 'http://127.0.0.1:8000/thumbnail/wp1858791.jpg', '2023-04-28 00:27:05', '2023-04-28 00:27:05'),
(3, 'Middle-earth: Shadow of War', '5000', 'Middle-earth: Shadow of War is a 2017 action-adventure video game developed by Monolith Productions and published by Warner Bros. Interactive Entertainment. Shadow of War is the sequel to 2014\'s Middle-earth: Shadow of Mordor, both of which based on J. R. R. Tolkien\'s legendarium.', 'OS: Windows 7 SP1.\r\nProcessor: AMD FX-4350, 4.2 GHz / Intel Core i5-2300, 2.80 GHz.\r\nMemory: 6GB RAM.\r\nGraphics: AMD HD 7870, 2GB / Nvidia GTX 660, 2GB.\r\nDirectX: Version 11.\r\nStorage: 70GB available space.', 'http://127.0.0.1:8000/thumbnail/thumb-1920-806265.jpg', '2023-04-28 00:28:21', '2023-04-28 00:28:21'),
(4, 'Watch Dogs 2', '3000', 'Watch Dogs 2 is a 2016 action-adventure game developed by Ubisoft Montreal and published by Ubisoft. It is the sequel to 2014\'s Watch Dogs and the second installment in the Watch Dogs series.', 'CPU: Intel Core i5-3470 @ 3.2 GHz / AMD FX 8120 @ 3.9 GHz.\r\nGPU: GeForce GTX 780, GeForce GTX 970, or GeForce GTX 1060.\r\nVRAM: 3GB.\r\nRAM: 8GB.\r\nOS: Windows 7 SP1, Windows 8.1, Windows 10 (64-bit versions only)\r\nHDD: 50GB free space.', 'http://127.0.0.1:8000/thumbnail/wp2411321.jpg', '2023-04-28 00:30:03', '2023-04-28 00:30:03'),
(5, 'Mafia III', '3500', 'Mafia III is a 2016 action-adventure video game developed by Hangar 13 and published by 2K. It was released in October 2016 for PlayStation 4, Windows, and Xbox One, in May 2017 for macOS, and in October 2021 for Google Stadia. It is the sequel to Mafia II and the third installment in the Mafia series.', 'CPU: i7-3770.\r\nGPU: GeForce GTX 780 or GeForce GTX 1060 (6GB)\r\nVRAM: 4GB.\r\nRAM: 8 GB.\r\nOS: Windows 7 64-bit.\r\nHDD: 50GB free space.', 'http://127.0.0.1:8000/thumbnail/wp2239384.jpg', '2023-04-28 00:31:25', '2023-04-28 00:31:25'),
(6, 'Batman: Arkham Knight', '2000', 'Batman: Arkham Knight is a 2015 action-adventure game developed by Rocksteady Studios and published by Warner Bros. Interactive Entertainment.', 'CPU: Intel Core i7-3770, 3.4 GHz | AMD FX-8350, 4.0 GHz\r\nCPU SPEED: Info\r\nRAM: 8 GB\r\nVIDEO CARD: NVIDIA GeForce GTX 760 - 3 GB Memory Recommended\r\nDEDICATED VIDEO RAM: 3 GB\r\nPIXEL SHADER: 5.0\r\nVERTEX SHADER: 5.0\r\nOS: Win 7 SP1, Win 8.1 (64-bit Operating System Required)\r\nFREE DISK SPACE: 55 GB', 'http://127.0.0.1:8000/thumbnail/wp1835381.jpg', '2023-04-28 00:32:51', '2023-04-28 00:32:51'),
(7, 'Spec Ops: The Line', '1000', 'Spec Ops: The Line is a 2012 third-person shooter video game developed by the German studio Yager Development and published by 2K. It is the tenth title, as well as a reboot, of the Spec Ops series.', 'CPU: Intel Core 2 Duo @ 2Ghz / AMD Athlon 64 X2 equivalent.\r\nCPU SPEED: Info.\r\nRAM: 2 GB.\r\nVIDEO CARD: NVIDIA GeForce 8600 / ATI Radeon HD 2600XT.\r\nDEDICATED VIDEO RAM: 256 MB.\r\nPIXEL SHADER: 2.0.\r\nVERTEX SHADER: 2.0.\r\nOS: Windows XP SP3.', 'http://127.0.0.1:8000/thumbnail/vKMsfo.jpg', '2023-04-28 00:34:05', '2023-04-28 00:34:05'),
(8, 'Just Cause 4', '4500', 'Just Cause 4 is a 2018 action-adventure game developed by Avalanche Studios and published by Square Enix. It is the fourth game in the Just Cause series and the sequel to 2015\'s Just Cause 3 and was released for PlayStation 4, Windows, and Xbox One on 4 December 2018.', 'OS: Windows 10 (64-bit versions only)\r\nProcessor: Intel Core i7-4770 @ 3.4 GHz | AMD Ryzen 5 1600 @ 3.2 GHz or equivalent.\r\nMemory: 16 GB RAM.\r\nGraphics: NVIDIA GeForce GTX 1070 (6GB VRAM or better) | AMD Vega 56 (6GB VRAM or better)\r\nDirectX: Version 11.\r\nStorage: 59 GB available space.', 'http://127.0.0.1:8000/thumbnail/tmouvwh5hyz1qaft.jpg', '2023-04-28 00:34:59', '2023-04-28 00:34:59'),
(9, 'Forza Horizon 4', '3500', 'Forza Horizon 4 is a 2018 racing video game developed by Playground Games and published by Microsoft Studios. It was released on 2 October 2018 for Windows and Xbox One after being announced at Xbox\'s E3 2018 conference. An enhanced version of the game was released on Xbox Series X/S on 10 November 2020.', 'OS: Windows 10 version 15063.0 or higher.\r\nProcessor: Intel i3-4170 @ 3.7Ghz OR Intel i5 750 @ 2.67Ghz.\r\nMemory: 8 GB RAM.\r\nGraphics: NVidia 650TI OR AMD R7 250x.\r\nDirectX: Version 12.\r\nNetwork: Broadband Internet connection.\r\nStorage: 80 GB available space.', 'http://127.0.0.1:8000/thumbnail/_101969460_forza.jpg', '2023-04-28 00:37:19', '2023-04-28 00:37:19'),
(10, 'Forza Horizon 5', '5000', 'Forza Horizon 5 is a 2021 racing video game developed by Playground Games and published by Xbox Game Studios. It is the fifth Forza Horizon title and twelfth main instalment in the Forza series. The game is set in a fictionalised representation of Baja California, Mexico.', 'Requires a 64-bit processor and operating system.\r\nOS: Windows 10 version 15063.0 or higher.\r\nProcessor: Intel i5-4460 or AMD Ryzen 3 1200.\r\nMemory: 8 GB RAM.\r\nGraphics: NVidia GTX 970 OR AMD RX 470.\r\nDirectX: Version 12.\r\nNetwork: Broadband Internet connection.\r\nStorage: 110 GB available space.', 'http://127.0.0.1:8000/thumbnail/thumb-1920-1168382.jpg', '2023-04-28 00:38:26', '2023-04-28 00:38:26'),
(11, 'Hitman III', '45000', 'Gameplay. Like its predecessors, Hitman 3 is a stealth game played from a third-person perspective and players once again assume control of assassin Agent 47. In the game, 47 travels to various locations and carries out contracted assassinations, continuing the story of the last two games.', 'CPU: Intel Core i5-2500K / AMD Phenom II X4 940.\r\nRAM: 8 GBOS: 64-bit Windows 10.\r\nVIDEO CARD: NVIDIA GeForce GTX 660 / AMD Radeon HD 7870.\r\nPIXEL SHADER: 5.0.\r\nVERTEX SHADER: 5.0.\r\nFREE DISK SPACE: 80 GB.\r\nDEDICATED VIDEO RAM: 2048 MB.', 'http://127.0.0.1:8000/thumbnail/thumb-1920-1081798.png', '2023-04-28 00:40:18', '2023-04-28 00:40:18'),
(20, 'Grand Theft Auto V', '3500', 'Grand Theft Auto V is a 2013 action-adventure game developed by Rockstar North and published by Rockstar Games. It is the seventh main entry in the Grand Theft Auto series, following 2008\'s Grand Theft Auto IV, and the fifteenth instalment overall.', 'Requires a 64-bit processor and operating system.\r\nOS: Windows 10 64 Bit, Windows 8.1 64 Bit, Windows 8 64 Bit, Windows 7 64 Bit Service Pack 1.\r\nProcessor: Intel Core i5 3470 @ 3.2GHz (4 CPUs) / AMD X8 FX-8350 @ 4GHz (8 CPUs)\r\nMemory: 8 GB RAM.\r\nGraphics: NVIDIA GTX 660 2GB / AMD HD 7870 2GB.\r\nStorage: 72 GB available space.', 'http://127.0.0.1:8000/thumbnail/gtav.jpg', '2023-04-29 12:33:08', '2023-04-29 12:33:08'),
(21, 'Prototype 2', '1500', 'Prototype 2 is a 2012 action-adventure video game developed by Radical Entertainment and published by Activision, and the sequel to 2009\'s Prototype. First announced at the 2010 Spike VGA Awards, it was released in April 2012 for the PlayStation 3 and Xbox 360, and in July 2012 for Microsoft Windows.', 'OS: Windows XP, Windows Vista, Windows 7.\r\nProcessor: Intel Core 2 Duo 2.6GHz, AMD Phenom X3 8750.\r\nMemory: 2 GB RAM.\r\nHard Disk Space: 10 GB available space.\r\nVideo Card: NVIDIA GeForce 8800 GT with 512 MB RAM, ATI Radeon HD 4850 with 512 MB RAM.\r\nDirectX®: 9.0c.', 'http://127.0.0.1:8000/thumbnail/prototype-2-poster-prototype-2-game-wallpaper-wallpaper-preview.jpg', '2023-04-29 12:35:19', '2023-04-29 12:35:19'),
(22, 'Resident Evil 8 (Village)', '6000', 'Resident Evil Village is a 2021 survival horror game developed and published by Capcom. It is the sequel to Resident Evil 7: Biohazard. Players control Ethan Winters, who searches for his kidnapped daughter in a village filled with mutant creatures.', 'CPU: Intel Core i5-7500 or AMD Ryzen 3 1200\r\nRAM: 8 GB\r\nVIDEO CARD: NVIDIA GeForce GTX 1050 Ti or AMD Radeon RX 560\r\nDEDICATED VIDEO RAM: 4096 MB\r\nPIXEL SHADER: 5.1\r\nVERTEX SHADER: 5.1\r\nOS: Windows 10 64-bit', 'http://127.0.0.1:8000/thumbnail/desktop-wallpaper-resident-evil-village-resident-evil-8-village.jpg', '2023-04-29 12:40:47', '2023-04-29 12:40:47'),
(23, 'Dying Light', '2000', 'Dying Light is a survival horror video game played from a first-person perspective. The game is set in an open-world environment called Harran; initially, an area named the Slums can be freely explored, later adding a second area called Old Town.', 'CPU: Intel Core i5-2500 @3.3 GHz / AMD FX-8320 @3.5 GHz\r\nCPU SPEED: Info\r\nRAM: 4 GB\r\nVIDEO CARD: NVIDIA GeForce GTX 560 / AMD Radeon HD 6870 (1GB VRAM)\r\nDEDICATED VIDEO RAM: 1 GB\r\nPIXEL SHADER: 5.0\r\nVERTEX SHADER: 5.0\r\nOS: Windows 7 64-bit / Windows 8 64-bit / Windows 8.1 64-bit\r\nFREE DISK SPACE: 40 GB\r\nSOUND CARD: Yes', 'http://127.0.0.1:8000/thumbnail/869t85ft652ly3jc.jpg', '2023-04-29 13:01:58', '2023-04-29 13:01:58'),
(25, 'Assassin\'s Creed Unity', '3600', 'Assassin\'s Creed Unity is an action-adventure video game developed by Ubisoft Montreal and published by Ubisoft. It was released in November 2014 for PlayStation 4, Windows, and Xbox One, and in December 2020 for Stadia.', 'Processor AMD FX 8350 @ 4.0 GHz or Intel Core i5-2500K @ 3.3 GHz. ...\r\nRAM 6GB.\r\nDirectX DirectX June 2010 Redistributable.\r\nHard Drive 50 GB available storage.\r\nSound Card DirectX 9.0c compatible sound card with latest drivers.', 'http://127.0.0.1:8000/thumbnail/05Y9wdP.jpg', '2023-05-14 15:17:30', '2023-05-14 15:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `pc_id` bigint(20) UNSIGNED NOT NULL,
  `p_id` bigint(20) UNSIGNED NOT NULL,
  `c_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`pc_id`, `p_id`, `c_id`, `created_at`, `updated_at`) VALUES
(1, 6, 5, NULL, NULL),
(2, 6, 6, NULL, NULL),
(3, 6, 7, NULL, NULL),
(4, 9, 6, NULL, NULL),
(5, 9, 8, NULL, NULL),
(8, 20, 6, NULL, NULL),
(9, 21, 5, NULL, NULL),
(10, 21, 6, NULL, NULL),
(14, 23, 6, NULL, NULL),
(16, 22, 11, NULL, NULL),
(17, 22, 10, NULL, NULL),
(18, 23, 6, NULL, NULL),
(19, 23, 11, NULL, NULL),
(20, 23, 10, NULL, NULL),
(24, 25, 5, NULL, NULL),
(25, 25, 6, NULL, NULL),
(26, 25, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','seller','client') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(4, 'Sufwan Bhatti', 'Sufwan@gmail.com', '123456', 'client', '2023-05-19 14:21:04', '2023-05-19 14:21:04'),
(5, 'Muhammad Kamran', 'Kamran@example.com', '123456', 'admin', '2023-05-21 19:00:00', '0000-00-00 00:00:00'),
(6, 'Example Seller', 'abc@example.com', '123456', 'seller', '2023-06-20 12:05:45', '2023-06-20 12:05:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`pc_id`),
  ADD KEY `product_categories_p_id_foreign` (`p_id`),
  ADD KEY `product_categories_c_id_foreign` (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `pc_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_c_id_foreign` FOREIGN KEY (`c_id`) REFERENCES `categories` (`cat_id`),
  ADD CONSTRAINT `product_categories_p_id_foreign` FOREIGN KEY (`p_id`) REFERENCES `products` (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
