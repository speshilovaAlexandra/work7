-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 03 2026 г., 09:55
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `security`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `Id` int NOT NULL COMMENT 'Код',
  `IdUser` int NOT NULL COMMENT 'Код пользователя',
  `IdPost` int NOT NULL COMMENT 'Код поста',
  `Messages` varchar(1000) NOT NULL COMMENT 'Сообщение'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`Id`, `IdUser`, `IdPost`, `Messages`) VALUES
(35, 8, 1, 'fdfdsfdsfdsf'),
(36, 8, 1, 'fff'),
(37, 8, 1, '<script>alert(document cookie)</script>'),
(38, 8, 1, '<script>(document.cookie)</script>'),
(39, 8, 1, '<script>(document.cookie)</script>'),
(40, 38, 1, '<script>alert(document cookie)</script>'),
(41, 38, 1, '<script>alert(document cookie)</script>'),
(42, 38, 1, '<script>alert(document.cookie)</script>');

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL COMMENT 'ID пользователя',
  `ip` varchar(45) DEFAULT NULL COMMENT 'IP пользователя',
  `date` datetime NOT NULL COMMENT 'Дата и время события',
  `time_online` varchar(50) DEFAULT NULL COMMENT 'Время в сети',
  `event` text COMMENT 'Описание события'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Журнал событий';

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `ip`, `date`, `time_online`, `event`) VALUES
(1, 8, '127.0.0.1', '2026-02-03 08:39:17', '00:00:00', 'пользователь user авторизован'),
(2, 8, '127.0.0.1', '2026-02-03 08:41:24', '00:00:00', 'пользователь user авторизован'),
(3, 8, '127.0.0.1', '2026-02-03 08:56:26', '00:00:00', 'пользователь user авторизован'),
(4, 8, '127.0.0.1', '2026-02-03 08:56:28', '00:00:00', 'пользователь user авторизован'),
(5, 1, '127.0.0.1', '2026-02-03 08:58:18', '00:00:00', 'пользователь admin авторизован'),
(6, 1, '127.0.0.1', '2026-02-03 08:58:20', '00:00:00', 'пользователь admin авторизован');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `img`) VALUES
(1, 'Внимание! Режим работы на 11 и 12 сентября 2020 г.', '11.09.2020 г. (пятница) занятия проводятся по расписанию звонков «пара-час». 12.09.2020 г. (суббота) занятия проводятся в дистанционном формате (в техникум приходить не нужно).', './img/img831.jpg\r\n'),
(2, 'Продолжается прием на заочное обучение', 'Пермский авиационный техникум продолжает прием документов на заочное обучение по специальностям «Производство авиационных двигателей», «Технология машиностроения», «Управление качеством продукции, процессов и услуг (по отраслям)» и «Прикладная информатика (по отраслям)».\r\n\r\nДокументы принимаются до 15 сентября 2020 г. включительно с 15:00 до 17:00. При себе иметь оригиналы и копии паспорта, документа об образовании, ИНН, СНИЛС и фотографии. Справки по телефону (342) 212-14-92.', './img/img830.jpg\r\n'),
(3, 'Расписание звонков', 'Расписание звонков в разных корпусах (Корпус А (1-2 и 3 этаж), Корпус В, Корпус С)\r\n<a href=\"./documents/Расписание звонков.docx\">Скачать</a>', './img/img831.jpg'),
(4, 'Основные принципы построения безопасных сайтов. Понятие безопасности приложений и классификация опасностей', 'Основные принципы построения безопасных сайтов. Понятие безопасности приложений и классификация опасностей\r\n<a href=\"./documents/1.docx\">Скачать</a>', './img/docx.png'),
(5, 'Источники угроз информационной безопасности и меры по их предотвращению', 'Источники угроз информационной безопасности и меры по их предотвращению\r\n<a href=\"./documents/2.doc\">Скачать</a>', './img/docx.png'),
(6, 'Регламенты и методы разработки безопасных веб-приложений', 'Регламенты и методы разработки безопасных веб-приложений\r\n<a href=\"./documents/3.pdf\">Скачать</a>', './img/docx.png');

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

CREATE TABLE `session` (
  `Id` int NOT NULL,
  `IdUser` int NOT NULL,
  `Ip` varchar(255) NOT NULL,
  `DateStart` datetime NOT NULL,
  `DateNow` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `session`
--

INSERT INTO `session` (`Id`, `IdUser`, `Ip`, `DateStart`, `DateNow`) VALUES
(1, 1, '127.0.0.1', '2026-02-03 07:48:44', '2026-02-03 07:48:44'),
(2, 1, '127.0.0.1', '2026-02-03 07:49:15', '2026-02-03 07:49:15'),
(3, 1, '127.0.0.1', '2026-02-03 07:50:50', '2026-02-03 07:50:50'),
(4, 1, '127.0.0.1', '2026-02-03 08:01:47', '2026-02-03 08:01:47'),
(5, 1, '127.0.0.1', '2026-02-03 08:02:18', '2026-02-03 08:02:18'),
(6, 1, '127.0.0.1', '2026-02-03 08:36:59', '2026-02-03 08:36:59'),
(7, 8, '127.0.0.1', '2026-02-03 08:37:08', '2026-02-03 08:37:08'),
(8, 8, '127.0.0.1', '2026-02-03 08:38:15', '2026-02-03 08:38:15'),
(9, 8, '127.0.0.1', '2026-02-03 08:39:17', '2026-02-03 08:39:17'),
(10, 8, '127.0.0.1', '2026-02-03 08:41:24', '2026-02-03 08:52:24'),
(11, 8, '127.0.0.1', '2026-02-03 08:56:26', '2026-02-03 08:56:26'),
(12, 8, '127.0.0.1', '2026-02-03 08:56:28', '2026-02-03 08:58:10'),
(13, 1, '127.0.0.1', '2026-02-03 08:58:18', '2026-02-03 08:58:18'),
(14, 1, '127.0.0.1', '2026-02-03 08:58:20', '2026-02-03 08:58:35');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roll` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `roll`) VALUES
(1, 'admin', 'Asdfg123', 1),
(8, 'user', 'Asdfg123', 0),
(38, 'userr', 'Asdfg123', 0),
(39, 'gfdgdfg', 'Asdfg123', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date` (`date`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `session`
--
ALTER TABLE `session`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
