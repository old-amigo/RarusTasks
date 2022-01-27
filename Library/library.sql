-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 27 2022 г., 18:43
-- Версия сервера: 5.6.51
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`, `surname`) VALUES
(1, 'Erich', 'Gamma'),
(2, 'Richard', 'Helm'),
(3, 'Ralph', 'Johnson'),
(4, 'John', 'Vlissides'),
(5, 'Аркадий', 'Стругацкий'),
(6, 'Борис', 'Стругацкий'),
(7, 'Джон Рональд Руэл', 'Толкин');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `isbn` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages` int(11) DEFAULT NULL,
  `publication_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `isbn`, `name`, `pages`, `publication_date`) VALUES
(1, NULL, 'Властелин колец: братство кольца', 250, '1954-06-29'),
(2, NULL, 'Властелин колец: две крепости', 278, '1954-11-11'),
(3, NULL, 'Властелин колец: возвращение короля', 256, '1955-10-20'),
(4, NULL, 'Понедельник начинается в субботу', 216, '1964-01-01'),
(5, NULL, 'Град обреченный', 417, '1988-01-01'),
(6, '0-201-63361-2', 'Design Patterns: Elements of Reusable Object-Oriented Software', 395, '1994-01-01');

-- --------------------------------------------------------

--
-- Структура таблицы `book_author`
--

CREATE TABLE `book_author` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `book_author`
--

INSERT INTO `book_author` (`id`, `book_id`, `author_id`) VALUES
(1, 6, 1),
(2, 6, 2),
(3, 6, 3),
(4, 6, 4),
(5, 4, 5),
(6, 4, 6),
(7, 5, 5),
(8, 5, 6),
(9, 1, 7),
(10, 2, 7),
(11, 3, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `book_genre`
--

CREATE TABLE `book_genre` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `book_genre`
--

INSERT INTO `book_genre` (`id`, `book_id`, `genre_id`) VALUES
(1, 6, 5),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 1, 2),
(6, 2, 2),
(7, 3, 2),
(8, 4, 1),
(9, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Фантастика'),
(2, 'Роман'),
(3, 'Детектив'),
(4, 'Приключения'),
(5, 'Наука'),
(6, 'Фольклор'),
(7, 'Юмор');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Индексы таблицы `book_genre`
--
ALTER TABLE `book_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `book_author`
--
ALTER TABLE `book_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `book_genre`
--
ALTER TABLE `book_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Ограничения внешнего ключа таблицы `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `book_genre_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `book_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
