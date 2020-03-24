-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Мар 24 2020 г., 20:00
-- Версия сервера: 8.0.18
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `buymypoem`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `authorID` int(11) NOT NULL,
  `finisedcompositions` int(11) NOT NULL DEFAULT '0',
  `rating` float NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`authorID`, `finisedcompositions`, `rating`, `userID`) VALUES
(1, 0, 0, 1),
(2, 0, 0, 3),
(3, 0, 0, 2),
(6, 0, 0, 20),
(7, 0, 0, 23),
(8, 0, 0, 25),
(12, 0, 0, 33),
(13, 0, 0, 34),
(14, 0, 0, 35);

-- --------------------------------------------------------

--
-- Структура таблицы `authorrequest`
--

CREATE TABLE `authorrequest` (
  `authorrequest` int(11) NOT NULL,
  `authorID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `authorrequest`
--

INSERT INTO `authorrequest` (`authorrequest`, `authorID`, `requestID`) VALUES
(1, 8, 4),
(2, 7, 4),
(9, 8, 1),
(10, 8, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `commentID` int(11) NOT NULL,
  `text` text NOT NULL,
  `sendingdate` date NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `commentcomposition`
--

CREATE TABLE `commentcomposition` (
  `commentcompositionID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `compositionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `commentordering`
--

CREATE TABLE `commentordering` (
  `commentorderingID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `orderingID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `commentrequest`
--

CREATE TABLE `commentrequest` (
  `commentrequestID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `requestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `composition`
--

CREATE TABLE `composition` (
  `compositionID` int(11) NOT NULL,
  `title` varchar(70) NOT NULL,
  `description` text,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `text` text NOT NULL,
  `authorID` int(11) NOT NULL,
  `genreID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `composition`
--

INSERT INTO `composition` (`compositionID`, `title`, `description`, `likes`, `dislikes`, `text`, `authorID`, `genreID`, `typeID`, `status`) VALUES
(1, 'Бельгия', 'Стих про величие Бельгии', 0, 0, 'Побеждена, но не рабыня,\r\nСтоишь ты гордо без доспех,\r\nОсквернена твоя святыня,\r\nЗато душа чиста, как снег.\r\nКровавый пир в дыму пожара\r\nУстроил грозный сатана,\r\nИ под мечом его удара\r\nРазбита храбрая страна.\r\nНо дух свободный, дух могучий\r\nВеликих сил не угасил,\r\nОн, как орел, парит за тучей\r\nНад цепью доблестных могил.\r\nИ жребий правды совершится:\r\nПадет твой враг к твоим ногам\r\nИ будет с горестью молиться\r\nТвоим разбитым алтарям.', 7, 1, 2, 'В черновике'),
(2, 'В гостях', 'Про мышку', 2, 0, 'Мышь меня на чашку чая\r\nПригласила в новый дом.\r\nДолго в дом не мог войти я,\r\nВсе же влез в него с трудом.\r\nА теперь вы мне скажите:\r\nПочему и отчего\r\nНет ни дома и ни чая,\r\nНет буквально ничего!', 7, 1, 1, 'Опубликовано'),
(8, 'Faith and me', 'piece of shit', 0, 3, 'Do u see what i mean?\r\nall my mindthings are free!\r\nthoughts have never been clean,\r\ni forgot to foresee\r\n\r\nhow ive lost all my friends,\r\nnevermind who they ve been,\r\nbut my pride it still stands\r\nbetween 8 and 15.', 1, 1, 1, 'Опубликовано'),
(13, ' Муха', 'да да я', 0, 0, 'Села муха на варенье!', 7, 2, 1, 'Опубликовано'),
(16, ' Береза', 'пушкин бох есенин сдох', 0, 0, 'Белая береза под моим окном...', 7, 1, 1, 'В черновике'),
(17, 'На изгибы мёртвых', 'Просто стих', 4354, 34545, 'На изгибы мёртвых улиц ляжет томный нежный взгляд.\r\nСтан серьёзный, шаг неспешный, 40 месяцев подряд.\r\nДень за днём и год за годом, в перемены веры нет.\r\nКрыши, ветки и заборы, под стабильный серый свет.\r\n\r\nЗнает всех людей района, кто противней, кто быстрей.\r\nСидя, с крыши пар пускает из потрёпанных ноздрей.\r\nГрациозные движенья: шаг, трусца, бегом, прыжок.\r\nИ уже в ларьке с едою. К повару. За ним должок.\r\n\r\nПодкрепившись тем, что дали. Неспеша по всем делам:\r\nПоздороваться с подругой, птиц подергать тут и там,\r\nПрочесать дорожки парка на потеху малышей,\r\nС высоты поникшей ивы потаращить на лещей.\r\n\r\nПод ногами километры за спиною только хвост.\r\nНастроенье переменно, то на крышу, то под мост.\r\nЯзыка шершавость бесит. Шерсть бы не стереть до дыр.\r\nВот у мамы был приятней. Ключевое слово был...\r\n\r\nНо не время капать слезы. Собираются коты\r\nВновь побиться до психоза за принцессу нищеты.\r\nЖаль сегодня без мужчинок, жизнь пустеет с каждым днём.\r\nГордо, не подав и виду уплывет играть с огнём.\r\n\r\nУрны жечь - не брать бумажки. Здесь не знают слова враг.\r\nНет желаний силы мерить, что касается и благ.\r\nСистематика не ставит рамок для понятия бомж.\r\nНет деления на бедных и господ или вельмож.\r\n\r\nОтражаясь в жёлтых глазках, догорит обычный день.\r\nС цветом стен почти сольётся в миг ушастенькая тень.\r\nХоть во мраке страх не встанет, взгляд кошачий режет тьму.\r\nНо усталость не позволит удивляться ничему.\r\n\r\nЖизнь проста но неизменна, завтра снова как-то так:\r\nКрыши, люди, перекрёстки, мост, огни, закат, чердак.\r\nСон придёт сквозь лай далёкий, одинокий, без угроз.\r\nВедь судьба одна и та же — не для строк стихов и проз.', 7, 1, 1, 'Опубликовано'),
(18, 'Дюжина пар назойливых глаз', 'Держу в курсе', 232, 1232, 'Дюжина пар назойливых глаз, простые движенья, пустые стаканы.\r\nОни все позабудут про кто, что сказал, расставляя друг другу под ноги капканы.\r\nЧто же я тут забыл? Бит взорвётся сильней и оставит вопрос без ответа.\r\nЗапах пьяных волос, голос детской мечты в середине двадцатого лета.\r\n\r\nВроде даже привык, как снижает свой темп беспорядочный пляс силуэтов,\r\nКак вселяет цикличность в статический фон россыпь красно-безумных портретов.\r\nВзгляд мой точку одну изучает давно сантиметром ни выше, ни ниже.\r\nЯ смотрю по прямой, но все то, что вокруг, наизусть знаю, хоть и не вижу.\r\n\r\nПусты мысли, идеи, слова, споры, звуки в молчании разум сильнее.\r\nСреди кучи чужих, бестолковых людей одиночество лупит больнее.\r\nПередоз или сон? Адекватен, влюблён? Я не тот за кого меня держат!\r\nЯ для них и не бог, но и точно не раб, наблюдая за всем где-то между.\r\n\r\nОн же мог не блевать где-то там в уголке, а узнать что то важное вместо.\r\nА она могла мирно в кровати сопеть, а не грудью трясти возле шеста.\r\nХотя что я ворчу? Мне не все ли равно? Убирать за ним точно не буду.\r\nА на годную грудь почему б не взглянуть, рот разинув, роняя посуду.\r\n\r\n\"Эй, братан! Ты чего приуныл? Хватит тухнуть! Возьми ка бутылочку пива!\"\r\nНу и нахер ты дал мне вот это дерьмо? Не дождавшись ответа ушёл некрасиво?\r\nХоть на пару минут надо выйти во двор, отпустить колдовство психодела.\r\nСвежий ветер ночной, Россыпь звёзд в небесах, вобщем все не для пьяного тела\r\n\r\nЧто ж, наверное, мне никогда не понять, почему им все это так сильно по нраву.\r\nВеселиться, курить, друг на друге скакать, запивая отравой отраву.\r\nИм же легче проблемы и мысли свои утопить и забыть в алкоголе.\r\nСоздать собственный мир, где не надо вникать, существуя как будто в приколе.\r\n\r\nНу а я что? Я тоже хотел. Но так просто свой мозг отключить не по силам.\r\nЭто сложно порой — слушать шум в голове и пульсацию крови по жилам\r\nЯ здесь самый чужой, мне не нужно здесь быть, будто взрослому в школьном буфете.\r\nСкоро выдвинусь в собственный мир а пока... А пока на меня дует ветер.\r\n\r\nСнова в мыслях повеет пейзажем до боли знакомым но очень далёким.\r\nЯ вовсе не знал, кем я был все то время, пока я не был одиноким.\r\nВ мечтах растворяясь, забыв про реальность я падал и падал и падал.\r\nИ понял, что где-то свернул не туда, лишь добравшись, куда мне не надо.', 7, 1, 2, 'Опубликовано'),
(19, 'мур', 'гыыыыыыы', 0, 0, 'мурмургыгы\r\nмурмургыгыгы', 7, 1, 1, 'В черновике'),
(20, 'мур', 'гыыыыыыы', 0, 0, 'мурмургыгы\r\nмурмургыгыгы', 7, 1, 1, 'В черновике'),
(21, 'Новое произведение', 'просто новое произведение', 0, 0, 'дада, новое', 7, 1, 1, 'В черновике'),
(22, 'мур', 'ghghghg', 0, 0, 'jkjkjkjkj', 7, 1, 1, 'В черновике'),
(27, 'qweqweqweqweqwe', 'ssssssssssssssssss', 0, 0, 'dddddddddddddddddddddd', 8, 1, 1, 'В черновике');

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `paidcompositionnumber` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`customerID`, `paidcompositionnumber`, `userID`) VALUES
(1, 0, 21),
(2, 0, 22),
(3, 0, 27);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `genreID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`genreID`, `title`, `description`) VALUES
(1, 'Стихотворение', 'небольшое литературное произведение, написанное по законам стихосложения, жанр поэтической речи.'),
(2, 'Рассказ', 'небольшое по объёму произведение, содержащее малое количество действующих лиц, а также, чаще всего, имеющее одну сюжетную линию.');

-- --------------------------------------------------------

--
-- Структура таблицы `ordering`
--

CREATE TABLE `ordering` (
  `orderingID` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `deadline` date NOT NULL,
  `cost` float NOT NULL,
  `description` text NOT NULL,
  `compositionID` int(11) DEFAULT NULL,
  `customerID` int(11) NOT NULL,
  `authorID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL,
  `genreID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `paymentresourse`
--

CREATE TABLE `paymentresourse` (
  `paymentresourceID` int(11) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `requestID` int(11) NOT NULL,
  `description` text NOT NULL,
  `customerID` int(11) NOT NULL,
  `publicationdate` date NOT NULL,
  `deadline` date NOT NULL,
  `cost` float NOT NULL,
  `genreID` int(11) NOT NULL,
  `typeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`requestID`, `description`, `customerID`, `publicationdate`, `deadline`, `cost`, `genreID`, `typeID`) VALUES
(1, 'Стих про зиму', 2, '2020-03-23', '2020-03-30', 100, 1, 2),
(2, 'Очень смешной рассказ про Путина', 3, '2020-03-23', '2020-04-23', 10000, 2, 1),
(3, 'хуй', 3, '2020-03-23', '2020-03-27', 45, 1, 1),
(4, 'рофлостих про коронавирус', 3, '2020-03-23', '2020-06-26', 1234, 1, 1),
(5, 'лалалалалалалалал', 3, '2020-03-24', '2020-03-27', 88, 1, 1),
(6, 'Не поверишь, это описание)', 1, '2020-03-24', '2020-03-24', 1000, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `rolename` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tag`
--

CREATE TABLE `tag` (
  `tagID` int(11) NOT NULL,
  `text` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tagcomposition`
--

CREATE TABLE `tagcomposition` (
  `tagcompositionID` int(11) NOT NULL,
  `compositionID` int(11) NOT NULL,
  `tagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `typeID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`typeID`, `title`, `description`) VALUES
(1, 'Комедия', 'художественное произведение, характеризующийся юмористическим или сатирическим подходами, и также вид драмы, в котором специфически разрешается момент действенного конфликта или борьбы.'),
(2, 'Трагедия', 'драматическое произведение, в основе которого лежит непримиримый жизненный конфликт, острое столкновение характеров и страстей, оканчивающееся чаще всего гибелью героя.');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `about` text,
  `registerdate` date NOT NULL,
  `role` varchar(15) DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'D:/repository/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`userID`, `login`, `password`, `email`, `birthdate`, `about`, `registerdate`, `role`, `photo`) VALUES
(1, 'pushkin322', '123', 'pushkin@ya.ru', '1990-02-01', 'Простой мужик', '2020-02-22', 'Author', 'D:/repository/default.jpg'),
(2, 'alex_top', '12345', 'alex@ya.ru', '1992-03-09', 'Родился в г. Вологда', '2020-02-22', 'Author', 'D:/repository/default.jpg'),
(3, 'vik', '11111', 'vika@ya.ru', '1988-06-21', 'Замужем. Двое детей', '2020-02-22', 'Author', 'D:/repository/default.jpg'),
(20, 'Lerrra', '-1041601825', 'lera@', '2020-03-07', NULL, '1999-11-25', 'Author', 'D:/repository/default.jpg'),
(21, '123', '48690', 'colya.juravlyov2011@ya.ru', '2020-03-07', NULL, '2007-11-07', 'Customer', 'D:/repository/default.jpg'),
(22, 'arranay', '48657', 'val@gmail.com', '2020-03-14', NULL, '2020-03-14', 'Customer', 'D:/repository/arranay.jpg'),
(23, 'arranayA', '48657', 'val@gmail.com', '2020-03-15', 'Скромный писатель', '2020-03-15', 'Author', 'D:/repository/arranayA.jpg'),
(24, 'admin', '48657', 'admin', '2020-03-15', NULL, '2020-03-15', 'Service', 'D:/repository/default.jpg'),
(25, 'seeyouinthespring', '49', 'colya.juravlyov2011@ya.ru', '2020-03-23', NULL, '1999-03-29', 'Author', 'D:/repository/seeyouinthespring.jpg'),
(27, 'see', '49', 'seesee', '2020-03-23', NULL, '2020-03-02', 'Customer', 'D:/repository/default.jpg'),
(33, 'jhjh', '49', 'lkl', '2020-03-24', NULL, '2020-03-24', 'Author', 'D:/repository/default.jpg'),
(34, 'new', '49', 'new', '2020-03-24', NULL, '2020-03-24', 'Author', 'D:/repository/default.jpg'),
(35, 'neeeeew', '49', 'new', '2020-03-24', NULL, '2020-03-24', 'Author', 'D:/repository/default.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `userrole`
--

CREATE TABLE `userrole` (
  `userroleID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`),
  ADD KEY `userID` (`userID`);

--
-- Индексы таблицы `authorrequest`
--
ALTER TABLE `authorrequest`
  ADD PRIMARY KEY (`authorrequest`),
  ADD KEY `authorID` (`authorID`),
  ADD KEY `requestID` (`requestID`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `userID` (`userID`);

--
-- Индексы таблицы `commentcomposition`
--
ALTER TABLE `commentcomposition`
  ADD PRIMARY KEY (`commentcompositionID`),
  ADD KEY `commentID` (`commentID`),
  ADD KEY `compositionID` (`compositionID`);

--
-- Индексы таблицы `commentordering`
--
ALTER TABLE `commentordering`
  ADD PRIMARY KEY (`commentorderingID`),
  ADD KEY `commentID` (`commentID`),
  ADD KEY `orderingID` (`orderingID`);

--
-- Индексы таблицы `commentrequest`
--
ALTER TABLE `commentrequest`
  ADD PRIMARY KEY (`commentrequestID`),
  ADD KEY `commentID` (`commentID`),
  ADD KEY `requestID` (`requestID`);

--
-- Индексы таблицы `composition`
--
ALTER TABLE `composition`
  ADD PRIMARY KEY (`compositionID`),
  ADD KEY `authorID` (`authorID`),
  ADD KEY `genreID` (`genreID`),
  ADD KEY `typeID` (`typeID`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `userID` (`userID`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreID`);

--
-- Индексы таблицы `ordering`
--
ALTER TABLE `ordering`
  ADD PRIMARY KEY (`orderingID`),
  ADD KEY `compositionID` (`compositionID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `authorID` (`authorID`),
  ADD KEY `typeID` (`typeID`),
  ADD KEY `genreID` (`genreID`);

--
-- Индексы таблицы `paymentresourse`
--
ALTER TABLE `paymentresourse`
  ADD PRIMARY KEY (`paymentresourceID`),
  ADD KEY `userID` (`userID`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `genreID` (`genreID`),
  ADD KEY `typeID` (`typeID`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagID`);

--
-- Индексы таблицы `tagcomposition`
--
ALTER TABLE `tagcomposition`
  ADD PRIMARY KEY (`tagcompositionID`),
  ADD KEY `compositionID` (`compositionID`),
  ADD KEY `tagID` (`tagID`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`typeID`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Индексы таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`userroleID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `authorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `authorrequest`
--
ALTER TABLE `authorrequest`
  MODIFY `authorrequest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `commentcomposition`
--
ALTER TABLE `commentcomposition`
  MODIFY `commentcompositionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `commentordering`
--
ALTER TABLE `commentordering`
  MODIFY `commentorderingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `commentrequest`
--
ALTER TABLE `commentrequest`
  MODIFY `commentrequestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `composition`
--
ALTER TABLE `composition`
  MODIFY `compositionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `genreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ordering`
--
ALTER TABLE `ordering`
  MODIFY `orderingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `paymentresourse`
--
ALTER TABLE `paymentresourse`
  MODIFY `paymentresourceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `tagID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tagcomposition`
--
ALTER TABLE `tagcomposition`
  MODIFY `tagcompositionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `typeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `userrole`
--
ALTER TABLE `userrole`
  MODIFY `userroleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Ограничения внешнего ключа таблицы `authorrequest`
--
ALTER TABLE `authorrequest`
  ADD CONSTRAINT `authorrequest_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `authorrequest_ibfk_2` FOREIGN KEY (`requestID`) REFERENCES `request` (`requestID`);

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Ограничения внешнего ключа таблицы `commentcomposition`
--
ALTER TABLE `commentcomposition`
  ADD CONSTRAINT `commentcomposition_ibfk_1` FOREIGN KEY (`commentID`) REFERENCES `comment` (`commentID`),
  ADD CONSTRAINT `commentcomposition_ibfk_2` FOREIGN KEY (`compositionID`) REFERENCES `composition` (`compositionID`);

--
-- Ограничения внешнего ключа таблицы `commentordering`
--
ALTER TABLE `commentordering`
  ADD CONSTRAINT `commentordering_ibfk_1` FOREIGN KEY (`commentID`) REFERENCES `comment` (`commentID`),
  ADD CONSTRAINT `commentordering_ibfk_2` FOREIGN KEY (`orderingID`) REFERENCES `ordering` (`orderingID`);

--
-- Ограничения внешнего ключа таблицы `commentrequest`
--
ALTER TABLE `commentrequest`
  ADD CONSTRAINT `commentrequest_ibfk_1` FOREIGN KEY (`commentID`) REFERENCES `comment` (`commentID`),
  ADD CONSTRAINT `commentrequest_ibfk_2` FOREIGN KEY (`requestID`) REFERENCES `request` (`requestID`);

--
-- Ограничения внешнего ключа таблицы `composition`
--
ALTER TABLE `composition`
  ADD CONSTRAINT `composition_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `genreID` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`),
  ADD CONSTRAINT `typeID` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`);

--
-- Ограничения внешнего ключа таблицы `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Ограничения внешнего ключа таблицы `ordering`
--
ALTER TABLE `ordering`
  ADD CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`compositionID`) REFERENCES `composition` (`compositionID`),
  ADD CONSTRAINT `ordering_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `ordering_ibfk_3` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `ordering_ibfk_4` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`),
  ADD CONSTRAINT `ordering_ibfk_5` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`);

--
-- Ограничения внешнего ключа таблицы `paymentresourse`
--
ALTER TABLE `paymentresourse`
  ADD CONSTRAINT `paymentresourse_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`);

--
-- Ограничения внешнего ключа таблицы `tagcomposition`
--
ALTER TABLE `tagcomposition`
  ADD CONSTRAINT `tagcomposition_ibfk_1` FOREIGN KEY (`compositionID`) REFERENCES `composition` (`compositionID`),
  ADD CONSTRAINT `tagcomposition_ibfk_2` FOREIGN KEY (`tagID`) REFERENCES `tag` (`tagID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
