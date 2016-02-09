-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 09 2016 г., 14:28
-- Версия сервера: 10.0.21-MariaDB
-- Версия PHP: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `forsazh62_db`
--
CREATE DATABASE IF NOT EXISTS `forsazh62_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `forsazh62_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `Components`
--

CREATE TABLE `Components` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `adminDir` varchar(200) NOT NULL,
  `admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Components`
--

INSERT INTO `Components` (`alias`, `name`, `author`, `version`, `description`, `adminDir`, `admin`) VALUES
('Adminpanel', 'Adminpanel', 'Compu Project', '1.0', 'Панель администрирования', 'admin', 'index.php'),
('Contacts', 'Контакты', 'Compu Project', '1.0', 'Контакты офисов', 'admin', 'index.php'),
('DrivingSchool', 'Автошкола', 'Compu Project', '1.0', NULL, 'admin', 'index.php'),
('Feedback', 'Feedback', 'CompuProject', '1.0', NULL, 'admin', 'index.php'),
('Materials', 'Материалы сайта', 'Compu Project', '1.0', 'Компонент для размещение материалов на сайте.', 'admin', 'index.php'),
('Users', 'Пользователи', 'Compu Project', '1.0', 'Компонент для работы с пользователями.', 'admin', 'index.php');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsDepends`
--

CREATE TABLE `ComponentsDepends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `elementType` varchar(50) NOT NULL,
  `component` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ComponentsDepends`
--

INSERT INTO `ComponentsDepends` (`id`, `elementType`, `component`, `depends`, `versionStart`, `versionEnd`) VALUES
(1, 'Plugins', 'Materials', 'appearingBox', '1.0', '1.0'),
(2, 'Modules', 'Materials', 'captcha', '1.0', '1.0'),
(3, 'Modules', 'Users', 'captcha', '1.0', '1.0');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsDependsElementsType`
--

CREATE TABLE `ComponentsDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ComponentsDependsElementsType`
--

INSERT INTO `ComponentsDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsElements`
--

CREATE TABLE `ComponentsElements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alias` varchar(50) NOT NULL,
  `component` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `mainPage` varchar(100) NOT NULL,
  `printPage` varchar(100) NOT NULL,
  `mobilePage` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyStart` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ComponentsElements`
--

INSERT INTO `ComponentsElements` (`id`, `alias`, `component`, `name`, `description`, `mainPage`, `printPage`, `mobilePage`, `head`, `bodyStart`, `bodyEnd`, `admin`) VALUES
(101, 'Material', 'Materials', 'Материал', 'Выводит на страницу сайта один материал.', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(102, 'MaterialsList', 'Materials', 'Список материалов', 'Выводит на страницу сайта список материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(103, 'MaterialsCategory', 'Materials', 'Категории материалов', 'Выводит на страницу сайта категорию материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(104, 'MaterialsCategoryList', 'Materials', 'Список категорий материалов', 'Выводит на страницу сайта список категорий материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(105, 'MaterialsBlog', 'Materials', 'Блог материалов', 'Выводит список материалов в виде блога. Отличается от обычного вывода списка материалов блочной структурой.', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(201, 'DrivingSchoolPrices', 'DrivingSchool', 'Цены автошколы', NULL, 'index.php', 'index.php', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(202, 'DrivingSchoolPersonnel', 'DrivingSchool', 'Персонал', NULL, 'index.php', 'index.php', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(301, 'Contacts', 'Contacts', 'Адреса офисов', NULL, 'index.php', 'index.php', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(401, 'Feedback', 'Feedback', 'Отзывы', NULL, 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999801, 'Accounts', 'Users', 'Аккаунт', 'Аккаунт пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999802, 'AccountSettings', 'Users', 'Настройки аккаунта', 'Настройки аккаунта пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999803, 'Registration', 'Users', 'Регистрация', 'Страница регистрации пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999901, 'Adminpanel', 'Adminpanel', 'Панель администрирования', 'Панель администрирвоания', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnits`
--

CREATE TABLE `ContactsUnits` (
  `unit` varchar(100) NOT NULL,
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `showOnMain` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(100) NOT NULL,
  `sequence` int(5) UNSIGNED NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `feedbackEmail` varchar(100) DEFAULT NULL,
  `phoneText1` varchar(100) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `additional1` varchar(9) DEFAULT NULL,
  `phoneText2` varchar(100) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `additional2` varchar(9) DEFAULT NULL,
  `monH_s` int(2) UNSIGNED DEFAULT NULL,
  `monM_s` int(2) UNSIGNED DEFAULT NULL,
  `monH_e` int(2) UNSIGNED DEFAULT NULL,
  `monM_e` int(2) UNSIGNED DEFAULT NULL,
  `tueH_s` int(2) UNSIGNED DEFAULT NULL,
  `tueM_s` int(2) UNSIGNED DEFAULT NULL,
  `tueH_e` int(2) UNSIGNED DEFAULT NULL,
  `tueM_e` int(2) UNSIGNED DEFAULT NULL,
  `wedH_s` int(2) UNSIGNED DEFAULT NULL,
  `wedM_s` int(2) UNSIGNED DEFAULT NULL,
  `wedH_e` int(2) UNSIGNED DEFAULT NULL,
  `wedM_e` int(2) UNSIGNED DEFAULT NULL,
  `thuH_s` int(2) UNSIGNED DEFAULT NULL,
  `thuM_s` int(2) UNSIGNED DEFAULT NULL,
  `thuH_e` int(2) UNSIGNED DEFAULT NULL,
  `thuM_e` int(2) UNSIGNED DEFAULT NULL,
  `friH_s` int(2) UNSIGNED DEFAULT NULL,
  `friM_s` int(2) UNSIGNED DEFAULT NULL,
  `friH_e` int(2) UNSIGNED DEFAULT NULL,
  `friM_e` int(2) UNSIGNED DEFAULT NULL,
  `satH_s` int(2) UNSIGNED DEFAULT NULL,
  `satM_s` int(2) UNSIGNED DEFAULT NULL,
  `satH_e` int(2) UNSIGNED DEFAULT NULL,
  `satM_e` int(2) UNSIGNED DEFAULT NULL,
  `sunH_s` int(2) UNSIGNED DEFAULT NULL,
  `sunM_s` int(2) UNSIGNED DEFAULT NULL,
  `sunH_e` int(2) UNSIGNED DEFAULT NULL,
  `sunM_e` int(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnits`
--

INSERT INTO `ContactsUnits` (`unit`, `show`, `showOnMain`, `type`, `sequence`, `email`, `feedbackEmail`, `phoneText1`, `phone1`, `additional1`, `phoneText2`, `phone2`, `additional2`, `monH_s`, `monM_s`, `monH_e`, `monM_e`, `tueH_s`, `tueM_s`, `tueH_e`, `tueM_e`, `wedH_s`, `wedM_s`, `wedH_e`, `wedM_e`, `thuH_s`, `thuM_s`, `thuH_e`, `thuM_e`, `friH_s`, `friM_s`, `friH_e`, `friM_e`, `satH_s`, `satM_s`, `satH_e`, `satM_e`, `sunH_s`, `sunM_s`, `sunH_e`, `sunM_e`) VALUES
('dep_information_department', 1, 0, 'departments', 202, '', '', '', '', '', '', '', '', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dep_responsible', 1, 0, 'departments', 201, '', '', '', '', '', '', '', '', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ds_rzn_chernovickaja_6a', 1, 0, 'drivingSchool', 2, 'info.forsazh62@gmail.com', 'info.forsazh62@gmail.com', '8(4912)511-502', '84912511502', '', '8(930)783-15-04', '89307381504', '', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ds_rzn_international_22a', 1, 0, 'drivingSchool', 1, 'info.forsazh62@gmail.com', 'info.forsazh62@gmail.com', '8(4912)511-604', '84912511604', '', '8(930)783-15-04', '89307381504', '', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ds_rzn_novoselov_30a', 1, 0, 'drivingSchool', 3, 'info.forsazh62@gmail.com', 'info.forsazh62@gmail.com', '8(4912)513-102', '84912512102', '', '8(930)783-15-04', '89307381504', '', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ds_rzn_pervomajskij_prt_21', 1, 0, 'drivingSchool', 5, 'info.forsazh62@gmail.com', 'info.forsazh62@gmail.com', '8(4912)511-504', '84912511504', '', '8(930)783-15-04', '89307381504', '', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ds_shil_sovetskaja_4', 1, 0, 'drivingSchool', 6, 'info.forsazh62@gmail.com', 'info.forsazh62@gmail.com', '8(4912)511-602', '84912511602', '', '8(930)783-15-04', '89307381504', '', 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, 9, 0, 18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnitsMaps`
--

CREATE TABLE `ContactsUnitsMaps` (
  `unit` varchar(100) NOT NULL,
  `map` varchar(100) NOT NULL,
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnitsMaps`
--

INSERT INTO `ContactsUnitsMaps` (`unit`, `map`, `show`) VALUES
('ds_rzn_chernovickaja_6a', 'rzn_chernovickaja_6a', 1),
('ds_rzn_international_22a', 'rzn_international_22a', 1),
('ds_rzn_novoselov_30a', 'rzn_novoselov_30a', 1),
('ds_rzn_pervomajskij_prt_21', 'rzn_pervomajskij_prt_21', 1),
('ds_shil_sovetskaja_4', 'shil_sovetskaja_4', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnitsTypes`
--

CREATE TABLE `ContactsUnitsTypes` (
  `type` varchar(100) NOT NULL,
  `sequence` tinyint(1) UNSIGNED NOT NULL,
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnitsTypes`
--

INSERT INTO `ContactsUnitsTypes` (`type`, `sequence`, `show`) VALUES
('departments', 2, 1),
('drivingSchool', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnitsTypes_Lang`
--

CREATE TABLE `ContactsUnitsTypes_Lang` (
  `type` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `typeName` varchar(100) NOT NULL,
  `topText` longtext,
  `bottomText` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnitsTypes_Lang`
--

INSERT INTO `ContactsUnitsTypes_Lang` (`type`, `lang`, `typeName`, `topText`, `bottomText`) VALUES
('departments', 'eng', 'Departments', NULL, '* If you want to send an e-mail, but have difficulties in choosing     the recipient, or can\'t find the address of the desired person,     you can always send a message to the general mailbox:     <a href="mailto:info.forsazh62@gmail.com">info.forsazh62@gmail.com</a>.'),
('departments', 'rus', 'Контакты отделов', NULL, '* При отправке почтовых сообщений, если вы затрудняетесь в выборе     получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете     направить корреспонденцию на общий ящик:     <a href="mailto:info.forsazh62@gmail.com">info.forsazh62@gmail.com</a>.'),
('drivingSchool', 'eng', 'Driving school office', NULL, '* If you want to send an e-mail, but have difficulties in choosing     the recipient, or can\'t find the address of the desired person,     you can always send a message to the general mailbox:     <a href="mailto:info.forsazh62@gmail.com">info.forsazh62@gmail.com</a>.'),
('drivingSchool', 'rus', 'Офисы Автошколы', NULL, '* При отправке почтовых сообщений, если вы затрудняетесь в выборе     получателя, либо не нашли адрес нужного Вам лица — Вы всегда можете     направить корреспонденцию на общий ящик:     <a href="mailto:info.forsazh62@gmail.com">info.forsazh62@gmail.com</a>.');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnitsWokers`
--

CREATE TABLE `ContactsUnitsWokers` (
  `unit` varchar(100) NOT NULL,
  `worker` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnitsWokers`
--

INSERT INTO `ContactsUnitsWokers` (`unit`, `worker`) VALUES
('dep_information_department', 'Абстрактный Секретарь'),
('dep_responsible', 'Борисов Алексей Владимирович'),
('dep_responsible', 'Кузнецов Роман Владимирович');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsUnits_Lang`
--

CREATE TABLE `ContactsUnits_Lang` (
  `unit` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `postAdress` varchar(200) DEFAULT NULL,
  `text` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsUnits_Lang`
--

INSERT INTO `ContactsUnits_Lang` (`unit`, `lang`, `name`, `adress`, `postAdress`, `text`) VALUES
('dep_information_department', 'eng', 'Information department', NULL, NULL, NULL),
('dep_information_department', 'rus', 'Отдел информации', NULL, NULL, NULL),
('dep_responsible', 'eng', 'Responsible', NULL, NULL, NULL),
('dep_responsible', 'rus', 'Ответственные', NULL, NULL, NULL),
('ds_rzn_chernovickaja_6a', 'rus', 'Офис в Роще', 'Рязанская область,<br>\r\nг. Рязань,<br>\r\nул. Черновицкая 6a,<br>\r\n3 этаж, офис 309', NULL, NULL),
('ds_rzn_international_22a', 'rus', 'Офис в Канищево', 'Рязанская область,<br>\r\nг. Рязань,<br>\r\nул. Интернациональная 22а, 0 этаж', NULL, 'Остановка "Муниципальный рынок". <br>\r\nАвтобусы: 17, 21, 34<br>\r\nТроллейбусы: 4, 8<br>\r\nМаршрутки: 50, 51, 58, 70, 73, 75, 90, 98<br>'),
('ds_rzn_novoselov_30a', 'rus', 'Офис в Дашках', 'Рязанская область,<br>\r\nг. Рязань,<br>\r\nул. Новоселов 30a,<br>\r\n2 этаж', NULL, NULL),
('ds_rzn_pervomajskij_prt_21', 'rus', 'Первомайский пр-т 21', 'Рязанская область,<br>\r\nг. Рязань,<br>\r\nПервомайский пр-т 21', NULL, NULL),
('ds_shil_sovetskaja_4', 'rus', 'пос. Шилово<br>ул. Советская 4', 'Рязанская область,<br>\r\nпоселок городского<br>\r\nтипа Шилово,<br>\r\nул. Советская 4', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkers`
--

CREATE TABLE `ContactsWorkers` (
  `worker` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `email1` varchar(50) NOT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `phoneText1` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `additional1` varchar(50) DEFAULT NULL,
  `phoneText2` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `additional2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkers`
--

INSERT INTO `ContactsWorkers` (`worker`, `post`, `email1`, `email2`, `phoneText1`, `phone1`, `additional1`, `phoneText2`, `phone2`, `additional2`) VALUES
('Абстрактный Секретарь', 'Секретарь', 'info.forsazh62@gmail.com', '', '8(4912)511-504', '84912511504', '', '', '', ''),
('Борисов Алексей Владимирович', 'Старший инструктор', 'alex634ya@mail.ru', NULL, '8(930)783-15-04', '89307381504', NULL, '8(4912)511-504', '84912511504', NULL),
('Кузнецов Роман Владимирович', 'Генеральный Директор', 'forsazh.kuznecov.rv@mail.ru', NULL, '8(930)783-15-04', '89307381504', NULL, '8(4912)511-504', '84912511504', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkersPosts`
--

CREATE TABLE `ContactsWorkersPosts` (
  `post` varchar(50) NOT NULL,
  `sequence` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkersPosts`
--

INSERT INTO `ContactsWorkersPosts` (`post`, `sequence`) VALUES
('Генеральный Директор', 1),
('Старший инструктор', 2),
('Секретарь', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkersPosts_Lang`
--

CREATE TABLE `ContactsWorkersPosts_Lang` (
  `post` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `postName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkersPosts_Lang`
--

INSERT INTO `ContactsWorkersPosts_Lang` (`post`, `lang`, `postName`) VALUES
('Генеральный Директор', 'rus', 'Генеральный Директор'),
('Секретарь', 'rus', 'Секретарь'),
('Старший инструктор', 'rus', 'Старший инструктор');

-- --------------------------------------------------------

--
-- Структура таблицы `ContactsWorkers_Lang`
--

CREATE TABLE `ContactsWorkers_Lang` (
  `worker` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `fio` varchar(50) NOT NULL,
  `info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ContactsWorkers_Lang`
--

INSERT INTO `ContactsWorkers_Lang` (`worker`, `lang`, `fio`, `info`) VALUES
('Абстрактный Секретарь', 'rus', 'Урегулирование конфликтов', ''),
('Борисов Алексей Владимирович', 'rus', 'Борисов Алексей Владимирович', ''),
('Кузнецов Роман Владимирович', 'rus', 'Кузнецов Роман Владимирович', '');

-- --------------------------------------------------------

--
-- Структура таблицы `CreatedModules`
--

CREATE TABLE `CreatedModules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CreatedModules`
--

INSERT INTO `CreatedModules` (`id`, `name`, `module`) VALUES
(101, 'MainMenu', 'menu'),
(201, 'Панель Авторизации', 'authorizationUserPanel'),
(301, 'Онлайн заявки', 'UsersOnlineApplications'),
(401, 'MainSlider', 'slider'),
(801, 'На верх', 'ToTopSite'),
(901, 'Копирайт с текстом', 'html'),
(902, 'Контакты в шапке сайта', 'html');

-- --------------------------------------------------------

--
-- Структура таблицы `DBerrors`
--

CREATE TABLE `DBerrors` (
  `id` bigint(20) NOT NULL,
  `element` varchar(200) NOT NULL,
  `sql` longtext NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Feedbacks`
--

CREATE TABLE `Feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fio` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `text` longtext NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `ip` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `rating` varchar(50) NOT NULL DEFAULT '5',
  `like` int(10) NOT NULL DEFAULT '0',
  `dislike` int(10) NOT NULL DEFAULT '0',
  `show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Feedbacks`
--

INSERT INTO `Feedbacks` (`id`, `fio`, `title`, `text`, `email`, `phone`, `ip`, `date`, `rating`, `like`, `dislike`, `show`) VALUES
(1, 'Юлия Зраенко', NULL, 'Обучение поставлено на поток. И теоретических и практических занятий столько сколько надо для полного понимания и отработки навыков уверенного вождения.Я сдала с первого раза. Процессом обучения довольна. Советую всем!', NULL, NULL, '127.0.0.1', '2013-04-22 20:39:44', 'excellent', 0, 0, 1),
(2, 'Татьяна', NULL, 'Полностью согласна с тобой. Отличная автошкола!', NULL, NULL, '127.0.0.1', '2013-07-25 09:10:32', 'noRating', 0, 0, 1),
(3, 'Ирина', NULL, 'Подскажите хорошего инструктора пожалуйста!!!', NULL, NULL, '127.0.0.1', '2013-04-26 22:37:17', 'noRating', 0, 0, 1),
(4, 'Татьяна', NULL, 'Обучение проходила в другой школе, в Форсаже брала дополнительные уроки вождения(инструктор Сергей). Сдала в ГАИ с первого раза. Большое спасибо.', NULL, NULL, '127.0.0.1', '2013-04-23 13:20:30', 'excellent', 0, 0, 1),
(6, 'Зайцев Максим', NULL, 'Отличная Автошкола, отличные инструктора. Очень понравилась работа инструкторов и приятно низкая стоимость обучения, а самое главное, что я не заплатил ни копейки больше, чем указано в договоре! После обучения в этой Автошколе я без проблем сдал экзамен в ГАИ и сейчас прекрасно вожу машину.', NULL, NULL, '127.0.0.1', '2013-04-23 16:13:53', 'excellent', 0, 0, 1),
(7, 'НАТАЛИЯ К.', NULL, 'Хочу поблагодарить всех сотрудников АВТОШКОЛЫ ФОРСАЖ. Коллектив очень грамотный и теория и вождение на высшем уровне. Спасибо руководителям автошколы за внимательное отношение. За честную, грамотную и профессиональную работу, за терпение инструкторов))Рекомендую всем,перед которыми сейчас стоит выбор Автошколы!', NULL, NULL, '127.0.0.1', '2013-04-23 19:47:53', 'excellent', 0, 0, 1),
(8, 'Елена Звягинцева', NULL, 'Так же хотелось бы выразить огромную благодарность . Отличная автошкола, отличный коллектив.От преподавателей и инструкторов всегда можно получить не только все необходимые знание, но и так порой необходимую поддержку.Отдельно, конечно, хотелось бы поблагодарить своего инструктора Литвинова Сергея за помощь в достижении желаемой цели и терпение)))', NULL, NULL, '127.0.0.1', '2013-04-24 20:32:50', 'excellent', 0, 0, 1),
(9, 'Татьяна', NULL, 'Уже 2 месяц я вожу свою машину по дорогам города и за это очень благодарна автошколе Форсаж. Обучение закончила за три месяца, осталась очень довольна своим инструктором Сергеем, очень хороший и внимательный учитель . Экзамены сдавала вместе с автошколой сдала со второго раза. Меня также очень порадовали цены и дружелюбный рабочий коллектив. Рекомендую всем!', NULL, NULL, '127.0.0.1', '2013-04-25 09:12:22', 'excellent', 0, 0, 1),
(10, 'Наталья', NULL, 'Хочу сказать огромное спасибо автошколе Форсаж! Благодаря профессионализму преподавателей и опытности инструкторов сдала в ГАИ все с первого раза и безумно этому рада!', NULL, NULL, '127.0.0.1', '2013-04-15 09:25:58', 'excellent', 0, 0, 1),
(11, 'Алексей', NULL, 'Автошкола Форсаж на высшем уровне! Переживал что школа новая и только начала работать, НО уже после первых занятий понял что зря волновался. В апреле сдал на права и сейчас без проблем вожу машину. огромное вам спасибо.', NULL, NULL, '127.0.0.1', '2013-04-25 10:42:32', 'excellent', 0, 0, 1),
(12, 'Александр', NULL, 'Я не жалею о том что выбрал именно эту автошколу. "Форсаж" великолепная школа! Она идеальна во всех смыслах. Всем кто все еще не может выбрать автошколу, советую выбирать Форсаж - не пожалеете! ', NULL, NULL, '127.0.0.1', '2013-03-16 12:04:27', 'excellent', 0, 0, 1),
(13, 'Алексей', NULL, 'Я очень доволен своим выбором. Прекрасные инструктора и преподаватели. Все отзывчивые и готовые помочь и поддержать, если вдруг возникают проблемы. Всем советую.', NULL, NULL, '127.0.0.1', '2013-03-17 07:57:09', 'excellent', 0, 0, 1),
(14, 'Юлия', NULL, 'Очень долго разрывалась между огромным количеством автошкол. Но однажды увидела рекламу на остановке и очень понравилась цена, решила позвонить. НЕ ЖАЛЕЮ! Очень довольна своим выбором. Спасибо вам.', NULL, NULL, '127.0.0.1', '2013-03-18 11:27:17', 'excellent', 0, 0, 1),
(15, 'Иван', NULL, 'Мне очень понравилось обучаться именно в автошколе форсаж. Качество обучения на очень высоком уровне, несмотря на то что школа новая. Отдельная благодарность Омельяненко Александру за все его старания', NULL, NULL, '127.0.0.1', '2013-03-25 05:52:13', 'excellent', 0, 0, 1),
(16, 'Полина', NULL, 'Превосходная автошкола! Обучаться одно удовольствие. легко совмещала работу и обучение. Преподаватели шли всегда навстречу. Добрые и отзывчивые. Что еще нужно для удобства? Спасибо вам, Благодаря вам сейчас свободно езжу по просторам нашего города.', NULL, NULL, '127.0.0.1', '2013-03-24 06:56:39', 'excellent', 0, 0, 1),
(19, 'Алексей', NULL, 'Спасибо автошколе форсаж. я получил отличные знания благодаря вашей школе. квалифицированные преподаватели и опытные инструкторы. Отдельное спасибо Борисову Алексею', NULL, NULL, '127.0.0.1', '2013-03-11 01:09:15', 'excellent', 0, 0, 1),
(20, 'Алексей', NULL, 'Просто нет слов! Чудесная автошкола. Всем доволен. Отличные знания и прекрасное отношение. Спасибо вам', NULL, NULL, '127.0.0.1', '2013-03-29 08:39:49', 'excellent', 0, 0, 1),
(22, 'Галина', NULL, 'Огромное вам спасибо за ваш профессионализм, за все старания. Благодаря вашей школе у меня теперь великолепные знания. Права получила с первого раза! Вот что значит качество обучения!', NULL, NULL, '127.0.0.1', '2013-04-29 12:17:31', 'excellent', 0, 0, 1),
(23, 'Ольга', NULL, 'Хочу сказать огромное спасибо всему коллективу автошколы Форсаж! И преподаватели и инструкторы на высоте. Очень осталась довольна. Мне повезло.', NULL, NULL, '127.0.0.1', '2013-04-30 12:06:38', 'excellent', 0, 0, 1),
(24, 'Лена', NULL, 'Автошкола Форсаж - это сплошные плюсы.\r\n1. Удобное расположение. \r\n2. Цены вполне приемлемые, акции ни могут не радовать! \r\n3. Коллектив приятный: вежливый и дружелюбный. \r\n4. Обучение на высоте! Объясняют все подробно и понятно. \r\nВ общем очень довольна своим выбором. Спасибо за прекрасную школу.', NULL, NULL, '127.0.0.1', '2013-04-02 07:59:42', 'excellent', 0, 0, 1),
(25, 'Дмитрий', NULL, 'Очень понравилась автошкола ФОРСАЖ. Отличное сочетание: качественное обучение + приемлемая цена. Доволен. Спасибо преподавателям и инструкторам. Отдельное спасибо Сергею.', NULL, NULL, '127.0.0.1', '2013-04-21 08:38:49', 'excellent', 0, 0, 1),
(26, 'Михаил', NULL, 'Исполнилось 18 - решил сдать на права. Увидел в институте рекламу с акциями. Рядом с домом, удобно. Записался. С первого занятия был в шоке! Преподаватель настолько все легко и доступно объяснял! Спасибо ему огромное. Совмещать учебу и обучение в автошколе легко и удобно. А еще и выгодно: попал на акцию - получил скидку! Спасибо автошкола ФОРСАЖ!', NULL, NULL, '127.0.0.1', '2013-04-18 10:03:18', 'excellent', 0, 0, 1),
(27, 'Виктория', NULL, 'Хочу поблагодарить своего инструктора Сергея за спокойствие, доброжелательность, отсутствие какого-либо давления. Очень грамотный и чуткий. Обязательно рекомендую всем.', NULL, NULL, '127.0.0.1', '2013-04-20 05:28:37', 'excellent', 0, 0, 1),
(28, 'Артур', NULL, 'Лучшая школа, которую я только видел! Замечательные инструкторы и преподаватели, машины новенькие, высокий уровень теоретической и практической подготовки, инструкторы вежливые и спокойные.', NULL, NULL, '127.0.0.1', '2013-05-19 09:53:28', 'excellent', 0, 0, 1),
(29, 'Алина', NULL, 'Грамотные преподаватели, спокойные и компетентные инструкторы. Хороший автодром, достаточно большой. Машины ухоженные, всегда чистые. В общем всем советую!!!', NULL, NULL, '127.0.0.1', '2013-04-27 11:35:58', 'excellent', 0, 0, 1),
(30, 'Екатерина', NULL, 'Я хожу в автошколу уже два месяца. Мне тут очень нравится, потому что теорию дают, разложенную по полочкам, а мне, как девушке, довольно тяжело самой в этом разобраться. Все тренеры очень внимательные, не кричат, когда идут практические занятия, а конкретно доносят, в чём твоя ошибка. И Вы знаете, так быстрее учишься, когда к тебе по-доброму относятся.', NULL, NULL, '127.0.0.1', '2013-06-15 04:38:18', 'excellent', 0, 0, 1),
(31, 'Светлана', NULL, 'Училась вождению в этой автошколе. Теория и практика прошли на достойном уровне. Узнала много нового и полезного. Действительно учат с нуля, терпение у инструкторов железное, терпеливо учат всему. Все расскажут и покажут и в обиду не дадут на дороге. Мне все понравилось. Ставлю твердую пятерку этой автошколе.', NULL, NULL, '127.0.0.1', '2013-04-18 12:31:52', 'excellent', 0, 0, 1),
(32, 'Ксения', NULL, 'Очень хорошее обучение, внимательные и доброжелательные инструкторы. Учиться вождению у них совсем не страшно, а интересно. Всем рекомендую.', NULL, NULL, '127.0.0.1', '2013-06-14 03:43:42', 'excellent', 0, 0, 1),
(33, 'Ирина', NULL, 'Не знаю… кому как. А меня обучение устроило. Инструктор просто умничка. Нашел способ как мне все просто объяснить, что бы я с первого раза все понимала. Все упражнения отрабатывали до автоматизма, хорошо, что на это не потребовалось много времени. ', NULL, NULL, '127.0.0.1', '2013-05-21 19:03:35', 'excellent', 0, 0, 1),
(34, 'Николай', NULL, 'Буду краток, автошкола просто супер! Все грамотно, не понравилось только то, что обучение почти 3 месяца, да и внутренний экзамен не так то просто сдать :-(', NULL, NULL, '127.0.0.1', '0000-00-00 00:00:00', 'good', 0, 0, 1),
(35, 'Игорь', NULL, 'Согласен с Николаем, внутренний экзамен это просто жесть, зато если сдадите, в ГАИ вам нечего бояться! Отличная автошкола!', NULL, NULL, '127.0.0.1', '2013-05-27 12:14:32', 'excellent', 0, 0, 1),
(36, 'Светлана', NULL, 'Ужасная автошкола! Я ничего не поняла, а до гаи меня так и не допустили. Проще по моему заплатить гаишнику, чем эту автошколу окончить.', NULL, NULL, '127.0.0.1', '2013-06-12 00:23:52', 'veryBad', 0, 0, 1),
(37, 'Петр', NULL, 'Светлана, а ты не пробовала ходить на занятия? Я тебя прекрасно помню. Сама виновата. Правильно сделали что не допустили тебя! Ты всех пешеходов бы передавила! И не один адекватный гаишник ни за что у тебя на лапу не возьмет! Желаю тебе и дальше ходить пешком! А на счет автошколы, присоединяюсь ко всем остальным. Автошкола очень хорошая.', NULL, NULL, '127.0.0.1', '2013-06-13 13:41:24', 'excellent', 0, 0, 1),
(38, 'Светик', NULL, 'Отличная автошкола, надо заниматься и слушать преподавателей, сама училась в этой школе и езжу теперь без проблем. Просто надо на время занятий отбросить в сторону все свои проблемы и заниматься.', NULL, NULL, '127.0.0.1', '2013-06-18 14:54:37', 'excellent', 0, 0, 1),
(39, 'Илья', NULL, 'Добрый день!!! Хочу сказать огромное спасибо всему коллективу автошколы Форсаж! Я обучался у них, а сдавал в Рыбном. Сдал все экзамены с первого раза без каких-либо особых усилий))) Огромное спасибо своему инструктору Сергею, который все это время со мной мучился XD', NULL, NULL, '127.0.0.1', '2013-06-18 18:47:41', 'excellent', 0, 0, 1),
(40, 'Екатерина', NULL, 'Отучилась в автошколе Форсаж. Права то конечно получила с первого раза, но впечатления от автошколы не очень. Инструктора часто кричат, а теорию преподают слишком поверхностно. В общем как-то не очень.', NULL, NULL, '127.0.0.1', '2013-06-19 14:17:54', 'notBad', 0, 0, 1),
(41, 'Михаил', NULL, 'Сдал на права с первого раза, разве не это ли показатель отличной работы сотрудников автошколы? В общем всем спасибо, всем доволен.', NULL, NULL, '127.0.0.1', '2013-06-21 17:12:19', 'excellent', 0, 0, 1),
(42, 'Максим', NULL, 'Кать, ты говоришь что инструктора часто кричали на тебя? Не за что не поверю! Я до этой автошколы пробовал учиться в другой, но к сожалению не сдал на права. Так вот, в той автошколе реально были грубые преподаватели, а настолько отзывчивых и уравновешенных преподавателей как в форсаже я еще не встречал. Так что же ты такое делала, что умудрилась выбить из колеи этих спокойных людей?', NULL, NULL, '127.0.0.1', '2013-06-21 19:56:02', 'excellent', 0, 0, 1),
(43, 'Лиза', NULL, 'Полностью согласна с Максом. Я когда поступала в автошколу очень боялась, что если я не буду понимать то на меня за это будут ругаться, но на деле оказалось все совсем наоборот. Если я что-то не понимала, то инструктор в свободное от занятий время собирал нас всех и индивидуально объяснял все, что нам было непонятно.', NULL, NULL, '127.0.0.1', '2013-06-23 09:32:41', 'excellent', 0, 0, 1),
(44, 'Артур', NULL, 'Пришел, отучился, получил права! А что еще надо?', NULL, NULL, '127.0.0.1', '2013-06-27 15:14:51', 'good', 0, 0, 1),
(45, 'Маша', NULL, 'Я только начала учиться в автошколе форсаж, но мне уже очень нравится. Недалеко от универа, приемлемая цена и гибкий график посещения. Надеюсь после окончания останусь довольна и не изменю своего мнения. Пока все нравится.', NULL, NULL, '127.0.0.1', '2013-07-01 01:07:43', 'excellent', 0, 0, 1),
(46, 'Наталья', NULL, 'Поддерживаю)', NULL, NULL, '127.0.0.1', '2013-07-26 03:22:14', 'noRating', 0, 0, 1),
(47, 'Галина', NULL, 'Здравствуйте! Недавно получила права и очень этому рада!!! Теорию сдала с первого раза, вождение со второго. Спасибо Автошколе форсаж. Все очень понравилось', NULL, NULL, '127.0.0.1', '2013-07-01 16:23:26', 'good', 0, 0, 1),
(48, 'Ксения', NULL, 'Здравствуйте,хочу сказать огромное спасибо! Автошкола очень понравилась, знание дают полные, очень доступно, особая благодарность моему инструктору Литвинову Сергею, МОЛОДЦЫ! ', NULL, NULL, '127.0.0.1', '2013-08-23 04:56:12', 'excellent', 0, 0, 1),
(49, 'Татьяна', NULL, 'Школа супер, инструктора грамотные, администраторы приветливые, преподаватели очень доходчиво,грамотно объясняют. Вообщем я не ошиблась с выбором автошколы. Все экзамены сдала с первого раза. Если кто то еще выбирает где отучится, то рекомендую &quot;Форсаж&quot;, не пожалеете! ', NULL, NULL, '127.0.0.1', '2013-08-23 05:04:34', 'excellent', 0, 0, 1),
(50, 'Александр', NULL, 'согласен с Татьяной! Спасибо &quot;Форсаж&quot; так держать!', NULL, NULL, '127.0.0.1', '2013-08-23 05:07:39', 'excellent', 0, 0, 1),
(51, 'симов  сергей константинович', NULL, 'отучился деньги заплатил в итоге на права не сдал остался без денег и без прав так что ни какой гарантии', NULL, NULL, '127.0.0.1', '2013-10-18 02:24:54', 'bad', 0, 0, 1),
(52, 'Якушева Светлана Александровна', NULL, 'Многие не сдают экзамен в ГАИ с первого раза... и не всегда это вина автошколы...Кто Вам пересдать не даёт??? Обвинить всегда проще кого-то, а не себя-любимого...Автошкола - супер!!! Кто хочет учиться - учатся, никто заставлять там не станет...А знания не приходят сами собой)))Удачи всем!!!', NULL, NULL, '127.0.0.1', '2013-10-22 11:18:58', 'noRating', 0, 0, 1),
(53, 'Кузнецов Роман Владимирович', NULL, 'Доброго времени суток. Симов Сергей Константинович, проверив все списки учеников к сожалению, (а может быть к счастью) не нашел вас в них. Соответственно, либо вы указали в своем отзыве не свои данные, что не имеет смысла, либо, А ТАК ОНО И ЕСТЬ, вы пытаетесь оклеветать нашу Автошколу. Дело ваше!\r\nЗаверяю каждого читателя данных отзывов, в нашей Автошколе ни когда не &quot;кидали&quot; народ, не брали каких либо доплат не предусмотренных договором и не бросали на произвол судьбы. С нашей Автошколой оооооочень сложно не сдать экзамены в ГАИ и не научиться водить ТС, для этого нужно быть весьма безответственным человеком, либо очень глупым. А гарантии вам действительно ни кто не даст, так как за вас учитсься мы не можем и не будем. \r\nПроцент сдачи нашими учениками в ГАИ один из лучших среди автошкол города Рязани.\r\nВсем желаю удачи в обучении и на дорогге!!!\r\n\r\nГен. Директор Кузнецов Роман Владимирович.', NULL, NULL, '127.0.0.1', '2013-10-28 07:59:32', 'noRating', 0, 0, 1),
(54, 'Евгений', NULL, 'Сергей, а вам не приходило в голову что вина может быть вашей? Автошкола дает вам знания, но она не обязана вас заставлять учиться. если вы на занятиях хлопали ушами, вместо того, чтобы заниматься, то это ваши проблемы. В конце концов как уже написали выше, всегда можно пересдать! Так что не надо винить никого кроме себя. Я сам учусь в этой автошколе и могу с уверенностью сказать что за экзамен в ГАИ не переживаю, так как уверенно езжу по городу, с первого раза прохожу все упражнения на автодроме и сдаю теоретические вопросы без ошибок!', NULL, NULL, '127.0.0.1', '2013-10-31 15:02:29', 'noRating', 0, 0, 1),
(55, 'Ирина', NULL, 'Очень рада, что так повезло. Детально и доступно разобрали все упражнения на площадке, все маневры в городе. Спасибо за терпение и спокойствие. А что касается вымогательств и грубого обращения, то за весь период обучения ничего подобного не встретила. Инструктора всегда идут на встречу, а за обучение я отдала ровно столько, сколько указано в договоре и не копейкой больше.', NULL, NULL, '127.0.0.1', '2013-10-26 10:24:16', 'excellent', 0, 0, 1),
(56, 'Руслан', NULL, 'Отличная автошкола! Занятия по теории проводятся очень грамотно, интересно слушать! Огромная благодарность моему инструктору по вождению Литвинову Сергею, очень грамотно, терпеливо, профессионально обучает! Спасибо!', NULL, NULL, '127.0.0.1', '2013-10-30 15:04:51', 'excellent', 0, 0, 1),
(57, 'Люлин Николай', NULL, 'Хорошая автошкола. Часто проводят акции всевозможные. Относительно недавно участвовал в розыгрыше 50% скидки, к сожалению главный приз достался не мне, но в качестве утешительного приза мне сделали скидку 10%. Поначалу смущала низкая цена обучения, но пока все нравится. Объясняют очень понятно. По поводу вождения пока не могу ничего сказать, но пока автошкола себя показала с хорошей стороны!', NULL, NULL, '127.0.0.1', '2013-10-31 12:09:23', 'excellent', 0, 0, 1),
(58, 'Хрусталева Оксана Викторовна', NULL, 'Примите слова искренней благодарности за ваш высокий профессионализм, компетентность, целеустремленность направленную на обучение, и кропотливый труд.Присущие вам работоспособность, нацеленность на достижение конечного результата, доброжелательность, терпение, готовность преподавателя и инструкторов отвечать на любые вопросы своих учеников-меня просто восхищает!!! Надеюсь, что ваш опыт и неугасимый огонь искренней преданности своему делу, послужат дальнейшему развитию и процветанию вашей автошколы.Желаю вам терпения, оптимизма и успехов в вашем нелегком, но таком важном труде.Спасибо за учебу!!!!', NULL, NULL, '127.0.0.1', '2013-11-17 04:02:36', 'excellent', 0, 0, 1),
(59, 'Хамидуллина Татьяна', NULL, 'Хочу выразить благодарность самой школе и в частности преподавателю ПДД Омельяненко Александру Анатольевичу, достаточно понятно все объяснял, что вопросов даже не возникало. Так же хочу сказать огромное спасибо моему инструктору по вождению       Литвинову Сергею Александровичу!!! Человек с волшебным терпением, железо-бетонными нервами и всегда с хорошим настроением) Золотой инструктор! ', NULL, NULL, '127.0.0.1', '2013-12-13 12:20:43', 'excellent', 0, 0, 1),
(60, 'Гусева Юлия', NULL, 'Огромное спасибо всем:преподавателям, инструкторам, администрации автошколы Форсаж! Когда поступала очень боялась, что ничего не получится, в общем, что дурой окажусь, и за руль не сяду никогда))) Но нет, объясняют все очень доступно, слушать приятно. Сдала с первого раза)) отдельное спасибо инструктору Насонову Сергею и мою преподавателю Наташе :))))', NULL, NULL, '127.0.0.1', '2013-12-17 07:18:29', 'excellent', 0, 0, 1),
(61, 'марина демко', NULL, 'скожите пожалуйста сколько будет стоеть два месяца обучения', NULL, NULL, '127.0.0.1', '2014-02-09 03:29:45', 'noRating', 0, 0, 1),
(62, 'Мария :-)', NULL, 'спасибо Автошколе) обучалась у Бутенко Владимира Ивановича, очень хороший преподаватель: объясняет все четко и понятно, еще отдельное спасибо инструктору Гуляеву Вячеславу :-) сдала правда не с первого раза, а со второго, но это уже была моя ошибка на сдаче)', NULL, NULL, '127.0.0.1', '2013-12-21 03:59:19', 'excellent', 0, 0, 1),
(63, 'Колесников Денчик', NULL, 'а Яб так ну совсем не сказал абсолютно нечеткий залуПЕЦ', NULL, NULL, '127.0.0.1', '2014-02-21 11:19:25', 'noRating', 0, 0, 1),
(64, 'Александр К.', NULL, 'Спасибо сотрудникам, но ничего такого необычного в автошколе не увидел. Посредственная автошкола, каких сотни. Но все равно спасибо, ибо цена за обучение очень сильно порадовала. Сестра училась в другой автошколе, и там с нее постоянно тянули деньги. Тут такого не заметил, заплатил только то, что было указано в договоре.', NULL, NULL, '127.0.0.1', '2013-12-22 11:57:31', 'good', 0, 0, 1),
(65, 'Администрация', NULL, 'Спасибо вам за отзыв. Вы верно заметили, что мы не супер автошкола, а обычная автошкола которая должным образом обучает своих учеников. По поводу вытягивания денег из учеников, это действительно беда большинства автошкол Рязани, мы же строго следим за этим. Ученики нашей автошколы платят ровно столько, сколько у них указано в договоре.', NULL, NULL, '127.0.0.1', '2014-06-09 02:09:50', 'noRating', 0, 0, 1),
(66, 'Щербакова Марина', NULL, 'Здравствуйте!Хочу поблагодарить всех сотрудников Автошколы ФОРСАЖ!!!Коллектив очень грамотный и теория и вождение все на высшем уровне.Спасибо руководителям автошколы за внимательное отношение,за честную,грамотную и профессиональную работу.Я очень довольна своим выбором  что училась именно в этой Автошколе.Большое спасибо преподавателю по теории Наталье)))Отдельно огромное СПАСИБО инструктору МАКАРОВУ ИГОРЮ ИВАНОВИЧУ. За  его профессионализм,доброжелательность,старание,спокойствие.За его грамотное и доступное объяснение и обучение вождению.Пришла обучаться с &quot;нуля&quot; и права в кармане)))(правда сдала в ГАИ со второго раза,но это не вина автошколы) ни какого вымогательства и грубого обращения я не увидела. СПАСИБО ЗА ОБУЧЕНИЕ,ВСЕ НА ВЫСШЕМ УРОВНЕ!!! ', NULL, NULL, '127.0.0.1', '2013-12-22 05:30:21', 'excellent', 0, 0, 1),
(67, 'Катенька', NULL, 'Спасибо автошколе! хороший преподавательский состав, отличные инструктора :-) отучилась без проблем и конфликтов, сдала с первого раза!', NULL, NULL, '127.0.0.1', '2013-12-27 03:33:28', 'excellent', 0, 0, 1),
(68, 'Алена', NULL, 'спасибо автошколе! обучилась быстро, без доплат, качественно. ВСЕМ СОВЕТУЮ!! сдала на права с первого раза:-)', NULL, NULL, '127.0.0.1', '2014-01-26 04:00:23', 'excellent', 0, 0, 1),
(69, 'Курзанова Люба', NULL, 'Огромное спасибо автошколе Форсаж,замечательным преподавателям ПДД Омельяненко А.А.,Бутенко В.И. за их профессионализм,грамотное донесение ПДД до учеников(объясняли так,что вопросов невозникало,да и возникнуть не могло)все дорожные ситуации объяснялись на жизненных примерах:)А также хочу выразить огромную благодарность самому замечательному,позитивному,профессиональному инструктору ГУЛЯЕВУ ВЯЧЕСЛАВУ:)Огромное спасибо,за позитивное обучение,профессиональное вождение:)И огромное спасибо за терпение:)Всем большое спасибо,было безумно приятно иметь дело с потрясающей АВТОШКОЛОЙ ФОРСАЖ!!!(Теорию,внутренний и ГАИ сдала с 1 раза)Все благодаря этой замечательной автошколе!Желаю вашей АВТОШКОЛЕ дальнейшего процветания:)', NULL, NULL, '127.0.0.1', '2014-02-05 09:38:50', 'excellent', 0, 0, 1),
(70, 'Пупс', NULL, 'Xорошая автошкола, особенно для те кто не знает с какой стороны пододить к автомобилю, всё расскажут, покажут. Рекомендую.  ', NULL, NULL, '127.0.0.1', '2014-02-20 04:22:16', 'excellent', 0, 0, 1),
(71, 'таня', NULL, 'класная школа', NULL, NULL, '127.0.0.1', '2014-02-24 01:07:14', 'excellent', 0, 0, 1),
(72, 'Галина', NULL, 'Хорошая школа, преподаватели молодцы, объясняют все понятно.Огромное спасибо инструктору Литвинову Сергею. Необыкновенный человек и классный специалист. Процветания Вашей школе.   ', NULL, NULL, '127.0.0.1', '2014-03-04 04:10:38', 'excellent', 0, 0, 1),
(73, 'любаша', NULL, 'А я в Форсаже прошла только теорию пока  училась на ул Есенина   у Светланы к сажелению фамилию забыла но это не главное самое главное я хочу выразить огромную благодарность этому преподавателю очень ХОРОШЕМУ и знающему свое дело на отлично все обясняет очень понятно и коректно    поймет даже мартышка так что советую а по поводу  практики вождения пока говорить не чего не буду т к  пока рано но позже обязательно напишу пока все на отлично!!!!!!!!          ', NULL, NULL, '127.0.0.1', '2014-03-12 08:18:43', 'excellent', 0, 0, 1),
(74, 'Виктория', NULL, 'Осталось совсем немного до самых главных дней. Обучение проходит плодотворно!С огромным удовольствием посещаю занятия на Есенина 9 у Светланы !!!Отличный знаток своего дела- всегда подскажет,расскажет,посоветует,наругает даже-но есть за что)))Мой сундучек знаний значительно увеличился-спасибо огромное!!!', NULL, NULL, '127.0.0.1', '2014-03-14 01:32:46', 'excellent', 0, 0, 1),
(75, 'Елена ', NULL, 'Автошкола хорошая, по теории очень хороший преподаватель Станислав Зигмундович. Дает теорию так хорошо и так занятия хорошо построены, что не сдать в ГАИ теорию невозможно. Вождению меня меня обучал очень спокойный и грамотный инструктор  Дмитрий. Большое им спасибо. Но очень бы хотелось чтобы руководство при сдачи экзаменов в ГАИ (вождение по городу) не допускало нервных инструкторов при котором из большой группы 19 человек сдают только 4.И не мало из-за его поведения. ', NULL, NULL, '127.0.0.1', '2014-03-27 10:56:35', 'good', 0, 0, 1),
(76, 'Администрация', NULL, 'Спасибо за ваши замечания, мы обязательно к ним прислушаемся и примем соответствующие меры. Удачи вам на дороге!', NULL, NULL, '127.0.0.1', '2014-06-09 02:04:33', 'noRating', 0, 0, 1),
(77, 'ОЛЬГА', NULL, 'Вопрос:&quot;В какой автошколе пройти обучение?&quot;, отпал сам собой,когда знакомый посоветовал пойти в &quot;Форсаж&quot;. Не пожалела ни капельки. Теорию изучала на ул.Есенина д.9. Удобный график, индивидуальный подход. Огромное спасибо преподавателю Светлане. Занятия по теории проходили на доступном для понимания уровне, после каждой пройденной и разобранной темы следовала контрольная, затем зачет. После такого обучения уж точно ничего не забудешь, отсюда и положительный результат при сдачи теории в ГАИ. Большущее спасибо инструктору Гуляеву Вячеславу, за грамотное и профессиональное обучение вождению. Желающим приобрести знания ПДД и стать водителем ТС рекомендую в &quot;Форсаж&quot; идти!', NULL, NULL, '127.0.0.1', '2014-04-16 12:06:44', 'excellent', 0, 0, 1),
(78, 'Виктория', NULL, 'и снова Я)))права на руках -счастью нет предела)))Преподаватель теории Светлана, отличный педагог и очень позитивный человек, всегда открыта и доброжелательна. Преподает настолько доступно, что в голове сразу все раскладывается по полочкам и вопросов не возникает, а, если и возникают, всегда можно подойти переспросить и получить на это развернутый ответ. Требование Светланы учить материал вполне оправданно, потому что вам прийдется сдавать теоретический экзамен самостоятельно и своей головой. Хотите сдать — учите, и, я считаю, это правильно.\r\n Вождением занималась с инструктором Гуляевым Вячеславом. Это лучший из лучших инструкторов, самый профессиональный из всех профессионалов. Очень выдержанный человек. Перед всеми упражнениями и действиями четко все объясняет — куда, зачем и почему именно так, а также во время упражнений проговаривает все столько раз, сколько это необходимо. Главное — постараться услышать и понять. К каждому ученику свой индивидуальный подход, с ним очень комфортно психологически. К сдаче экзаменов в ГИБДД готовит основательно!  Все люди разные, и, соответственно, время на подготовку требуется разное. По-моему мнению, Вячеслав, может научить ездить любого, независимо от уровня подготовки. От занятий у меня остались только положительные впечатления и эмоции, а также приличный багаж знаний, который теперь буду отрабатывать на практике. ОГРОМНОЕ ЧЕЛОВЕЧЕСКОЕ СПАСИБО !!!я с правами)))урааа урааа!!!', NULL, NULL, '127.0.0.1', '2014-04-16 01:04:32', 'excellent', 0, 0, 1),
(79, 'ирина', NULL, 'Отличная автошкола!Прекрасные инструктора, атмосфера,доступная цена и гибкий график. Особо хочу выделить Диму Лиханова-очень хороший инструктор и комфортный человек, всем рекомендую.\r\nP.S.Спасибо Дим!!!', NULL, NULL, '127.0.0.1', '2014-04-18 07:27:21', 'excellent', 0, 0, 1),
(80, 'Мариночка', NULL, 'Замечательная автошкола!по моему этого достаточно)', NULL, NULL, '127.0.0.1', '2014-04-19 12:01:12', 'excellent', 0, 0, 1),
(81, 'Манина Екатерина ', NULL, 'не хочу спорить насчет профессионализма инструкторов, но факт остается фактом, что объяснить и научить могут не все.А о том что манера общения и человеческое отношение хромает это точно (опять же не у Всех). В моем случае, пока не потребовала составить график вождения, его в природе не было,о периодической отмене и переносе занятий вообще молчу.Уважаемые инструктора график вождения составляется для общего удобства - вы работаете, мы тоже. Вообщем минусов хватает.', NULL, NULL, '127.0.0.1', '2014-04-26 09:12:06', 'bad', 0, 0, 1),
(82, 'Администрация', NULL, 'Здравствуйте, Марина, не могли бы вы уточнить с каким инструктором у вас возникли проблемы, чтобы мы могли принять соответствующие меры. Для нас очень важно качество обслуживания наших клиентов.', NULL, NULL, '127.0.0.1', '2014-06-09 02:00:12', 'noRating', 0, 0, 1),
(83, 'Кузнецов Роман Владимирович', NULL, 'Доброго времени суток. \r\nЯ являюсь генеральным директором данной Автошколы. \r\nЕкатерина, вы должны помнить наш с вами разговор, в котором я вам объяснил причины переноса занятий, напомню и расскажу всем читателям, из-за изменения закона о ПДД и закона об образовании, в нашем ГИБДД перенесли дату начала принятия экзамена на автоматической коробке передач, мы могли вам выдать все необходимые часы в срок и без переноса занятий, но в таком случае до даты экзамена в ГИБДД вам бы пришлось сидеть дома и ждать, в связи с чем, вы бы все забыли. Не скажу, что наше решение было правильным, две стороны, два мнения, но на сколько я помню, в ГИБДД теорию и автодром вы сдали с первого раза, а город со второго, что очень и очень высокий результат. Этот результат говорит о том, что вы хорошая ученица, а Борисов Алексей Владимирович отличный инструктор, и не смотря на ваши с ним разногласия, вы оба смогли найти общий язык, и последние занятия проходили с улыбкой и в хорошем настроении.\r\nЖелаю вам удачи на дорогах. Ни гвоздя, ни жезла!!!\r\n', NULL, NULL, '127.0.0.1', '2014-07-03 03:31:33', 'noRating', 0, 0, 1),
(84, 'Гуртиков Артем ', NULL, 'Сдал ГАИ с первого раза, отличное обучение, великолепные преподаватели и инструкторы! Спасибо большое!', NULL, NULL, '127.0.0.1', '2014-05-06 06:32:52', 'excellent', 0, 0, 1),
(85, 'Администрация', NULL, 'Вам спасибо за то, что вы у нас обучались. Нам всегда приятно слышать о том, что наши ученики довольны результатом. Удачи вам на дорогах!', NULL, NULL, '127.0.0.1', '2014-06-09 02:01:30', 'noRating', 0, 0, 1),
(86, 'Ирина С.', NULL, 'Сергей Старожилов - отличный инструктор! Мне понравилось заниматься с ним, осталась очень довольна. Он видит ученика, его слабые стороны. Фиксирует внимание на вроде бы не значительных деталях, но в то же время достаточно важных. Сергей очень хорошо объясняет, даже такие нюансы, которые другой человек не объяснит. Чувствую себя намного увереннее за рулем. Спасибо за подбор такого замечательного инструктора.', NULL, NULL, '127.0.0.1', '2014-06-05 12:52:50', 'excellent', 0, 0, 1),
(87, 'без имени', NULL, 'сергей сторожилов самый лучший инструктор', NULL, NULL, '127.0.0.1', '2014-06-10 07:27:50', 'excellent', 0, 0, 1),
(88, 'ЛЮДМИЛА ТРУБИЦЫНА ', NULL, 'СПАСИБО большое преподавателю СВЕТЛАНЕ!!!она нас обучила теории её занятия были просто супер нам было очень хорошо понятно её уроки,иногда даже уходить было не охота.Она объясняла нам на простом языке.она старательно подходила и объясняла чтоб каждый понял теорию,ЕЩЁ ОГРОМНОЕ СПАСИБО нашему замечательному инструктору АЛЕКСЕЮ БОРИСОВУ!!!!! он нас обучал вождению на дороге,он очень хороший инструктор и я благодарна ему за все эти занятия особенно перед экзаменом который Я сдала!!! И САМОЕ БОЛЬШОЕ СПАСИБО ВЯЧЕСЛАВУ!!!заставляет думать головой, СПАСИБО ОГРОМНОЕ БОЛЬШОЕ МОЕЙ ПОДРУЖКЕ ЕЛЕНЕ СВИРИНОЙ КОТОРАЯ МЕНЯ В ЭТУ КЛАССНУЮ ШКОЛУ ПРИВЕЛА!!!!!', NULL, NULL, '127.0.0.1', '2014-06-24 05:46:22', 'excellent', 0, 0, 1),
(89, 'Александра ', NULL, 'Всем доброго времени суток! Я обучалась в автошколе Форсаж в Алине.  Честно?  Я очень довольна! \r\nПреподаватель Наташа строгий человек. Но это того стоило. От нее очень сложно уйти не зная правил дорожного движения. Меня полностью устраивали условия и способы обучения. Если было время я посещала лекции вечером. Но мне не было нужды, на все мои вопросы отвечали в индивидуальном порядке на занятиях, которые я посещала. Я получила отличные знания по ПДД! Я знаю их и умею ими пользоваться, и очень этому рада :-) \r\nТеперь не много о занятиях по практике. Скажу честно, я очень сильно боялась машин. Когда меня инструктор посадил на автодроме за руль - у меня была истерика. Но ничего страшного не произошло, инструктор очень адекватно отреагировал – ни кричал, ни ругал, просто объяснил все, показал как, что и где. Объяснил что машину боятся глупо. В общем, посмеялись, пошутили я и успокоилась.  Автодром проблем никаких не вызвал. Если делать все четко, как говорит инструктор, то все делается «одной левой» с первого раза! \r\nТеперь не много о городе. Опять же перед выездом у меня была истерика и я не хотела ехать с уютного и привычного уже автодрома. Но инструктор сказал едем и мы поехали. Теперь возник страх ДРУГИХ машин. Все едут абы как: подрезают, перестраиваются без поворотников, скоростной режим не соблюдают ! и тут выезжаю я! Скорость 30-40, шарахаюсь от всех машин, за рулем не слежу. Инструктор без криков, без мата спокойно помогал мне, объяснял как и что надо делать. И я проехала так первый  раз от автодрома до офиса в Канищево. На следующий раз я уже спокойно ехала и усваивала все что говорит инструктор. Мне моих часов вождения вполне хватило. Если слушать инструктора и выполнять все его требования то все идет как по маслу. Так что вождением я была больше чем довольна! За что я безумно благодарна своему инструктору – Насонову Сергею! Великолепный человек, не кричит, не ругается ( если конечно вы не тупите!). Он обучает всему что требуется новичку. Меня он обучил всему, НО самое главное с ним я поняла что машина это не так страшно как я думала. Спасибо ему большое. \r\nНу вот я сдала все зачеты, откатала свои занятия – пора и на внутренние экзамены. \r\nВ понедельник (экзамены по практике каждый понедельник) в 9.00 на ост. Телезавод, подождали опоздавших и нас забрали на автодром. На автодроме нам разрешили сдавать на любой машине из предоставленных. Предоставлялись автомобили на которых мы обучались. Если твоего автомобиля не было, никто не запрещал попробовать прокатится на другом – попробовать как едет. Не довольных не было. Автодром сдали все, без каких либо проблем. Сдавали все 5 элементов (змейка, парковка, эстакада, гараж и разворот). Как все сдали выехали в город. И тут все как на экзамене в ГАИ кто то поехал на маршрут канищево-приокский-московский, а кого то увезли на Павлова, 22. Сдавалось так же строго как и в ГАИ. Наш экзаменатор Вячеслав был строг, но ни разу он не нажимал педали, не дергал руль, не мешал одним словом ученикам ехать. Я ехала сзади и наблюдала молча как все сдают. Все было как надо. Вячеслав брал в расчет и то что люди волнуются, но не давал им слабины. На их мелкие просчеты он объяснял что в ГАИ для них эта ошибка может выйти пересдачей. При мне ни один ученик серьезно не накосячил ( все соблюдали все правила и ехали как надо).  Так что и город сдало большинство. В том числе и я.\r\nТак вышло что сразу после вождения у меня был экзамен по теории. Наталья очень строго к этому относится! У нее на 5 билетов разрешено допустить 1 ошибку. Это сделать довольно таки сложно! НО если человек реально учил ПДД, знает их и понимает что да как, то это не вызывает особых проблем. Сдается у нее 5 билетов письменно и 5 на компьютере. Все строго. Но все сдают и не возникают, потому что так надо и это факт. \r\nЗатем инструктаж. За день до ГАИ вечером инструктаж. Сверка документов, кратко о ГАИ : что можно и что нельзя в ГАИ. 30-40 минут времени вечером и вот она – ночь перед ГАИ! Я спала крепко, без нервов.\r\n\r\nСдача в ГАИ!\r\n26.06.2014 выдался прекрасный солнечный день. В 7.45 перед входом в ГАИ нас собрали, что бы мы сдали паспорта на проверку документов, видимо. :-) Все волновались перед теорией, курящие скурили наверное пачки по две сигарет. Но ничего. Когда нас запустили было сначала страшно, но когда зашла в аудиторию сдачи поняла – пути назад нет и боятся уже без смылено.  Три минуты и ни единой ошибки! Вышла, порадовалась, нас посадили в газель и повезли на автодром. Теорию сдали все! Это было очень приятный факт, поскольку неожиданный. У знакомых из своего офиса узнала как им теория, они сказали что все было очень даже просто.  Приехали на автодром. Кому надо было попробовали машину и проехали по автодрому в ожидании инспектора ГИБДД. Когда он приехал, сдача прошла быстро и без конфузов.  Он разделил нас на две группы и мы поехали в город. Я была в первой группе, нас посадили в газель и мы поехали. В газели все быстро и спокойно решили кто за кем идет, ни кто не возникал, всех вроде все устроило. Я сдавала то ли пятая то ли шестая. Было очень страшно! И если выезжая с автодрома все шутили и смеялись, то после второго человека атмосфера очень напряглась. Ну вот я и в машине. Еду. Останавливаюсь. И инспектор говорит: «Завтра с паспортом». Выходила из машины и меня трясло еще минут 10. НО Я СДАЛА!!! С ПЕРВОГО РАЗА!!! Я БЫЛА БЕЗУМНО РАДА И ГОРДА СОБОЙ! \r\n\r\nИ ВОТ Я С ПРАВАМИ!!! Ура! Я так этому рада! Огромнейшее спасибо и преподавателю Наташе и моему инструктору Сергею!  Все было супер! Теперь я могу правильно водить автомобиль, но так же я перестала опасаться машин! Как говориться клин клином выбивают! :-)\r\nИтог: если очень хотеть и стараться все сдается только так! На внутренних никто и не пытался валить ( поверьте я ехала на заднем сиденье и видела как себя ведет и ученик, и Гуляев Вячеслав). На теории у Наташи все зависит от ваших знаний. Знаете – сдадите.  В ГАИ все зависит от вас, ваших нервов и инспектора ГИБДД. СПАСИБО ВАМ ЗА ЗНАНИЯ!\r\n', NULL, NULL, '127.0.0.1', '2014-07-02 04:21:14', 'excellent', 0, 0, 1),
(90, 'Анечка', NULL, 'Сдала в ГАИ с первого раза! Спасибо автошколе Форсаж! Преподавателю Наташе огромное спасибо за теорию, инструктору Сергею за практику. Меня все устроило. Писать что то еще и более подробно? не вижу смысла.Меня все устроило в процессе обучения! Всем советую эту автошколу!', NULL, NULL, '127.0.0.1', '2014-07-04 06:47:05', 'excellent', 0, 0, 1),
(91, 'Мария', NULL, 'сдала с первого раза! все как обещали. денег не доплачивала никаких, в сроки уложилась. главное желание и стремление. всему персоналу автошколы Форсаж огромное спасибо! осталась полностью довольна. всем советую и рекомендую!', NULL, NULL, '127.0.0.1', '2014-07-04 03:01:42', 'excellent', 0, 0, 1),
(92, 'Виктория', NULL, 'закончила эту автошколу. очень довольна что выбрала именно её. преподаватель и инструктор супер! обучили на отлично. администраторы очень вежливые и приветливые, отвечали на все интересующие вопросы. всем советую и рекомендую.', NULL, NULL, '127.0.0.1', '2014-07-04 03:33:13', 'excellent', 0, 0, 1),
(93, 'Дмитрий ', NULL, 'Я не пожалел что обучался в автошколе форсаж. Всё отлично мне понравилось.', NULL, NULL, '127.0.0.1', '2014-07-04 03:49:48', 'excellent', 0, 0, 1),
(94, 'Кристина', NULL, 'Спасибо сотрудникам автошколы &quot;Форсаж&quot;, все хорошо объясняют, особенно преподаватель Наталья, обо всем заранее напоминают и все подсказывают. Инструктора достойны уважения, все знают свое дело, прекрасно объясняют и показывают все на практике. В особенности спасибо Панову Юрию Леонидовичу, за терпение в обучении и в объяснении материала. ', NULL, NULL, '127.0.0.1', '2014-07-04 04:19:55', 'excellent', 0, 0, 1),
(95, 'Вова', NULL, 'УРАААААААА!!!! Я получил права! Спасибо вам. \r\nНа теории расскажут. На практике — покажут и научат. Ни о чем не пожалел.', NULL, NULL, '127.0.0.1', '2014-07-09 06:02:44', 'excellent', 0, 0, 1),
(96, 'Елена', NULL, 'Как для автошколы - довольно хорошая. Отучилась без каких-либо проблем. Никаких проблем во время обучения не возникало, ни с ГАИ, ни с тренировочной машиной, ни с инструкторами, вообще никаких. Расценки достаточно приемлемые, я думаю, для всех. Очень рекомендую. Думаю, лучшего Вы не найдете.', NULL, NULL, '127.0.0.1', '2014-07-09 06:04:21', 'excellent', 0, 0, 1),
(97, 'Алина', NULL, 'Я прошла обучение в автошколе «Форсаж», осталась очень довольна. Хороший инструкторский персонал, профессионально обучают, у каждого отдельный подход к ученику. Спасибо особенно моему инструктору Борисову А.В. , за то что научил водить и не бояться дорог!!!', NULL, NULL, '127.0.0.1', '2014-07-09 06:05:47', 'excellent', 0, 0, 1),
(98, 'Ольга', NULL, 'Это очень хорошая автошкола, преподаватели по теории отличные, понимающие люди...инструктор попался замечательный человек..никаких проблем со сдачей внутреннего экзамена не было!!! всем советую, не пожалеете)))', NULL, NULL, '127.0.0.1', '2014-07-09 03:32:46', 'excellent', 0, 0, 1),
(99, 'Ольга', NULL, 'Это очень хорошая автошкола, преподаватели по теории отличные, понимающие люди...инструктор попался замечательный человек..никаких проблем со сдачей внутреннего экзамена не было!!! всем советую, не пожалеете)))', NULL, NULL, '127.0.0.1', '2014-07-09 03:33:31', 'excellent', 0, 0, 1),
(100, 'Светлана', NULL, 'Замечательная автошкола не давно получил здесь права. Автошкола очень понравилась всем советую не пожалеете к тому же и цена на обучение не большая.', NULL, NULL, '127.0.0.1', '2014-07-09 03:54:34', 'excellent', 0, 0, 1),
(101, 'Анастасия', NULL, 'Внятно и доходчиво. Кто придёт за знаниями и умением - тот их получит. Подход спартанский, но здоровый. Спасибо Наталье (теория) и Юрию (вождение)', NULL, NULL, '127.0.0.1', '2014-07-11 07:29:53', 'excellent', 0, 0, 1),
(102, 'Оксана', NULL, 'Занималась в филиале в Канищево,понравилось! Очень интересная методика преподавания теоретических занятий,преподаватели просто супер!Инструктор по вождению реально хочет научить своих учеников обдуманно водить машину, оценивать дорожную ситуацию и принимать в связи с этим правильные решения, учит избегать ненужных действий на дороге. Долго выбирала хорошую автошколу и как оказалось с выбором не ошиблась!', NULL, NULL, '127.0.0.1', '2014-07-11 07:44:42', 'excellent', 0, 0, 1),
(103, 'Лена', NULL, 'Хочу выразить свою благодарность автошколе Форсаж. Преподаватели хорошие. Хочу сказать, что все сдала сама и это реально. Особенно хочу поблагодарить своего инструктора Славу! Очень хороший инструктор :)', NULL, NULL, '127.0.0.1', '2014-07-11 08:43:43', 'excellent', 0, 0, 1),
(104, 'Дима', NULL, 'Очень доволен, большое спасибо. Рад что к вам попал, буду советовать друзьям!!!', NULL, NULL, '127.0.0.1', '2014-07-11 10:51:23', 'excellent', 0, 0, 1),
(105, 'Марина', NULL, 'Уникальный подход к людям, огромное спасибо инструктору Сергею, вхожу в поворот, перестраиваюсь, паркуюсь и все это приносит одно удовольствие. Очень довольна, буду советовать всем друзьям.', NULL, NULL, '127.0.0.1', '2014-07-11 11:30:31', 'excellent', 0, 0, 1),
(106, 'Анна', NULL, 'Спасибо огромное автошколе за знания, за уверенность, которую в нас вселили, за доброжелательное, я бы сказала – семейное отношение! Отдельное СПАСИБО, преподавателю Свете, за отличное объяснение материала, все доступно и ясно!', NULL, NULL, '127.0.0.1', '2014-07-11 12:25:15', 'excellent', 0, 0, 1),
(107, 'Антон', NULL, 'Всем привет. Буду краток. Автошкол выбор большой, но я в своем не ошибся. Насонов Сергей ЛУЧШИЙ инструктор. Респект автошколе и всем удачи на дорогах!!!', NULL, NULL, '127.0.0.1', '2014-07-15 03:12:55', 'excellent', 0, 0, 1),
(108, 'Мария', NULL, 'Спасибо Вам Большое!!!У Вас замечательная автошкола!!!чуткие и внимательные инструктора!с Радостью и большой благодарностью вспоминаю Форсаж!Спасибо Вам Большое! ', NULL, NULL, '127.0.0.1', '2014-07-15 03:18:12', 'excellent', 0, 0, 1),
(109, 'Любовь ', NULL, 'Я осталась очень довольна, что выбрала именно эту автошколу. Светлана прекрассный преподаватель, все доступно, понятно объясняет. Огромное ей спасибо!!!!!!!!!! И огромное спасибо инструктору Насонову Сергею. Очень хорошо объясняет, комментируя каждое твое действие. ', NULL, NULL, '127.0.0.1', '2014-07-16 03:29:58', 'excellent', 0, 0, 1),
(110, 'Ольга и Наталья', NULL, 'Сегодня сдали экзамен в ГАИ с первого раза , как впрочем и внутренний экзамен) благодаря преподавательнице Наталье, ее хорошему подходу к каждому ученику, мы усвоили всю данную ей информацию (но и от целеустремления тоже зависит многое),администратору Елене, они очень дружелюбные, приветливые, внимательные, всегда выслушают,поддержат, наши палочки-выручалочки). Благодарны своему инструктору Челакову Юрию ,без него мы никуда...)он хороший друг и учитель). Также вышестоящие люди как Вячеслав и Алексей ,такие же добрые и понимающие люди). В общем , мы вам всем очень благодарны за все, особенно за ваше терпение. Будем по вам скучать и заходить к вам в гости) Форсаж , очень хорошая автошкола, желаем всем удачи в обучении)', NULL, NULL, '127.0.0.1', '2014-07-17 01:44:04', 'excellent', 0, 0, 1),
(111, 'Артем', NULL, 'Хочу выразить огромную благодарность автошколе Форсаж за очень качественную подготовку для получения водительского удостоверения. Вчера сдал с первого раза. Буду всем своим друзьям советовать именно вашу автошколу .Спасибо за все !! )', NULL, NULL, '127.0.0.1', '2014-07-18 03:26:58', 'excellent', 0, 0, 1),
(112, 'Ренат', NULL, 'Хорошая автошкола! Машины хорошие! Сдал всё с первого раза! Хорошие мастера!', NULL, NULL, '127.0.0.1', '2014-07-18 03:34:45', 'excellent', 0, 0, 1),
(113, 'Наталья', NULL, 'Ура!!! Я сдала в ГАИ!!! Спасибо большое автошколе за полученные знания и навыки, очень доступно и хорошо объясняют, было бы желание)). Всем спасибо!!!', NULL, NULL, '127.0.0.1', '2014-07-22 12:56:14', 'excellent', 0, 0, 1),
(114, 'Дмитрий ', NULL, 'Хочу выразить огромную благодарность преподавателям и инструкторам автошколы Форсаж! После обучения, подстраховки не нужны, уверенно можно сдать самостоятельно! Здесь действительно УЧАТ! Итог - ПРАВА на рукух!', NULL, NULL, '127.0.0.1', '2014-07-23 08:50:38', 'excellent', 0, 0, 1),
(115, 'Юлия', NULL, 'Форсаж самая крутая автошкола!!! Получила права с первого раза и без всяких проблем, благодаря хорошим инструкторам. Огромное спасибо !!!&quot;Стальные нервы&quot; - это про Вас ;)) Дальнейшего Вам процветания и побольше талантливых учеников!!!', NULL, NULL, '127.0.0.1', '2014-07-25 06:05:55', 'excellent', 0, 0, 1),
(116, 'Лариса', NULL, 'Великолепная,по цене доступная автошкола! Отличное отношение к обучающимся. Моим инструктором по вождению являлся Литвинов Сергей,относительно человеческих качеств великолепный и добросовестный человек,безусловно идентичное хорошее мнение могу высказать относительно профессиональных качеств,как инструктора.', NULL, NULL, '127.0.0.1', '2014-07-28 04:24:19', 'excellent', 0, 0, 1),
(117, 'Ann ', NULL, 'Сдала с первого раза. Спасибо преподавателю Станиславу Зигмундовичу за хорошую теорию. Инструктор по вождению Старожилов Сергей самый лучший)', NULL, NULL, '127.0.0.1', '2014-08-07 08:56:33', 'excellent', 0, 0, 1),
(118, 'Evgeniya', NULL, 'огромное спасибо преподавателю ЛЕСЕ)))правда,она уволилась(((замечательный препод и человечек))\r\n\r\nАеще хочется поблагодарить инструктора Юрия Панова, очень классный)))', NULL, NULL, '127.0.0.1', '2014-08-13 12:22:38', 'excellent', 0, 0, 1),
(119, 'Виктория', NULL, 'Хочу выразить огромную благодарность инструктору по ПДД Наталье и сказать ей огромное спасибо!!! Она самая лучшая!!Она найдет подход к любому ученику!!! И еще я хочу выразить благодарность инструктору Панову Юрию!! самый офигенный инструктор!! И сказать им большое спасибо за навыки!!САМАЯ ЛУЧШАЯ АВТОШКОЛА!!!ФОРСАЖ спасибо вам !!!', NULL, NULL, '127.0.0.1', '2014-08-15 01:30:17', 'excellent', 0, 0, 1),
(120, 'секретики', NULL, 'Если вы хотите управлять легковым автомобилем и обучаетесь категории «В», то вам необходимо 50 часов практического вождения с инструктором. Много ли это, или мало? Все зависит от того, что считать за час.\r\n\r\nМногие уверены, что если речь идет об обучении в автошколе, то за час, как в университете, следует принимать час академический – то есть 45 минут. С учетом организационных моментов, на дороге вы проведете не больше получаса. А при том, что в сумме должно набраться 50 часов, занятий получается больше, и вы переплачиваете за встречи с инструктором.\r\n\r\nВ нашей автошколе час вождения – это полноценные 60 минут, и реальные 50 часов на дороге. За 60 минут можно успеть гораздо больше: лучше погрузиться в дорожную ситуацию, больше почерпнуть от общения с инструктором и насладиться долгожданным удовольствием от вождения автомобиля. Этот стандарт в 60 минут закреплен в договоре об обучении в автошколе .', NULL, NULL, '127.0.0.1', '2014-08-19 09:06:32', 'excellent', 0, 0, 1),
(121, 'юлия', NULL, 'Училась в автошколе &quot;Форсаж&quot;. Первое, что мне очень понравилось при выборе автошколы в которую пойти учиться - это то, что автошкола &quot;Форсаж&quot; предоставляет рассрочку при оплате обучения. Это очень удобно. В дальнейшем была очень довольна стилем преподавания как теории (доходчиво, интересно, с примерами из жизни), так и практики (инструктор объяснял все очень доходчиво, научил меня именно ездить, а не просто от катал со мной часы). После получения прав сразу же села за руль и чувствую себя уверенно, хотя до учебы в автошколе за рулем не сидела ни разу. Безумно благодарна автошколе &quot;Форсаж&quot;!!! Спасибо Калинина Оксане (преподавателю теории) и Мелешкину Андрею (инструктору).', NULL, NULL, '127.0.0.1', '2014-09-01 07:02:09', 'excellent', 0, 0, 1),
(122, 'Анастасия', NULL, 'замечательная автошкола &quot;Форсаж&quot;!!! преподаватель по теории отличный. Хочу отдельно поблагодарить своего инструктора Сергея Сторожилова! он инструктор от Бога!!!! спокойный, объясняет все доходчиво, учит ездить, подбирает наиболее удобное время для каждого из учеников!!! огромное спасибо тебе :)) ', NULL, NULL, '127.0.0.1', '2014-09-08 08:20:24', 'excellent', 0, 0, 1),
(123, 'Екатерина', NULL, 'А я хочу опровергнуть всё вышесказанное. Если вы сами что-то не услышали и не поняли, нечего никого обвинять. Школа  хорошая, всю информацию доносят без обмана, преподы и инструктора первоклассные. Говорю со знанием дела - недавно всё сдала с первого раза и теперь езжу и наслаждаюсь!!! Идите сюда учиться и никого не слушайте!!!!!!!!!', NULL, NULL, '127.0.0.1', '2014-10-11 09:01:07', 'excellent', 0, 0, 1),
(124, 'Анастасия', NULL, 'Многоуважаемый &quot;ученик форсажа&quot;, видимо вам ещё рано учиться на права или уж с мамкой ходите везде, раз сами адекватно информацию воспринимать не можете. О том, что сдавать на права можно  только с 18-ти лет у вас написано на первой странице договора, читать нужно внимательнее, а не в облаках витать. Таких и за руль сажать опасно, собьёт кого-нибудь, а потом скажет, что ему не говорили, что так делать нельзя.\r\nСидите уж лучше дома около мамки, и всем будет спокойнее.', NULL, NULL, '127.0.0.1', '2014-10-12 07:10:05', 'excellent', 0, 0, 1),
(125, 'Денис', NULL, 'Я тоже хочу заступиться за автошколу Форсаж. Нормальная школа, сам недавно там отучился, благополучно сдал на права. Конечно, в любой организации можно найти минусы, но уж заявлять, что там одни жулики и всех обманывают, это уж слишком. Действительно, сами чего-то недослышат, не дочитают, а потом у них все кругом виноваты.', NULL, NULL, '127.0.0.1', '2014-10-12 07:16:23', 'good', 0, 0, 1),
(126, 'Максим', NULL, 'Я считаю что это очень хорошая автошкола,отличные преподаватели.Огромное спасибо хочу сказать преподавателю Светлане и инструктору Сергею, которые всё доходчиво и понятно объяснили', NULL, NULL, '127.0.0.1', '2014-10-24 01:20:45', 'excellent', 0, 0, 1),
(127, 'Ирина Евгеньевна', NULL, 'Сравнить не могу,но напишу,школа хорошая, администраторы, что на Есенина ,что в &quot;Алине&quot; супер!!!, Алексей,который помог мне выйти из сложившейся ситуации тоже хорош))), но инструкторов надо держать на таком расстоянии, чтобы даже пискнуть боялся))), Панов реально подставил всю группу с июня по август училась)),Бондарев Андрей спас, сама сдала с первого раза!', NULL, NULL, '127.0.0.1', '2014-10-31 01:48:20', 'excellent', 0, 0, 1),
(128, 'Светлана', NULL, 'Класс!!!! Получила права!!!! Спасибо, тебе &quot;Форсаж&quot;, за всё!!! Я очень довольна, всем знакомым буду советовать эту школу. Посещение свободное, оплата в рассрочку, преподаватель офигенный... Вообщем всё, что нужно, чтобы совместить и работу и учёбу!!!\r\n', NULL, NULL, '127.0.0.1', '2014-11-11 02:03:10', 'excellent', 0, 0, 1),
(129, 'Ирина', NULL, 'Ура, я сдала на права!!!!Правда со 2 раза). Первый раз не сдала автодром, подставил инструктор. Спасибо, инструктору Андрею М, что помог в трудную минуту- результат экзамен сдан! Так же хочу выразить благодарность преподавателю Наташе ( теорию сдала без ошибок), администратору Оксане за поддержку. В целом всему коллективу автошколы &quot;Форсаж&quot;. Училась в тц &quot;Алина&quot;.Всем удачи!!!! ', NULL, NULL, '127.0.0.1', '2014-11-19 01:47:35', 'excellent', 0, 0, 1),
(130, 'Наталья ', NULL, 'Хочу поблагодарить своего инструктора Лиханова Дмитрия за  профессионализм, отзывчивость и терпение, проявленные во время обучения. Очень приятно было заниматься под его руководством. Большое спасибо!', NULL, NULL, '127.0.0.1', '2014-11-19 02:32:36', 'excellent', 0, 0, 1),
(131, 'Марина', NULL, 'Сегодня успешно сдала экзамен в ГАИ с первого раза! Хочу поблагодарить весь коллектив автошколы &quot;Форсаж&quot; за прекрасную подготовку!!! Вы профессионалы своего дела! Я нисколько не сомневаюсь что данная автошкола одна из лучших в городе. Всем советую. Спасибо всем инструкторам, которые присутствовали сегодня на экзамене. Также водителю маршрутки, который нас возил по городу!  Особенную благодарность выражаю своему инструктору Сторожилову Сергею за его профессионализм, умение обучать и подготавливать человека к вождению в жизни, а не только в ГАИ. За его терпение и выдержку, за умение находить подход к каждому ученику! За требовательность, за понимание и доброту! Спасибо от чистого сердца!! Желаю автошколе процветания и всех благ!! ', NULL, NULL, '127.0.0.1', '2014-11-19 04:25:07', 'excellent', 0, 0, 1),
(132, 'Светлана', NULL, 'Ура!!!! Сегодня сдала экзамены в ГАИ!!! Не думала, что такую, как я , можно научить водить машину. Но Вы это сделали! Большое спасибо автошколе Форсаж, инструкторам и преподавателям! Вы все большие мастера своего дела! С первого дня, как только я пришла заключать договор и до последнего дня учёбы, я ни разу не пожалела, что пришла именно к вам!', NULL, NULL, '127.0.0.1', '2014-12-23 12:55:11', 'excellent', 0, 0, 1),
(133, 'Ника', NULL, 'Автошколу Форсаж советую всем!!! Отличные преподаватели и инструктора!! Отдельное спасибо инструкторам Сергею Литвинову,Сергею (не помню фамилию)и преподавателю Светлане! Мастера своего дела и отличные люди!Объясняли все доходчиво и добросовестно!По этому экзамен в ГАИ я сдала с первого раза! Спасибо всем)', NULL, NULL, '127.0.0.1', '2015-01-19 09:46:49', 'excellent', 0, 0, 1),
(134, 'ЮРА .С.', NULL, 'МНЕ ПОНРАВИЛАСЬ ПРЕПОДОВАТЕЛЬ НАТАЛИЯ ОБУЧАЕТ ХОРОШО А ИНСТРУКТОР НАСОНОВ СЕРГЕЙ ДАЁТ УРОКИ ВОЖДЕНИЯ ОЧЕНЬ ХОРОШО.ВСЁ СДАЛ С ПЕРВОГО РАЗА.СПОСИБО ВСЕМ.', NULL, NULL, '127.0.0.1', '2015-01-25 01:10:35', 'excellent', 0, 0, 1),
(135, 'Илья К.', NULL, 'отличная автошкола, пришел учиться    мне не было 18 лет, прошел курс теории и вождения, по исполнении 18 лет пошел в гаи и все сдал с первого раза!!!!!! ура я теперь с правами!!!! большое спасибо &quot;Форсаж&quot;!!!! спасибо преподу Наташе, администраторам в Канищево, инструктору Юрию. всем кто хочет получить права без заморочки ОЧЕНЬ рекомендую!!!! ', NULL, NULL, '127.0.0.1', '2015-01-30 03:20:03', 'excellent', 0, 0, 1),
(136, 'Сайян Арут', NULL, 'Учусь в автошколе Форсаж.Скоро экзамены)\r\nЗАмечательная автошкола, преподаватель теории Наталия все понятно и доходчиво обьясняет. Инструктор Сергей Л. мастер своего дела) \r\nРеспект вам =) ', NULL, NULL, '127.0.0.1', '2015-02-02 06:00:48', 'excellent', 0, 0, 1),
(137, 'Юля К.', NULL, 'Здравствуйте!Хочу поблагодарить коллектив &quot;Форсаж&quot;: добрым и понимающим нашим администраторам, преподавателю теории-Наталье,обьясняющей понятно и доходчиво. Огромное спасибо инструктору Насонову Сергею,за достойное, спокойное и понимающее отношение!Четкое,понятное обучение вождению!Когда садишься в машину с данным инструктором, волнение исчезает и чувствуешь себя защищенным, что очень важно! Сдала на права с первого раза! Спасибо Вам Большое!', NULL, NULL, '127.0.0.1', '2015-02-03 03:39:21', 'excellent', 0, 0, 1),
(138, 'Анастасия', NULL, 'Хочу выразить огромную благодарность автошколе &quot;Форсаж&quot;. Замечательные педагоги и инструктора. Отдельное спасибо администратору Наташе, преподавателю Светлане и инструктору Бондареву Андрею за понимание, терпение,поддержку, за полученные знания и опыт.Спасибо Вам, вы самые лучшие!!!!!', NULL, NULL, '127.0.0.1', '2015-02-04 11:51:34', 'excellent', 0, 0, 1),
(139, 'Ученица', NULL, 'ЛУЧШАЯ АВТОШКОЛА. Администратор на Победе очень вежливый, всегда все вовремя сообщает, беспокоится. Преподаватель классная, рассказывает понятным языком - 5+, до вождения еще не дошла,но по отзывам моих знакомых, которые сейчас как раз на вождении, все проходит очень спокойно, грамотно и результативно!!! Спасибо автошколе форсаж!!!', NULL, NULL, '127.0.0.1', '2015-02-05 09:36:40', 'excellent', 0, 0, 1),
(140, 'Катерина', NULL, 'Спасибо &quot;Форсаж&quot;, вы лучшие!!!! Спасибо преподавателю Наташе, мастеру своего дела,лекции очень познавательные и интересные, администраторам, инструктору Артему, за терпение и профессионализм! Большое вам спасибо!!!! Всем кто выбирает где учиться советую &quot;Форсаж&quot;', NULL, NULL, '127.0.0.1', '2015-02-11 07:34:42', 'excellent', 0, 0, 1),
(141, 'Павел', NULL, 'Выражаю свою благодарность коллективу автошколы &quot;Форсаж&quot;, а именно преподавателю Светлане, инструктору Сергею Сторожилову, администратору за качественное обучение, терпение, профессионализм! Желаю дальнейшего развития и успехов!', NULL, NULL, '127.0.0.1', '2015-02-12 11:59:44', 'excellent', 0, 0, 1),
(142, 'Ксения', NULL, 'Обучалась в офисе на Черновицкой, теоретическая часть обучения была проведена на достаточно высоком профессиональном уровне. Материал излагается в доступной, понятной форме. Преподаватель Светлана доброжелательна, всегда поддерживает морально и позволяет грамотно усвоить материал. Инструктор по вождению Андрей Бондарев профессионал своего дела!  Всем большое человеческое спасибо!', NULL, NULL, '127.0.0.1', '2015-02-12 12:10:36', 'excellent', 0, 0, 1),
(143, 'Оля ', NULL, 'Всем советую автошколу &quot;Форсаж&quot;!!!! Огромное спасибо  педагогу Светлане и  инструктору Сергею Старожилову за знания, которые помогли мне сдать экзамены в ГАИ с первого раза!!! Я познакомилась с самыми замечательными специалистами своего дела. Здорово, что существуют такие профессионалы!', NULL, NULL, '127.0.0.1', '2015-02-13 07:23:12', 'excellent', 0, 0, 1),
(144, 'Маруся', NULL, 'Добрый день! Хочу выразить благодарность Всей компании &quot;Форсаж&quot;начиная от администратора Елены (пл. Победы) очень подробно отвечает на все интересующие меня вопросы, не хамит, дает почитать договор, что очень важно, и подробно рассказывает о ценах, машинах, которые есть в автошколе, и хотелось бы  поблагодарить преподавателя Юрия  Храмова, за профессионализм...Больше слов писать не буду, это лишнее...   Всем спасибо', NULL, NULL, '127.0.0.1', '2015-02-16 11:15:52', 'good', 0, 0, 1),
(145, 'Мария', NULL, 'Отличная автошкола! Преподаватель теории Светлана (на Черновицкой) все понятно и доходчиво объясняет,инструктор Сергей Старожилов научит водить грамотно всех, даже самых \'трудных\' учеников!!! Впечатления от обучения в автошколе  самые положительные!!!', NULL, NULL, '127.0.0.1', '2015-03-04 12:02:24', 'excellent', 0, 0, 1),
(146, 'сергей с', NULL, 'я пока только изучаю теорию, преподаватели Наташа и Светлана относятся хорошо, каждому доносят подробно, спасибо им большое, за инструкторов слышал только хорошее..особенно Сергея С', NULL, NULL, '127.0.0.1', '2015-03-18 06:53:17', 'excellent', 0, 0, 1),
(147, 'Арут', NULL, 'Жду не дождусь экзамена в Гаи, месяц прошел а очередь никак не дойдет(', NULL, NULL, '127.0.0.1', '2015-03-20 09:58:26', 'excellent', 0, 0, 1),
(148, 'Цымбалова Екатерина Александровна', NULL, 'Хочу выразить свою благодарность инструктору Бондареву Андрею, за то что научил меня управлять транспортным средством и справляться с нервами,за твой профессионализм и тактику преподавания,так держать!!!Спасибо что ты поверил в меня и поддержал!А еще огромное спасибо преподавателю теории Светлане на Черновицкой,Вы настоящий специалист в своём деле,благодаря Вам теоретический экзамен прошел без единой ошибки.Спасибо Вам мои учителя,Вы лучшие!', NULL, NULL, '127.0.0.1', '2015-03-03 05:32:38', 'excellent', 0, 0, 1),
(149, 'Мария Веселова', NULL, 'Мой автоинструктор по вождению, сделал из меня настоящего водителя несмотря на утверждения родных, что с моей эмоциональностью и рассеянностью мне не следует даже пытаться садиться за руль.', NULL, NULL, '127.0.0.1', '2015-04-01 02:49:22', 'excellent', 0, 0, 1),
(150, 'Анна Д.', NULL, 'Хочу выразить огромную благодарность автошколе!инструкторам, менеджерам, учителям! Обучалась я с подругой у одного учителя по теории и у одно и того же инструктора. Что самое странное, я сдала с первого раза в ГИБДД, а подруга с третьего. Наверное все зависит от самого человека, волнение, нервы. Мы остались довольны. Спасибо всем кто поддерживал меня. Сейчас чувствую себя за рулем хорошо. Сейчас поведу маму обучаться). СПАСИБО!!!', NULL, NULL, '127.0.0.1', '2015-04-01 05:47:54', 'excellent', 0, 0, 1),
(151, 'Алина', NULL, 'Прочитала отзывы и слегка была шокирована! Лично училась в это автошколе, сдала все с первого раза!! Огромное спасибо преподавателю Макиной Светлане  и инструктору Мелешкину Андрею за его терпение и понимание. Очень много зависит не только от автошколы, но и от самого человека как ты воспринимаешь информацию которую тебе дают. Хорошая школа. Ну это чисто мое мнение.', NULL, NULL, '127.0.0.1', '2015-04-01 06:09:02', 'excellent', 0, 0, 1),
(152, 'Маруся', NULL, 'Сдала с первого раза!! Очень этому рада) Спасибо огромное персоналу автошколы за ваше понимание и терпение!!!!', NULL, NULL, '127.0.0.1', '2015-04-01 06:23:34', 'excellent', 0, 0, 1),
(153, 'Надежда', NULL, 'Главное преимущество этой школы, на мой взгляд, - очень серьезная слаженность, взаимопонимание, сплоченность коллектива, в котором любой инструктор или преподаватель готов прийти на выручку и помочь как в штатной, так и внештатной ситуации и своему коллеге и ученику. Было очень приятно чувствовать себя частью этого коллектива и очень грустно расставаться. Очень интересно учиться у Вас)', NULL, NULL, '127.0.0.1', '2015-04-07 12:27:57', 'excellent', 0, 0, 1),
(154, 'Марина', NULL, 'Обучалась в дашках. Замечательно преподавали теорию. К своему стыду не помню имя преподавателя, но это не умаляет его заслуг. Весь материал был дан в полном объеме и практически разжеван, жаль только я пожадничала и не купила курс к которого свободное время посещения, так что если кто собирается идти учиться в автошколу, поверьте мне это вас очень выручит.\r\n\r\nОгромное спасибо директору автошколы который пошел на уступку и позволил скорректировать мой учебный график.', NULL, NULL, '127.0.0.1', '2015-07-04 01:00:50', 'excellent', 0, 0, 1),
(155, 'твердая 4', NULL, 'Хорошая автошкола, звезд с неба не хватает но с другой стороны для Рязани мне кажется одна из лучших, просто я начинал учиться в Москве, но потом переехал и по этому есть с чем сравнить.\r\n\r\nМоя самая главная претензия это то что в кабинете довольно жарко, не знаю как в остальных офисах но у нас было душновато, в Москве у нас были кондиционеры.\r\n\r\nВ остальном автошкола меня полностью устроила, она дала мне именно то что требуется для сдачи экзамена в гаи, не больше не меньше. Рекомендую.', NULL, NULL, '127.0.0.1', '2015-06-29 01:05:33', 'good', 0, 0, 1),
(156, 'Федорова  Мария', NULL, 'Хочу  выразить  огромную  благодарность   автошколе,  в особенности преподавателю теории Светлане и инструктору по вождению Сторожилову Сергею, подкупает их внимательность, терпение, тактичность, умение найти подход к каждому, даже трудно обучаемому человеку, способность помочь, объяснить, поддержать. От преподавателя порой зависит очень многое, спасибо за грамотность и профессионализм.', NULL, NULL, '127.0.0.1', '2015-07-07 10:50:51', 'excellent', 0, 0, 1),
(157, 'Зотова Татьяна', NULL, 'Огромное СПАСИБО коллективу Автошколы. Очень профессиональная работа и доброжелательное отношение. Отдельно СПАСИБО преподавателю Наталье и инструктору Сергею Литвинову  за терпение и поддержку.Сергей, спасибо Вам за ваше чуткое отношение к ученикам, за ваш профессионализм и терпение. Вы супер автоинструктор и чудесный человек. Теперь буду ездить и вспоминать ваши советы. Удачи Вам, ровных дорог и способных учеников!Так же хочу поблагодарить всех менеджеров,работающих в офисах,за их доброжелательность и отзывчивость,супер коллектив!!!!!Нет никаких негативных отзывов об этой автошколе !', NULL, NULL, '127.0.0.1', '2015-07-22 06:53:47', 'excellent', 0, 0, 1),
(158, 'АБРАМОВА СВЕТЛАНА', NULL, 'ХОЧУ ВЫРАЗИТЬ ОГРОМНУЮ БЛАГОДАРНОСТЬ АВТОШКОЛЕ,А ОСОБЕННО ЛИХАНОВУ ДМИТРИЮ.СДАЛА С ПЕРВОГО РАЗА.Я ОСТАЛАСЬ ДОВОЛЬНА.СПАСИБО!!!', NULL, NULL, '127.0.0.1', '2015-07-24 05:59:49', 'excellent', 0, 0, 1),
(159, 'А.К.', NULL, 'Спасибо коллективу автошколы! Преподавателю теории Наталье за подготовку к теоретическому экзамену, инструктору Сергею Литвинову за поддержку во время практического экзамена, администратору Наташе индивидуальный подход к обучающимся. Огромное спасибо инструктору Андрею Мелёшкину за то, что не только подготовил к сдаче экзамена, но и действительно научил ездить в реальных условиях и не бояться автомобиля!!! ', NULL, NULL, '127.0.0.1', '2015-09-10 03:34:01', 'good', 0, 0, 1),
(160, 'Максим', 'Новый сайт', 'Новый сайт действительно стал гораздо быстрее работать, выглядит приятнее и в целом более дружелюбен. Приятно видеть, что автошкола работает над собой не только в рамках программы обучения.', NULL, '89209997040', '92.39.137.126', '2015-12-21 04:34:55', 'excellent', 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `FeedbacksIsComments`
--

CREATE TABLE `FeedbacksIsComments` (
  `feedback` bigint(20) UNSIGNED NOT NULL,
  `parentFeedback` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FeedbacksIsComments`
--

INSERT INTO `FeedbacksIsComments` (`feedback`, `parentFeedback`) VALUES
(2, 1),
(3, 1),
(46, 45),
(52, 51),
(53, 51),
(54, 51),
(61, 60),
(63, 62),
(65, 64),
(76, 75),
(82, 81),
(83, 81),
(85, 84);

-- --------------------------------------------------------

--
-- Структура таблицы `FeedbacksLike`
--

CREATE TABLE `FeedbacksLike` (
  `feedback` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(50) NOT NULL,
  `like` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FeedbacksLike`
--

INSERT INTO `FeedbacksLike` (`feedback`, `ip`, `like`) VALUES
(160, '92.39.137.126', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `FeedbacksListIP`
--

CREATE TABLE `FeedbacksListIP` (
  `ip` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FeedbacksListIP`
--

INSERT INTO `FeedbacksListIP` (`ip`, `status`, `comment`) VALUES
('127.0.0.1', 'vip', NULL),
('92.39.137.126', 'default', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `FeedbacksListIPStatus`
--

CREATE TABLE `FeedbacksListIPStatus` (
  `status` varchar(50) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `timeLimit` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Есть ли ограничение по времени на повторное создание отзыва (не распространяется на комментарии к отзывам)',
  `checkingModerator` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Необходима ли проверка модератором',
  `commentYourself` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Можно ли комментировать самого себя',
  `saveReview` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Сохранять отзыв',
  `showReview` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Отображать отзывы'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FeedbacksListIPStatus`
--

INSERT INTO `FeedbacksListIPStatus` (`status`, `name`, `description`, `timeLimit`, `checkingModerator`, `commentYourself`, `saveReview`, `showReview`) VALUES
('blocked', 'Заблокирован', 'Сообщения не отображаются на сайте, пользователю выдается информация что этот IP заблокирован и неможет оставлять комментарии', 1, 1, 0, 0, 0),
('default', 'По умолчанию', 'Значения по умолчанию', 1, 0, 0, 1, 1),
('vip', 'VIP статус', 'Сразу размещается и не подлежит проверкам', 0, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `FeedbacksRating`
--

CREATE TABLE `FeedbacksRating` (
  `id` varchar(50) NOT NULL,
  `value` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `calc` tinyint(1) NOT NULL DEFAULT '1',
  `forFeedbacks` tinyint(1) NOT NULL DEFAULT '0',
  `forComments` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `FeedbacksRating`
--

INSERT INTO `FeedbacksRating` (`id`, `value`, `name`, `calc`, `forFeedbacks`, `forComments`) VALUES
('bad', 2, 'Плохо', 1, 1, 0),
('excellent', 5, 'Отлично', 1, 1, 0),
('good', 4, 'Хорошо', 1, 1, 0),
('noRating', 99, 'Не голосовать', 0, 0, 1),
('notBad', 3, 'Неплохо', 1, 1, 0),
('terribly', 0, 'Ужасно', 1, 1, 0),
('veryBad', 1, 'Очень плохо', 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul`
--

CREATE TABLE `HtmlModul` (
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `HtmlModul`
--

INSERT INTO `HtmlModul` (`name`, `description`) VALUES
('copy1', NULL),
('HeadContacts', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul_Lang`
--

CREATE TABLE `HtmlModul_Lang` (
  `htmlModul` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `html` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `HtmlModul_Lang`
--

INSERT INTO `HtmlModul_Lang` (`htmlModul`, `lang`, `html`) VALUES
('copy1', 'eng', '<p>Driving school "FORSAZH" reserves the right to change the information published on the site.</p>\r\n<p>Information available at this site is not a public offer.</p>\r\n<p>For more information about pricing and terms, please call us at the telephone numbers provided on the OUR CONTACTS page.</p>\r\n<p>The use of information from the site www.forsazh62.ru is prohibited without the prior permission from the Site managers.</p>\r\n'),
('copy1', 'rus', '<p>Автошкола «ФОРСАЖ» оставляет за собой право вносить изменения в информацию, размещенную на этом сайте.</p>\r\n<p>Информация, размещенная на сайте ни в каком виде не является публичной офертой.</p>\r\n<p>Более подробную информацию о ценах и условиях просьба узнавать по телефонам на странице Контакты.</p>\r\n<p>Использование информации с сайта www.forsazh62.ru запрещено без разрешения Администрации сайта.</p>\r\n'),
('HeadContacts', 'rus', '<div class="HeadPhone">8 (4912) 511 504</div>\r\n<div class="HeadMail">info.forsazh62@gmail.com</div>');

-- --------------------------------------------------------

--
-- Структура таблицы `JCropTypes`
--

CREATE TABLE `JCropTypes` (
  `type` varchar(50) NOT NULL,
  `aspectRatio` float UNSIGNED NOT NULL DEFAULT '0',
  `bgColor` varchar(45) NOT NULL DEFAULT 'black',
  `bgOpacity` float NOT NULL DEFAULT '0.5',
  `sideHandles` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `minWidth` int(10) UNSIGNED DEFAULT NULL,
  `minHeight` int(10) UNSIGNED DEFAULT NULL,
  `maxWidth` int(10) UNSIGNED DEFAULT NULL,
  `maxHeight` int(10) UNSIGNED DEFAULT NULL,
  `cssClasse` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `JCropTypes`
--

INSERT INTO `JCropTypes` (`type`, `aspectRatio`, `bgColor`, `bgOpacity`, `sideHandles`, `minWidth`, `minHeight`, `maxWidth`, `maxHeight`, `cssClasse`) VALUES
('Avatar', 1, 'black', 0.2, 1, 150, 150, 600, 600, 'JCrop_Avatar'),
('MaterialsImage', 0, 'black', 0.2, 1, 200, 150, 900, 500, 'JCrop_MaterialsImage');

-- --------------------------------------------------------

--
-- Структура таблицы `Jquery`
--

CREATE TABLE `Jquery` (
  `fileName` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `min` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Jquery`
--

INSERT INTO `Jquery` (`fileName`, `version`, `min`) VALUES
('jquery-1.10.1.min.js', '1.10.1', 1),
('jquery-1.6.3.min.js', '1.6.3', 1),
('jquery.1.8.2.min.js', '1.8.2', 1),
('jquery-1.9.0.min.js', '1.9.0', 1),
('jquery-2.0.3.min.js', '2.0.3', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Lang`
--

CREATE TABLE `Lang` (
  `lang` varchar(3) NOT NULL,
  `langName` varchar(50) NOT NULL,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Lang`
--

INSERT INTO `Lang` (`lang`, `langName`, `default`) VALUES
('eng', 'English', 0),
('rus', 'Русский', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Maps`
--

CREATE TABLE `Maps` (
  `alias` varchar(100) NOT NULL,
  `sid` varchar(100) NOT NULL,
  `width` int(5) UNSIGNED DEFAULT '560',
  `height` int(5) UNSIGNED DEFAULT '200'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Maps`
--

INSERT INTO `Maps` (`alias`, `sid`, `width`, `height`) VALUES
('rzn_chernovickaja_6a', 'fPGWPk568Add75Vy5qsbRuXCpRuxwwXm', 560, 200),
('rzn_international_22a', 'bzmZsMdnrEQlxJk6JzcgZqk4wHACcbCO', 560, 200),
('rzn_novoselov_30a', 'SJ2oohMwvytc5LBPfIEzGdRcNFraSwMo', 560, 200),
('rzn_pervomajskij_prt_21', '8QIKE22Wy-uG6FoX7LqKWXlFAbGttb1b', 560, 200),
('rzn_pervomajskij_prt_66', 'iHKUpBh7hTCsRAc5DE2WE36dFejHMtYm', 560, 200),
('shil_sovetskaja_4', 'WcDypzOslSvTtKDtDFlZ2zymYhNk4TWO', 560, 200);

-- --------------------------------------------------------

--
-- Структура таблицы `Materials`
--

CREATE TABLE `Materials` (
  `alias` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `lastChange` datetime NOT NULL,
  `showTitle` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `showCreated` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `showChange` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Materials`
--

INSERT INTO `Materials` (`alias`, `created`, `lastChange`, `showTitle`, `showCreated`, `showChange`) VALUES
('about', '2015-09-07 11:00:29', '2015-12-21 04:38:06', 1, 0, 0),
('akcija_uspej_zapisatsja_poka_ceny_ne_stali_kusatsja', '2015-09-08 12:53:41', '2015-10-05 10:34:55', 1, 0, 0),
('documents', '2015-09-07 11:00:30', '2016-01-20 12:17:56', 1, 0, 0),
('dokumenty_dlja_postuplenija', '2015-09-08 01:37:17', '2015-09-08 01:37:17', 1, 0, 0),
('dokumenty_dlja_sdachi_jekzamena_v_mrjeo_gibdd', '2015-09-08 01:49:07', '2015-09-08 01:49:07', 1, 0, 0),
('nabor_na_kategoriu_a', '2016-01-21 10:07:04', '2016-01-21 10:07:04', 1, 0, 0),
('novogodnjaja_cena', '2015-11-27 01:50:06', '2016-01-18 05:59:08', 1, 0, 0),
('raspisanie_zanjatij', '2015-09-08 01:52:03', '2015-09-08 01:52:03', 1, 0, 0),
('soglasovano_s_gibdd', '2020-01-01 00:00:00', '2020-01-01 00:00:00', 1, 0, 0),
('we_re-designed', '2015-09-07 12:59:39', '2015-11-27 01:58:51', 1, 0, 0),
('zakonchen_nabor_na_kategoriju_a', '2015-10-05 10:28:01', '2016-01-21 10:11:01', 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategories`
--

CREATE TABLE `MaterialsCategories` (
  `alias` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `lastChange` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategories`
--

INSERT INTO `MaterialsCategories` (`alias`, `created`, `lastChange`) VALUES
('Archives', '2015-09-08 00:00:00', '2015-09-08 00:00:00'),
('disable', '2015-10-05 00:00:00', '2015-10-05 00:00:00'),
('Info', '2015-09-08 00:00:00', '2015-09-08 00:00:00'),
('News', '2015-09-07 00:00:00', '2015-09-07 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesInList`
--

CREATE TABLE `MaterialsCategoriesInList` (
  `category` varchar(200) NOT NULL,
  `list` varchar(200) NOT NULL,
  `sequence` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategoriesInList`
--

INSERT INTO `MaterialsCategoriesInList` (`category`, `list`, `sequence`) VALUES
('Archives', 'Archives', 1),
('disable', 'disable', 1),
('Info', 'Info', 1),
('News', 'News', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesList`
--

CREATE TABLE `MaterialsCategoriesList` (
  `name` varchar(200) NOT NULL,
  `showFullMaterialsText` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `showShortMaterialsText` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `showCategories` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `showCreated` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `showChange` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '1',
  `categorialsAsURL` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `titleAsURL` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `showAllOnPage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `onPage` int(2) UNSIGNED NOT NULL DEFAULT '10',
  `maxPages` int(2) UNSIGNED NOT NULL DEFAULT '6'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategoriesList`
--

INSERT INTO `MaterialsCategoriesList` (`name`, `showFullMaterialsText`, `showShortMaterialsText`, `showCategories`, `showCreated`, `showChange`, `categorialsAsURL`, `titleAsURL`, `showAllOnPage`, `onPage`, `maxPages`) VALUES
('Archives', 0, 1, 1, 0, 0, 1, 1, 0, 10, 6),
('disable', 0, 1, 1, 1, 1, 1, 1, 0, 10, 6),
('Info', 0, 1, 1, 0, 0, 1, 1, 0, 10, 6),
('News', 0, 1, 1, 0, 0, 1, 1, 0, 10, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesList_Lang`
--

CREATE TABLE `MaterialsCategoriesList_Lang` (
  `list` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategoriesList_Lang`
--

INSERT INTO `MaterialsCategoriesList_Lang` (`list`, `lang`, `name`, `description`) VALUES
('Archives', 'rus', 'В архиве', NULL),
('Info', 'rus', 'Информация', NULL),
('News', 'rus', 'Новости', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategories_Lang`
--

CREATE TABLE `MaterialsCategories_Lang` (
  `category` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsCategories_Lang`
--

INSERT INTO `MaterialsCategories_Lang` (`category`, `lang`, `name`, `description`) VALUES
('Archives', 'rus', 'В архиве', NULL),
('disable', 'rus', 'Отключить', NULL),
('Info', 'rus', 'Информация', NULL),
('News', 'rus', 'Новости', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsInCategories`
--

CREATE TABLE `MaterialsInCategories` (
  `material` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MaterialsInCategories`
--

INSERT INTO `MaterialsInCategories` (`material`, `category`) VALUES
('about', 'Info'),
('akcija_uspej_zapisatsja_poka_ceny_ne_stali_kusatsja', 'disable'),
('documents', 'Info'),
('dokumenty_dlja_postuplenija', 'Info'),
('dokumenty_dlja_sdachi_jekzamena_v_mrjeo_gibdd', 'Info'),
('nabor_na_kategoriu_a', 'News'),
('novogodnjaja_cena', 'News'),
('raspisanie_zanjatij', 'Info'),
('soglasovano_s_gibdd', 'News'),
('we_re-designed', 'disable'),
('zakonchen_nabor_na_kategoriju_a', 'disable');

-- --------------------------------------------------------

--
-- Структура таблицы `Materials_Lang`
--

CREATE TABLE `Materials_Lang` (
  `material` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Materials_Lang`
--

INSERT INTO `Materials_Lang` (`material`, `lang`, `title`, `text`) VALUES
('about', 'rus', 'О нас', '<img class="ImgRight" src="./resources/Images/piples/thank.jpg">\r\n\r\n<p>Автошкола ФОРСАЖ приглашает Вас на курсы подготовки водителей транспортных средств категории «В». Наша автошкола предлагает обучение по новой программе, состоящей из двух базовых курсов, каждый из которых одобрен Министерством образования Российской Федерации: теоретический курс - правила дорожного движения, и практический курс - вождение. На каждом курсе используются инновационные приемы. Учебный процесс ведут квалифицированные преподаватели.</p>\r\n\r\n<p>За время прохождения теоретического курса вы изучите и приобретёте навыки по следующим предметам: Основы безопасного управления транспортными средствами, Основы законодательства в сфере дорожного движения, Устройство и техническое обслуживание транспортных средств. Одним из основных и обязательных предметов для изучения является курс первой медицинской помощи при ДТП. Практические навыки по данному предмету отрабатываются на современных манекенах и самих учениках, что позволяет сделать урок очень живым и интересным. Наши преподаватели научат вас разбираться в спорных и сложных дорожных ситуациях и, самое главное, чувствовать себя уверенно за рулём своего авто.</p>\r\n\r\n<p>Обучение теоретической части ведется по индивидуальному графику.</p>\r\n\r\n<img class="ImgLeft" src="./resources/Images/cars/mitsubishi.png">\r\n\r\n<p>Практический курс в нашей автошколе ФОРСАЖ проводится по современным методикам подготовки с использованием современных автомобилей иностранного производства. Опытные инструкторы доступно, качественно и быстро научат вас водить автомобиль, чувствуя себя уверенно за рулем своего железного коня.</p>\r\n\r\n<p>Для усовершенствования теоретических и практических навыков наша автошкола предлагает вам компьютерное тестирование и занятие на тренажерах.</p>\r\n\r\n<p>Оплату обучения Вы можете произвести в рассрочку. Всю необходимую литературу можно приобрести в наших филиалах. Здесь же Вы без лишней суеты и траты времени пройдёте медицинскую комиссию и получите медицинскую справку. Врачи сами к вам приедут.</p>\r\n\r\n<p>Также наша автошкола предоставляет необходимые дополнительные консультации по Правилам Дорожного Движения, помогаем восстановить утерянные навыки вождения или получить дополнительные навыки управления автомобилем в сложных дорожных условиях (интенсивное движение, гололед, темное время суток и т.д.).</p>\r\n\r\n\r\n<h2>Наши преимущества:</h2>\r\n<ul>\r\n<li>Начало занятий в день заключения договора;</li>\r\n<li>Свободный график посещения;</li>\r\n<li>Вождение на иномарках;</li>\r\n<li>Низкая цена обучения;</li>\r\n<li>Рассрочка платежа;</li>\r\n<li>Получение медицинской справки в Автошколе за 30 минут;</li>\r\n<li>Классы расположены в разных районах города;</li>\r\n<li>Вождение по выходным дням и после 19:00*;</li>\r\n<li>Наличие краткосрочного курса обучения (1,5 месяца*);</li>\r\n<li>Обучение на механической и АВТОМАТИЧЕСКОЙ коробках передач;</li>\r\n<li>Лучшие инструкторы города;</li>\r\n<li>Хорошо оснащенные лекционные и компьютерные классы;</li>\r\n<li>Профессиональный педагогический состав;</li>\r\n<li>Любые виды оплаты;</li>\r\n<li>Возможность обучения в кредит с минимальной переплатой 1% в месяц*;</li>\r\n<li>Обучение по бартеру;</li>\r\n<li>Возможность заработать*;</li>\r\n<li>Скидки, Акции, Подарки!!!*</li>\r\n<li>НИКАКИХ СКРЫТЫХ И ДОПОЛНИТЕЛЬНЫХ ПЛАТЕЖЕЙ В ПРОЦЕССЕ ОБУЧЕНИЯ!</li>\r\n</ul>\r\n\r\n<div class="slogan">СДЕЛАЙ ПРАВИЛЬНЫЙ ВЫБОР!!!</div>\r\n\r\n<img class="ImgCenter" src="./resources/Images/cars/all_cars.png">\r\n\r\n<div class="footnote">* - Более точная информация по тел. 511-504</div>'),
('akcija_uspej_zapisatsja_poka_ceny_ne_stali_kusatsja', 'rus', 'Успей записаться<br>пока цены не стали кусаться', '<p>C 1 ОКТЯБРЯ 2015 года минимальная цена на обучение составит 30 000 руб.</p>\r\n<p>Будь умнее, сэкономь, запишись до повышения цены!</p>\r\n<p>* Акция завершена.</p>'),
('documents', 'rus', 'Документы', '<p>Все автошколы города Рязани обязаны иметь соответствующий документ, разрешающий ведение образовательной деятельности. Автошкола «ФОРСАЖ» получила право на обучение вождению автомобиля, успешно пройдя аттестационную проверку в Комитете по Образованию и ГИБДД. Своего рода, мы получили аналог водительского удостоверения, но для того, чтобы учить других уверенно вести себя на дорогах.</p>\r\n\r\n<div class="MaterialGalleryBlock">\r\n<a class="fancybox-gallery" href="./resources/Images/documents/certificate_01.jpg">\r\n<img src="./resources/Images/documents/certificate_01_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/certificate_02.jpg">\r\n<img src="./resources/Images/documents/certificate_02_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/license_01.jpg">\r\n<img src="./resources/Images/documents/license_01_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/license_02.jpg">\r\n<img src="./resources/Images/documents/license_02_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/license_03.jpg">\r\n<img src="./resources/Images/documents/license_03_preview.jpg">\r\n</a>\r\n</div>\r\n\r\n<p>При выборе автошколы в Рязани для прохождения обучения особое внимание стоит обращать на наличие лицензии. Без этого документа ни одна школа не может проводить учебные занятия. Кроме этого, обучение водителей возможно только в том случае, если есть приложение к лицензии. Без этого документа лицензия не имеет юридической силы. Это очень важный момент! Поэтому будьте бдительны, решив записаться в ту или иную школу вождения.</p>\r\n\r\n<div class="MaterialGalleryBlock">\r\n<a class="fancybox-gallery" href="./resources/Images/documents/obrProgramm_01.jpg">\r\n<img src="./resources/Images/documents/obrProgramm_01_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/obrProgramm_02.jpg">\r\n<img src="./resources/Images/documents/obrProgramm_02_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/obrProgramm_03.jpg">\r\n<img src="./resources/Images/documents/obrProgramm_03_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/ustav_01.jpg">\r\n<img src="./resources/Images/documents/ustav_01_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/ustav_02.jpg">\r\n<img src="./resources/Images/documents/ustav_02_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/ustav_03.jpg">\r\n<img src="./resources/Images/documents/ustav_03_preview.jpg">\r\n</a>\r\n</div>\r\n\r\n<p>Наша автошкола «ФОРСАЖ» имеет все необходимые разрешительные свидетельства и приложения к ним. Это позволяет нам вести обучение на права категории в без нарушения действующего законодательства и норм ГИБДД. В любое время вы можете ознакомиться с документацией, регламентирующей нашу деятельность. Ещё раз напомним: лицензия действительна только при наличии приложения.</p>\r\n\r\n<ul>\r\n<li><a href="./resources/Files/documents/dogovor.docx">Скачать договор на оказание платных образовательных услуг в формате .doc</a></li>\r\n<li><a href="./resources/Files/documents/akt_samoobsledovanija.rtf">Скачать Акт самообследования УМБ в формате .rtf</a></li>\r\n<li><a href="./resources/Files/documents/akt_samoobsledovanija_p01.doc">Скачать ПРИЛОЖЕНИЕ 1 к акту самообследования в формате .doc</a></li>\r\n<li><a href="./resources/Files/documents/akt_samoobsledovanija_p02.doc">Скачать ПРИЛОЖЕНИЕ 2 к акту самообследования в формате .doc</a></li>\r\n<li><a href="./resources/Files/documents/akt_samoobsledovanija_p03.doc">Скачать ПРИЛОЖЕНИЕ 3 к акту самообследования в формате .doc</a></li>\r\n<li><a href="./resources/Files/documents/akt_samoobsledovanija_p04.doc">Скачать ПРИЛОЖЕНИЕ 4 к акту самообследования в формате .doc</a></li>\r\n<li><a href="./resources/Files/documents/akt_samoobsledovanija_p05.doc">Скачать ПРИЛОЖЕНИЕ 5 к акту самообследования в формате .doc</a></li>\r\n</ul>\r\n\r\n<div class="MaterialGalleryBlock">\r\n<a class="fancybox-gallery" href="./resources/Images/documents/actgai_img_doc_001.jpg">\r\n<img src="./resources/Images/documents/actgai_img_doc_001_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/actgai_img_doc_002.jpg">\r\n<img src="./resources/Images/documents/actgai_img_doc_002_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/actgai_img_doc_003.jpg">\r\n<img src="./resources/Images/documents/actgai_img_doc_003_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/actgai_img_doc_004.jpg">\r\n<img src="./resources/Images/documents/actgai_img_doc_004_preview.jpg">\r\n</a>\r\n</div>\r\n<div class="MaterialGalleryBlock">\r\n<a class="fancybox-gallery" href="./resources/Images/documents/actgai_img_doc_005.jpg">\r\n<img src="./resources/Images/documents/actgai_img_doc_005_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/actgai_img_doc_006.jpg">\r\n<img src="./resources/Images/documents/actgai_img_doc_006_preview.jpg">\r\n</a>\r\n<a class="fancybox-gallery" href="./resources/Images/documents/actgai_img_doc_007.jpg">\r\n<img src="./resources/Images/documents/actgai_img_doc_007_preview.jpg">\r\n</a>\r\n</div>'),
('dokumenty_dlja_postuplenija', 'rus', 'Документы для поступления', '<h3>Для жителей Рязани с Рязанской регистрацией:</h3>\r\n<ol>\r\n<li>Документ, удостоверяющий личность (паспорт) *</li>\r\n<li>Медицинская справка по форме 083/у-89 - для предъявления в ГИБДД **</li>\r\n<li>Фотографии 3х4мм - 4 штуки ***</li>\r\n<li>Военный билет или приписное свидетельство ****</li>\r\n</ol>\r\n<div class="infonote">\r\nКлиентам нашей Автошколы не нужно бегать и искать медучреждения для получения \r\nмедицинской справки, пройти медкомиссию вы можете прям в Автошколе за 30 минут.\r\n</div>\r\n\r\n\r\n<h3>Для жителей Рязани с временной регистрацией:</h3>\r\n<ol>\r\n<li>Документ, удостоверяющий личность (паспорт) *</li>\r\n<li>Медицинская справка по форме 083/у-89 - для предъявления в ГИБДД **</li>\r\n<li>Фотографии 3х4мм - 4 штуки ***</li>\r\n<li>Военный билет или приписное свидетельство ****</li>\r\n<li>Справка об отсутствии штрафов, не выдаче и не лишении водительского удостоверения, выданная отделом административной практики ГИБДД по месту постоянного жительства не ранее чем за 30 дней до даты сдачи квалификационного экзамена в ГИБДД (НЕ ЗАБУДЬТЕ ЗАКАЗАТЬ ЕЕ ЗАРАНЕЕ).</li>\r\n</ol>\r\n<div class="infonote">\r\nДля жителей области, вместе со справкой, нужно предоставить копию лицензии того медучреждения где проходилось обследование.\r\nЕсли штамп временной регистрации стоит у Вас в паспорте, то такую регистрацию заверять в ГАИ не требуется.\r\nЕсли у Вас нет регистрации в Рязани, а есть постоянная в другом городе РФ, то Вы можете отучиться в автошколе, сдать внутренние экзамены и получить свидетельство об окончании школы, а экзамены в ГАИ будете сдавать по месту постоянной регистрации. Запросы в ГАИ вам делать не нужно.\r\n</div>\r\n\r\n\r\n<h3>Для иногородних жителей Рязани:</h3>\r\n<ol>\r\n<li>Документ, удостоверяющий личность (загранпаспорт) *</li>\r\n<li>Медицинская справка по форме 083/у-89 - для предъявления в ГИБДД **</li>\r\n<li>Фотографии 3х4мм - 4 штуки ***</li>\r\n<li>Военный билет или приписное свидетельство ****</li>\r\n<li>Справка об отсутствии штрафов, не выдаче и не лишении водительского удостоверения, выданная отделом полиции по месту постоянного жительства (бессрочная) с нотариально заверенным переводом.</li>\r\n</ol>\r\n<div class="infonote">\r\nКорме того: если Вы в течение последних 3-х лет меняли место жительства, то такие справки Вы должны предоставить со всех районных отделов ГИБДД.\r\nЕсли Вы являетесь гражданином другой страны, а в РФ временно проживаете, то документом, удостоверяющим личность, для Вас является загранпаспорт. Для сдачи экзаменов в ГАИ потребуется нотариально заверенный его перевод. Водительское удостоверение Вам выдадут на время вашей регистрации.\r\n</div>\r\n\r\n\r\n\r\n<div class="footnote">\r\n* Если Вам в процессе обучения исполняется 20 или 45 лет, \r\nто Вам необходимо срочно заняться обменом паспорта, т.к. \r\nк экзаменам в ГАИ с просроченным паспортом Вас не допустят. \r\nЕсли поменяли фамилию или регистрацию, необходимо уведомить \r\nоб этом учебную часть (принести ксерокопию паспорта с нужной страницей).\r\n</div>\r\n\r\n<div class="footnote">\r\n** Если вы проходите медкомиссию не у нас, Медицинская \r\nсправка оформляется в медицинском учреждении, срок ее \r\nдействия - 2 года. При получении справки для автошколы \r\nобязательно проверьте правильность написания Ваших ФИО, \r\nдаты рождения, наличие печатей с обеих сторон.\r\n</div>\r\n\r\n<div class="footnote">\r\n*** Фотографии без уголка, цветные или черно-белые на \r\nматовой бумаге, 2 шт. - нужны для медсправки; 1 шт. - \r\nдля личной карточки; 1 шт. – для карточки учета \r\nпрактических занятий по вождению.\r\n</div>\r\n\r\n<div class="footnote">\r\n**** Требуется для мужчин, при прохождении медицинской комиссии.\r\n</div>\r\n\r\n<div class="footnote">Более точная информация по тел. 511-504</div>'),
('dokumenty_dlja_sdachi_jekzamena_v_mrjeo_gibdd', 'rus', 'Документы для сдачи экзамена в МРЭО ГИБДД', '<p>Перечень документов, необходимых для сдачи квалификационного экзамена в МРЭО ГИБДД на право управления транспортным средством категории «В» (при самостоятельном обращении)</p>\r\n<ol>\r\n<li>Паспорт, действительный на момент сдачи экзамена (замена паспорта: 20 лет и 45 лет);</li>\r\n<li>Медицинская справка формы № 083/У-89 на право управления транспортным средством соответствующей категории и её копия (для жителей области, вместе со справкой, нужно предоставить копию лицензии того медучреждения где проходилось обследование);</li>\r\n<li>Свидетельство об окончании автошколы и экзаменационный лист.</li>\r\n</ol>'),
('nabor_na_kategoriu_a', 'rus', 'Начало набора на категорию «А»', '<p>Автошкола "ФОРСАЖ" начинает набор на категорию «A» на 2016 год.</p>\r\n<p>Начало обучения теории с середины февраля.</p>'),
('novogodnjaja_cena', 'rus', 'Всего 12 000 за теорию!', '<p>Автошкола "ФОРСАЖ" поздравляет всех с наступившими праздниками и спешит сообщить, что акция "новогодние цены" продлена до 31 января 2016 года. Стоимость теоретического курса в период действии акции составит всего 12 000 р.</p>'),
('raspisanie_zanjatij', 'rus', 'Расписание занятий', '<p>Теоретические занятия проводятся с понедельника по пятницу, начало занятий приблизительно с 10:00 до 21:00</p>\r\n<p>Занятия по оказанию первой помощи при ДТП проводятся по вторникам с 17:00 до 21:00.</p>\r\n<p>Занятия по психофизиологическим основам деятельности водителя проводятся по четвергам с 17:00 до 21:00.</p>\r\n<p>Практические занятия по вождению ТС проводятся 7 дней в неделю, приблизительное начало занятий с 7:00 до 20:00</p>'),
('soglasovano_s_gibdd', 'rus', 'Наша программа согласована с ГИБДД', '<p>С 11 августа 2014 года вступили в силу новые программы обучения водителей согласно Приказу Министерства образования и науки Российской Федерации от 26 декабря 2013 г. N 1408 "Об утверждении примерных программ профессионального обучения водителей транспортных средств соответствующих категорий и подкатегорий".</p>\r\n\r\n<p>Наша автошкола за выделенный период времени изменила и подготовила все учебные и методические программы по новым требованиям и прошла проверку по согласованию программы и учебно-материальной базы в ГИБДД.</p>\r\n\r\n<a href="http://www.gibdd.ru/r/62/drivingscools/" target="_blank">Перейти на сайт ГИБДД</a>'),
('we_re-designed', 'rus', 'Мы обновили дизайн', '<p>Спешим сообщить вам, что мы полностью обновили дизайн сайта и его ядро.</p>\r\n\r\n<p>Новый сайт работает в несколько раз стабильнее и быстрее, а благодаря дружелюбному интерфейсу вы всегда найдете необходимую вам информацию.</p>\r\n\r\n<p>Мы заботится о вашем удобстве.</p>'),
('zakonchen_nabor_na_kategoriju_a', 'rus', 'Завершился набор на категорию «A».', '<p>Завершился набор на категорию «A» на 2015 год.<p></p>Следующий набор начнется с февраля 2016 года.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `Menu`
--

CREATE TABLE `Menu` (
  `name` varchar(100) NOT NULL COMMENT 'Название меню',
  `description` text COMMENT 'описание',
  `type` varchar(50) NOT NULL COMMENT 'тип меню',
  `cssClass` varchar(200) DEFAULT NULL COMMENT 'ункиальный стиль меню'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Menu`
--

INSERT INTO `Menu` (`name`, `description`, `type`, `cssClass`) VALUES
('del', NULL, 'horizontal_1_lvl', NULL),
('MainMenu', 'Основное меню', 'horizontal_1_lvl', 'MainMenu');

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemParent`
--

CREATE TABLE `MenuItemParent` (
  `menuItem` bigint(20) UNSIGNED NOT NULL COMMENT 'Элемент меню',
  `parent` bigint(20) UNSIGNED NOT NULL COMMENT 'Родитель элемента меню'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица родственных связей элементов меню.';

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems`
--

CREATE TABLE `MenuItems` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT 'Идентификатор элемента меню',
  `menu` varchar(100) NOT NULL COMMENT 'идентификатор меню',
  `url` text COMMENT 'ссылка которую можно указать вместо идентификатора страницы. Если указана URL то ее приоритет будет выше чем у id страницы',
  `target` int(1) UNSIGNED NOT NULL COMMENT 'как открывать ссылку',
  `sequence` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItems`
--

INSERT INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES
(101, 'MainMenu', NULL, 2, 1),
(102, 'del', NULL, 2, 2),
(103, 'del', NULL, 2, 3),
(104, 'MainMenu', NULL, 2, 4),
(105, 'MainMenu', NULL, 2, 5),
(106, 'MainMenu', NULL, 2, 6),
(107, 'MainMenu', NULL, 2, 7),
(108, 'MainMenu', NULL, 2, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemsPage`
--

CREATE TABLE `MenuItemsPage` (
  `menuItem` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(50) NOT NULL,
  `postfix` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItemsPage`
--

INSERT INTO `MenuItemsPage` (`menuItem`, `page`, `postfix`) VALUES
(101, 'news', NULL),
(102, 'about', NULL),
(103, 'documents', NULL),
(104, 'info', NULL),
(105, 'personnel', NULL),
(106, 'prices', NULL),
(107, 'contacts', NULL),
(108, 'feedbacks', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems_Lang`
--

CREATE TABLE `MenuItems_Lang` (
  `menuItem` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItems_Lang`
--

INSERT INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES
(101, 'eng', 'News'),
(101, 'rus', 'Акции'),
(102, 'eng', 'About'),
(102, 'rus', 'О нас'),
(103, 'eng', 'Documents'),
(103, 'rus', 'Документы'),
(104, 'eng', 'Information'),
(104, 'rus', 'Информация'),
(105, 'eng', 'Staff'),
(105, 'rus', 'Персонал'),
(106, 'eng', 'Prices'),
(106, 'rus', 'Цены'),
(107, 'eng', 'Contacts'),
(107, 'rus', 'Контакты'),
(108, 'rus', 'Отзывы');

-- --------------------------------------------------------

--
-- Структура таблицы `MenuTypes`
--

CREATE TABLE `MenuTypes` (
  `type` varchar(50) NOT NULL,
  `description` text,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Типы меню:\nВертикальный\nГоризонтальный\nКарусель\nСлайдер';

--
-- Дамп данных таблицы `MenuTypes`
--

INSERT INTO `MenuTypes` (`type`, `description`, `default`) VALUES
('horizontal_1_lvl', 'Горизонтальное одноуровневое меню', 0),
('vertical_1_lvl', 'Вертикальное одноуровневое меню', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Modules`
--

CREATE TABLE `Modules` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `main` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyStart` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `includeOnceHead` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `includeOnceBodyStart` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `includeOnceBodyEnd` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Modules`
--

INSERT INTO `Modules` (`alias`, `name`, `author`, `version`, `description`, `main`, `head`, `bodyStart`, `bodyEnd`, `admin`, `includeOnceHead`, `includeOnceBodyStart`, `includeOnceBodyEnd`) VALUES
('authorizationUserPanel', 'Панель авторизации', 'Compu Project', '1.0', 'Модуль для отображения панели авторизации пользователей', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('html', 'Вывод HTML кода', 'Compu Project', '1.0', 'Данный модуль позволяет делать HTML вставки в указанные блоки сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('langPanel', 'Языковая панель', 'Compu Project', '1.0', 'Панель выбора языка сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('menu', 'Модуль меню', 'Compu Project', '1.0', 'Модуль для создания меню сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('slider', 'Слайдер', 'Compu Project', '1.0', 'Модуль для вывода слайдеров', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('socialPanel', 'social panel', 'CompuProject', '1.0', 'социальные сети', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('ToTopSite', 'ToTopSite', 'Compu Project', '1.0', NULL, 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', '/admin/index.php', 1, 1, 1),
('UsersOnlineApplications', 'Онлайн заявки', 'Compuproject', '1.0', NULL, 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesDepends`
--

CREATE TABLE `ModulesDepends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `elementType` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesDependsElementsType`
--

CREATE TABLE `ModulesDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesDependsElementsType`
--

INSERT INTO `ModulesDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks`
--

CREATE TABLE `ModulesInBlocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` bigint(20) UNSIGNED NOT NULL,
  `block` bigint(20) UNSIGNED NOT NULL,
  `sequence` int(10) UNSIGNED NOT NULL,
  `showTitle` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `cssClasses` varchar(200) DEFAULT NULL,
  `display` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `onAllPages` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesInBlocks`
--

INSERT INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES
(101101, 101, 101, 1, 0, NULL, 1, 1),
(201901, 201, 901, 1, 0, NULL, 1, 1),
(301102, 301, 102, 2, 0, NULL, 1, 1),
(401103, 401, 103, 1, 0, NULL, 1, 1),
(801901, 801, 107, 999, 0, NULL, 1, 1),
(901107, 901, 107, 1, 0, 'CopyText', 1, 1),
(902102, 902, 102, 1, 0, 'HeadContacts', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks_Lang`
--

CREATE TABLE `ModulesInBlocks_Lang` (
  `module` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesOnPages`
--

CREATE TABLE `ModulesOnPages` (
  `module` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesOnPages`
--

INSERT INTO `ModulesOnPages` (`module`, `page`) VALUES
(401103, 'news');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesParam`
--

CREATE TABLE `ModulesParam` (
  `module` bigint(20) UNSIGNED NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesParam`
--

INSERT INTO `ModulesParam` (`module`, `param`, `value`) VALUES
(101, 'name', 'MainMenu'),
(401, 'name', 'MainSlider'),
(901, 'name', 'copy1'),
(902, 'name', 'HeadContacts');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesTitleIcon`
--

CREATE TABLE `ModulesTitleIcon` (
  `module` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(200) NOT NULL,
  `style` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesTitleIconStile`
--

CREATE TABLE `ModulesTitleIconStile` (
  `style` varchar(50) NOT NULL,
  `align` varchar(50) NOT NULL,
  `width` int(10) UNSIGNED NOT NULL,
  `height` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PageParam`
--

CREATE TABLE `PageParam` (
  `page` varchar(50) NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PageParam`
--

INSERT INTO `PageParam` (`page`, `param`, `value`) VALUES
('about', 'name', 'about'),
('documents', 'name', 'documents'),
('info', 'name', 'Info'),
('news', 'name', 'News');

-- --------------------------------------------------------

--
-- Структура таблицы `Pages`
--

CREATE TABLE `Pages` (
  `alias` varchar(50) NOT NULL,
  `showTitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `cssClasses` varchar(200) DEFAULT NULL,
  `componentElement` bigint(20) UNSIGNED NOT NULL,
  `template` varchar(50) NOT NULL,
  `isMainPage` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `index` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `follow` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `archive` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `notModifiable` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Означает что страница была создана не пользователем а компонентой и может быть удалена только через эту компоненту.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Pages`
--

INSERT INTO `Pages` (`alias`, `showTitle`, `cssClasses`, `componentElement`, `template`, `isMainPage`, `index`, `follow`, `archive`, `notModifiable`) VALUES
('about', 1, NULL, 101, 'forsazh62', 0, 1, 1, 1, 0),
('adminpanel', 1, NULL, 999901, 'adminPanel', 0, 1, 1, 1, 0),
('contacts', 1, NULL, 301, 'forsazh62', 0, 1, 1, 1, 0),
('documents', 1, NULL, 101, 'forsazh62', 0, 1, 1, 1, 0),
('feedbacks', 1, NULL, 401, 'forsazh62', 0, 1, 1, 1, 0),
('info', 1, NULL, 105, 'forsazh62', 0, 1, 1, 1, 0),
('news', 1, NULL, 105, 'forsazh62', 1, 1, 1, 1, 0),
('personnel', 1, NULL, 202, 'forsazh62', 0, 1, 1, 1, 0),
('prices', 1, NULL, 201, 'forsazh62', 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Pages_Lang`
--

CREATE TABLE `Pages_Lang` (
  `page` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `browserTitle` varchar(100) NOT NULL,
  `pageTitle` varchar(100) NOT NULL,
  `description` text,
  `keywords` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Pages_Lang`
--

INSERT INTO `Pages_Lang` (`page`, `lang`, `browserTitle`, `pageTitle`, `description`, `keywords`) VALUES
('about', 'eng', 'Driving school "FORSAZH"', 'Driving school "FORSAZH"', NULL, NULL),
('about', 'rus', 'Автошкола "ФОРСАЖ"', 'Автошкола "ФОРСАЖ"', NULL, NULL),
('contacts', 'eng', 'Addresses of our offices', 'Addresses of our offices', NULL, NULL),
('contacts', 'rus', 'Адреса наших офисов', 'Адреса наших офисов', NULL, NULL),
('documents', 'eng', 'Documents', 'Documents', NULL, NULL),
('documents', 'rus', 'Документы', 'Документы', NULL, NULL),
('info', 'eng', 'Information', 'Information', NULL, NULL),
('info', 'rus', 'Информация', 'Информация', NULL, NULL),
('news', 'eng', 'Promotions and News', 'Promotions and News', NULL, NULL),
('news', 'rus', 'Акции и Новости', 'Акции и Новости', NULL, NULL),
('personnel', 'eng', 'Staff driving school', 'Staff driving school', NULL, NULL),
('personnel', 'rus', 'Персонал', 'Персонал', NULL, NULL),
('prices', 'eng', 'Prices', 'Prices', NULL, NULL),
('prices', 'rus', 'Цены', 'Цены', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ParamInfo_ComponentsElements`
--

CREATE TABLE `ParamInfo_ComponentsElements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `componentElement` bigint(20) UNSIGNED NOT NULL,
  `param` varchar(100) NOT NULL DEFAULT 'name',
  `mandatory` tinyint(4) NOT NULL DEFAULT '1',
  `coments` text NOT NULL,
  `table` varchar(200) DEFAULT NULL,
  `column` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ParamInfo_ComponentsElements`
--

INSERT INTO `ParamInfo_ComponentsElements` (`id`, `componentElement`, `param`, `mandatory`, `coments`, `table`, `column`) VALUES
(1, 101, 'name', 1, 'alias материала для вывода настранице', 'Materials', 'alias'),
(2, 102, 'name', 1, 'name списка категорий', 'MaterialsCategoriesList', 'name'),
(5, 105, 'name', 1, 'name списка категорий для вывода списка материалов', 'MaterialsCategoriesList', 'name');

-- --------------------------------------------------------

--
-- Структура таблицы `Personnel`
--

CREATE TABLE `Personnel` (
  `id` varchar(100) NOT NULL,
  `fio` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `post` varchar(100) NOT NULL,
  `education` varchar(50) DEFAULT NULL COMMENT 'Образование',
  `workExperience` varchar(50) DEFAULT NULL COMMENT 'Стаж работы',
  `experience` varchar(50) DEFAULT NULL COMMENT 'Опыт работы',
  `drivingExperience` varchar(50) DEFAULT NULL COMMENT 'Стаж вождения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Personnel`
--

INSERT INTO `Personnel` (`id`, `fio`, `birthdate`, `post`, `education`, `workExperience`, `experience`, `drivingExperience`) VALUES
('Borisov_Aleksej_Vladimirovich', 'Борисов Алексей Владимирович', '1979-01-18', 'Старший мастер производственного обучения вождению', NULL, NULL, '15 лет', 'более 16 лет'),
('Chelakov_Jurij_Nikolaevich', 'Челаков Юрий Николаевич', '1983-10-28', 'Мастер производственного обучения вождению', NULL, NULL, '5 лет', 'более 12 лет'),
('Hramov_Jurij_Vladislavovich', 'Храмов Юрий Владиславович', '1968-01-17', 'Мастер производственного обучения вождению', NULL, NULL, '1 год', 'более 27 лет'),
('Kuznecov_Roman_Vladimirovich', 'Кузнецов Роман Владимирович', '1985-02-04', 'Руководитель', 'высшее', 'более 13 лет', 'более 5 лет', 'более 11 лет'),
('Lihanov_Dmitrij_Georgievich', 'Лиханов Дмитрий Георгиевич', '1980-09-21', 'Мастер производственного обучения вождению', NULL, NULL, '15 лет', 'более 16 лет'),
('Litvinov_Sergej_Aleksandrovich', 'Литвинов Сергей Александрович', '1979-04-11', 'Мастер производственного обучения вождению', NULL, NULL, '3 года', 'более 16 лет'),
('Makina_Svetlana_Anatolevna', 'Макина Светлана Анатольевна', '1974-04-15', 'преподаватель теоретического курса', NULL, NULL, '1 год', 'более 16 лет'),
('Meleshkin_Andrej_Anatolevich', 'Мелешкин Андрей Анатольевич', '1983-12-13', 'Мастер производственного обучения вождению', NULL, NULL, '1 год', 'более 10 лет'),
('Storozhilov_Sergej_Viktorovich', 'Сторожилов Сергей Викторович', '1984-02-19', 'Мастер производственного обучения вождению', NULL, NULL, '1 год', 'более 11 лет'),
('Vasilev_Vladimir_Gennadevich', 'Васильев Владимир Геннадьевич', '1984-07-09', 'Мастер производственного обучения вождению', NULL, NULL, '4 года', 'более 11 лет');

-- --------------------------------------------------------

--
-- Структура таблицы `PersonnelPosts`
--

CREATE TABLE `PersonnelPosts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `priority` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PersonnelPosts`
--

INSERT INTO `PersonnelPosts` (`id`, `name`, `priority`) VALUES
('Мастер производственного обучения вождению', 'Мастер производственного обучения вождению', 4),
('преподаватель теоретического курса', 'преподаватель теоретического курса', 2),
('Руководитель', 'Руководитель', 1),
('Старший мастер производственного обучения вождению', 'Старший мастер производственного обучения вождению', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `PluginDefaultParam`
--

CREATE TABLE `PluginDefaultParam` (
  `plugin` varchar(50) NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PluginDefaultParam`
--

INSERT INTO `PluginDefaultParam` (`plugin`, `param`, `value`) VALUES
('jquery', 'min', '1'),
('jquery', 'version', '1.10.1');

-- --------------------------------------------------------

--
-- Структура таблицы `PluginDepends`
--

CREATE TABLE `PluginDepends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `elementType` varchar(50) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PluginOnPage`
--

CREATE TABLE `PluginOnPage` (
  `id` int(10) UNSIGNED NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PluginParam`
--

CREATE TABLE `PluginParam` (
  `plugin` int(10) UNSIGNED NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Plugins`
--

CREATE TABLE `Plugins` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `main` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `onAllPages` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `sequence` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Plugins`
--

INSERT INTO `Plugins` (`alias`, `name`, `author`, `version`, `description`, `main`, `head`, `bodyEnd`, `admin`, `onAllPages`, `sequence`) VALUES
('appearingBox', 'Всплывающий блок', 'Compu Project', '1.0', 'Всплывающий блок дял размещение изображений, страниц, видео и т.д.', 'index.php', 'head.php', '', './admin/index.php', 1, 5),
('AudioPlayer', 'AudioPlayer', 'Compu Project', '1.0', 'AudioPlayer', 'index.php', 'head.php', 'bodyEnd.php', 'admin/index.php', 1, 4),
('barcodegen', 'Генератор штрих кодов', 'Compu Project', '1.0', NULL, 'index.php', 'head.php', NULL, NULL, 1, 10),
('captcha', 'Captcha', 'Compu Project', '1.0', 'Генератор проверочного кода', 'index.php', 'head.php', '', './admin/index.php', 1, 2),
('ContentToColumns', 'Content To Columns', 'Compu Project', '1.0', 'Распределяет равномерно контент по колонкам', 'index.php', 'head.php', NULL, 'admin/index.php', 1, 7),
('JCrop', 'Обрезка изображений', 'Compu Project', '1.0', 'Обрезка изображения', 'index.php', 'head.php', '', './admin/index.php', 1, 3),
('JiraCollector', 'JiraCollector', 'CompuProject', '1.0', NULL, 'index.php', 'head.php', NULL, NULL, 1, 9),
('jquery', 'Библиотека Jquery', 'Compu Project', '1.0', 'Плагин для подключения библиотеки Jquery', 'index.php', 'head.php', '', './admin/index.php', 1, 1),
('printPage', 'Версия для печати', 'Compu Project', '1.0', 'Плагин генерирующий кнопку для открытия страницы версии для печати', 'index.php', 'head.php', 'bodyEnd.php', 'admin/index.php', 1, 6),
('snowflakes', 'Snowflakes', 'Compu Project', '1.0', 'Падающий снег', 'index.php', 'head.php', NULL, 'admin/index.php', 0, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `PluginsDependsElementsType`
--

CREATE TABLE `PluginsDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PluginsDependsElementsType`
--

INSERT INTO `PluginsDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `PricesAdditionalServices`
--

CREATE TABLE `PricesAdditionalServices` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `cost` int(11) NOT NULL,
  `perHour` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `sequence` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PricesAdditionalServices`
--

INSERT INTO `PricesAdditionalServices` (`id`, `name`, `cost`, `perHour`, `sequence`) VALUES
(1, 'Индивидуальный график вождения на мотоцикле', 1000, 0, 1),
(2, 'Индивидуальный график вождения на автомобиле', 3000, 0, 2),
(3, 'Дополнительный час занятия с инструктором (коробка механика)', 500, 1, 3),
(4, 'Дополнительный час занятия с инструктором (коробка автомат)', 750, 1, 4),
(5, 'Ускоренный курс обучения для кат. «В»', 5000, 0, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `PricesCourses`
--

CREATE TABLE `PricesCourses` (
  `id` int(10) UNSIGNED NOT NULL,
  `сours` varchar(100) NOT NULL,
  `theory` float UNSIGNED NOT NULL,
  `practice` float UNSIGNED NOT NULL,
  `duration` varchar(100) NOT NULL,
  `cost` int(10) UNSIGNED NOT NULL,
  `category` varchar(100) NOT NULL,
  `sequence` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PricesCourses`
--

INSERT INTO `PricesCourses` (`id`, `сours`, `theory`, `practice`, `duration`, `cost`, `category`, `sequence`) VALUES
(1, 'ФОРСАЖ «А+» (при наличие водительского удостоверения «В» категории)', 112, 18, '1.5-2', 8000, 'A', 1),
(3, 'ФОРСАЖ «А»', 112, 18, '1.5-2', 10000, 'A', 2),
(5, 'ФОРСАЖ «А+В» (коробка механика)', 134, 74, '4-5', 31000, 'A+B', 1),
(8, 'ФОРСАЖ «А+В» (коробка автомат)', 134, 74, '4-5', 34000, 'A+B', 2),
(11, 'ФОРСАЖ «В» (коробка механика)', 134, 56, '4-5', 20000, 'B', 1),
(14, 'ФОРСАЖ «В» (коробка автомат)', 134, 56, '4-5', 23000, 'B', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `PricesCoursesCategory`
--

CREATE TABLE `PricesCoursesCategory` (
  `category` varchar(100) NOT NULL,
  `description` longtext,
  `sequence` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PricesCoursesCategory`
--

INSERT INTO `PricesCoursesCategory` (`category`, `description`, `sequence`) VALUES
('A', '<p>Категория "А" - водительское удостоверение категории А позволяет управлять любыми мотоциклами, в том числе и мотоциклами с коляской.</p>\r\n\r\n<p>* Набор в этом году на категорию «А» ЗАВЕРШЕН. Следующий набор начнется с февраля 2016г.</p>', 1),
('A+B', '<p>Категории "А"+"В" - автомобили и транспортные средств категории "А", разрешенная максимальная масса которых не превышает 3500 килограммов и число сидячих мест которых, помимо сиденья водителя, не превышает восьми; автомобили категории "В", сцепленные с прицепом, разрешенная максимальная масса которого не превышает 750 килограммов; автомобили категории "В", сцепленные с прицепом, разрешенная максимальная масса которого превышает 750 килограммов, но не превышает массы автомобиля без нагрузки, при условии, что общая разрешенная максимальная масса такого состава транспортных средств не превышает 3500 килограммов;</p>', 3),
('B', '<p>Категория "В" - автомобили (за исключением транспортных средств категории "А"), разрешенная максимальная масса которых не превышает 3500 килограммов и число сидячих мест которых, помимо сиденья водителя, не превышает восьми; автомобили категории "В", сцепленные с прицепом, разрешенная максимальная масса которого не превышает 750 килограммов; автомобили категории "В", сцепленные с прицепом, разрешенная максимальная масса которого превышает 750 килограммов, но не превышает массы автомобиля без нагрузки, при условии, что общая разрешенная максимальная масса такого состава транспортных средств не превышает 3500 килограммов;</p>', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ROOT_SETTINGS`
--

CREATE TABLE `ROOT_SETTINGS` (
  `settingsName` varchar(50) NOT NULL,
  `superKey` varchar(100) NOT NULL,
  `multilanguage` tinyint(4) NOT NULL DEFAULT '0',
  `siteClosed` tinyint(4) NOT NULL DEFAULT '0',
  `charset` varchar(100) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `siteName` varchar(100) NOT NULL,
  `activated` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ROOT_SETTINGS`
--

INSERT INTO `ROOT_SETTINGS` (`settingsName`, `superKey`, `multilanguage`, `siteClosed`, `charset`, `companyName`, `siteName`, `activated`) VALUES
('default', 'f1828ce9f26031573db9a3268b51041c', 1, 0, 'utf8', 'Compu Project', 'Автошкола Форсаж', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Sliders`
--

CREATE TABLE `Sliders` (
  `alias` varchar(100) NOT NULL,
  `theme` varchar(50) NOT NULL,
  `hideTools` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `show_randomly` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `controls` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `controls_position` varchar(50) NOT NULL,
  `focus` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `focus_position` varchar(50) NOT NULL,
  `numbers` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `numbers_align` varchar(50) NOT NULL,
  `progressbar` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `enable_navigation_keys` tinyint(4) NOT NULL DEFAULT '1',
  `label` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `labelAnimation` varchar(50) NOT NULL,
  `dots` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `thumbs` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `preview` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `animations` varchar(50) NOT NULL,
  `interval` int(10) UNSIGNED NOT NULL DEFAULT '4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Sliders`
--

INSERT INTO `Sliders` (`alias`, `theme`, `hideTools`, `show_randomly`, `controls`, `controls_position`, `focus`, `focus_position`, `numbers`, `numbers_align`, `progressbar`, `enable_navigation_keys`, `label`, `labelAnimation`, `dots`, `thumbs`, `preview`, `animations`, `interval`) VALUES
('disable', 'clean', 1, 0, 1, 'center', 0, 'center', 0, 'center', 0, 1, 1, 'fixed', 1, 0, 1, 'blind', 4000),
('MainSlider', 'clean', 1, 0, 0, 'center', 0, 'center', 0, 'center', 0, 1, 0, 'slideUp', 0, 0, 0, 'blind', 10000);

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersControlsPosition`
--

CREATE TABLE `SlidersControlsPosition` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersControlsPosition`
--

INSERT INTO `SlidersControlsPosition` (`alias`, `description`) VALUES
('center', 'Поцентру'),
('leftBottom', 'Левый нижний угол'),
('leftTop', 'Левый верхний угол'),
('rightBottom', 'Правый нижний угол'),
('rightTop', 'Правый верхний угол');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersFocusPosition`
--

CREATE TABLE `SlidersFocusPosition` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersFocusPosition`
--

INSERT INTO `SlidersFocusPosition` (`alias`, `description`) VALUES
('center', 'Поцентру'),
('leftBottom', 'Левый нижний угол'),
('leftTop', 'Левый верхний угол'),
('rightBottom', 'Правый нижний угол'),
('rightTop', 'Правый верхний угол');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersLabelAnimation`
--

CREATE TABLE `SlidersLabelAnimation` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersLabelAnimation`
--

INSERT INTO `SlidersLabelAnimation` (`alias`, `description`) VALUES
('fixed', 'фиксированно'),
('left', 'с левой стороны'),
('right', 'с правой стороны'),
('slideUp', 'снизу вверх');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersNumbersAlign`
--

CREATE TABLE `SlidersNumbersAlign` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersNumbersAlign`
--

INSERT INTO `SlidersNumbersAlign` (`alias`, `description`) VALUES
('center', 'по центру'),
('left', 'по левой стороне'),
('right', 'по правой стороне');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersThemes`
--

CREATE TABLE `SlidersThemes` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersThemes`
--

INSERT INTO `SlidersThemes` (`alias`, `description`) VALUES
('clean', 'Круглые кнопки переключения на слайдере'),
('default', 'Тема по умолчанию'),
('minimalist', 'Тема минимализма'),
('round', 'Полукруглые стрелки по бокам слайдера, словно окружают его'),
('square', 'Квадратные кнопки переключения на слайдере');

-- --------------------------------------------------------

--
-- Структура таблицы `Slides`
--

CREATE TABLE `Slides` (
  `fileName` varchar(50) NOT NULL,
  `slider` varchar(100) NOT NULL,
  `sequence` int(11) NOT NULL,
  `animation` varchar(50) NOT NULL,
  `url` text,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Slides`
--

INSERT INTO `Slides` (`fileName`, `slider`, `sequence`, `animation`, `url`, `text`) VALUES
('001.jpg', 'MainSlider', 2, 'blind', NULL, NULL),
('002.jpg', 'MainSlider', 3, 'blind', NULL, NULL),
('003.jpg', 'disable', 3, 'blind', NULL, NULL),
('004.jpg', 'MainSlider', 1, 'blind', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `SlidesAnimations`
--

CREATE TABLE `SlidesAnimations` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidesAnimations`
--

INSERT INTO `SlidesAnimations` (`alias`, `description`) VALUES
('blind', ''),
('blindHeight', ''),
('blindWidth', ''),
('block', ''),
('circles', ''),
('circlesInside', ''),
('circlesRotate', ''),
('cube', ''),
('cubeHide', ''),
('cubeJelly', ''),
('cubeRandom', ''),
('cubeShow', ''),
('cubeSize', ''),
('cubeSpread', ''),
('cubeStop', ''),
('cubeStopRandom', ''),
('cut', ''),
('directionBottom', ''),
('directionLeft', ''),
('directionRight', ''),
('directionTop', ''),
('downBars', ''),
('fade', ''),
('fadeFour', ''),
('glassBlock', ''),
('glassCube', ''),
('hideBars', ''),
('horizontal', ''),
('paralell', ''),
('random', ''),
('randomSmart', ''),
('showBars', ''),
('showBarsRandom', ''),
('swapBars', ''),
('swapBarsBack', ''),
('swapBlocks', ''),
('tube', ''),
('upBars', '');

-- --------------------------------------------------------

--
-- Структура таблицы `TemplateBlocks`
--

CREATE TABLE `TemplateBlocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `block` varchar(50) NOT NULL,
  `template` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `TemplateBlocks`
--

INSERT INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES
(101, 'MainMenuBlock', 'forsazh62', NULL),
(102, 'HeadInfoBlock', 'forsazh62', NULL),
(103, 'TopMainBlock', 'forsazh62', NULL),
(104, 'BeforeContentBlock', 'forsazh62', NULL),
(105, 'AfterContentBlock', 'forsazh62', NULL),
(106, 'BottomMainBlock', 'forsazh62', NULL),
(107, 'FooterBlock', 'forsazh62', NULL),
(901, 'TopPanel', 'adminPanel', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `TemplateDependence`
--

CREATE TABLE `TemplateDependence` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Templates`
--

CREATE TABLE `Templates` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `main` varchar(100) NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `print` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Templates`
--

INSERT INTO `Templates` (`alias`, `name`, `author`, `version`, `description`, `default`, `main`, `mobile`, `print`) VALUES
('adminPanel', 'adminPanel', 'Compu Project', '1.0', NULL, 0, 'index.php', 'mobile.php', 'print.php'),
('forsazh62', 'forsazh62', 'Compu Project', '1.0', NULL, 1, 'index.php', 'mobile.php', 'print.php');

-- --------------------------------------------------------

--
-- Структура таблицы `UrlTarget`
--

CREATE TABLE `UrlTarget` (
  `id` int(10) UNSIGNED NOT NULL,
  `target` varchar(30) NOT NULL COMMENT 'инструкция об отскрытии ссылки',
  `description` varchar(45) DEFAULT NULL COMMENT 'Описание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='тип ссылки. как ее открывать';

--
-- Дамп данных таблицы `UrlTarget`
--

INSERT INTO `UrlTarget` (`id`, `target`, `description`) VALUES
(1, '_blank', 'Opens the linked document in a new window or '),
(2, '_self', 'Opens the linked document in the same frame a'),
(3, '_parent', 'Opens the linked document in the parent frame'),
(4, '_top', 'Opens the linked document in the full body of');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `login` varchar(25) NOT NULL,
  `nickname` varchar(25) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `ferstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthday` datetime NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 - мужской\n0 - женский',
  `city` varchar(200) NOT NULL,
  `group` varchar(50) NOT NULL,
  `registered` datetime NOT NULL,
  `lastVisit` datetime NOT NULL,
  `activated` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `activatedHash` varchar(200) NOT NULL,
  `disable` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `delete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(150) DEFAULT NULL,
  `aboutYourself` text,
  `icq` varchar(9) DEFAULT NULL,
  `skype` varchar(25) DEFAULT NULL,
  `vk` varchar(25) DEFAULT NULL,
  `odnoklasniki` varchar(25) DEFAULT NULL,
  `google` varchar(25) DEFAULT NULL,
  `facebook` varchar(25) DEFAULT NULL,
  `twitter` varchar(25) DEFAULT NULL,
  `instagram` varchar(25) DEFAULT NULL,
  `youtube` varchar(25) DEFAULT NULL,
  `livejournal` varchar(25) DEFAULT NULL,
  `blogger` varchar(25) DEFAULT NULL,
  `siteName` varchar(25) DEFAULT NULL,
  `siteUrl` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`login`, `nickname`, `password`, `email`, `phone`, `ferstName`, `lastName`, `birthday`, `sex`, `city`, `group`, `registered`, `lastVisit`, `activated`, `activatedHash`, `disable`, `delete`, `status`, `aboutYourself`, `icq`, `skype`, `vk`, `odnoklasniki`, `google`, `facebook`, `twitter`, `instagram`, `youtube`, `livejournal`, `blogger`, `siteName`, `siteUrl`) VALUES
('raymefise', 'RayMefise', 'd9c919aeb9e698100216c81955874ac5', 'zaytsev.max90@gmail.com', '89105665485', 'Максим', 'Зайцев', '1990-03-01 00:00:00', 1, 'Рязань', 'Administrator', '2013-11-06 12:08:42', '2013-11-06 12:08:42', 1, 'd4af759b9c284a163c6d3d6fe7575eb4', 0, 0, 'Уровень сарказма в моем ответе зависит от уровня тупости вашего вопроса.', 'Психология - это искусство иметь людей раньше чем они поимеют вас!\r\n\r\nЛучший изгиб на теле женщины - это ее улыбка. \r\n\r\nПеред сексом вы помогаете друг другу раздеться, после секса вы одеваете только себя.\r\nМораль: в жизни никто не поможет вам, когда вас поимеют.\r\n\r\nУстой традиций надо соблюдать,\r\nПускай не раз ответят вам отказом,\r\nКонечно дама может и не дать,\r\nНо предложить, ты ей, всегда обязан.', '430776', 'mefise_ray', 'raymefise', '', '113232610557507330855', 'ray.mefise', 'RayMefise', 'ray_mefise', 'RayMefise', '', '', 'Compu Project', 'compuproject.com');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersAgreements`
--

CREATE TABLE `UsersAgreements` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `text` longtext NOT NULL,
  `dateOfChange` datetime NOT NULL,
  `sequence` int(10) UNSIGNED NOT NULL,
  `site` tinyint(4) NOT NULL DEFAULT '1',
  `admin` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersAgreements`
--

INSERT INTO `UsersAgreements` (`id`, `name`, `text`, `dateOfChange`, `sequence`, `site`, `admin`) VALUES
(1, 'Пользовательское соглашение', '<b><u>Пользовательское соглашение</u></b>\r\n<ol>\r\n<li><b><u>Общее положения</u></b>\r\n<ol>\r\n<li>Администрация предлагает Пользователю использовать сервисы Интернет-сайта на условиях, изложенных в настоящем Пользовательском соглашении. Соглашение вступает в силу с момента выражения Пользователем согласия с его условиями в порядке, предусмотренном п. 1.3 Соглашения.</li>\r\n<li>Использование сервисов Интернет-сайта регулируется настоящим Соглашением. Соглашение может быть изменено Администрацией без какого-либо специального уведомления, новая редакция Соглашения вступает в силу с момента ее размещения в сети Интернет по указанному адресу в п. 1.5 Соглашения.</li>\r\n<li>Начиная использовать сервис Интернет-сайта, пройдя процедуру регистрации, Пользователь считается принявшим условия Соглашения в полном объеме, без всяких оговорок и исключений. </li>\r\n<li>В случае несогласия Пользователя с какими-либо из положений Соглашения, Пользователь не в праве использовать сервисы Интернет-сайта. В случае если Администрацией были внесены какие-либо изменения в Соглашение в порядке, предусмотренном пунктом 1.2 Соглашения, с которыми Пользователь не согласен, он обязан прекратить использование сервисов Интернет-сайта.</li>\r\n</ol>\r\n</li>\r\n<li><b><u>Правила пользования Сайтом</u></b>\r\n<ol>\r\n<li>Пользование Сайтом возможно только при условии согласия Пользователя с условиями Соглашения и присоединения к нему в порядке, предусмотренном Соглашением. Для возможности использования основного функционала Сайта Пользователь создает Аккаунт.</li>\r\n<li>При регистрации Аккаунта Пользователем указывается актуальная и соответствующая действительности информация, в том числе Ф.И.О., пол, дата рождения и прочая информация. В случае указания неверных данных Пользователю будет отказано в использовании сервисов Интернет-сайта, а так же в участие на фестивале. </li>\r\n<li>Для входа на Сайт Пользователем формируются уникальные учетные данные - логин и пароль, которые являются конфиденциальной информацией и не подлежат разглашению, за исключением случаев, предусмотренных действующим законодательством и/или Соглашением. Риск осуществления мошеннических и иных неправомерных действий с Аккаунтом Пользователя в связи с утратой пароля несет Пользователь.</li>\r\n<li>Персональные данные Пользователя, указанные им при регистрации, а именно фамилия, имя, дата рождения, город проживания и прочая информация, отражаемая в Аккаунте и Профиле Пользователя (далее по тексту - персональные данные), обрабатываются Администрацией для исполнения Соглашения, предоставления Сервисов, оказания услуг Пользователю посредством Сайта.</li>\r\n<li>Присоединяясь к Соглашению и размещая данные в Аккаунте, Пользователь выражает свое согласие на обработку персональных данных Администрацией и на отражение персональных данных в Профиле Пользователя.</li>\r\n<li>Пользователь соглашается с тем, что Администрация в процессе обработки персональных данных имеет право осуществлять с персональными данными следующие действия: сбор, систематизацию, накопление, хранение, использование, уничтожение и иные необходимые в целях исполнения Соглашения и реализации Сервисов действия.</li>\r\n<li>После регистрации Аккаунта Пользователь вправе осуществлять наполнение Аккаунта  Контентом, добавлять фотографии и иные материалы в соответствии с предоставленным функционалом, предоставленными Администрацией при условии соблюдения Соглашения.</li>\r\n<li>Пользователь осознает и соглашается, что размещаемая в Аккаунте Пользователя Информация доступна для ознакомления иным Пользователям через Персональную страницу (Профиль) Пользователя.</li>\r\n<li>Вход на Сайт Пользователем, ранее зарегистрировавшим Аккаунт, осуществляется каждый раз путем прохождения процедуры авторизации - введения логина и пароля Пользователя, перехода по гиперссылке, полученной по электронной почте.</li>\r\n<li>Лицо, авторизовавшееся на Сайте, считается надлежащим владельцем Аккаунта Пользователя, доступ к использованию и управлению которого были получены в результате такой авторизации.</li>\r\n<li>Способы восстановления доступа к Аккаунту, авторизации Пользователя могут быть изменены, отменены или дополнены Администрацией в одностороннем порядке.</li>\r\n<li>Администрация обеспечивает функционирование Сайта в круглосуточном режиме, однако не гарантирует отсутствие перерывов, связанных с техническими неисправностями или проведением профилактических работ. Администрация не гарантирует, что Сайт или любые Сервисы будут функционировать в любое конкретное время в будущем или что они не прекратят работу.</li>\r\n</ol>\r\n</li>\r\n<li><b><u>Права и обязанности Пользователя</u></b>\r\n<ol>\r\n<li>Пользователь вправе:\r\n<ol>\r\n<li>производить настройки Аккаунта и Профиля, менять пароль для доступа к Аккаунту;</li>\r\n<li>размещать в Аккаунте Пользователя информацию о себе, добавлять фотографии, статусы;</li>\r\n<li>осуществлять поиск иных Пользователей в сообществах Пользователей, а также по информации, известной Пользователю и соответствующей информации, размещаемой отыскиваемым Пользователем на Персональной странице;</li>\r\n<li>отправлять и получать Личные сообщения, добавлять сообщения в чат;</li>\r\n<li>осуществлять иные, не запрещенные законодательством Российской Федерации или Соглашением действия, связанные с использованием Сайта.</li>\r\n</ol>\r\n<li> Пользователь гарантирует, что обладает всеми необходимыми полномочиями, для заключения настоящего Соглашения.</li>\r\n<li>Пользователь обязуется:\r\n<ol>\r\n<li>в момент регистрации Аккаунта указывать соответствующие действительности сведения в том числе Ф.И.О., пол, дата рождения и прочая информация. В случае указания неверных данных Пользователю будет отказано в использовании сервисов Интернет-сайта, а так же в участие на фестивале;</li>\r\n<li>принимать необходимые меры для обеспечения конфиденциальности учетных данных (логин и пароль), используемых для доступа к Аккаунту, следить за тем, чтобы пароль не сохранялся в браузере при возможном использовании компьютера другими лицами;</li>\r\n<li>уведомлять Администрацию Сайта обо всех случаях совершения в отношении Пользователя действий, которые могут быть расценены как оскорбительные, унижающие, дискредитирующие и т.п.;</li>\r\n<li>не совершать указанные в разделе 4 Соглашения запрещенные действия.</li>\r\n</ol></li>\r\n</ol></li>\r\n<li><b><u>Пользователю запрещается</u></b>\r\n<ol>\r\n<li>Осуществлять сбор персональных данных других Пользователей;</li>\r\n<li>Использовать любые автоматические или автоматизированные средства для сбора информации, размещенной на Сайте;</li>\r\n<li>Осуществлять пропаганду или агитацию, возбуждающую социальную, расовую, национальную или религиозную ненависть и вражду, пропаганду войны, социального, расового, национального, религиозного или языкового превосходства;</li>\r\n<li>Размещать на Сайте или передавать посредством Личных сообщений информацию ограниченного доступа (конфиденциальную информацию) третьих лиц, если Пользователь не обладает достаточными правами в силу закона или договора на раскрытие данной информации;</li>\r\n<li>Размещать на Сайте в открытом доступе (в чате, в комментариях и/или статусах) или передавать посредством Личных сообщений текстовые сообщения, графические изображения или иные материалы, содержание которых является оскорбительным для других Пользователей или иных лиц или может быть расценено в качестве такового, а также сообщения, изображения и иные материалы, которые дискредитируют Пользователей или иных лиц, содержат угрозы, призывы к насилию, совершению противоправных деяний, антиобщественных, аморальных поступков, а также совершению любых иных действий, противоречащих основам правопорядка и нравственности;</li>\r\n<li>Размещать на Сайте сообщения, графические изображения или другие материалы (в том числе не соответствующие действительности), размещение которых наносит или может нанести ущерб чести, достоинству и деловой репутации гражданина или деловой репутации организации;</li>\r\n<li>Размещать на Сайте сообщения, содержащие нецензурные слова и выражения;</li>\r\n<li>Размещать на Сайте материалы порнографического или эротического характера, фотографии людей в нижнем белье, за исключением купальных костюмов, или гипертекстовые ссылки на Интернет-сайты, содержащие такие материалы;</li>\r\n<li>Размещать на Сайте материалы с изображением алкогольной или табачной продукции, а так же с имитацией процесса курения и употребления алкогольных напитков;</li>\r\n<li>Размещать на Сайте персональные данные, в том числе контактные данные, других Пользователей или иных лиц без их предварительного согласия;</li>\r\n<li>Указывать при регистрации Аккаунта или вводить впоследствии заведомо ложную или вымышленную информацию о себе, в частности чужие или вымышленные имя и фамилию;</li>\r\n<li>Размещать на Сайте в качестве собственной фотографии изображения других лиц или вымышленных персонажей, изображения животных, предметов, абстрактные изображения, а также любые иные графические изображения, не являющиеся изображениями Пользователя, размещающего данные изображения;</li>\r\n<li>Регистрировать Аккаунт Пользователя в целях использования группой лиц или организацией без предварительного явного согласия Администрации;</li>\r\n<li>Регистрировать более одного Аккаунта Пользователя одним и тем же лицом;</li>\r\n<li>Размещать на Сайте в открытом доступе без предварительного согласия Администрации Сайта, передавать посредством Личных сообщений без предварительного согласия Пользователя текстовые сообщения, графические изображения и иные материалы, которые содержат рекламу;</li>\r\n<li>Осуществлять действия, направленные на дестабилизацию функционирования Сайта, осуществлять попытки несанкционированного доступа к управлению Сайтом или его закрытым разделам (разделам, доступ к которым разрешен только Администрации), а также осуществлять любые иные аналогичные действия;</li>\r\n<li>Осуществлять несанкционированный доступ к Аккаунтам иных Пользователей путем подборки или введения пароля, а также предпринимать попытки такого доступа;</li>\r\n<li>Использовать Сайт в каких-либо коммерческих целях без предварительного разрешения Администрации Сайта, за исключением случаев, предусмотренных настоящим Соглашением;</li>\r\n<li>Осуществлять рассылку спама - массовую рассылку коммерческой, политической, рекламной и иной информации (в том числе гиперссылок, ведущих на интернет-сайты с такой информацией и/или на интернет-сайты, содержащие вредоносное программное обеспечение) в Личных сообщениях, комментариях, сообщениях в чате и т.п., если Пользователи-получатели не выражали своего согласия на получение такого рода информации;</li>\r\n<li>Использовать Сайт для целей поиска и подбора персонала, размещения резюме, поиска должников или иных подобных целей.</li>\r\n</ol></li>\r\n<li><b><u>Права и обязанности Администрации Сайта</u></b>\r\n<ol>\r\n<li>Администрация осуществляет текущее управление Сайтом, определяет его структуру, внешний вид, разрешает или ограничивает доступ Пользователей к Сайту, осуществляет иные принадлежащие ей права.</li>\r\n<li>В части предоставления возможности взаимодействия между Пользователями, в том числе предоставления Пользователям возможности самостоятельно совершать те или иные действия в рамках Сайта, Администрация является лицом, только организовавшим техническую возможность такого взаимодействия, и связанные с таким взаимодействием передача, хранение и обеспечение доступа посредством сети Интернет к предоставляемой Пользователями информации, графическим изображениям и иным материалам, осуществляются без изменения таких материалов или влияния на них со стороны Администрации.</li>\r\n<li>Администрация решает вопросы о порядке размещения на Сайте рекламы, участия в партнерских программах и т.д.</li>\r\n<li>Администрация не несет ответственности за размещенные Пользователями Материалы, и предупреждает об уголовной ответственности за нарушение законодательства Российской Федерации.</li>\r\n<li>Администрация имеет право:\r\n<ol>\r\n<li>в любое время изменять оформление Сайта, его содержание, список Сервисов, изменять или дополнять используемые скрипты, программное обеспечение, Контент Администрации и другие объекты, используемые или хранящиеся на Сайте, любые серверные приложения, с уведомлением Пользователя или без такового;</li>\r\n<li>по своему усмотрению удалять любую информацию, в том числе размещаемую Пользователем на Сайте в нарушение законодательства Российской Федерации или положений Соглашения;</li>\r\n<li>использовать Материалы Пользователя в целях рекламы Сайта на свое усмотрение без какой-либо компенсации;</li>\r\n<li>использовать Материалы Пользователя  и/или их отдельные части (фрагменты) любыми способами (в т.ч. без указаний имени автора, модели и т.п.), в любой форме в любых целях, в том числе, в рекламных, макетах, рекламных модулях и т.д., без какой-либо компенсации;</li>\r\n<li>приостанавливать, ограничивать или прекращать доступ Пользователя ко всем или к любому из разделов Сайта, сообществам, группам на Сайте, Сервисам Администрации и/или Сервисам Партнеров Администрации, удалять создаваемые Пользователями сообщества и группы, в любое время без объяснения причин, с предварительным уведомлением или без такового;</li>\r\n<li>удалить Аккаунт Пользователя по своему усмотрению, в том числе в случае совершения Пользователем действий, нарушающих законодательство Российской Федерации или положения Соглашения;</li>\r\n<li>осуществлять рассылку Пользователям сообщений (в том числе сообщений по электронной почте, sms-сообщений и т.п.), являющихся уведомлениями о введении в действие новых, либо отмене старых услуг, утверждении и опубликовании новой редакции Соглашения, о новых Личных сообщениях, комментариях к фотографиям и статусам в Профиле Пользователя и т.п., содержащих рекламную информацию о Сервисах Администрации.</li>\r\n</ol></li>\r\n<li> Администрация не занимается рассмотрением и разрешением споров и конфликтных ситуаций, возникающих между Пользователями, а также между Пользователем и Партнером Администрации при использовании Пользователем Сервиса Партнера Администрации, однако по своему усмотрению может содействовать в разрешении возникших конфликтов. Администрация вправе приостановить, ограничить или прекратить доступ Пользователя к Сайту, в случае получения от других Пользователей мотивированных жалоб на некорректное поведение данного Пользователя на Сайте.</li>\r\n</ol></li>\r\n<li><b><u>Использование пользовательских материалов</u></b>\r\n<ol>\r\n<li>Принимая условия настоящего Соглашения, Пользователь безвозмездно предоставляет Администрации право использования материалов, который Пользователь добавляет, размещает или транслирует на Сайт. </li>\r\n<li>Размещаемые на Сайте Материалы не должны содержать:\r\n<ol>\r\n<li>материалы, которые нарушают действующие нормативно-правовые акта Российской Федерации, являются вредоносными, угрожающими, оскорбляющими нравственность, честь и достоинство, права и охраняемые законом интересы третьих лиц, клеветническими, нарушающими авторские права, пропагандирующими ненависть и/или дискриминацию людей по расовому, этническому, половому, социальному признакам, способствующие разжиганию религиозной, расовой или межнациональной розни, содержащие сцены насилия, либо жестокого обращения с животными, и т.д.;</li>\r\n<li>ущемления прав меньшинств;</li>\r\n<li>выдачи себя за другого человека или представителя организации и/или сообщества без достаточных на то прав, а также введения в заблуждение относительно свойств и характеристик каких-либо субъектов или объектов;</li>\r\n<li>неразрешенной специальным образом рекламной информации, спама, схем «пирамид», «писем счастья»;</li>\r\n<li>материалы, содержащие компьютерные коды, предназначенные для нарушения, уничтожения либо ограничения функциональности любого компьютерного или телекоммуникационного оборудования или программ, для осуществления несанкционированного доступа, а также серийные номера к коммерческим программным продуктам, логины, пароли и прочие средства для получения несанкционированного доступа к платным ресурсам в Интернет;</li>\r\n<li>умышленного или случайного нарушения каких-либо применимых нормативно-правовых актов;</li>\r\n<li>сбора и хранения персональных данных других пользователей;</li>\r\n<li>несогласованной передачи записей рекламного, коммерческого или агитационного характера;</li>\r\n<li>рекламы наркотических средств, алкогольной или табачной продукции, а так же с имитацией процесса курения и употребления алкогольных напитков и наркотиков;</li>\r\n<li>записи в чей-либо адрес, содержащие грубые и оскорбительные выражения.</li>\r\n</ol></li>\r\n</ol></li>\r\n<li><b><u>Прочие условия</u></b>\r\n<ol>\r\n<li>Соглашение вступает в силу с момента принятия его условий Пользователем. Соглашение выражается путем проставления отметки в соответствующем поле во время регистрации Аккаунта Пользователя, а также совершения Пользователем любого из действий по пользованию Сайтом (например, авторизация, фактическое потребление оказываемых услуг, загрузка Контента, использование Сервиса и т.п.). В случае несогласия с условиями Соглашения, Пользователь обязан прекратить пользование Сайтом и удалить Аккаунт Пользователя.</li>\r\n<li>Удаление Аккаунта означает автоматическое удаление персональных данных, Контента, настроек Аккаунта и Профиля, имеющихся у Пользователя ОКов, а также иной имеющейся в Аккаунте Пользователя информации.</li>\r\n<li>Положения Соглашения могут быть дополнены, изменены или отменены Администрацией Сайта в одностороннем порядке без предварительного уведомления Пользователей. Администрация Сайта вправе известить Пользователя о внесенных в Соглашение изменениях или о вступлении в силу новой редакции Соглашения путем опубликования уведомления на Сайте, отправки Личных сообщений Пользователю или иным способом по выбору Администрации Сайта.</li>\r\n<li>К правам и обязанностям Сторон, возникшим на основании редакции Соглашения, утратившей свою силу, применяются положения действующей (актуальной) редакции Соглашения, если иное не вытекает из характера возникших между Сторонами отношений.</li>\r\n<li>Претензии Пользователя, направляемые Администрации, принимаются и рассматриваются при условии указания актуальных и достоверных данных Пользователя, указанных в Аккаунте. Принимая во внимание возможное наличие Аккаунтов со схожими учетными данными, Администрация вправе требовать предоставления дополнительных сведений и информации, в том числе в отношении Аккаунта Пользователя, позволяющих определить, в связи с каким Аккаунтом поступила претензия, или установить принадлежность Аккаунта лицу, обратившемуся с претензией.</li>\r\n</ol></li>\r\n</ol>', '2013-11-05 06:13:33', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `UsersGroups`
--

CREATE TABLE `UsersGroups` (
  `group` varchar(50) NOT NULL,
  `adminDefault` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `siteDefault` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `loginInAdminPanel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `changeSettings` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionUsersShow` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionUsersCreate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionUsersEdit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionUsersDelete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionUsersGroupCreate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionUsersGroupEdit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionUsersGroupDelete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionPagesCreate` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `permissionPagesEdit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionPagesDelete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionModulesCreate` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionModulesEdit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionModulesDelete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `permissionPluginsEdit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersGroups`
--

INSERT INTO `UsersGroups` (`group`, `adminDefault`, `siteDefault`, `loginInAdminPanel`, `changeSettings`, `permissionUsersShow`, `permissionUsersCreate`, `permissionUsersEdit`, `permissionUsersDelete`, `permissionUsersGroupCreate`, `permissionUsersGroupEdit`, `permissionUsersGroupDelete`, `permissionPagesCreate`, `permissionPagesEdit`, `permissionPagesDelete`, `permissionModulesCreate`, `permissionModulesEdit`, `permissionModulesDelete`, `permissionPluginsEdit`) VALUES
('Administrator', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
('Moderator', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
('SuperModerator', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0),
('User', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `UsersGroups_Lang`
--

CREATE TABLE `UsersGroups_Lang` (
  `group` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersGroups_Lang`
--

INSERT INTO `UsersGroups_Lang` (`group`, `lang`, `name`, `description`) VALUES
('Administrator', 'rus', 'Администратор', 'Администратор системы'),
('Moderator', 'rus', 'Модератор', 'Модератор сайта'),
('SuperModerator', 'rus', 'Главный модератор', 'Главный модератор сайта'),
('User', 'rus', 'Пользователь', 'Пользователь сайта');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersMassage`
--

CREATE TABLE `UsersMassage` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL,
  `sender` varchar(25) NOT NULL,
  `addressee` varchar(25) NOT NULL,
  `sender_read` tinyint(4) NOT NULL DEFAULT '0',
  `addressee_read` tinyint(4) NOT NULL DEFAULT '0',
  `sender_delete` tinyint(4) NOT NULL DEFAULT '0',
  `addressee_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotifications`
--

CREATE TABLE `UsersNotifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(25) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotificationsType`
--

CREATE TABLE `UsersNotificationsType` (
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersNotificationsType`
--

INSERT INTO `UsersNotificationsType` (`type`) VALUES
('alarm'),
('alert'),
('notification');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotifications_Lang`
--

CREATE TABLE `UsersNotifications_Lang` (
  `usersNotifications` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `UsersOnlineApplications`
--

CREATE TABLE `UsersOnlineApplications` (
  `id` varchar(100) NOT NULL,
  `fio` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `message` longtext,
  `creation` datetime NOT NULL,
  `totalStatus` varchar(50) NOT NULL,
  `changed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `UsersOnlineApplicationsLogStatusTransition`
--

CREATE TABLE `UsersOnlineApplicationsLogStatusTransition` (
  `onlineApplication` varchar(100) NOT NULL,
  `changed` datetime NOT NULL,
  `startStatus` varchar(50) NOT NULL,
  `endStatus` varchar(50) NOT NULL,
  `managerComment` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `UsersOnlineApplicationsStatuses`
--

CREATE TABLE `UsersOnlineApplicationsStatuses` (
  `status` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersOnlineApplicationsStatuses`
--

INSERT INTO `UsersOnlineApplicationsStatuses` (`status`, `name`, `description`) VALUES
('callBack', 'нужно перезвонить', 'Человек просил перезвонить позже'),
('created', 'не обработана', 'Заявка была создана, но ей еще никто не занимался'),
('denied', 'мы отказали', 'По тем или иным причинам мы отказали в этой заявке'),
('makeTheContract', 'составлен договор', 'Был составлен договор на обучение'),
('notAvailable', 'телефон недоступен', 'Телефон не отвечает'),
('pay', 'оплачено', 'Внесены деньги по договору за обучение'),
('refused', 'нам отказали', 'Человек отказался составить договор'),
('talked', 'связались', 'С человеком связались по телефону и поговорили');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersOnlineApplicationsStatuseTransition`
--

CREATE TABLE `UsersOnlineApplicationsStatuseTransition` (
  `startStatus` varchar(50) NOT NULL,
  `endStatus` varchar(50) NOT NULL,
  `bottonText` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersOnlineApplicationsStatuseTransition`
--

INSERT INTO `UsersOnlineApplicationsStatuseTransition` (`startStatus`, `endStatus`, `bottonText`) VALUES
('callBack', 'callBack', 'просили перезвонить позже'),
('callBack', 'denied', 'отказать в заявке'),
('callBack', 'notAvailable', 'недозвонились'),
('callBack', 'refused', 'отказались общатсья'),
('callBack', 'talked', 'поговорили'),
('created', 'callBack', 'просили перезвонить позже'),
('created', 'denied', 'отказать в заявке'),
('created', 'notAvailable', 'недозвонились'),
('created', 'refused', 'отказались общатсья'),
('created', 'talked', 'поговорили'),
('makeTheContract', 'callBack', 'просили перезвонить позже'),
('makeTheContract', 'denied', 'отказать в заявке'),
('makeTheContract', 'notAvailable', 'недозвонились'),
('makeTheContract', 'pay', 'оплатили'),
('makeTheContract', 'refused', 'отказались общатсья'),
('notAvailable', 'callBack', 'просили перезвонить позже'),
('notAvailable', 'denied', 'отказать в заявке'),
('notAvailable', 'notAvailable', 'недозвонились'),
('notAvailable', 'talked', 'поговорили'),
('talked', 'callBack', 'просили перезвонить позже'),
('talked', 'denied', 'отказать в заявке'),
('talked', 'makeTheContract', 'заключили договор'),
('talked', 'notAvailable', 'недозвонились'),
('talked', 'refused', 'отказались общатсья');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Components`
--
ALTER TABLE `Components`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `ComponentsDepends`
--
ALTER TABLE `ComponentsDepends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `depends_UNIQUE` (`depends`,`component`,`elementType`),
  ADD KEY `fk_ComponentsDepends_1_idx` (`elementType`),
  ADD KEY `fk_ComponentsDepends_2_idx` (`component`);

--
-- Индексы таблицы `ComponentsDependsElementsType`
--
ALTER TABLE `ComponentsDependsElementsType`
  ADD PRIMARY KEY (`elementType`),
  ADD UNIQUE KEY `elementType_UNIQUE` (`elementType`);

--
-- Индексы таблицы `ComponentsElements`
--
ALTER TABLE `ComponentsElements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `component_UNIQUE` (`component`,`alias`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`,`component`);

--
-- Индексы таблицы `ContactsUnits`
--
ALTER TABLE `ContactsUnits`
  ADD PRIMARY KEY (`unit`),
  ADD KEY `fk_ContactsUnits_1_idx` (`type`);

--
-- Индексы таблицы `ContactsUnitsMaps`
--
ALTER TABLE `ContactsUnitsMaps`
  ADD PRIMARY KEY (`unit`,`map`),
  ADD KEY `fk_ContactsUnitsMaps_2_idx` (`map`);

--
-- Индексы таблицы `ContactsUnitsTypes`
--
ALTER TABLE `ContactsUnitsTypes`
  ADD PRIMARY KEY (`type`),
  ADD UNIQUE KEY `unique_sequence` (`sequence`);

--
-- Индексы таблицы `ContactsUnitsTypes_Lang`
--
ALTER TABLE `ContactsUnitsTypes_Lang`
  ADD PRIMARY KEY (`type`,`lang`),
  ADD KEY `fk_ContactsTypes_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `ContactsUnitsWokers`
--
ALTER TABLE `ContactsUnitsWokers`
  ADD PRIMARY KEY (`unit`,`worker`),
  ADD KEY `fk_ContactsUnitsWokers_2_idx` (`worker`);

--
-- Индексы таблицы `ContactsUnits_Lang`
--
ALTER TABLE `ContactsUnits_Lang`
  ADD PRIMARY KEY (`unit`,`lang`),
  ADD KEY `fk_ContactsUnits_lang_2_idx` (`lang`);

--
-- Индексы таблицы `ContactsWorkers`
--
ALTER TABLE `ContactsWorkers`
  ADD PRIMARY KEY (`worker`),
  ADD KEY `fk_ContactsWorkers_1_idx` (`post`);

--
-- Индексы таблицы `ContactsWorkersPosts`
--
ALTER TABLE `ContactsWorkersPosts`
  ADD PRIMARY KEY (`post`),
  ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`);

--
-- Индексы таблицы `ContactsWorkersPosts_Lang`
--
ALTER TABLE `ContactsWorkersPosts_Lang`
  ADD PRIMARY KEY (`post`,`lang`),
  ADD KEY `fk_ContactsWorkersPosts_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `ContactsWorkers_Lang`
--
ALTER TABLE `ContactsWorkers_Lang`
  ADD PRIMARY KEY (`worker`,`lang`),
  ADD KEY `fk_ContactsWorkers_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `CreatedModules`
--
ALTER TABLE `CreatedModules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_CreatedModules_1_idx` (`module`);

--
-- Индексы таблицы `DBerrors`
--
ALTER TABLE `DBerrors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Feedbacks`
--
ALTER TABLE `Feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Feedbacks_1_idx` (`rating`),
  ADD KEY `fk_Feedbacks_2_idx` (`ip`);

--
-- Индексы таблицы `FeedbacksIsComments`
--
ALTER TABLE `FeedbacksIsComments`
  ADD PRIMARY KEY (`feedback`,`parentFeedback`),
  ADD KEY `fk_FeedbacksIsComments_2_idx` (`parentFeedback`);

--
-- Индексы таблицы `FeedbacksLike`
--
ALTER TABLE `FeedbacksLike`
  ADD PRIMARY KEY (`ip`,`feedback`),
  ADD KEY `fk_FeedbacksLike_1_idx` (`feedback`);

--
-- Индексы таблицы `FeedbacksListIP`
--
ALTER TABLE `FeedbacksListIP`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `fk_FeedbacksListIP_1_idx` (`status`);

--
-- Индексы таблицы `FeedbacksListIPStatus`
--
ALTER TABLE `FeedbacksListIPStatus`
  ADD PRIMARY KEY (`status`);

--
-- Индексы таблицы `FeedbacksRating`
--
ALTER TABLE `FeedbacksRating`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value_UNIQUE` (`value`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `HtmlModul`
--
ALTER TABLE `HtmlModul`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `HtmlModul_Lang`
--
ALTER TABLE `HtmlModul_Lang`
  ADD PRIMARY KEY (`htmlModul`,`lang`),
  ADD KEY `fk_HtmlModul_Lang_HtmlModul_idx` (`htmlModul`),
  ADD KEY `fk_HtmlModul_Lang_Lang_idx` (`lang`);

--
-- Индексы таблицы `JCropTypes`
--
ALTER TABLE `JCropTypes`
  ADD PRIMARY KEY (`type`),
  ADD UNIQUE KEY `boxId_UNIQUE` (`type`);

--
-- Индексы таблицы `Jquery`
--
ALTER TABLE `Jquery`
  ADD PRIMARY KEY (`fileName`),
  ADD UNIQUE KEY `version_UNIQUE` (`version`,`min`),
  ADD UNIQUE KEY `fileName_UNIQUE` (`fileName`);

--
-- Индексы таблицы `Lang`
--
ALTER TABLE `Lang`
  ADD PRIMARY KEY (`lang`),
  ADD UNIQUE KEY `lang_UNIQUE` (`lang`),
  ADD UNIQUE KEY `langName_UNIQUE` (`langName`);

--
-- Индексы таблицы `Maps`
--
ALTER TABLE `Maps`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `Materials`
--
ALTER TABLE `Materials`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `MaterialsCategories`
--
ALTER TABLE `MaterialsCategories`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `MaterialsCategoriesInList`
--
ALTER TABLE `MaterialsCategoriesInList`
  ADD PRIMARY KEY (`category`,`list`),
  ADD UNIQUE KEY `key_UNIQUE` (`sequence`,`list`),
  ADD KEY `fk_MaterialsCategories_has_CategoriesList_CategoriesList1_idx` (`list`),
  ADD KEY `fk_MaterialsCategories_has_CategoriesList_MaterialsCategori_idx` (`category`);

--
-- Индексы таблицы `MaterialsCategoriesList`
--
ALTER TABLE `MaterialsCategoriesList`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `MaterialsCategoriesList_Lang`
--
ALTER TABLE `MaterialsCategoriesList_Lang`
  ADD PRIMARY KEY (`list`,`lang`),
  ADD KEY `fk_MaterialsCategoriesList_Lang_MaterialsCategories_idx` (`list`),
  ADD KEY `fk_MaterialsCategoriesList_Lang_Lang_idx` (`lang`);

--
-- Индексы таблицы `MaterialsCategories_Lang`
--
ALTER TABLE `MaterialsCategories_Lang`
  ADD PRIMARY KEY (`category`,`lang`),
  ADD KEY `fk_MaterialsCategories_Lang_MaterialsCategories_idx` (`category`),
  ADD KEY `fk_MaterialsCategories_Lang_Lang_idx` (`lang`);

--
-- Индексы таблицы `MaterialsInCategories`
--
ALTER TABLE `MaterialsInCategories`
  ADD PRIMARY KEY (`material`,`category`),
  ADD KEY `fk_MaterialsInCategories_Materials_idx` (`material`),
  ADD KEY `fk_MaterialsInCategories_MaterialsCategories_idx` (`category`);

--
-- Индексы таблицы `Materials_Lang`
--
ALTER TABLE `Materials_Lang`
  ADD PRIMARY KEY (`material`,`lang`),
  ADD KEY `fk_Materials_Lang_Materials_idx` (`material`),
  ADD KEY `fk_Materials_Lang_Lang_idx` (`lang`);

--
-- Индексы таблицы `Menu`
--
ALTER TABLE `Menu`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_Menu_MenuTypes` (`type`);

--
-- Индексы таблицы `MenuItemParent`
--
ALTER TABLE `MenuItemParent`
  ADD PRIMARY KEY (`menuItem`,`parent`),
  ADD UNIQUE KEY `menuItem_UNIQUE` (`menuItem`),
  ADD KEY `fk_MenuItemParent_MenuItems1` (`menuItem`),
  ADD KEY `fk_MenuItemParent_MenuItems2` (`parent`);

--
-- Индексы таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `key_UNIQUE` (`sequence`,`menu`),
  ADD KEY `fk_MenuItems_UrlTarget` (`target`),
  ADD KEY `fk_MenuElements_Menu` (`menu`);

--
-- Индексы таблицы `MenuItemsPage`
--
ALTER TABLE `MenuItemsPage`
  ADD PRIMARY KEY (`menuItem`,`page`),
  ADD UNIQUE KEY `menuItem_UNIQUE` (`menuItem`),
  ADD KEY `fk_MenuItemsPage_MenuItems` (`menuItem`),
  ADD KEY `fk_MenuItemsPage_Pages` (`page`);

--
-- Индексы таблицы `MenuItems_Lang`
--
ALTER TABLE `MenuItems_Lang`
  ADD PRIMARY KEY (`menuItem`,`lang`),
  ADD KEY `fk_MenuItems_Lang_MenuItems` (`menuItem`),
  ADD KEY `fk_MenuItems_Lang_Lang` (`lang`);

--
-- Индексы таблицы `MenuTypes`
--
ALTER TABLE `MenuTypes`
  ADD PRIMARY KEY (`type`),
  ADD UNIQUE KEY `type_UNIQUE` (`type`);

--
-- Индексы таблицы `Modules`
--
ALTER TABLE `Modules`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `depends_UNIQUE` (`depends`,`module`,`elementType`),
  ADD KEY `fk_ModulesDepends_1_idx` (`elementType`),
  ADD KEY `fk_ModulesDepends_2` (`module`);

--
-- Индексы таблицы `ModulesDependsElementsType`
--
ALTER TABLE `ModulesDependsElementsType`
  ADD PRIMARY KEY (`elementType`),
  ADD UNIQUE KEY `tableName_UNIQUE` (`tableName`),
  ADD UNIQUE KEY `elementType_UNIQUE` (`elementType`);

--
-- Индексы таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_UNIQUE` (`module`,`block`),
  ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`,`block`),
  ADD KEY `fk_ModulesInBlocks_2_idx` (`block`);

--
-- Индексы таблицы `ModulesInBlocks_Lang`
--
ALTER TABLE `ModulesInBlocks_Lang`
  ADD PRIMARY KEY (`module`,`lang`),
  ADD KEY `fk_ModulesInBlocks_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `ModulesOnPages`
--
ALTER TABLE `ModulesOnPages`
  ADD PRIMARY KEY (`module`,`page`),
  ADD KEY `fk_ModulesOnPages_2_idx` (`page`),
  ADD KEY `fk_ModulesOnPages_1_idx` (`module`);

--
-- Индексы таблицы `ModulesParam`
--
ALTER TABLE `ModulesParam`
  ADD PRIMARY KEY (`module`,`param`);

--
-- Индексы таблицы `ModulesTitleIcon`
--
ALTER TABLE `ModulesTitleIcon`
  ADD PRIMARY KEY (`module`),
  ADD UNIQUE KEY `module_UNIQUE` (`module`),
  ADD KEY `fk_ModulesTitleIcon_1_idx` (`module`),
  ADD KEY `fk_ModulesTitleIcon_2_idx` (`style`);

--
-- Индексы таблицы `ModulesTitleIconStile`
--
ALTER TABLE `ModulesTitleIconStile`
  ADD PRIMARY KEY (`style`),
  ADD UNIQUE KEY `style_UNIQUE` (`style`);

--
-- Индексы таблицы `PageParam`
--
ALTER TABLE `PageParam`
  ADD PRIMARY KEY (`page`,`param`);

--
-- Индексы таблицы `Pages`
--
ALTER TABLE `Pages`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`),
  ADD KEY `fk_Pages_1_idx` (`componentElement`),
  ADD KEY `fk_Pages_2_idx` (`template`);

--
-- Индексы таблицы `Pages_Lang`
--
ALTER TABLE `Pages_Lang`
  ADD PRIMARY KEY (`page`,`lang`),
  ADD KEY `fk_Pages_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `ParamInfo_ComponentsElements`
--
ALTER TABLE `ParamInfo_ComponentsElements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `param_UNIQUE` (`param`,`componentElement`),
  ADD KEY `fk_ParamInfo_ComponentsElements_1_idx` (`componentElement`);

--
-- Индексы таблицы `Personnel`
--
ALTER TABLE `Personnel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Personnel_1_idx` (`post`);

--
-- Индексы таблицы `PersonnelPosts`
--
ALTER TABLE `PersonnelPosts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `PluginDefaultParam`
--
ALTER TABLE `PluginDefaultParam`
  ADD PRIMARY KEY (`plugin`,`param`);

--
-- Индексы таблицы `PluginDepends`
--
ALTER TABLE `PluginDepends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `depends_UNIQUE` (`depends`,`plugin`,`elementType`),
  ADD KEY `fk_PluginDepends_1_idx` (`elementType`),
  ADD KEY `fk_PluginDepends_2_idx` (`plugin`);

--
-- Индексы таблицы `PluginOnPage`
--
ALTER TABLE `PluginOnPage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugin_UNIQUE` (`plugin`,`page`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_PluginOnPage_2_idx` (`page`),
  ADD KEY `fk_PluginOnPage_1_idx` (`plugin`);

--
-- Индексы таблицы `PluginParam`
--
ALTER TABLE `PluginParam`
  ADD PRIMARY KEY (`plugin`,`param`);

--
-- Индексы таблицы `Plugins`
--
ALTER TABLE `Plugins`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`);

--
-- Индексы таблицы `PluginsDependsElementsType`
--
ALTER TABLE `PluginsDependsElementsType`
  ADD PRIMARY KEY (`elementType`),
  ADD UNIQUE KEY `elementType_UNIQUE` (`elementType`),
  ADD UNIQUE KEY `tableName_UNIQUE` (`tableName`);

--
-- Индексы таблицы `PricesAdditionalServices`
--
ALTER TABLE `PricesAdditionalServices`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `PricesCourses`
--
ALTER TABLE `PricesCourses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Courses_1_idx` (`category`);

--
-- Индексы таблицы `PricesCoursesCategory`
--
ALTER TABLE `PricesCoursesCategory`
  ADD PRIMARY KEY (`category`);

--
-- Индексы таблицы `ROOT_SETTINGS`
--
ALTER TABLE `ROOT_SETTINGS`
  ADD PRIMARY KEY (`settingsName`),
  ADD UNIQUE KEY `settingsName_UNIQUE` (`settingsName`);

--
-- Индексы таблицы `Sliders`
--
ALTER TABLE `Sliders`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`),
  ADD KEY `fk_Sliders_SlidersThemes_idx` (`theme`),
  ADD KEY `fk_Sliders_1_idx` (`controls_position`),
  ADD KEY `fk_Sliders_2_idx` (`focus_position`),
  ADD KEY `fk_Sliders_3_idx` (`numbers_align`),
  ADD KEY `fk_Sliders_4_idx` (`labelAnimation`),
  ADD KEY `fk_Sliders_5_idx` (`animations`);

--
-- Индексы таблицы `SlidersControlsPosition`
--
ALTER TABLE `SlidersControlsPosition`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersFocusPosition`
--
ALTER TABLE `SlidersFocusPosition`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersLabelAnimation`
--
ALTER TABLE `SlidersLabelAnimation`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersNumbersAlign`
--
ALTER TABLE `SlidersNumbersAlign`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersThemes`
--
ALTER TABLE `SlidersThemes`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `Slides`
--
ALTER TABLE `Slides`
  ADD PRIMARY KEY (`fileName`,`slider`),
  ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`,`slider`),
  ADD KEY `fk_Slides_Sliders_idx` (`slider`),
  ADD KEY `fk_Slides_SlidesAnimations_idx` (`animation`);

--
-- Индексы таблицы `SlidesAnimations`
--
ALTER TABLE `SlidesAnimations`
  ADD PRIMARY KEY (`alias`),
  ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `block_UNIQUE` (`block`,`template`),
  ADD KEY `fk_TemplateBlocks_1_idx` (`template`);

--
-- Индексы таблицы `TemplateDependence`
--
ALTER TABLE `TemplateDependence`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `template_UNIQUE` (`template`,`depends`);

--
-- Индексы таблицы `Templates`
--
ALTER TABLE `Templates`
  ADD PRIMARY KEY (`alias`);

--
-- Индексы таблицы `UrlTarget`
--
ALTER TABLE `UrlTarget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `target_UNIQUE` (`target`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`login`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `phone_UNIQUE` (`phone`),
  ADD KEY `fk_Users_1_idx` (`group`);

--
-- Индексы таблицы `UsersAgreements`
--
ALTER TABLE `UsersAgreements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`);

--
-- Индексы таблицы `UsersGroups`
--
ALTER TABLE `UsersGroups`
  ADD PRIMARY KEY (`group`),
  ADD UNIQUE KEY `group_UNIQUE` (`group`);

--
-- Индексы таблицы `UsersGroups_Lang`
--
ALTER TABLE `UsersGroups_Lang`
  ADD PRIMARY KEY (`group`,`lang`),
  ADD KEY `fk_UsersGroups_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `UsersMassage`
--
ALTER TABLE `UsersMassage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_UsersMassage_1_idx` (`sender`),
  ADD KEY `fk_UsersMassage_2_idx` (`addressee`);

--
-- Индексы таблицы `UsersNotifications`
--
ALTER TABLE `UsersNotifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_UsersNotifications_1_idx` (`type`),
  ADD KEY `fk_UsersNotifications_2_idx` (`user`);

--
-- Индексы таблицы `UsersNotificationsType`
--
ALTER TABLE `UsersNotificationsType`
  ADD PRIMARY KEY (`type`),
  ADD UNIQUE KEY `type_UNIQUE` (`type`);

--
-- Индексы таблицы `UsersNotifications_Lang`
--
ALTER TABLE `UsersNotifications_Lang`
  ADD PRIMARY KEY (`usersNotifications`,`lang`),
  ADD UNIQUE KEY `lang_UNIQUE` (`lang`,`usersNotifications`);

--
-- Индексы таблицы `UsersOnlineApplications`
--
ALTER TABLE `UsersOnlineApplications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_UsersOnlineApplications_1_idx` (`totalStatus`);

--
-- Индексы таблицы `UsersOnlineApplicationsLogStatusTransition`
--
ALTER TABLE `UsersOnlineApplicationsLogStatusTransition`
  ADD PRIMARY KEY (`onlineApplication`,`changed`),
  ADD KEY `fk_UsersOnlineApplicationsLogStatusTransition_2_idx` (`startStatus`),
  ADD KEY `fk_UsersOnlineApplicationsLogStatusTransition_3_idx` (`endStatus`);

--
-- Индексы таблицы `UsersOnlineApplicationsStatuses`
--
ALTER TABLE `UsersOnlineApplicationsStatuses`
  ADD PRIMARY KEY (`status`);

--
-- Индексы таблицы `UsersOnlineApplicationsStatuseTransition`
--
ALTER TABLE `UsersOnlineApplicationsStatuseTransition`
  ADD PRIMARY KEY (`startStatus`,`endStatus`),
  ADD KEY `fk_UsersOnlineApplicationsStatuseTransition_2_idx` (`endStatus`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ComponentsDepends`
--
ALTER TABLE `ComponentsDepends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `ComponentsElements`
--
ALTER TABLE `ComponentsElements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=999902;
--
-- AUTO_INCREMENT для таблицы `DBerrors`
--
ALTER TABLE `DBerrors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Feedbacks`
--
ALTER TABLE `Feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT для таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор элемента меню', AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT для таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=902103;
--
-- AUTO_INCREMENT для таблицы `ParamInfo_ComponentsElements`
--
ALTER TABLE `ParamInfo_ComponentsElements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `PluginDepends`
--
ALTER TABLE `PluginDepends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `PluginOnPage`
--
ALTER TABLE `PluginOnPage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Plugins`
--
ALTER TABLE `Plugins`
  MODIFY `sequence` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `PricesAdditionalServices`
--
ALTER TABLE `PricesAdditionalServices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `PricesCourses`
--
ALTER TABLE `PricesCourses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=902;
--
-- AUTO_INCREMENT для таблицы `TemplateDependence`
--
ALTER TABLE `TemplateDependence`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `UrlTarget`
--
ALTER TABLE `UrlTarget`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `UsersAgreements`
--
ALTER TABLE `UsersAgreements`
  MODIFY `sequence` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `UsersMassage`
--
ALTER TABLE `UsersMassage`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `UsersNotifications`
--
ALTER TABLE `UsersNotifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ComponentsDepends`
--
ALTER TABLE `ComponentsDepends`
  ADD CONSTRAINT `fk_ComponentsDepends_1` FOREIGN KEY (`elementType`) REFERENCES `ComponentsDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ComponentsDepends_2` FOREIGN KEY (`component`) REFERENCES `Components` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ComponentsElements`
--
ALTER TABLE `ComponentsElements`
  ADD CONSTRAINT `fk_ComponentsElements_1` FOREIGN KEY (`component`) REFERENCES `Components` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnits`
--
ALTER TABLE `ContactsUnits`
  ADD CONSTRAINT `fk_ContactsUnits_1` FOREIGN KEY (`type`) REFERENCES `ContactsUnitsTypes` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnitsMaps`
--
ALTER TABLE `ContactsUnitsMaps`
  ADD CONSTRAINT `fk_ContactsUnitsMaps_1` FOREIGN KEY (`unit`) REFERENCES `ContactsUnits` (`unit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsUnitsMaps_2` FOREIGN KEY (`map`) REFERENCES `Maps` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnitsTypes_Lang`
--
ALTER TABLE `ContactsUnitsTypes_Lang`
  ADD CONSTRAINT `fk_ContactsUnitsTypes_Lang_1` FOREIGN KEY (`type`) REFERENCES `ContactsUnitsTypes` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsUnitsypes_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnitsWokers`
--
ALTER TABLE `ContactsUnitsWokers`
  ADD CONSTRAINT `fk_ContactsUnitsWokers_1` FOREIGN KEY (`unit`) REFERENCES `ContactsUnits` (`unit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsUnitsWokers_2` FOREIGN KEY (`worker`) REFERENCES `ContactsWorkers` (`worker`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsUnits_Lang`
--
ALTER TABLE `ContactsUnits_Lang`
  ADD CONSTRAINT `fk_ContactsUnits_lang_1` FOREIGN KEY (`unit`) REFERENCES `ContactsUnits` (`unit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsUnits_lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsWorkers`
--
ALTER TABLE `ContactsWorkers`
  ADD CONSTRAINT `fk_ContactsWorkers_1` FOREIGN KEY (`post`) REFERENCES `ContactsWorkersPosts` (`post`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsWorkersPosts_Lang`
--
ALTER TABLE `ContactsWorkersPosts_Lang`
  ADD CONSTRAINT `fk_ContactsWorkersPosts_Lang_1` FOREIGN KEY (`post`) REFERENCES `ContactsWorkersPosts` (`post`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsWorkersPosts_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ContactsWorkers_Lang`
--
ALTER TABLE `ContactsWorkers_Lang`
  ADD CONSTRAINT `fk_ContactsWorkers_Lang_1` FOREIGN KEY (`worker`) REFERENCES `ContactsWorkers` (`worker`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ContactsWorkers_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `CreatedModules`
--
ALTER TABLE `CreatedModules`
  ADD CONSTRAINT `fk_CreatedModules_1` FOREIGN KEY (`module`) REFERENCES `Modules` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Feedbacks`
--
ALTER TABLE `Feedbacks`
  ADD CONSTRAINT `fk_Feedbacks_1` FOREIGN KEY (`rating`) REFERENCES `FeedbacksRating` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Feedbacks_2` FOREIGN KEY (`ip`) REFERENCES `FeedbacksListIP` (`ip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `FeedbacksIsComments`
--
ALTER TABLE `FeedbacksIsComments`
  ADD CONSTRAINT `fk_FeedbacksIsComments_1` FOREIGN KEY (`feedback`) REFERENCES `Feedbacks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_FeedbacksIsComments_2` FOREIGN KEY (`parentFeedback`) REFERENCES `Feedbacks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `FeedbacksLike`
--
ALTER TABLE `FeedbacksLike`
  ADD CONSTRAINT `fk_FeedbacksLike_1` FOREIGN KEY (`feedback`) REFERENCES `Feedbacks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_FeedbacksLike_2` FOREIGN KEY (`ip`) REFERENCES `FeedbacksListIP` (`ip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `FeedbacksListIP`
--
ALTER TABLE `FeedbacksListIP`
  ADD CONSTRAINT `fk_FeedbacksListIP_1` FOREIGN KEY (`status`) REFERENCES `FeedbacksListIPStatus` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `HtmlModul_Lang`
--
ALTER TABLE `HtmlModul_Lang`
  ADD CONSTRAINT `fk_HtmlModul_Lang_HtmlModul` FOREIGN KEY (`htmlModul`) REFERENCES `HtmlModul` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_HtmlModul_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategoriesInList`
--
ALTER TABLE `MaterialsCategoriesInList`
  ADD CONSTRAINT `fk_MaterialsCategoriesInList_CategoriesList_CategoriesList` FOREIGN KEY (`list`) REFERENCES `MaterialsCategoriesList` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsCategoriesInList_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategoriesList_Lang`
--
ALTER TABLE `MaterialsCategoriesList_Lang`
  ADD CONSTRAINT `fk_MaterialsCategoriesList_Lang_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsCategoriesList_Lang_MaterialsCategories` FOREIGN KEY (`list`) REFERENCES `MaterialsCategoriesList` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategories_Lang`
--
ALTER TABLE `MaterialsCategories_Lang`
  ADD CONSTRAINT `fk_MaterialsCategories_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsCategories_Lang_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsInCategories`
--
ALTER TABLE `MaterialsInCategories`
  ADD CONSTRAINT `fk_MaterialsInCategories_Materials` FOREIGN KEY (`material`) REFERENCES `Materials` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MaterialsInCategories_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Materials_Lang`
--
ALTER TABLE `Materials_Lang`
  ADD CONSTRAINT `fk_Materials_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Materials_Lang_Materials` FOREIGN KEY (`material`) REFERENCES `Materials` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Menu`
--
ALTER TABLE `Menu`
  ADD CONSTRAINT `fk_Menu_MenuTypes` FOREIGN KEY (`type`) REFERENCES `MenuTypes` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItemParent`
--
ALTER TABLE `MenuItemParent`
  ADD CONSTRAINT `fk_MenuItemParent_MenuItems1` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItemParent_MenuItems2` FOREIGN KEY (`parent`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
  ADD CONSTRAINT `fk_MenuElements_Menu` FOREIGN KEY (`menu`) REFERENCES `Menu` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItems_UrlTarget` FOREIGN KEY (`target`) REFERENCES `UrlTarget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItemsPage`
--
ALTER TABLE `MenuItemsPage`
  ADD CONSTRAINT `fk_MenuItemsPage_MenuItems` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItemsPage_Pages` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItems_Lang`
--
ALTER TABLE `MenuItems_Lang`
  ADD CONSTRAINT `fk_MenuItems_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_MenuItems_Lang_MenuItems` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
  ADD CONSTRAINT `fk_ModulesDepends_1` FOREIGN KEY (`elementType`) REFERENCES `ModulesDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesDepends_2` FOREIGN KEY (`module`) REFERENCES `Modules` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
  ADD CONSTRAINT `fk_ModulesInBlocks_1` FOREIGN KEY (`module`) REFERENCES `CreatedModules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesInBlocks_2` FOREIGN KEY (`block`) REFERENCES `TemplateBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesInBlocks_Lang`
--
ALTER TABLE `ModulesInBlocks_Lang`
  ADD CONSTRAINT `fk_ModulesInBlocks_Lang_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesInBlocks_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesOnPages`
--
ALTER TABLE `ModulesOnPages`
  ADD CONSTRAINT `fk_ModulesOnPages_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesOnPages_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesParam`
--
ALTER TABLE `ModulesParam`
  ADD CONSTRAINT `fk_ModulesParam_1` FOREIGN KEY (`module`) REFERENCES `CreatedModules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesTitleIcon`
--
ALTER TABLE `ModulesTitleIcon`
  ADD CONSTRAINT `fk_ModulesTitleIcon_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ModulesTitleIcon_2` FOREIGN KEY (`style`) REFERENCES `ModulesTitleIconStile` (`style`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PageParam`
--
ALTER TABLE `PageParam`
  ADD CONSTRAINT `fk_PageParam_1` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Pages`
--
ALTER TABLE `Pages`
  ADD CONSTRAINT `fk_Pages_1` FOREIGN KEY (`componentElement`) REFERENCES `ComponentsElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pages_2` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Pages_Lang`
--
ALTER TABLE `Pages_Lang`
  ADD CONSTRAINT `fk_Pages_Lang_1` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pages_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ParamInfo_ComponentsElements`
--
ALTER TABLE `ParamInfo_ComponentsElements`
  ADD CONSTRAINT `fk_ParamInfo_ComponentsElements_1` FOREIGN KEY (`componentElement`) REFERENCES `ComponentsElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Personnel`
--
ALTER TABLE `Personnel`
  ADD CONSTRAINT `fk_Personnel_1` FOREIGN KEY (`post`) REFERENCES `PersonnelPosts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginDefaultParam`
--
ALTER TABLE `PluginDefaultParam`
  ADD CONSTRAINT `fk_PluginDefaultParam_1` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginDepends`
--
ALTER TABLE `PluginDepends`
  ADD CONSTRAINT `fk_PluginDepends_1` FOREIGN KEY (`elementType`) REFERENCES `PluginsDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PluginDepends_2` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginOnPage`
--
ALTER TABLE `PluginOnPage`
  ADD CONSTRAINT `fk_PluginOnPage_1` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PluginOnPage_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginParam`
--
ALTER TABLE `PluginParam`
  ADD CONSTRAINT `fk_PluginParam_1` FOREIGN KEY (`plugin`) REFERENCES `PluginOnPage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PricesCourses`
--
ALTER TABLE `PricesCourses`
  ADD CONSTRAINT `fk_Courses_1` FOREIGN KEY (`category`) REFERENCES `PricesCoursesCategory` (`category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Sliders`
--
ALTER TABLE `Sliders`
  ADD CONSTRAINT `fk_Sliders_1` FOREIGN KEY (`controls_position`) REFERENCES `SlidersControlsPosition` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_2` FOREIGN KEY (`focus_position`) REFERENCES `SlidersFocusPosition` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_3` FOREIGN KEY (`numbers_align`) REFERENCES `SlidersNumbersAlign` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_4` FOREIGN KEY (`labelAnimation`) REFERENCES `SlidersLabelAnimation` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_5` FOREIGN KEY (`animations`) REFERENCES `SlidesAnimations` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Sliders_SlidersThemes` FOREIGN KEY (`theme`) REFERENCES `SlidersThemes` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Slides`
--
ALTER TABLE `Slides`
  ADD CONSTRAINT `fk_Slides_Sliders` FOREIGN KEY (`slider`) REFERENCES `Sliders` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Slides_SlidesAnimations` FOREIGN KEY (`animation`) REFERENCES `SlidesAnimations` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
  ADD CONSTRAINT `fk_TemplateBlocks_1` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `TemplateDependence`
--
ALTER TABLE `TemplateDependence`
  ADD CONSTRAINT `fk_TemplateDependence_1` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `fk_Users_1` FOREIGN KEY (`group`) REFERENCES `UsersGroups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersGroups_Lang`
--
ALTER TABLE `UsersGroups_Lang`
  ADD CONSTRAINT `fk_UsersGroups_Lang_1` FOREIGN KEY (`group`) REFERENCES `UsersGroups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersGroups_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersMassage`
--
ALTER TABLE `UsersMassage`
  ADD CONSTRAINT `fk_UsersMassage_1` FOREIGN KEY (`sender`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersMassage_2` FOREIGN KEY (`addressee`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersNotifications`
--
ALTER TABLE `UsersNotifications`
  ADD CONSTRAINT `fk_UsersNotifications_1` FOREIGN KEY (`type`) REFERENCES `UsersNotificationsType` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersNotifications_2` FOREIGN KEY (`user`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersNotifications_Lang`
--
ALTER TABLE `UsersNotifications_Lang`
  ADD CONSTRAINT `fk_UsersNotifications_Lang_1` FOREIGN KEY (`usersNotifications`) REFERENCES `UsersNotifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersNotifications_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersOnlineApplications`
--
ALTER TABLE `UsersOnlineApplications`
  ADD CONSTRAINT `fk_UsersOnlineApplications_1` FOREIGN KEY (`totalStatus`) REFERENCES `UsersOnlineApplicationsStatuses` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersOnlineApplicationsLogStatusTransition`
--
ALTER TABLE `UsersOnlineApplicationsLogStatusTransition`
  ADD CONSTRAINT `fk_UsersOnlineApplicationsLogStatusTransition_1` FOREIGN KEY (`onlineApplication`) REFERENCES `UsersOnlineApplications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersOnlineApplicationsLogStatusTransition_2` FOREIGN KEY (`startStatus`) REFERENCES `UsersOnlineApplicationsStatuses` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersOnlineApplicationsLogStatusTransition_3` FOREIGN KEY (`endStatus`) REFERENCES `UsersOnlineApplicationsStatuses` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersOnlineApplicationsStatuseTransition`
--
ALTER TABLE `UsersOnlineApplicationsStatuseTransition`
  ADD CONSTRAINT `fk_UsersOnlineApplicationsStatuseTransition_1` FOREIGN KEY (`startStatus`) REFERENCES `UsersOnlineApplicationsStatuses` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_UsersOnlineApplicationsStatuseTransition_2` FOREIGN KEY (`endStatus`) REFERENCES `UsersOnlineApplicationsStatuses` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
