-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Cze 2020, 12:30
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wisielec`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hasla`
--

CREATE TABLE `hasla` (
  `id` int(11) NOT NULL,
  `id_kategorii` int(11) NOT NULL,
  `haslo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `hasla`
--

INSERT INTO `hasla` (`id`, `id_kategorii`, `haslo`) VALUES
(1, 1, 'PAWEŁ MAŁASZYŃSKI'),
(2, 2, 'WYSZŁO SZYDŁO Z WORKA'),
(3, 2, 'JAKI PAN TAKI KRAM'),
(4, 2, 'NIE WSZYSTKO ZŁOTO CO SIĘ ŚWIECI'),
(5, 2, 'MĄDREJ GŁOWIE DOŚĆ DWIE SŁOWIE'),
(6, 2, 'NIE WCHODZI SIĘ DWA RAZY DO TEJ SAMEJ RZEKI'),
(7, 3, 'SILENT HILL'),
(8, 3, 'WORLD OF WARCRAFT'),
(9, 3, 'NEED FOR SPEED'),
(10, 2, 'PORYWAĆ SIĘ Z MOTYKĄ NA SŁOŃCE'),
(11, 2, 'KŁAMSTWO MA KRÓTKIE NOGI'),
(12, 2, 'PAŃSKIE OKO KONIA TUCZY'),
(13, 4, 'DWUNASTU GNIEWNYCH LUDZI'),
(14, 2, 'SŁUCHAJ UCHEM A NIE BRZUCHEM'),
(15, 2, 'NA ZŁODZIEJU CZAPKA GORE'),
(16, 2, 'SYTY GŁODNEGO NIE ZROZUMIE'),
(17, 2, 'KTO SIĘ CZUBI TEN SIĘ LUBI'),
(18, 2, 'KRZYKIEM SKRZYPIEC NIE NASTROISZ'),
(19, 2, 'TONĄCY BRZYTWY SIĘ CHWYTA'),
(20, 2, 'NADZIEJA MATKĄ GŁUPICH');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kategoria`
--

INSERT INTO `kategoria` (`id`, `nazwa`) VALUES
(1, 'AKTOR POLSKI'),
(2, 'PRZYSŁOWIE'),
(3, 'GRA KOMPUTEROWA'),
(4, 'FILM');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `liczbaWygranych` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ranking`
--

INSERT INTO `ranking` (`id`, `nazwa`, `liczbaWygranych`) VALUES
(1, 'Maciej', 10),
(2, 'Maciej', 11),
(3, 'Maciej', 15);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `hasla`
--
ALTER TABLE `hasla`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `hasla`
--
ALTER TABLE `hasla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
