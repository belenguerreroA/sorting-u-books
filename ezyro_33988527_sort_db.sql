-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql307.ezyro.com
-- Tiempo de generación: 14-04-2023 a las 17:09:40
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ezyro_33988527_sort_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `award`
--

INSERT INTO `award` (`id`, `name`) VALUES
(1, 'wikipedia.org\r\nLesbian Literature Notable Works'),
(2, 'lambdaliterary.org\r\nLesbian Fiction'),
(3, 'www.ala.org/rt/glbtrt\r\nStonewall Book'),
(4, 'www.elisarolle.com\r\nRainbow Awards');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 1,
  `name` varchar(300) NOT NULL,
  `author` varchar(300) DEFAULT NULL,
  `n_series` int(11) DEFAULT NULL COMMENT 'Number of full-length novels in the series',
  `shared_universe` int(11) DEFAULT NULL COMMENT 'Part of a shared-universe or similar',
  `has_related` int(11) DEFAULT NULL COMMENT 'Some related works exist, ie. short stories, web chapters etc.',
  `warning` int(11) DEFAULT NULL COMMENT 'Warning: series gets worse, turns het, or has other issues',
  `not_read_all` int(11) DEFAULT NULL COMMENT 'Haven''t read all of it so can''t vouch for the content of all novels',
  `available` int(11) DEFAULT NULL COMMENT 'Series might not be easily available or abandoned',
  `m_wo` int(11) DEFAULT NULL COMMENT 'Matriarchies, women-only, etc.',
  `science_babies` int(11) DEFAULT NULL COMMENT 'Science or magic babies',
  `url` varchar(300) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `type_id`, `name`, `author`, `n_series`, `shared_universe`, `has_related`, `warning`, `not_read_all`, `available`, `m_wo`, `science_babies`, `url`, `deleted`) VALUES
(1, 1, 'JA Cipriano Witching On A Starship', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.goodreads.com/series/204379-witching-on-a-starship', 0),
(2, 1, 'Niall Teasdale Aneka Jansen', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 1, 'Dean Chalmers Space Cruiser Musashi', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 1, 'Skyler Grant Persephone Saga', NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0),
(5, 1, 'E William Brown Perilous Waif', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(6, 1, 'Becky Chambers Wayfarers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 1, 'Vincent Martineau Claire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 1, 'Martin Schiller Sisterhood Of Suns', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(9, 1, 'Mackey Chandler April Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(10, 1, 'Kyra Anderson The Significant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 1, 'Tonya Cannariato The Builders', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(12, 1, 'Lea Daley FutureDyke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(13, 1, 'StarAndrea Ships In Service', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(14, 1, 'BK Hunter Empyreal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(15, 1, 'April Conrad Faithful', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(16, 1, 'AC Edwards Maple Leaves Quartet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(17, 1, 'I Christie Merker\'s Outpost', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(18, 1, 'Kaia Sønderby Xandri Corelel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(19, 1, 'Owen R O\'Neill & Jordan L Hunter Alecto Iniative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(20, 1, 'Andi Marquette Far Seek Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(21, 1, 'Annathesa Darksbane Destiny Abounds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(22, 1, 'Yoon Ha Lee Machineries Of Empire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(23, 1, 'Guerric Haché Digitesque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(24, 1, 'Elí Freysson The Golden Throne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(25, 1, 'Adam-Troy Castro Andrea Cort', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(26, 1, 'Lora E Rasmussen Dark Reach Wars', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(27, 1, 'JS Fields Ardulum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(28, 1, 'Erica Lawson Soulwalker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(29, 1, 'Cary Caffrey The Girls From Alcyone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(30, 1, 'Benjanun Sriduangkawew Machine Mandate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(31, 1, 'Kameron Hurley The Stars Are Legion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(32, 1, 'Charles E Hash Goddess Of Decay', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(33, 1, 'SE Goss Capital City Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(34, 1, 'Geoff Ryman The Child Garden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(35, 1, 'Merle Clarke The Divine Wasteland', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(36, 1, 'Tabitha Chirrick Rokkir Saga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(37, 1, 'J-L Heylen Wisdom Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(38, 1, 'Emily Skrutskie The Abyss Surrounds Us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(39, 1, 'ME Logan  Tempered Steele', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(40, 1, 'A Wendeberg 1/2986', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(41, 1, 'Lance Erlick Regina Shen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(42, 1, 'Eden S French Reintegration', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(43, 1, 'Stacey Berg Echo Hunter 367', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(44, 1, 'Allen Donnelly Crystal Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(45, 1, 'Joseph Picard Lifehack', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(46, 1, 'Caitlin Starling The Luminous Dead', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(47, 1, 'KB Spangler Rachel Peng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(48, 1, 'Arkady Martine A Memory Called Empire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(49, 1, 'Matt Doyle Cassie Tam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(50, 1, 'Jason Halstead Lost Girls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(51, 1, 'Jacqueline Carey Santa Olivia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(52, 1, 'Jenn Gott Hopefuls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(53, 1, 'Jennifer Matarese Heroine Addiction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(54, 1, 'Blaze Ward White Crane', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(55, 1, 'Benjamin Medrano Lilith\'s Shadow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(56, 1, 'CB Lee Not Your Sidekick', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(57, 1, 'April Daniels Nemesis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(58, 1, 'Tamara Boyens Seoul Circuit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(59, 1, 'Matt Doyle Cassia Tam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(60, 1, 'KC Alexander Necrotech', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(61, 1, 'Danielle Parker Faoladh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(62, 1, 'Geonn Cannon Underdogs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(63, 1, 'David G King Licantropa Sogna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(64, 1, 'Gill McKnight Garoul Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(65, 1, 'Kate Owen Once Bitten', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(66, 1, 'Shei Darksbane Dakota Shepherd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(67, 1, 'Zoe Reed In Spirit And Truth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(68, 1, 'Jae Second Nature', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(69, 1, 'Tori Curtis Eelgrass', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(70, 1, 'Erik Schubach The Bridge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(71, 1, 'Erik Schubach Drakon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(72, 1, 'Amber Jacobs Primal Touch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(73, 1, 'Lara Hayes Redamancy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(74, 1, 'Mark Henwick Bite Back', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(75, 1, 'CM Michaels Dangerous Waters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(76, 1, 'CM Sipes Bloodline Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(77, 1, 'Patty G Henderson Karnov Trilogy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(78, 1, 'Shei Darksbane Dying Ashes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(79, 1, 'Sarah E Glenn All This And Family, Too', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(80, 1, 'Elizabeth Watasin Monster Stalker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(81, 1, 'Rebecca Murphy The Cupid Project', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(82, 1, 'Melanie Jackson Jaden\'s Journey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(83, 1, 'Jordan Redhawk Sanquire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(84, 1, 'Siona Hartl The Lost Girls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(85, 1, 'Jennie Taylor The Non-Vampire Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(86, 1, 'Jacquotte F Kline Deep Down Inside', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(87, 1, 'K Simpson Devil\'s Workshop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(88, 1, 'EL Blaisdell Drained', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(89, 1, 'Akyson Madden-Brooker Forgotten Wings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(90, 1, 'IS Neko Demons Of Heaven', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(91, 1, 'Karen Williams Nightshade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(92, 1, 'Brantwijn Serrah Goblin Fires', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(93, 1, 'Merciella Heartstorm La Lividum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(94, 1, 'Tay LaRoi The Faerie Court Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(95, 1, 'Jennie Taylor Fairie Queen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(96, 1, 'Mishell Baker Arcadia Project', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(97, 1, 'Jody Klaire Above And Beyond', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(98, 1, 'Linda Kay Silva Echo Branson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(99, 1, 'Alex Mykals Psi Draconis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(100, 1, 'Gary Aumaugher The Monoecions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(101, 1, 'RJ Samuel Vision Painter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(102, 1, 'Craig Schaefer Wisdom\'s Grave', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(103, 1, 'Anthony Francis Skindancer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(104, 1, 'Paul Neuhaus Quinn Henaghan Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(105, 1, 'GD Penman Witch Of Empire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(106, 1, 'Liv Olteano Thirteen Mercies, Three Kills', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(107, 1, 'Joanna MacOwl Fern Witches Trilogy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(108, 1, 'Niall Teasdale Thaumatology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(109, 1, 'Chrissie Buhr Psyche Moon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(110, 1, 'Casey Matthews The One Who Eats Monsters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(111, 1, 'Hillary Monahan Snake Eyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(112, 1, 'Kaye Draper Wendigo Girl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(113, 1, 'Saruuh Kelsey The Legend Mirror', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(114, 1, 'Marcus A Hart Alexis Vs The Afterlife', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(115, 1, 'Zen Cho Black Water Sister', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(116, 1, 'Roz Kaveney Rhapsody Of Blood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(117, 1, 'Klara Kim The Cassandra Project', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(118, 1, 'Alex Westmoore Silver Legacy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(119, 1, 'Marie Castle Dark Mirror', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(120, 1, 'Dan Hansen Trickster\'s War', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(121, 1, 'Jason Halstead Lost Girls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(122, 1, 'Church K. Calvert Manifesting Shadows', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(123, 1, 'Julien Heslin Calls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(124, 1, 'Jess Faraday The Left Hand Of Justice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(125, 1, 'Sarina Dorie Silkpunk And Steam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(126, 1, 'Joseph R Lallo Free-Wrench', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(127, 1, 'Liv Olteano Thirteen Mercies, Three Kills', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(128, 1, 'Felicity Banks The Antipodean Queen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(129, 1, 'Meg Kingston Crystal Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(130, 1, 'John Varley Demon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(131, 1, 'JL Forrest Requies Dawn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(132, 1, 'JB Garner The Songstress Murders', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(133, 1, 'Natalie Debrabandere Ashakaan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(134, 1, 'Nicola Griffith Ammonite', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(135, 1, 'Erik Schubach Techromancy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(136, 1, 'Sam Farren Dragonoak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(137, 1, 'Jane Fletcher Lyremouth Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(138, 1, 'Barbara A Wright Katya & Starbride', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(139, 1, 'Jennifer Lyndon The Changeling', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(140, 1, 'Sharon Cho A Slice Of Quietude', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(141, 1, 'Alex Marshall The Crimson Empire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(142, 1, 'Sam Farren Bitfrost', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(143, 1, 'LJ Baker Broken Wings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(144, 1, 'Fran Wilde The Jewel And Her Lapidary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(145, 1, 'Sarah Ettritch Salbine Sisters', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(146, 1, 'Malinda Lo Huntress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(147, 1, 'Zoe Reed Breaking Legacies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(148, 1, 'Lyl What A Wild Spirit Brings', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(149, 1, 'Seth Dickinson Baru Cormorant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(150, 1, 'Django Wraxler Shadow Campaigns', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(151, 1, 'Catherine M. Wilson When Women Were Warriors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(152, 1, 'TJ Mindancer Tales Of Emoria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(153, 1, 'David Engelstad A Call Of Moonheart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(154, 1, 'Diana Rivers Dancer For The Goddess', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(155, 1, 'Betty Cross Mistress Of The Topaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(156, 1, 'Josh Gifford Tales Of Ankyran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(157, 1, 'Janine Cross Dragon Temple Saga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(158, 1, 'SD Simper Fallen Gods', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(159, 1, 'CJ Perry Godswar Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(160, 1, 'Melinda Lo Ash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(161, 1, 'Meredith Katz Beauty & Cruelty', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(162, 1, 'Anna Burke Thorn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(163, 1, 'Sally M Gearhart The Wanderground', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(164, 1, 'Mercia McMahon Preserving Eternity ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(165, 1, 'Sam Ryan Dynasty Saga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(166, 1, 'Rohvannyn Shaw The Dice Of Fate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(167, 1, 'GS Taylor Seven-Point Star', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(168, 1, 'Mary Gentle Ash - A Secret History', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(169, 1, 'Brian O\'Sullivan Fionn Mac Cumhaill', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(170, 1, 'Heather R Jones Alpennia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(171, 1, 'Martin Schiller Blackbird', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(172, 1, 'Nel Havas Sekma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(173, 1, 'Alex Mykals Psi Draconis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(174, 1, 'Benjamin Medrano Ancient Dreams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(175, 1, 'Beth Lyons Vox Swift Mysteries', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(176, 1, 'J Judkins Kim & Angel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(177, 1, 'Camryn Eyde Tricky Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(178, 1, 'Layce Gardner Tats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(179, 1, 'Saxon Bennett & Layce Gardner Gigolo Girl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(180, 1, 'Robin Alexander Just Jorie', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(181, 1, 'AE Radley Huntress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(182, 1, 'Natasha West Joined At The Hip', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(183, 1, 'Holly Sharp The Other Mother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(184, 1, 'LJ Baker Promises, Promises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(185, 1, 'Gerri Hill Behind The Pine Curtain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(186, 1, 'Clare Ashton Poppy Jenkins', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(187, 1, 'Diana Jean Tokyo Love', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(188, 1, 'Julie Cannon Come And Get Me', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(189, 1, 'Georgia Beers Turning The Page', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(190, 1, 'KG MacGregor Shaken', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(191, 1, 'Melissa Good Dar & Kerry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(192, 1, 'Carrie Carr Lex & Amanda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(193, 1, 'G Benson All The Little Moments', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(194, 1, 'Kate Sweeney Winds Of Heaven', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(195, 1, 'AE Radley Flight Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(196, 1, 'DeJay Redemption', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(197, 1, 'Melissa Brayden Heart Block', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(198, 1, 'T Novan Devlyn & Lauren', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(199, 1, 'CP Rowlands Collision Course', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(200, 1, 'Marolyn Krasner You Know You Wish You Were Me', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(201, 1, 'Kate Genet Building Character', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(202, 1, 'Saxon Bennett More Than A Kiss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(203, 1, 'Gerri Hill Artist\'s Dream', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(204, 1, 'Kelli J Baeli Rain Falls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(205, 1, 'Lyn Gardner Give Me A Reason', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(206, 1, 'Lorelie Brown Far From Home', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(207, 1, 'Gun Brooke Sheridan\'s Fate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(208, 1, 'David G King La Zorra Ciega', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(209, 1, 'Heather Mace Screwed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(210, 1, 'Sara Jane Wilson Out There', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(211, 1, 'Micheala Lynn At All Costs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(212, 1, 'Erik Schubach Five Feet Or Less', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(213, 1, 'Mishell Baker Acadia Project', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(214, 1, 'Ashley Bartlett Cash Braddock', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(215, 1, 'Riley LaShea Behind The Green Curtain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(216, 1, 'Geonn Cannon Claire Lance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(217, 1, 'Ali Vain Cain Casey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(218, 1, 'CK Martin Dirty Little War', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(219, 1, 'Isabella American Yakuza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(220, 1, 'Ian Hamilton Ava Lee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(221, 1, 'Tamara Boyens Seoul Circuit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(222, 1, 'KG MacGregor Anyone But You', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(223, 1, 'Karin Kallmaker Above Temptation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(224, 1, 'Lee Winter On The Record', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(225, 1, 'Stuart McCafferty Empress Saga', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(226, 1, 'Kiki Archer Kat & Freya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(227, 1, 'Keira M Telford The Housemistress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(228, 1, 'Coco Mingolelli Peccatum In Carne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(229, 1, 'Lee Winter The Brutal Truth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(230, 1, 'Georgette Kaplan Scissors Link', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(231, 1, 'AE Radley Mergers And Acquisitions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(232, 1, 'Sybil Smith Curating A Masterpiece', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(233, 1, 'Roslyn Sinclair The Carlisle Series', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(234, 1, 'G Benson Who\'d Have Thought', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(235, 1, 'Tracey Richardson By Mutual Consent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(236, 1, 'Raven J Spencer The Gift', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(237, 1, 'Lola Keeley The Music & The Mirror', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(238, 1, 'Zoe Lynne That Witch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(239, 1, 'Lauren Crane The Square Donut', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(240, 1, 'Hildred Billings Ren\'ai Rensai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(241, 1, 'Linda North Winds And Dreams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(242, 1, 'Susanna Valent The Amazons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(243, 1, 'Mabel Maney Nancy Clue & Cherry Aimless', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(244, 1, 'Monica Nolan Career Girl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(245, 1, 'AiM Sword Saint', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(246, 1, 'Sarah Waters Fingersmith', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(247, 1, 'Elena Graf Passing Rites', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(248, 1, 'Vanda Juliana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(249, 1, 'Jeanelle M Ferreira The Covert Captain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(250, 1, 'Penelope Friday The Sisterhood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(251, 1, 'Kate Allen Alison Kane', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(252, 1, 'Laurie R King Kate Martinelli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(253, 1, 'Rose Beecham Jude Devine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(254, 1, 'Katherine V Forrest Kate Delafield', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(255, 1, 'Cari Hunter The Dark Peak', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(256, 1, 'Anne Holt Hanne Wilhelmsen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(257, 1, 'Jennifer L Jordan Kristin Ashe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(258, 1, 'Diane Wood The Fortune Teller\'s Daughter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(259, 1, 'Nicola Griffith Aud Torvingen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(260, 1, 'JM Redman Micky Knight', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(261, 1, 'Jaye Maiman Robin Miller', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(262, 1, 'Sandra Scoppettone Lauren Laurano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(263, 1, 'Kate Calloway Cassidy James', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(264, 1, 'Ali Franklin Haverwood College', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(265, 1, 'KA Tracy Deadline', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(266, 1, 'Jennifer L Jordan Lauren Vellequette', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(267, 1, 'Iza Moreau Small Town', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(268, 1, 'Claire McNab Kylie Kendall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(269, 1, 'Lauren W Douglas Caitlin Reece', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(270, 1, 'Jessica Thomas Alex Peres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(271, 1, 'Saxon Bennett & Layce Gardner Jaymie Bravo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(272, 1, 'Cate Culpepper River Walker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(273, 1, 'Ellen Hart Jane Lawless', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(274, 1, 'Diane Anderson-Minshall Blind Eye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(275, 1, 'Anne Holt Hanne Wilhelmsen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(276, 1, 'Paulette Callen Command Of Silence', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(277, 1, 'Lindy Cameron Kit O\'Malley', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(278, 1, 'Val McDermid Lindsey Gordon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(279, 1, 'Elizabeth Woodcraft Frankie Richmond', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(280, 1, 'Manda Scott Dr. Kellen Stewart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(281, 1, 'Laurence Moore Kina McKevie ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(282, 1, 'Ian Hamilton Ava Lee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(283, 1, 'Keira M Telford Come, My Pet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(284, 1, 'Alexa Black Steel And Promise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(285, 1, 'Anna Keraleigh Breaking Bethany', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(286, 1, 'Winter Pennington Rosso Lussuria Vampire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(287, 1, 'Jacquotte F Kline Deep Down Inside', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(288, 1, 'Kerstin Cherry Absent In Absinthe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(289, 1, 'Yoshiyuki Ly The Scorpions\' Empress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(290, 1, 'LL Craft Abigail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(291, 1, 'Helen Atreya Alien Queen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(292, 1, 'Felicia Fox Vixen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(293, 1, 'Hildred Billings Ren\'ai Rensai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(294, 1, 'Radclyffe Shadowland', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(295, 1, 'Lorelei Elstrom Owning Regina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(296, 1, 'AL Bryce Put Me In A Skirt And Hurt Me', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(297, 1, 'Nova Black Onyx Mafia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(298, 1, 'Cari Z & Caitlin Ricci Camellia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(299, 1, 'Julia P Lynde Unwilling', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(300, 1, 'Vanessa Cardui Fan Domme', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(301, 1, 'Lesley Gowan The Collectors', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(302, 1, 'Sandra Kishi Glenn Dangerous', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(303, 1, 'Rikki de la Vega Naomi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(304, 1, 'EW Gilpine The Dorienne Institute', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(305, 1, 'Rebekah Weatherspoon At Her Feet', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(306, 1, 'Donna Jay Finding Love Down Under', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(307, 1, 'Loki Renard Mature Women', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(308, 1, 'Kim Nuala Maria\'s Story', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(309, 1, 'Stardawn Cabot Sangrian Tiger\'s Tale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(310, 1, 'Stardawn Cabot Standing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(311, 1, 'Tamara Vincent Helen\'s Cathouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(312, 1, 'Chloe Fox Beneath Her Dark Wing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(313, 1, 'Raven Burning Alexa\'s Revenge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(314, 1, 'Amelia Killian Blood Savant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(315, 1, 'Tim Gallen Nicene\'s Creed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(316, 1, 'Susanna Valent The Queen\'s Slave Woman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(317, 1, 'VW Singer Workhouse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(318, 1, 'Bradley Stoke Alif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(319, 1, 'Mira Margrave Fine Or Punishment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(320, 1, 'Debra Hyde Charlotte Olmes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(321, 1, 'Ther Renard Over Witch\'s Knee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(322, 1, 'Hanna T Corner Kitty Wishes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(323, 1, 'Elizabeth Watasin Monster Stalker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(324, 1, 'Jennifer Pelland Machine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(325, 1, 'Anastasia Vitsky Bastia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(326, 1, 'Carvel Catherway The Valley Of Lesbos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(327, 1, 'Groblek Sasha\'s Healing Womb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(328, 1, 'Carton Mellick III Razor Wire Pubic Hair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(329, 1, 'James Peter The Zombie Manifesto', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(330, 1, 'CP Brickhouse Ghula', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(331, 1, 'CL Black Stiletto Dolls', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(332, 1, 'Jody Scott The Benaroya Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(333, 1, 'Taylor Connor The End Of Everything And Anything', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(334, 1, 'Karie Adair A Lady\'s Delights', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(335, 1, 'AiM Sword Saint', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(336, 1, 'Annalinde Matichei Goldenhead', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(337, 1, 'Duen Spectral', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(338, 1, 'Ellen Galford The Fires Of Bride', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(339, 1, 'Radclyffe Hall The Well of Loneliness', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(340, 1, 'Djuna Barnes Nightwood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(341, 1, 'Patricia Highsmith The Price Of Salt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(342, 1, 'Vin Packer Spring Fire', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(343, 1, 'Pamelo Moore Chocolates For Breakfast', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(344, 1, 'Ann Bannon The Beebo Brinker Chronicles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(345, 1, 'Jane Rule Desert Of The Heart', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(346, 1, 'Isabel Miller Patience & Sarah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(347, 1, 'Rita Mae Brown Rubyfruit Jungle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(348, 1, 'Alice Walker The Color Purple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(349, 1, 'Dorothy Allison Trash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_award`
--

CREATE TABLE `book_award` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_detail`
--

CREATE TABLE `book_detail` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `book_detail`
--

INSERT INTO `book_detail` (`id`, `book_id`, `detail_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 2, 3),
(4, 2, 4),
(5, 3, 4),
(6, 3, 1),
(7, 4, 5),
(8, 4, 2),
(9, 4, 3),
(10, 5, 3),
(11, 5, 1),
(12, 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_genre`
--

CREATE TABLE `book_genre` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `direct` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `book_genre`
--

INSERT INTO `book_genre` (`id`, `book_id`, `genre_id`, `direct`) VALUES
(1, 1, 3, 1),
(2, 2, 3, 1),
(3, 3, 3, 1),
(4, 4, 3, 0),
(5, 5, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detail`
--

CREATE TABLE `detail` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detail`
--

INSERT INTO `detail` (`id`, `name`) VALUES
(1, 'Poly / \"alternative\" relationships'),
(2, 'No/little romance (by genre standards)'),
(3, 'Het, bi, ...content'),
(4, 'Fetish (not necessarily pornographic)'),
(5, 'Rape, abuse'),
(6, 'Tragedy, death'),
(7, 'Weird, bizarre'),
(8, 'Genderbender, futa, TG, ...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Scifi'),
(2, 'Space Opera & Similars'),
(3, 'Pulp & Trash'),
(4, 'Future Slice-of-Life'),
(5, 'Future Romance'),
(6, 'Pacifist Visions'),
(7, 'Space Ships & Explosions'),
(8, 'Personal Combat'),
(9, 'Dystopia'),
(10, 'Far Future'),
(11, 'Grumpy Adults'),
(12, 'Young Adult'),
(13, 'Near Future'),
(14, 'Zombiecalypse!'),
(15, 'Other Scifi'),
(16, 'Survival / Adventure'),
(17, 'Mystery'),
(18, 'Superheroes'),
(19, 'Sane Adults'),
(20, 'Young Adult'),
(21, 'Cyberpunk'),
(22, 'Fantasy'),
(23, 'Urban Fantasy'),
(24, 'Shifter'),
(25, 'Wolves'),
(26, 'Pups (YA)'),
(27, 'Others'),
(28, 'Vampires'),
(29, 'Old Adults'),
(30, 'Bit Of Both'),
(31, 'Young Adults'),
(32, 'Succubi & Other Demons'),
(33, 'Fae, Faeries & Wee Free Women'),
(34, 'Empaths & Colleagues'),
(35, 'Witches, Mages & Their Ilk'),
(36, 'Monsters & Other Creatures'),
(37, 'Ghosts, Spirits & Other Ethereals'),
(38, '(Special) Humans Are Fine, Too'),
(39, 'Epic Fantasy'),
(40, 'Steampunk / Retrofuturism'),
(41, 'Science Fantasy'),
(42, 'High Fantasy Lots of Magic!'),
(43, 'Series'),
(44, 'Stand-alone'),
(45, 'Low Fantasy No/little Magic.'),
(46, 'Dark Fantasy'),
(47, 'Other Fantasy'),
(48, 'Fairy Tale / Retellings'),
(49, 'Feminist Fantasy'),
(50, 'Time Travel, Parallel Worlds, Isekai '),
(51, 'Alternative History'),
(52, 'LitRPG, DnD And Co'),
(53, 'Romance'),
(54, '(Contemporary) Romance'),
(55, 'Comedy'),
(56, 'Generic A-meets-B'),
(57, 'Standalone'),
(58, 'Series'),
(59, 'Theme: Children'),
(60, 'Theme: Art, Food, Music Etc.'),
(61, 'Theme: Disability'),
(62, 'Theme: Crime & Criminals'),
(63, 'Theme: Star-crossed Lovers'),
(64, 'Theme: Power Gap'),
(65, 'Student/Teacher'),
(66, 'Workplace'),
(67, 'Contracts, Mix-Ups, Etc.'),
(68, 'Young Adult'),
(69, 'Polyamory'),
(70, 'Other Romance'),
(71, 'Pulp & Parodies'),
(72, 'Historical'),
(73, 'Biographical'),
(74, 'Mystery'),
(75, 'Police, FBI, Etc.'),
(76, 'US'),
(77, 'Non-US'),
(78, 'PIs, Journalists, Etc.'),
(79, 'US'),
(80, 'Investigate Personal Things'),
(81, 'Investigate The Big Stuff'),
(82, 'Investigate Small Things'),
(83, 'Investigate The Supernatural'),
(84, 'Investigate ... and only that'),
(85, 'Investigate ... with a disability'),
(86, 'Non-US'),
(87, 'Erotica'),
(88, 'Fantasy & Scifi'),
(89, 'Pure Porn'),
(90, 'Plot Porn'),
(91, 'Fetishes / Themes'),
(92, 'Vanilla'),
(93, 'BDSM'),
(94, 'S&M \"Lifestyle\"'),
(95, 'Age Play'),
(96, 'Domestic Discipline'),
(97, 'Prostitution'),
(98, 'Fucked-up Shit'),
(99, 'Weird Shit'),
(100, 'Sexy Weirdness'),
(101, 'Erotic Comedy'),
(102, 'Weird'),
(103, 'Incomprehensible'),
(104, 'Pure Weirdness'),
(105, 'Weird'),
(106, 'Incomprehensible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre_tree`
--

CREATE TABLE `genre_tree` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `direct` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genre_tree`
--

INSERT INTO `genre_tree` (`id`, `genre_id`, `parent`, `direct`) VALUES
(1, 1, NULL, 1),
(2, 22, NULL, 1),
(3, 53, NULL, 1),
(4, 74, NULL, 1),
(5, 87, NULL, 1),
(6, 99, NULL, 1),
(7, 2, 1, 1),
(8, 9, 1, 1),
(9, 15, 1, 1),
(10, 3, 2, 1),
(11, 4, 2, 1),
(12, 5, 2, 1),
(13, 6, 2, 1),
(14, 7, 2, 1),
(15, 8, 2, 1),
(16, 10, 9, 1),
(17, 13, 9, 1),
(18, 14, 9, 1),
(19, 11, 10, 1),
(20, 12, 10, 1),
(21, 16, 15, 1),
(22, 17, 15, 1),
(23, 18, 15, 0),
(24, 21, 15, 1),
(25, 20, 18, 1),
(26, 19, 18, 1),
(27, 23, 22, 1),
(28, 39, 22, 1),
(29, 47, 22, 1),
(30, 18, 23, 0),
(31, 21, 23, 0),
(32, 24, 23, 1),
(33, 28, 23, 1),
(34, 32, 23, 1),
(35, 33, 23, 1),
(36, 34, 23, 1),
(37, 35, 23, 1),
(38, 36, 23, 1),
(39, 37, 23, 1),
(40, 38, 23, 1),
(41, 25, 24, 1),
(42, 26, 24, 1),
(43, 27, 24, 1),
(44, 30, 28, 1),
(45, 31, 28, 1),
(46, 29, 28, 1),
(47, 40, 39, 1),
(48, 41, 39, 1),
(49, 42, 39, 1),
(50, 45, 39, 1),
(51, 46, 39, 1),
(52, 43, 42, 1),
(53, 44, 42, 1),
(54, 48, 47, 1),
(55, 49, 47, 1),
(56, 50, 47, 1),
(57, 51, 47, 1),
(58, 52, 47, 1),
(59, 54, 53, 1),
(60, 70, 53, 1),
(61, 55, 54, 1),
(62, 56, 54, 1),
(63, 59, 54, 1),
(64, 60, 54, 1),
(65, 61, 54, 1),
(66, 62, 54, 1),
(67, 63, 54, 1),
(68, 64, 54, 1),
(69, 68, 54, 1),
(70, 69, 54, 1),
(71, 71, 54, 0),
(72, 57, 56, 1),
(73, 58, 56, 1),
(74, 66, 64, 1),
(75, 67, 64, 1),
(76, 65, 64, 1),
(77, 71, 70, 1),
(78, 72, 70, 1),
(79, 73, 70, 1),
(80, 75, 74, 1),
(81, 78, 74, 1),
(82, 76, 75, 1),
(83, 77, 75, 1),
(84, 79, 78, 1),
(85, 86, 78, 1),
(86, 80, 79, 1),
(87, 81, 79, 1),
(88, 82, 79, 1),
(89, 83, 79, 1),
(90, 84, 79, 1),
(91, 85, 79, 1),
(92, 88, 87, 1),
(93, 91, 87, 1),
(94, 101, 87, 0),
(95, 89, 88, 1),
(96, 90, 88, 1),
(97, 92, 91, 1),
(98, 93, 91, 1),
(99, 94, 91, 1),
(100, 95, 91, 1),
(101, 96, 91, 1),
(102, 97, 91, 1),
(103, 98, 91, 1),
(104, 100, 99, 1),
(105, 104, 99, 1),
(106, 101, 100, 1),
(107, 102, 100, 1),
(108, 103, 100, 1),
(109, 106, 104, 1),
(110, 105, 104, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temp`
--

CREATE TABLE `temp` (
  `name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `temp`
--

INSERT INTO `temp` (`name`) VALUES
('select t2.name as cat, t3.name as pa, t1.direct \r\nfrom genre_tree t1 \r\nleft join genre t2 on t1.genre_id = t2.id \r\nleft join genre t3 on t1.parent = t3.id '),
('young adult, mystery?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `type`
--

INSERT INTO `type` (`id`, `name`) VALUES
(1, 'The \"best\" anon managed to find for this genre'),
(2, 'Don\'t quite fit but worth a mention'),
(3, 'Non anon picks, Awards etc.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_books__type` (`type_id`);

--
-- Indices de la tabla `book_award`
--
ALTER TABLE `book_award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_books__award` (`book_id`),
  ADD KEY `FK_award__books` (`award_id`);

--
-- Indices de la tabla `book_detail`
--
ALTER TABLE `book_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_books_detail` (`book_id`),
  ADD KEY `FK_books_detail__detail` (`detail_id`);

--
-- Indices de la tabla `book_genre`
--
ALTER TABLE `book_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_books_genre__books` (`book_id`),
  ADD KEY `FK_books_genre__genre` (`genre_id`);

--
-- Indices de la tabla `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genre_tree`
--
ALTER TABLE `genre_tree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_genre_tree__genre` (`genre_id`),
  ADD KEY `FK_genre_tree__genre_2` (`parent`);

--
-- Indices de la tabla `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT de la tabla `book_award`
--
ALTER TABLE `book_award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `book_detail`
--
ALTER TABLE `book_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `book_genre`
--
ALTER TABLE `book_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detail`
--
ALTER TABLE `detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `genre_tree`
--
ALTER TABLE `genre_tree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `FK_books__type` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);

--
-- Filtros para la tabla `book_award`
--
ALTER TABLE `book_award`
  ADD CONSTRAINT `FK_award__books` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`),
  ADD CONSTRAINT `FK_books__award` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Filtros para la tabla `book_detail`
--
ALTER TABLE `book_detail`
  ADD CONSTRAINT `FK_books_detail__books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `FK_books_detail__detail` FOREIGN KEY (`detail_id`) REFERENCES `detail` (`id`);

--
-- Filtros para la tabla `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `FK_books_genre__books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `FK_books_genre__genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Filtros para la tabla `genre_tree`
--
ALTER TABLE `genre_tree`
  ADD CONSTRAINT `FK_genre_tree__genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `FK_genre_tree__genre_2` FOREIGN KEY (`parent`) REFERENCES `genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
