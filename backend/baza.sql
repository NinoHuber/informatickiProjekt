-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2025 at 07:51 PM
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
-- Database: `joygame`
--

-- --------------------------------------------------------

--
-- Table structure for table `igre`
--

CREATE TABLE `igre` (
  `ID` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `year` int(4) NOT NULL,
  `genres` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `igre`
--

INSERT INTO `igre` (`ID`, `title`, `description`, `year`, `genres`) VALUES
(1, 'ELDEN RING NIGHTREIGN', 'ELDEN RING NIGHTREIGN is a standalone adventure within the ELDEN RING universe, crafted to offer players a new gaming experience by reimagining the game’s core design. ', 2025, 'Souls-like, Multiplayer'),
(2, 'Black Myth: Wukong', 'Black Myth: Wukong is an action RPG rooted in Chinese mythology. You shall set out as the Destined One to venture into the challenges and marvels ahead, to uncover the obscured truth beneath the veil of a glorious legend from the past. ', 2024, 'Action, Mythology'),
(3, 'Tom Clancy\'s Rainbow Six Siege', 'Rainbow Six Siege X is the reference in tactical team shooters, where elite strategy and execution triumph. Enjoy free access to Quick Match, Unranked and Dual Front game modes with a selection of operators. ', 2015, 'FPS, PVP'),
(4, 'Barotrauma', 'Barotrauma is a 2D co-op submarine simulator – in space, with survival horror and RPG elements. Steer your submarine, complete missions, fight monsters, fix leaks, operate machinery, man the guns and craft items, and stay alert: danger in Barotrauma doesn’t announce itself! ', 2023, 'Survival, Horror'),
(5, 'Team Fortress 2', 'Nine distinct classes provide a broad range of tactical abilities and personalities. Constantly updated with new game modes, maps, equipment and, most importantly, hats! ', 2007, 'FPS, Multiplayer'),
(6, 'Crusader Kings III', 'Love, fight, scheme, and claim greatness. Determine your noble house’s legacy in the sprawling grand strategy of Crusader Kings III. Death is only the beginning as you guide your dynasty’s bloodline in the rich and larger-than-life simulation of the Middle Ages. ', 2020, 'Strategy, Simulation'),
(7, 'Victoria 3', 'Paradox Development Studio invites you to build your ideal society in the tumult of the exciting and transformative 19th century. Balance the competing interests in your society and earn your place in the sun in Victoria 3, one of the most anticipated games in Paradox’s history. ', 2022, 'Historical, Economy'),
(8, 'Manor Lords', 'Manor Lords is a medieval strategy game featuring in-depth city building, large-scale tactical battles, and complex economic and social simulations. Rule your lands as a medieval lord – the seasons pass, the weather changes, and cities rise and fall. ', 2024, 'Strategy, Simulation'),
(9, 'Balatro', 'The poker roguelike. Balatro is a hypnotically satisfying deckbuilder where you play illegal poker hands, discover game-changing jokers, and trigger adrenaline-pumping, outrageous combos. ', 2024, 'Card game, Roguelike'),
(10, '9 Kings', 'A fast-paced roguelike kingdom builder. Grow your empire and fight massive battles against powerful rival kings. Break the game with thousands of insane builds to become the King of Kings. ', 2025, 'Roguelike, Strategy'),
(11, 'Destiny 2', 'Destiny 2 is an action MMO with a single evolving world that you and your friends can join anytime, anywhere, absolutely free. ', 2019, 'Multiplayer, Open-world'),
(12, 'Resident Evil 4', 'Survival is just the beginning. Six years have passed since the biological disaster in Raccoon City. Leon S. Kennedy, one of the survivors, tracks the president\'s kidnapped daughter to a secluded European village, where there is something terribly wrong with the locals. ', 2023, 'Horror, Action'),
(13, 'Warhammer 40,000: Space Marine', 'Embody the superhuman skill and brutality of a Space Marine. Unleash deadly abilities and devastating weaponry to obliterate the relentless Tyranid swarms. Defend the Imperium in spectacular third-person action in solo or multiplayer modes. ', 2024, 'Action, Multiplayer'),
(14, 'Dune: Awakening', 'Rise from survival to greatness and challenge the power of an Imperium in Dune: Awakening, a brand-new open world survival and crafting game. Alone or together with others, you must survive the sandworm, build a home, craft your ornithopter, and unravel the story of the missing Fremen. ', 2025, 'Survival, Open-world'),
(15, 'Palworld', 'Fight, farm, build and work alongside mysterious creatures called \"Pals\" in this completely new multiplayer, open world survival and crafting game! ', 2024, 'Crafting, Open-world'),
(16, 'Dead by Daylight', 'Trapped forever in a realm of eldritch evil where even death is not an escape, four determined Survivors face a bloodthirsty Killer in a vicious game of nerve and wits. Pick a side and step into a world of tension and terror with horror gaming\'s best asymmetrical multiplayer. ', 2016, 'Horror, Multiplayer'),
(17, '112 Operator', 'Manage emergency services in any city in the world! Take calls and dispatch rescue forces. Handle difficult situations, now depending on the weather, and traffic. Help the citizens through cataclysms and natural disasters, becoming a better emergency number operator every day! ', 2020, 'Simulation, Realistic'),
(18, 'Rust', 'The only aim in Rust is to survive. Everything wants you to die - the island’s wildlife, other inhabitants, the environment, and other survivors. Do whatever it takes to last another night. ', 2018, 'Survival, Crafting'),
(19, 'DOOM: The Dark Ages', 'DOOM: The Dark Ages is the prequel to the critically acclaimed DOOM (2016) and DOOM Eternal that tells an epic cinematic story worthy of the DOOM Slayer’s legend. In this third installment of the modern DOOM series, players will step into the blood-stained boots of the DOOM Slayer, in this never-before-seen dark and sinister medieval war against Hell.', 2025, 'FPS, Action'),
(20, 'Celeste', 'Help Madeline survive her inner demons on her journey to the top of Celeste Mountain, in this super-tight platformer from the creators of TowerFall. Brave hundreds of hand-crafted challenges, uncover devious secrets, and piece together the mystery of the mountain. ', 2018, 'Difficult, Platformer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igre`
--
ALTER TABLE `igre`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `igre`
--
ALTER TABLE `igre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
