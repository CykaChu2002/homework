-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Máj 23. 18:35
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `aprofoto`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `city`
--

CREATE TABLE `city` (
  `idcity` int(11) NOT NULL,
  `idcountry` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `city`
--

INSERT INTO `city` (`idcity`, `idcountry`, `name`) VALUES
(1, 1, 'Budapest'),
(2, 1, 'Kecskemét'),
(3, 1, 'Szeged'),
(4, 2, 'City one'),
(5, 2, 'City two'),
(6, 2, 'City three');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `country`
--

CREATE TABLE `country` (
  `idcountry` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `country`
--

INSERT INTO `country` (`idcountry`, `name`) VALUES
(1, 'Hungary'),
(2, 'Other country');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hirdetes_infok`
--

CREATE TABLE `hirdetes_infok` (
  `id` int(11) NOT NULL,
  `kepek_id` int(11) DEFAULT NULL,
  `telepulesek_id` int(11) DEFAULT NULL,
  `cim` varchar(128) NOT NULL,
  `fokepURL` varchar(32) DEFAULT NULL,
  `ar` int(11) NOT NULL,
  `elerheto` tinyint(1) NOT NULL,
  `feladas_datum` datetime NOT NULL DEFAULT current_timestamp(),
  `kiemelt` tinyint(1) NOT NULL,
  `mobil` varchar(32) NOT NULL,
  `email` varchar(321) NOT NULL,
  `leiras` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `hirdetes_infok`
--

INSERT INTO `hirdetes_infok` (`id`, `kepek_id`, `telepulesek_id`, `cim`, `fokepURL`, `ar`, `elerheto`, `feladas_datum`, `kiemelt`, `mobil`, `email`, `leiras`) VALUES
(26, 26, 14, 'Test', 'fokep.jpg', 13000, 1, '2023-05-23 18:34:57', 0, '06123456789', 'test@gmail.com', 'This is a test description');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `id` int(11) NOT NULL,
  `nev` varchar(16) NOT NULL,
  `kepURL` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`id`, `nev`, `kepURL`) VALUES
(1, 'Lens', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kepek`
--

CREATE TABLE `kepek` (
  `id` int(11) NOT NULL,
  `kep_string` varchar(64) NOT NULL,
  `count_kepek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kepek`
--

INSERT INTO `kepek` (`id`, `kep_string`, `count_kepek`) VALUES
(14, '0.png;', 1),
(15, '0.png;', 1),
(26, '0.jpg;', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `message`) VALUES
(56, 'Guest', 'test@gmail.com', 'Test subject', 'Test message'),
(58, 'buxi ', 'brusky137@gmail.com', 'Help', 'Segítség, hogyan tudok továbbjutni innen?\r\n');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `objektiv_bajonett`
--

CREATE TABLE `objektiv_bajonett` (
  `id` int(11) NOT NULL,
  `nev` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `objektiv_bajonett`
--

INSERT INTO `objektiv_bajonett` (`id`, `nev`) VALUES
(1, 'Canon'),
(2, 'Nikon'),
(3, 'Sony');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `objektiv_hirdetesek`
--

CREATE TABLE `objektiv_hirdetesek` (
  `id` int(11) NOT NULL,
  `hirdetes_infok_id` int(11) NOT NULL,
  `objektiv_marka_id` int(11) NOT NULL,
  `kategoriak_id` int(11) NOT NULL,
  `fix_fokusztav` tinyint(1) DEFAULT NULL,
  `min_fokusztav` int(11) DEFAULT NULL,
  `max_fokusztav` int(11) DEFAULT NULL,
  `rekesz_fix` tinyint(1) DEFAULT NULL,
  `rekesz_min` float DEFAULT NULL,
  `rekesz_max` float DEFAULT NULL,
  `stabilizator` tinyint(1) DEFAULT NULL,
  `autofokusz` tinyint(1) DEFAULT NULL,
  `bajonett_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `objektiv_marka`
--

CREATE TABLE `objektiv_marka` (
  `id` int(11) NOT NULL,
  `nev` varchar(16) NOT NULL,
  `kepURL` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `objektiv_marka`
--

INSERT INTO `objektiv_marka` (`id`, `nev`, `kepURL`) VALUES
(1, 'Canon', ''),
(2, 'Nikon', ''),
(3, 'Sigma', ''),
(4, 'Sony', ''),
(5, 'Samyang', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `telepulesek`
--

CREATE TABLE `telepulesek` (
  `id` int(11) NOT NULL,
  `nev` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `telepulesek`
--

INSERT INTO `telepulesek` (`id`, `nev`) VALUES
(1, 'Nincs adat'),
(2, 'Aba'),
(3, 'Abádszalók'),
(4, 'Abaliget'),
(5, 'Abasár'),
(6, 'Abaújalpár'),
(7, 'Abaújkér'),
(8, 'Abaújlak'),
(9, 'Abaújszántó'),
(10, 'Abaújszolnok'),
(11, 'Abaújvár'),
(12, 'Abda'),
(13, 'Abod'),
(14, 'Abony'),
(15, 'Ábrahámhegy'),
(16, 'Ács'),
(17, 'Acsa'),
(18, 'Acsád'),
(19, 'Acsalag'),
(20, 'Ácsteszér'),
(21, 'Adács'),
(22, 'Ádánd'),
(23, 'Adásztevel'),
(24, 'Adony'),
(25, 'Adorjánháza'),
(26, 'Adorjás'),
(27, 'Ág'),
(28, 'Ágasegyháza'),
(29, 'Ágfalva'),
(30, 'Aggtelek'),
(31, 'Agyagosszergény'),
(32, 'Ajak'),
(33, 'Ajka'),
(34, 'Aka'),
(35, 'Akasztó'),
(36, 'Alacska'),
(37, 'Alap'),
(38, 'Alattyán'),
(39, 'Albertirsa'),
(40, 'Alcsútdoboz'),
(41, 'Aldebrő'),
(42, 'Algyő'),
(43, 'Alibánfa'),
(44, 'Almamellék'),
(45, 'Almásfüzitő'),
(46, 'Almásháza'),
(47, 'Almáskamarás'),
(48, 'Almáskeresztúr'),
(49, 'Álmosd'),
(50, 'Alsóberecki'),
(51, 'Alsóbogát'),
(52, 'Alsódobsza'),
(53, 'Alsógagy'),
(54, 'Alsómocsolád'),
(55, 'Alsónána'),
(56, 'Alsónémedi'),
(57, 'Alsónemesapáti'),
(58, 'Alsónyék'),
(59, 'Alsóörs'),
(60, 'Alsópáhok'),
(61, 'Alsópetény'),
(62, 'Alsórajk'),
(63, 'Alsóregmec'),
(64, 'Alsószenterzsébet'),
(65, 'Alsószentiván'),
(66, 'Alsószentmárton'),
(67, 'Alsószölnök'),
(68, 'Alsószuha'),
(69, 'Alsótelekes'),
(70, 'Alsótold'),
(71, 'Alsóújlak'),
(72, 'Alsóvadász'),
(73, 'Alsózsolca'),
(74, 'Ambrózfalva'),
(75, 'Anarcs'),
(76, 'Andocs'),
(77, 'Andornaktálya'),
(78, 'Andrásfa'),
(79, 'Annavölgy'),
(80, 'Apácatorna'),
(81, 'Apagy'),
(82, 'Apaj'),
(83, 'Aparhant'),
(84, 'Apátfalva'),
(85, 'Apátistvánfalva'),
(86, 'Apátvarasd'),
(87, 'Apc'),
(88, 'Áporka'),
(89, 'Apostag'),
(90, 'Aranyosapáti'),
(91, 'Aranyosgadány'),
(92, 'Arka'),
(93, 'Arló'),
(94, 'Arnót'),
(95, 'Ároktő'),
(96, 'Árpádhalom'),
(97, 'Árpás'),
(98, 'Ártánd'),
(99, 'Ásotthalom'),
(100, 'Ásványráró'),
(101, 'Aszaló'),
(102, 'Ászár'),
(103, 'Aszód'),
(104, 'Aszófő'),
(105, 'Áta'),
(106, 'Átány'),
(107, 'Atkár'),
(108, 'Attala'),
(109, 'Babarc'),
(110, 'Babarcszőlős'),
(111, 'Babócsa'),
(112, 'Bábolna'),
(113, 'Bábonymegyer'),
(114, 'Babosdöbréte'),
(115, 'Babót'),
(116, 'Bácsalmás'),
(117, 'Bácsbokod'),
(118, 'Bácsborsód'),
(119, 'Bácsszentgyörgy'),
(120, 'Bácsszőlős'),
(121, 'Badacsonytomaj'),
(122, 'Badacsonytördemic'),
(123, 'Bag'),
(124, 'Bagamér'),
(125, 'Baglad'),
(126, 'Bagod'),
(127, 'Bágyogszovát'),
(128, 'Baj'),
(129, 'Baja'),
(130, 'Bajánsenye'),
(131, 'Bajna'),
(132, 'Bajót'),
(133, 'Bak'),
(134, 'Bakháza'),
(135, 'Bakóca'),
(136, 'Bakonszeg'),
(137, 'Bakonya'),
(138, 'Bakonybánk'),
(139, 'Bakonybél'),
(140, 'Bakonycsernye'),
(141, 'Bakonygyirót'),
(142, 'Bakonyjákó'),
(143, 'Bakonykoppány'),
(144, 'Bakonykúti'),
(145, 'Bakonynána'),
(146, 'Bakonyoszlop'),
(147, 'Bakonypéterd'),
(148, 'Bakonypölöske'),
(149, 'Bakonyság'),
(150, 'Bakonysárkány'),
(151, 'Bakonyszentiván'),
(152, 'Bakonyszentkirály'),
(153, 'Bakonyszentlászló'),
(154, 'Bakonyszombathely'),
(155, 'Bakonyszücs'),
(156, 'Bakonytamási'),
(157, 'Baks'),
(158, 'Baksa'),
(159, 'Baktakék'),
(160, 'Baktalórántháza'),
(161, 'Baktüttös'),
(162, 'Balajt'),
(163, 'Balassagyarmat'),
(164, 'Balástya'),
(165, 'Balaton'),
(166, 'Balatonakali'),
(167, 'Balatonakarattya'),
(168, 'Balatonalmádi'),
(169, 'Balatonberény'),
(170, 'Balatonboglár'),
(171, 'Balatoncsicsó'),
(172, 'Balatonederics'),
(173, 'Balatonendréd'),
(174, 'Balatonfenyves'),
(175, 'Balatonfőkajár'),
(176, 'Balatonföldvár'),
(177, 'Balatonfüred'),
(178, 'Balatonfűzfő'),
(179, 'Balatongyörök'),
(180, 'Balatonhenye'),
(181, 'Balatonkenese'),
(182, 'Balatonkeresztúr'),
(183, 'Balatonlelle'),
(184, 'Balatonmagyaród'),
(185, 'Balatonmáriafürdő'),
(186, 'Balatonőszöd'),
(187, 'Balatonrendes'),
(188, 'Balatonszabadi'),
(189, 'Balatonszárszó'),
(190, 'Balatonszemes'),
(191, 'Balatonszentgyörgy'),
(192, 'Balatonszepezd'),
(193, 'Balatonszőlős'),
(194, 'Balatonudvari'),
(195, 'Balatonújlak'),
(196, 'Balatonvilágos'),
(197, 'Balinka'),
(198, 'Balkány'),
(199, 'Ballószög'),
(200, 'Balmazújváros'),
(201, 'Balogunyom'),
(202, 'Balotaszállás'),
(203, 'Balsa'),
(204, 'Bálványos'),
(205, 'Bana'),
(206, 'Bánd'),
(207, 'Bánfa'),
(208, 'Bánhorváti'),
(209, 'Bánk'),
(210, 'Bánokszentgyörgy'),
(211, 'Bánréve'),
(212, 'Bár'),
(213, 'Barabás'),
(214, 'Baracs'),
(215, 'Baracska'),
(216, 'Báránd'),
(217, 'Baranyahídvég'),
(218, 'Baranyajenő'),
(219, 'Baranyaszentgyörgy'),
(220, 'Barbacs'),
(221, 'Barcs'),
(222, 'Bárdudvarnok'),
(223, 'Barlahida'),
(224, 'Bárna'),
(225, 'Barnag'),
(226, 'Bársonyos'),
(227, 'Basal'),
(228, 'Baskó'),
(229, 'Báta'),
(230, 'Bátaapáti'),
(231, 'Bátaszék'),
(232, 'Baté'),
(233, 'Bátmonostor'),
(234, 'Bátonyterenye'),
(235, 'Bátor'),
(236, 'Bátorliget'),
(237, 'Battonya'),
(238, 'Bátya'),
(239, 'Batyk'),
(240, 'Bázakerettye'),
(241, 'Bazsi'),
(242, 'Béb'),
(243, 'Becsehely'),
(244, 'Becske'),
(245, 'Becskeháza'),
(246, 'Becsvölgye'),
(247, 'Bedegkér'),
(248, 'Bedő'),
(249, 'Bejcgyertyános'),
(250, 'Békás'),
(251, 'Bekecs'),
(252, 'Békés'),
(253, 'Békéscsaba'),
(254, 'Békéssámson'),
(255, 'Békésszentandrás'),
(256, 'Bekölce'),
(257, 'Bélapátfalva'),
(258, 'Bélavár'),
(259, 'Belecska'),
(260, 'Beled'),
(261, 'Beleg'),
(262, 'Belezna'),
(263, 'Bélmegyer'),
(264, 'Beloiannisz'),
(265, 'Belsősárd'),
(266, 'Belvárdgyula'),
(267, 'Benk'),
(268, 'Bénye'),
(269, 'Bér'),
(270, 'Bérbaltavár'),
(271, 'Bercel'),
(272, 'Beregdaróc'),
(273, 'Beregsurány'),
(274, 'Berekböszörmény'),
(275, 'Berekfürdő'),
(276, 'Beremend'),
(277, 'Berente'),
(278, 'Beret'),
(279, 'Berettyóújfalu'),
(280, 'Berhida'),
(281, 'Berkenye'),
(282, 'Berkesd'),
(283, 'Berkesz'),
(284, 'Bernecebaráti'),
(285, 'Berzék'),
(286, 'Berzence'),
(287, 'Besence'),
(288, 'Besenyőd'),
(289, 'Besenyőtelek'),
(290, 'Besenyszög'),
(291, 'Besnyő'),
(292, 'Beszterec'),
(293, 'Bezedek'),
(294, 'Bezenye'),
(295, 'Bezeréd'),
(296, 'Bezi'),
(297, 'Biatorbágy'),
(298, 'Bicsérd'),
(299, 'Bicske'),
(300, 'Bihardancsháza'),
(301, 'Biharkeresztes'),
(302, 'Biharnagybajom'),
(303, 'Bihartorda'),
(304, 'Biharugra'),
(305, 'Bikács'),
(306, 'Bikal'),
(307, 'Biri'),
(308, 'Birján'),
(309, 'Bisse'),
(310, 'Boba'),
(311, 'Bocfölde'),
(312, 'Boconád'),
(313, 'Bócsa'),
(314, 'Bocska'),
(315, 'Bocskaikert'),
(316, 'Boda'),
(317, 'Bodajk'),
(318, 'Bodmér'),
(319, 'Bodolyabér'),
(320, 'Bodonhely'),
(321, 'Bodony'),
(322, 'Bodorfa'),
(323, 'Bodrog'),
(324, 'Bodroghalom'),
(325, 'Bodrogkeresztúr'),
(326, 'Bodrogkisfalud'),
(327, 'Bodrogolaszi'),
(328, 'Bódvalenke'),
(329, 'Bódvarákó'),
(330, 'Bódvaszilas'),
(331, 'Bogács'),
(332, 'Bogád'),
(333, 'Bogádmindszent'),
(334, 'Bogdása'),
(335, 'Bogyiszló'),
(336, 'Bogyoszló'),
(337, 'Bojt'),
(338, 'Bókaháza'),
(339, 'Bokod'),
(340, 'Bokor'),
(341, 'Boldog'),
(342, 'Boldogasszonyfa'),
(343, 'Boldogkőújfalu'),
(344, 'Boldogkőváralja'),
(345, 'Boldva'),
(346, 'Bolhás'),
(347, 'Bolhó'),
(348, 'Bóly'),
(349, 'Boncodfölde'),
(350, 'Bonyhád'),
(351, 'Bonyhádvarasd'),
(352, 'Bonnya'),
(353, 'Bordány'),
(354, 'Borgáta'),
(355, 'Borjád'),
(356, 'Borota'),
(357, 'Borsfa'),
(358, 'Borsodbóta'),
(359, 'Borsodgeszt'),
(360, 'Borsodivánka'),
(361, 'Borsodnádasd'),
(362, 'Borsodszentgyörgy'),
(363, 'Borsodszirák'),
(364, 'Borsosberény'),
(365, 'Borszörcsök'),
(366, 'Borzavár'),
(367, 'Bosta'),
(368, 'Botpalád'),
(369, 'Botykapeterd'),
(370, 'Bozzai'),
(371, 'Bozsok'),
(372, 'Bózsva'),
(373, 'Bő'),
(374, 'Bőcs'),
(375, 'Böde'),
(376, 'Bödeháza'),
(377, 'Bögöt'),
(378, 'Bögöte'),
(379, 'Böhönye'),
(380, 'Bököny'),
(381, 'Bölcske'),
(382, 'Bőny'),
(383, 'Börcs'),
(384, 'Börzönce'),
(385, 'Bősárkány'),
(386, 'Bőszénfa'),
(387, 'Bucsa'),
(388, 'Bucsu'),
(389, 'Búcsúszentlászló'),
(390, 'Bucsuta'),
(391, 'Budajenő'),
(392, 'Budakalász'),
(393, 'Budakeszi'),
(394, 'Budaörs'),
(395, 'Budapest'),
(396, 'Budapest 01. ker.'),
(397, 'Budapest 02. ker.'),
(398, 'Budapest 03. ker.'),
(399, 'Budapest 04. ker.'),
(400, 'Budapest 05. ker.'),
(401, 'Budapest 06. ker.'),
(402, 'Budapest 07. ker.'),
(403, 'Budapest 08. ker.'),
(404, 'Budapest 09. ker.'),
(405, 'Budapest 10. ker.'),
(406, 'Budapest 11. ker.'),
(407, 'Budapest 12. ker.'),
(408, 'Budapest 13. ker.'),
(409, 'Budapest 14. ker.'),
(410, 'Budapest 15. ker.'),
(411, 'Budapest 16. ker.'),
(412, 'Budapest 17. ker.'),
(413, 'Budapest 18. ker.'),
(414, 'Budapest 19. ker.'),
(415, 'Budapest 20. ker.'),
(416, 'Budapest 21. ker.'),
(417, 'Budapest 22. ker.'),
(418, 'Budapest 23. ker.'),
(419, 'Bugac'),
(420, 'Bugacpusztaháza'),
(421, 'Bugyi'),
(422, 'Buj'),
(423, 'Buják'),
(424, 'Buzsák'),
(425, 'Bük'),
(426, 'Bükkábrány'),
(427, 'Bükkaranyos'),
(428, 'Bükkmogyorósd'),
(429, 'Bükkösd'),
(430, 'Bükkszék'),
(431, 'Bükkszenterzsébet'),
(432, 'Bükkszentkereszt'),
(433, 'Bükkszentmárton'),
(434, 'Bükkzsérc'),
(435, 'Bürüs'),
(436, 'Büssü'),
(437, 'Büttös'),
(438, 'Cák'),
(439, 'Cakóháza'),
(440, 'Cece'),
(441, 'Cégénydányád'),
(442, 'Cegléd'),
(443, 'Ceglédbercel'),
(444, 'Celldömölk'),
(445, 'Cered'),
(446, 'Chernelházadamonya'),
(447, 'Cibakháza'),
(448, 'Cigánd'),
(449, 'Cikó'),
(450, 'Cirák'),
(451, 'Cún'),
(452, 'Csabacsűd'),
(453, 'Csabaszabadi'),
(454, 'Csabdi'),
(455, 'Csabrendek'),
(456, 'Csáfordjánosfa'),
(457, 'Csaholc'),
(458, 'Csajág'),
(459, 'Csákány'),
(460, 'Csákánydoroszló'),
(461, 'Csákberény'),
(462, 'Csákvár'),
(463, 'Csanádalberti'),
(464, 'Csanádapáca'),
(465, 'Csanádpalota'),
(466, 'Csánig'),
(467, 'Csány'),
(468, 'Csányoszró'),
(469, 'Csanytelek'),
(470, 'Csapi'),
(471, 'Csapod'),
(472, 'Csárdaszállás'),
(473, 'Csarnóta'),
(474, 'Csaroda'),
(475, 'Császár'),
(476, 'Császártöltés'),
(477, 'Császló'),
(478, 'Csátalja'),
(479, 'Csatár'),
(480, 'Csataszög'),
(481, 'Csatka'),
(482, 'Csávoly'),
(483, 'Csebény'),
(484, 'Csécse'),
(485, 'Csegöld'),
(486, 'Csehbánya'),
(487, 'Csehi'),
(488, 'Csehimindszent'),
(489, 'Csém'),
(490, 'Csemő'),
(491, 'Csempeszkopács'),
(492, 'Csengele'),
(493, 'Csenger'),
(494, 'Csengersima'),
(495, 'Csengerújfalu'),
(496, 'Csengőd'),
(497, 'Csénye'),
(498, 'Csenyéte'),
(499, 'Csép'),
(500, 'Csépa'),
(501, 'Csepreg'),
(502, 'Csér'),
(503, 'Cserdi'),
(504, 'Cserénfa'),
(505, 'Cserépfalu'),
(506, 'Cserépváralja'),
(507, 'Cserháthaláp'),
(508, 'Cserhátsurány'),
(509, 'Cserhátszentiván'),
(510, 'Cserkeszőlő'),
(511, 'Cserkút'),
(512, 'Csernely'),
(513, 'Cserszegtomaj'),
(514, 'Csertalakos'),
(515, 'Csertő'),
(516, 'Csesznek'),
(517, 'Csesztreg'),
(518, 'Csesztve'),
(519, 'Csetény'),
(520, 'Csévharaszt'),
(521, 'Csibrák'),
(522, 'Csikéria'),
(523, 'Csikóstőttős'),
(524, 'Csikvánd'),
(525, 'Csincse'),
(526, 'Csipkerek'),
(527, 'Csitár'),
(528, 'Csobád'),
(529, 'Csobaj'),
(530, 'Csobánka'),
(531, 'Csókakő'),
(532, 'Csokonyavisonta'),
(533, 'Csokvaomány'),
(534, 'Csolnok'),
(535, 'Csólyospálos'),
(536, 'Csoma'),
(537, 'Csomád'),
(538, 'Csombárd'),
(539, 'Csongrád'),
(540, 'Csonkahegyhát'),
(541, 'Csonkamindszent'),
(542, 'Csopak'),
(543, 'Csór'),
(544, 'Csorna'),
(545, 'Csorvás'),
(546, 'Csót'),
(547, 'Csöde'),
(548, 'Csögle'),
(549, 'Csökmő'),
(550, 'Csököly'),
(551, 'Csömend'),
(552, 'Csömödér'),
(553, 'Csömör'),
(554, 'Csönge'),
(555, 'Csörnyeföld'),
(556, 'Csörög'),
(557, 'Csörötnek'),
(558, 'Csősz'),
(559, 'Csővár'),
(560, 'Csurgó'),
(561, 'Csurgónagymarton'),
(562, 'Dabas'),
(563, 'Dabronc'),
(564, 'Dabrony'),
(565, 'Dad'),
(566, 'Dág'),
(567, 'Dáka'),
(568, 'Dalmand'),
(569, 'Damak'),
(570, 'Dámóc'),
(571, 'Dánszentmiklós'),
(572, 'Dány'),
(573, 'Daraboshegy'),
(574, 'Darány'),
(575, 'Darnó'),
(576, 'Darnózseli'),
(577, 'Daruszentmiklós'),
(578, 'Darvas'),
(579, 'Dávod'),
(580, 'Debercsény'),
(581, 'Debrecen'),
(582, 'Debréte'),
(583, 'Decs'),
(584, 'Dédestapolcsány'),
(585, 'Dég'),
(586, 'Dejtár'),
(587, 'Délegyháza'),
(588, 'Demecser'),
(589, 'Demjén'),
(590, 'Dencsháza'),
(591, 'Dénesfa'),
(592, 'Derecske'),
(593, 'Derekegyház'),
(594, 'Deszk'),
(595, 'Detek'),
(596, 'Detk'),
(597, 'Dévaványa'),
(598, 'Devecser'),
(599, 'Dinnyeberki'),
(600, 'Diósberény'),
(601, 'Diósd'),
(602, 'Diósjenő'),
(603, 'Dióskál'),
(604, 'Diósviszló'),
(605, 'Doba'),
(606, 'Doboz'),
(607, 'Dobri'),
(608, 'Dobronhegy'),
(609, 'Dóc'),
(610, 'Domaháza'),
(611, 'Domaszék'),
(612, 'Dombegyház'),
(613, 'Dombiratos'),
(614, 'Dombóvár'),
(615, 'Dombrád'),
(616, 'Domony'),
(617, 'Domoszló'),
(618, 'Dormánd'),
(619, 'Dorog'),
(620, 'Dorogháza'),
(621, 'Dozmat'),
(622, 'Döbörhegy'),
(623, 'Döbröce'),
(624, 'Döbrököz'),
(625, 'Döbrönte'),
(626, 'Döge'),
(627, 'Dömös'),
(628, 'Dömsöd'),
(629, 'Dör'),
(630, 'Dörgicse'),
(631, 'Döröske'),
(632, 'Dötk'),
(633, 'Dövény'),
(634, 'Drágszél'),
(635, 'Drávacsehi'),
(636, 'Drávacsepely'),
(637, 'Drávafok'),
(638, 'Drávagárdony'),
(639, 'Drávaiványi'),
(640, 'Drávakeresztúr'),
(641, 'Drávapalkonya'),
(642, 'Drávapiski'),
(643, 'Drávaszabolcs'),
(644, 'Drávaszerdahely'),
(645, 'Drávasztára'),
(646, 'Drávatamási'),
(647, 'Drégelypalánk'),
(648, 'Dubicsány'),
(649, 'Dudar'),
(650, 'Duka'),
(651, 'Dunaalmás'),
(652, 'Dunabogdány'),
(653, 'Dunaegyháza'),
(654, 'Dunafalva'),
(655, 'Dunaföldvár'),
(656, 'Dunaharaszti'),
(657, 'Dunakeszi'),
(658, 'Dunakiliti'),
(659, 'Dunapataj'),
(660, 'Dunaremete'),
(661, 'Dunaszeg'),
(662, 'Dunaszekcső'),
(663, 'Dunaszentbenedek'),
(664, 'Dunaszentgyörgy'),
(665, 'Dunaszentmiklós'),
(666, 'Dunaszentpál'),
(667, 'Dunasziget'),
(668, 'Dunatetétlen'),
(669, 'Dunaújváros'),
(670, 'Dunavarsány'),
(671, 'Dunavecse'),
(672, 'Dusnok'),
(673, 'Dúzs'),
(674, 'Ebergőc'),
(675, 'Ebes'),
(676, 'Écs'),
(677, 'Ecséd'),
(678, 'Ecseg'),
(679, 'Ecsegfalva'),
(680, 'Ecseny'),
(681, 'Ecser'),
(682, 'Edde'),
(683, 'Edelény'),
(684, 'Edve'),
(685, 'Eger'),
(686, 'Egerág'),
(687, 'Egeralja'),
(688, 'Egeraracsa'),
(689, 'Egerbakta'),
(690, 'Egerbocs'),
(691, 'Egercsehi'),
(692, 'Egerfarmos'),
(693, 'Egerlövő'),
(694, 'Egerszalók'),
(695, 'Egerszólát'),
(696, 'Égerszög'),
(697, 'Egervár'),
(698, 'Egervölgy'),
(699, 'Egyed'),
(700, 'Egyek'),
(701, 'Egyházasdengeleg'),
(702, 'Egyházasfalu'),
(703, 'Egyházasgerge'),
(704, 'Egyházasharaszti'),
(705, 'Egyházashetye'),
(706, 'Egyházashollós'),
(707, 'Egyházaskesző'),
(708, 'Egyházaskozár'),
(709, 'Egyházasrádóc'),
(710, 'Elek'),
(711, 'Ellend'),
(712, 'Előszállás'),
(713, 'Emőd'),
(714, 'Encs'),
(715, 'Encsencs'),
(716, 'Endrefalva'),
(717, 'Endrőc'),
(718, 'Enese'),
(719, 'Enying'),
(720, 'Eperjes'),
(721, 'Eperjeske'),
(722, 'Eplény'),
(723, 'Epöl'),
(724, 'Ercsi'),
(725, 'Érd'),
(726, 'Erdőbénye'),
(727, 'Erdőhorváti'),
(728, 'Erdőkertes'),
(729, 'Erdőkövesd'),
(730, 'Erdőkürt'),
(731, 'Erdősmárok'),
(732, 'Erdősmecske'),
(733, 'Erdőtarcsa'),
(734, 'Erdőtelek'),
(735, 'Erk'),
(736, 'Érpatak'),
(737, 'Érsekcsanád'),
(738, 'Érsekhalma'),
(739, 'Érsekvadkert'),
(740, 'Értény'),
(741, 'Erzsébet'),
(742, 'Esztár'),
(743, 'Eszteregnye'),
(744, 'Esztergályhorváti'),
(745, 'Esztergom'),
(746, 'Ete'),
(747, 'Etes'),
(748, 'Etyek'),
(749, 'Fábiánháza'),
(750, 'Fábiánsebestyén'),
(751, 'Fácánkert'),
(752, 'Fadd'),
(753, 'Fáj'),
(754, 'Fajsz'),
(755, 'Fancsal'),
(756, 'Farád'),
(757, 'Farkasgyepű'),
(758, 'Farkaslyuk'),
(759, 'Farmos'),
(760, 'Fazekasboda'),
(761, 'Fedémes'),
(762, 'Fegyvernek'),
(763, 'Fehérgyarmat'),
(764, 'Fehértó'),
(765, 'Fehérvárcsurgó'),
(766, 'Feked'),
(767, 'Feketeerdő'),
(768, 'Felcsút'),
(769, 'Feldebrő'),
(770, 'Felgyő'),
(771, 'Felpéc'),
(772, 'Felsőberecki'),
(773, 'Felsőcsatár'),
(774, 'Felsődobsza'),
(775, 'Felsőegerszeg'),
(776, 'Felsőgagy'),
(777, 'Felsőjánosfa'),
(778, 'Felsőkelecsény'),
(779, 'Felsőlajos'),
(780, 'Felsőmarác'),
(781, 'Felsőmocsolád'),
(782, 'Felsőnána'),
(783, 'Felsőnyárád'),
(784, 'Felsőnyék'),
(785, 'Felsőörs'),
(786, 'Felsőpáhok'),
(787, 'Felsőpakony'),
(788, 'Felsőpetény'),
(789, 'Felsőrajk'),
(790, 'Felsőregmec'),
(791, 'Felsőszenterzsébet'),
(792, 'Felsőszentiván'),
(793, 'Felsőszentmárton'),
(794, 'Felsőszölnök'),
(795, 'Felsőtárkány'),
(796, 'Felsőtelekes'),
(797, 'Felsőtold'),
(798, 'Felsővadász'),
(799, 'Felsőzsolca'),
(800, 'Fényeslitke'),
(801, 'Fenyőfő'),
(802, 'Ferencszállás'),
(803, 'Fertőboz'),
(804, 'Fertőd'),
(805, 'Fertőendréd'),
(806, 'Fertőhomok'),
(807, 'Fertőrákos'),
(808, 'Fertőszentmiklós'),
(809, 'Fertőszéplak'),
(810, 'Fiad'),
(811, 'Filkeháza'),
(812, 'Fityeház'),
(813, 'Foktő'),
(814, 'Folyás'),
(815, 'Fonó'),
(816, 'Fony'),
(817, 'Fonyód'),
(818, 'Forráskút'),
(819, 'Forró'),
(820, 'Fót'),
(821, 'Földeák'),
(822, 'Földes'),
(823, 'Főnyed'),
(824, 'Fulókércs'),
(825, 'Furta'),
(826, 'Füle'),
(827, 'Fülesd'),
(828, 'Fülöp'),
(829, 'Fülöpháza'),
(830, 'Fülöpjakab'),
(831, 'Fülöpszállás'),
(832, 'Fülpösdaróc'),
(833, 'Fürged'),
(834, 'Füzér'),
(835, 'Füzérkajata'),
(836, 'Füzérkomlós'),
(837, 'Füzérradvány'),
(838, 'Füzesabony'),
(839, 'Füzesgyarmat'),
(840, 'Fűzvölgy'),
(841, 'Gáborján'),
(842, 'Gáborjánháza'),
(843, 'Gacsály'),
(844, 'Gadács'),
(845, 'Gadány'),
(846, 'Gadna'),
(847, 'Gádoros'),
(848, 'Gagyapáti'),
(849, 'Gagybátor'),
(850, 'Gagyvendégi'),
(851, 'Galambok'),
(852, 'Galgaguta'),
(853, 'Galgagyörk'),
(854, 'Galgahévíz'),
(855, 'Galgamácsa'),
(856, 'Gálosfa'),
(857, 'Galvács'),
(858, 'Gamás'),
(859, 'Ganna'),
(860, 'Gánt'),
(861, 'Gara'),
(862, 'Garáb'),
(863, 'Garabonc'),
(864, 'Garadna'),
(865, 'Garbolc'),
(866, 'Gárdony'),
(867, 'Garé'),
(868, 'Gasztony'),
(869, 'Gátér'),
(870, 'Gávavencsellő'),
(871, 'Géberjén'),
(872, 'Gecse'),
(873, 'Géderlak'),
(874, 'Gégény'),
(875, 'Gelej'),
(876, 'Gelénes'),
(877, 'Gellénháza'),
(878, 'Gelse'),
(879, 'Gelsesziget'),
(880, 'Gemzse'),
(881, 'Gencsapáti'),
(882, 'Gérce'),
(883, 'Gerde'),
(884, 'Gerendás'),
(885, 'Gerényes'),
(886, 'Geresdlak'),
(887, 'Gerjen'),
(888, 'Gersekarát'),
(889, 'Geszt'),
(890, 'Gesztely'),
(891, 'Geszteréd'),
(892, 'Gétye'),
(893, 'Gibárt'),
(894, 'Gic'),
(895, 'Gige'),
(896, 'Gilvánfa'),
(897, 'Girincs'),
(898, 'Gógánfa'),
(899, 'Golop'),
(900, 'Gomba'),
(901, 'Gombosszeg'),
(902, 'Gór'),
(903, 'Gordisa'),
(904, 'Gosztola'),
(905, 'Göd'),
(906, 'Gödöllő'),
(907, 'Gödre'),
(908, 'Gölle'),
(909, 'Gömörszőlős'),
(910, 'Gönc'),
(911, 'Göncruszka'),
(912, 'Gönyű'),
(913, 'Görbeháza'),
(914, 'Görcsöny'),
(915, 'Görcsönydoboka'),
(916, 'Görgeteg'),
(917, 'Gősfa'),
(918, 'Grábóc'),
(919, 'Gulács'),
(920, 'Gutorfölde'),
(921, 'Gyál'),
(922, 'Gyalóka'),
(923, 'Gyanógeregye'),
(924, 'Gyarmat'),
(925, 'Gyékényes'),
(926, 'Gyenesdiás'),
(927, 'Gyepükaján'),
(928, 'Gyermely'),
(929, 'Gyód'),
(930, 'Gyomaendrőd'),
(931, 'Gyóró'),
(932, 'Gyömöre'),
(933, 'Gyömrő'),
(934, 'Gyöngyfa'),
(935, 'Gyöngyös'),
(936, 'Gyöngyösfalu'),
(937, 'Gyöngyöshalász'),
(938, 'Gyöngyösmellék'),
(939, 'Gyöngyösoroszi'),
(940, 'Gyöngyöspata'),
(941, 'Gyöngyössolymos'),
(942, 'Gyöngyöstarján'),
(943, 'Gyönk'),
(944, 'Győr'),
(945, 'Győrasszonyfa'),
(946, 'Györe'),
(947, 'Györgytarló'),
(948, 'Györköny'),
(949, 'Győrladamér'),
(950, 'Győröcske'),
(951, 'Győrság'),
(952, 'Győrsövényház'),
(953, 'Győrszemere'),
(954, 'Győrtelek'),
(955, 'Győrújbarát'),
(956, 'Győrújfalu'),
(957, 'Győrvár'),
(958, 'Győrzámoly'),
(959, 'Gyugy'),
(960, 'Gyula'),
(961, 'Gyulaháza'),
(962, 'Gyulaj'),
(963, 'Gyulakeszi'),
(964, 'Gyúró'),
(965, 'Gyügye'),
(966, 'Gyüre'),
(967, 'Gyűrűs'),
(968, 'Hács'),
(969, 'Hagyárosbörönd'),
(970, 'Hahót'),
(971, 'Hajdúbagos'),
(972, 'Hajdúböszörmény'),
(973, 'Hajdúdorog'),
(974, 'Hajdúhadház'),
(975, 'Hajdúnánás'),
(976, 'Hajdúsámson'),
(977, 'Hajdúszoboszló'),
(978, 'Hajdúszovát'),
(979, 'Hajmás'),
(980, 'Hajmáskér'),
(981, 'Hajós'),
(982, 'Halastó'),
(983, 'Halászi'),
(984, 'Halásztelek'),
(985, 'Halimba'),
(986, 'Halmaj'),
(987, 'Halmajugra'),
(988, 'Halogy'),
(989, 'Hangács'),
(990, 'Hangony'),
(991, 'Hantos'),
(992, 'Harasztifalu'),
(993, 'Harc'),
(994, 'Harka'),
(995, 'Harkakötöny'),
(996, 'Harkány'),
(997, 'Háromfa'),
(998, 'Háromhuta'),
(999, 'Harsány'),
(1000, 'Hárskút'),
(1001, 'Harta'),
(1002, 'Hásságy'),
(1003, 'Hatvan'),
(1004, 'Hédervár'),
(1005, 'Hedrehely'),
(1006, 'Hegyesd'),
(1007, 'Hegyeshalom'),
(1008, 'Hegyfalu'),
(1009, 'Hegyháthodász'),
(1010, 'Hegyhátmaróc'),
(1011, 'Hegyhátsál'),
(1012, 'Hegyhátszentjakab'),
(1013, 'Hegyhátszentmárton'),
(1014, 'Hegyhátszentpéter'),
(1015, 'Hegykő'),
(1016, 'Hegymagas'),
(1017, 'Hegymeg'),
(1018, 'Hegyszentmárton'),
(1019, 'Héhalom'),
(1020, 'Hejce'),
(1021, 'Hejőbába'),
(1022, 'Hejőkeresztúr'),
(1023, 'Hejőkürt'),
(1024, 'Hejőpapi'),
(1025, 'Hejőszalonta'),
(1026, 'Helesfa'),
(1027, 'Helvécia'),
(1028, 'Hencida'),
(1029, 'Hencse'),
(1030, 'Herceghalom'),
(1031, 'Hercegkút'),
(1032, 'Hercegszántó'),
(1033, 'Heréd'),
(1034, 'Héreg'),
(1035, 'Herencsény'),
(1036, 'Herend'),
(1037, 'Heresznye'),
(1038, 'Hermánszeg'),
(1039, 'Hernád'),
(1040, 'Hernádbűd'),
(1041, 'Hernádcéce'),
(1042, 'Hernádkak'),
(1043, 'Hernádkércs'),
(1044, 'Hernádnémeti'),
(1045, 'Hernádpetri'),
(1046, 'Hernádszentandrás'),
(1047, 'Hernádszurdok'),
(1048, 'Hernádvécse'),
(1049, 'Hernyék'),
(1050, 'Hét'),
(1051, 'Hetefejércse'),
(1052, 'Hetes'),
(1053, 'Hetvehely'),
(1054, 'Hetyefő'),
(1055, 'Heves'),
(1056, 'Hevesaranyos'),
(1057, 'Hevesvezekény'),
(1058, 'Hévíz'),
(1059, 'Hévízgyörk'),
(1060, 'Hidas'),
(1061, 'Hidasnémeti'),
(1062, 'Hidegkút'),
(1063, 'Hidegség'),
(1064, 'Hidvégardó'),
(1065, 'Himesháza'),
(1066, 'Himod'),
(1067, 'Hirics'),
(1068, 'Hobol'),
(1069, 'Hodász'),
(1070, 'Hódmezővásárhely'),
(1071, 'Hollád'),
(1072, 'Hollóháza'),
(1073, 'Hollókő'),
(1074, 'Homokbödöge'),
(1075, 'Homokkomárom'),
(1076, 'Homokmégy'),
(1077, 'Homokszentgyörgy'),
(1078, 'Homorúd'),
(1079, 'Homrogd'),
(1080, 'Hont'),
(1081, 'Horpács'),
(1082, 'Hort'),
(1083, 'Hortobágy'),
(1084, 'Horváthertelend'),
(1085, 'Horvátlövő'),
(1086, 'Horvátzsidány'),
(1087, 'Hosszúhetény'),
(1088, 'Hosszúpályi'),
(1089, 'Hosszúpereszteg'),
(1090, 'Hosszúvíz'),
(1091, 'Hosszúvölgy'),
(1092, 'Hosztót'),
(1093, 'Hottó'),
(1094, 'Hőgyész'),
(1095, 'Hövej'),
(1096, 'Hugyag'),
(1097, 'Hunya'),
(1098, 'Hunyadfalva'),
(1099, 'Husztót'),
(1100, 'Ibafa'),
(1101, 'Iborfia');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `university`
--

CREATE TABLE `university` (
  `iduniversity` int(11) NOT NULL,
  `idcity` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `telefon` varchar(11) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `university`
--

INSERT INTO `university` (`iduniversity`, `idcity`, `name`, `address`, `telefon`, `email`) VALUES
(1, 1, 'ELTE', 'Address1', '0611111111', 'elte@mail.hu'),
(2, 1, 'BME', 'Address12', '0612222222', 'bme@mail.hu'),
(3, 1, 'BGE', 'Address13', '0613333333', 'bge@mail.hu'),
(4, 2, 'NJE', 'Address14', '0676444444', 'nje@mail.hu'),
(5, 3, 'SZE', 'Address15', '0662555555', 'sze@mail.hu'),
(6, 3, 'Other', 'Address16', '0662666666', 'mas@mail.hu');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(45) NOT NULL DEFAULT '',
  `last_name` varchar(45) NOT NULL DEFAULT '',
  `user_name` varchar(12) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`) VALUES
(1, 'FirstName_1', 'LastName_1', 'Login1', 'd4b90f2dfafc736205a98bf3ae6541431bc77d8e'),
(2, 'FirstName_2', 'LastName_2', 'Login2', '6cf8efacae19431476020c1e2ebd2d8acca8f5c0'),
(3, 'FirstName_3', 'LastName_3', 'Login3', 'df4d8ad070f0d1585e172a2150038df5cc6c891a'),
(4, 'FirstName_4', 'LastName_4', 'Login4', 'b020c308c155d6bbd7eb7d27bd30c0573acbba5b'),
(5, 'FirstName_5', 'LastName_5', 'Login5', '9ab1a4743b30b5e9c037e6a645f0cfee80fb41d4'),
(6, 'FirstName_6', 'LastName_6', 'Login6', '7ca01f28594b1a06239b1d96fc716477d198470b'),
(7, 'FirstName_7', 'LastName_7', 'Login7', '41ad7e5406d8f1af2deef2ade4753009976328f8'),
(8, 'FirstName_8', 'LastName_8', 'Login8', '3a340fe3599746234ef89591e372d4dd8b590053'),
(9, 'FirstName_9', 'LastName_9', 'Login9', 'c0298f7d314ecbc5651da5679a0a240833a88238'),
(10, 'FirstName_10', 'LastName_10', 'Login10', 'a477427c183664b57f977661ac3167b64823f366'),
(11, 'FirstName_11', 'LastName_11', 'Login11', '6c7e2151d33968a02198f7e2073b1d7b9ee65ed9'),
(12, 'FirstName_12', 'LastName_12', 'Login12', '0722b3651be10eeb8df39cced958b74a98d18ce3'),
(25, 'firstname_test', 'lastname_test', 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(24, 'Földvári', 'Rómeó', 'buxi', 'c8499454bada15f6d76bbf8cf133960f93f9b4eb');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`idcity`);

--
-- A tábla indexei `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`idcountry`);

--
-- A tábla indexei `hirdetes_infok`
--
ALTER TABLE `hirdetes_infok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kepek_id` (`kepek_id`),
  ADD KEY `telepulesek_id` (`telepulesek_id`),
  ADD KEY `kepek_id_2` (`kepek_id`);

--
-- A tábla indexei `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kepek`
--
ALTER TABLE `kepek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `objektiv_bajonett`
--
ALTER TABLE `objektiv_bajonett`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `objektiv_hirdetesek`
--
ALTER TABLE `objektiv_hirdetesek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `objektiv_marka_id` (`objektiv_marka_id`,`kategoriak_id`,`bajonett_id`),
  ADD KEY `bajonett_id` (`bajonett_id`),
  ADD KEY `kategoriak_id` (`kategoriak_id`),
  ADD KEY `hirdetes_infok_id` (`hirdetes_infok_id`);

--
-- A tábla indexei `objektiv_marka`
--
ALTER TABLE `objektiv_marka`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `telepulesek`
--
ALTER TABLE `telepulesek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`iduniversity`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `city`
--
ALTER TABLE `city`
  MODIFY `idcity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `country`
--
ALTER TABLE `country`
  MODIFY `idcountry` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `hirdetes_infok`
--
ALTER TABLE `hirdetes_infok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT a táblához `kategoriak`
--
ALTER TABLE `kategoriak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `kepek`
--
ALTER TABLE `kepek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT a táblához `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT a táblához `objektiv_bajonett`
--
ALTER TABLE `objektiv_bajonett`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `objektiv_hirdetesek`
--
ALTER TABLE `objektiv_hirdetesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `objektiv_marka`
--
ALTER TABLE `objektiv_marka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `telepulesek`
--
ALTER TABLE `telepulesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1102;

--
-- AUTO_INCREMENT a táblához `university`
--
ALTER TABLE `university`
  MODIFY `iduniversity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `hirdetes_infok`
--
ALTER TABLE `hirdetes_infok`
  ADD CONSTRAINT `hirdetes_infok_ibfk_2` FOREIGN KEY (`kepek_id`) REFERENCES `kepek` (`id`),
  ADD CONSTRAINT `hirdetes_infok_ibfk_3` FOREIGN KEY (`telepulesek_id`) REFERENCES `telepulesek` (`id`);

--
-- Megkötések a táblához `objektiv_hirdetesek`
--
ALTER TABLE `objektiv_hirdetesek`
  ADD CONSTRAINT `objektiv_hirdetesek_ibfk_1` FOREIGN KEY (`objektiv_marka_id`) REFERENCES `objektiv_marka` (`id`),
  ADD CONSTRAINT `objektiv_hirdetesek_ibfk_2` FOREIGN KEY (`bajonett_id`) REFERENCES `objektiv_bajonett` (`id`),
  ADD CONSTRAINT `objektiv_hirdetesek_ibfk_4` FOREIGN KEY (`kategoriak_id`) REFERENCES `kategoriak` (`id`),
  ADD CONSTRAINT `objektiv_hirdetesek_ibfk_5` FOREIGN KEY (`hirdetes_infok_id`) REFERENCES `hirdetes_infok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
