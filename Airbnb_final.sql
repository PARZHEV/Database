--  курсовая работа  по созданию базы данных пример сервис Airbnb

-- https://www.airbnb.ru/
-- Описание сервиса:
-- Сревис по бронированию жилья для путешествий. Сервис охватывает почти все страны и тысячи собственников из разных стран предлагают свои апартаменты.

-- Описание базы:
-- база хранит в себе информацию о путешествиниках, о собствеников жилья, о жилье, о условиях съема жилья, о запросах на жилье от путешесвиника к собственику, 
-- о текущих и прошедших бронях, о отзывах по жилью 
-- База должна осуществлять хранение всех взоимотношений между путшествиником и собствеником а так же информацию по всем вариантам жилья.

-- Список таблиц
-- Table #1 users - информация про каждому пользователю
-- Table #2 apartment - инфомрация по каждому жилью
-- Table #3 adreses - адреса жилья
-- Table #4 profiles - персональные данные каждого пользователя
-- Table #5 messages - сообщения между пользователями
-- Table #6 media - все медиа файлы, фото пользователей, фото жилья и топ
-- Table #7 media_types - тип медиа файлов
-- Table #8 requests - запросы на бронирования жилья
-- Table #9 reviews - отзывы по жилью
-- Table #10 apart_condition - условия проживания и оборудование находящиеся в жилье
-- Table #11 reservations - текущие бронирование и прошлые бронирования
-- Table #12 apart_owner - кому пренадлежит жилье

-- После проделаной работы и всех запросов понял на сколько много недочетов как в самой базе так и ее наполнености. ПОнял ято нужно все переделывать но не времени не сил уже
-- не нашел... Зато я понял на сколько крапотливый труд пос озданию базы. Ну и конечно создавать базу по готовому огромному сервису можно месяцами с учетом уровня текущиего владения SQL
-- В заключении скажу что данная работа заставила пройти оч ускорено по всему материалу и собратьв едино умения и найти собственные пробела.Самое главное нужна тонна практики без этого никак.

-- скрипты создания структуры БД (с первичными ключами, индексами, внешними ключами);


CREATE DATABASE airbnb;

USE airbnb;

-- Table #1
SELECT * FROM users;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", -- искусственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone CHAR(11) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";

 INSERT INTO `users` 
 	  (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) 
 	VALUES 
	  (1, 'Kasey', 'Dibbert', 'okuneva.adelle@example.org', '279.608.829', '1990-04-21 06:25:49', '1979-09-20 07:10:02'),
	  (3, 'Fabiola', 'McKenzie', 'collier.toney@example.net', '533-809-620', '2014-03-22 21:30:36', '2003-09-28 04:27:48'),
	  (2, 'Stephon', 'Bauch', 'sporer.abel@example.net', '282.348.335', '2006-02-01 03:35:44', '1996-01-11 19:40:37'),
	  (4, 'Lloyd', 'Kassulke', 'bbergnaum@example.com', '710.364.642', '1994-10-21 03:10:22', '2017-04-05 16:11:00'),
	  (5, 'Adela', 'Stoltenberg', 'wmoen@example.com', '(654)204-88', '1982-02-17 17:10:50', '1995-11-20 06:33:27'),
	  (6, 'Zakary', 'Corwin', 'krystel.walker@example.net', '1-722-824-6', '1991-04-16 20:26:47', '1980-11-10 08:18:25'),
	  (7, 'Deondre', 'Ward', 'zwolff@example.org', '00349563509', '1978-07-31 02:31:52', '1974-11-02 00:28:50'),
	  (8, 'Jaylon', 'Jaskolski', 'hermann.o\'conner@example.com', '792-834-482', '2010-11-22 06:33:58', '1988-04-18 18:42:47'),
	  (9, 'Jordyn', 'Olson', 'tianna.mclaughlin@example.net', '09054791702', '1975-12-13 04:09:07', '2021-02-02 02:59:39'),
	  (10, 'Bradly', 'Prohaska', 'german37@example.net', '369-771-009', '1970-03-04 17:09:12', '1987-06-18 02:28:32');




 -- Table #2

CREATE TABLE `apartment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `link_googlemap` VARCHAR(130) COMMENT 'ссылка на нахождения жилья',
  `id_owner` INT UNSIGNED NOT NULL COMMENT "владелец апартаментов",
  `photo_id` INT unsigned DEFAULT NULL COMMENT 'Ссылка на основную фотографии апартаментов',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
 ) COMMENT 'апартаменты';

ALTER TABLE apartment ADD CONSTRAINT apartment_photo_id FOREIGN KEY (photo_id) REFERENCES media(id);
ALTER TABLE apartment ADD CONSTRAINT apartment_id_owner FOREIGN KEY (id_owner) REFERENCES users(id);

INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (1, 'http://hellerthiel.com/', 1, 1, '1981-01-07 22:28:37', '2001-10-08 22:27:37');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (2, 'http://murray.com/', 2, 2, '1972-02-28 02:52:53', '2006-11-11 11:07:17');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (3, 'http://lynch.com/', 3, 3, '1997-02-02 13:37:40', '1979-09-09 08:52:52');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (4, 'http://leuschke.net/', 4, 4, '1996-04-15 20:38:28', '1986-03-05 17:38:49');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (5, 'http://www.braun.com/', 5, 5, '2018-08-27 19:53:17', '1994-06-11 02:01:15');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (6, 'http://www.franeckimccullough.org/', 6, 6, '1985-01-24 00:58:02', '1977-05-13 00:01:37');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (7, 'http://www.farrell.com/', 7, 7, '2016-01-12 02:45:23', '2018-06-03 21:27:36');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (8, 'http://www.mcdermott.com/', 8, 8, '1998-12-27 14:28:24', '2013-12-01 14:47:02');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (9, 'http://gottlieb.com/', 9, 9, '1981-12-21 08:02:42', '2019-05-12 15:51:06');
INSERT INTO `apartment` (`id`, `link_googlemap`, `id_owner`, `photo_id`, `created_at`, `updated_at`) VALUES (10, 'http://strosin.biz/', 10, 10, '2019-05-21 06:47:19', '2002-11-28 11:15:51');


-- Table #3

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE `adresses` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  apartment_id INT UNSIGNED NOT NULL COMMENT "Ссылка на апартаменты",
  country VARCHAR(130) COMMENT "Страна",
  city VARCHAR(130) COMMENT "Город",
  street VARCHAR(130) COMMENT "улица",
  home VARCHAR(130) COMMENT "улица",
  apartment_number VARCHAR(130) COMMENT "улица",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Адреса апартаментов"; 

ALTER TABLE adresses ADD CONSTRAINT adresses_apartment_id FOREIGN KEY (apartment_id) REFERENCES apartment(id);

SELECT * FROM adresses ;

INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (1, 1, 'Eritrea', 'South Kristianview', '102 Botsford Branch Apt. 130', 'Suite 077', '68', '1994-04-19 15:37:56', '1986-02-18 07:39:57');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (3, 3, 'Botswana', 'Peteside', '2422 Cary Inlet Apt. 097', 'Apt. 193', '', '1996-03-11 05:21:19', '1998-08-22 10:16:31');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (2, 2, 'Korea', 'Kulasview', '71361 Terry Mission Apt. 897', 'Apt. 792', '', '1987-01-08 23:54:24', '1986-05-22 22:16:02');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (4, 4, 'Philippines', 'West Sonyamouth', '2698 Marianne Expressway Apt. 351', 'Apt. 093', '223', '2008-10-21 10:38:43', '1985-11-01 10:36:29');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (5, 5, 'Ghana', 'Lake Diana', '9086 Brakus Hills Apt. 954', 'Apt. 988', '795', '1977-10-25 00:31:58', '2017-10-19 21:54:41');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (6, 6, 'Serbia', 'Lake Dallas', '747 Freeda Locks', 'Apt. 336', '3', '1973-01-22 09:01:36', '2017-01-27 07:29:54');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (7, 7, 'Algeria', 'Juwanside', '309 Trace Knoll Apt. 445', 'Suite 869', '5080', '2005-01-13 22:30:34', '2015-07-01 00:18:40');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (8, 8, 'Mongolia', 'Schaeferstad', '7293 Emmerich Route Suite 951', 'Suite 613', '1', '1987-08-25 13:49:49', '1987-04-25 21:04:47');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (9, 9, 'South Africa', 'West Anthony', '425 Terrence Hollow Suite 177', 'Suite 787', '78', '2011-12-27 18:01:35', '2019-01-11 12:43:29');
INSERT INTO `adresses` (`id`, `apartment_id`, `country`, `city`, `street`, `home`, `apartment_number`, `created_at`, `updated_at`) VALUES (10, 10, 'Mongolia', 'Grimeshaven', '33758 Casper Row Apt. 341', 'Suite 303', '5052974', '2016-10-22 22:54:25', '1973-06-19 08:03:56');

-- Table #4

CREATE TABLE profiles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",  
  gerder ENUM('M', 'F', '?') COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  photo_id INT UNSIGNED COMMENT "Ссылка на основную фотографию пользователя",
 `status` ENUM('online', 'offline', 'disabled') COMMENT "Текущий статус",
  city VARCHAR(130) COMMENT "Город проживания",
  country VARCHAR(130) COMMENT "Страна проживания",
  status_user ENUM('owner', 'turist') COMMENT "Определение кто юзер ищет или сдает апартаменты",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили";

ALTER TABLE profiles ADD CONSTRAINT profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE profiles ADD CONSTRAINT profiles_photo_id FOREIGN KEY (photo_id) REFERENCES media(id);

INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (1, 1, '?', '2016-09-30', 1, 'disabled', 'Goldnerhaven', '535281', 'owner', '1971-04-18 23:12:31', '2013-01-26 00:58:08');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (2, 2, 'M', '1978-03-20', 2, 'disabled', 'New Camronbury', '1651', 'turist', '1984-03-27 01:48:02', '1988-03-13 06:26:30');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (3, 3, 'F', '2011-10-08', 3, 'disabled', 'South Arnoldomouth', '629895', 'turist', '2012-08-22 19:46:38', '1979-05-21 22:26:53');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (4, 4, 'F', '1972-11-28', 4, 'online', 'Marjorychester', '4657194', 'turist', '1975-07-10 00:21:26', '2007-07-21 08:55:02');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (5, 5, '?', '2013-06-17', 5, 'online', 'North Izaiah', '35', 'owner', '1991-04-10 03:53:27', '2008-07-21 00:33:02');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (6, 6, 'M', '2002-08-30', 6, 'disabled', 'Lake Lennie', '30280870', 'turist', '1994-05-29 01:51:11', '2017-09-23 06:14:35');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (7, 7, 'M', '1983-01-28', 7, 'offline', 'East Ceasarstad', '362257', 'turist', '2016-03-10 17:35:52', '1998-04-30 11:57:44');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (8, 8, 'F', '1986-11-19', 8, 'offline', 'West Alexandra', '702759489', 'owner', '1975-07-31 02:42:28', '2017-12-02 19:29:21');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (9, 9, 'M', '1996-10-20', 9, 'online', 'Chandlerfort', '89', 'turist', '1978-10-31 11:41:38', '2007-07-01 14:00:58');
INSERT INTO `profiles` (`id`, `user_id`, `gerder`, `birthday`, `photo_id`, `status`, `city`, `country`, `status_user`, `created_at`, `updated_at`) VALUES (10, 10, 'F', '1982-06-25', 10, 'online', 'Ondrickaberg', '988093', 'owner', '1988-07-08 09:35:40', '1996-01-22 05:02:16');



-- Table #5

CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отправителя сообщения",
  to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_important BOOLEAN COMMENT "Признак важности",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Сообщения";

ALTER TABLE messages ADD CONSTRAINT messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users(id);
ALTER TABLE messages ADD CONSTRAINT messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users(id);

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (1, 1, 1, 'Voluptas sit consequuntur repellat in harum aut dignissimos nihil. Atque distinctio maiores voluptas alias corporis. Quibusdam omnis quae corporis et repellendus in dolorum. Aut qui et doloribus enim qui culpa.', 0, 0, '2014-03-21 01:10:31', '1991-05-25 12:50:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (2, 2, 2, 'Sapiente qui nostrum fugit est voluptatibus. Nobis qui laboriosam reprehenderit.', 0, 0, '1979-05-08 04:42:39', '2005-01-20 23:39:55');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (3, 3, 3, 'Sit culpa sed est sit deserunt. Magnam blanditiis repellat amet. At iusto ut architecto sed eos quaerat repellendus.', 0, 0, '1973-02-25 03:00:38', '2010-07-19 10:44:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (4, 4, 4, 'Sapiente iusto id qui eum aperiam. Quibusdam modi animi rem fugiat tempora. Et aliquid veniam maxime aliquam voluptate quam modi. Laborum aspernatur totam architecto soluta in beatae ut. Sunt quis placeat excepturi in consequuntur et voluptates.', 1, 1, '1972-12-19 13:30:59', '1975-11-29 06:35:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (5, 5, 5, 'Quam quis aliquid rem. Aliquam possimus omnis molestiae rerum adipisci. Nihil quibusdam quia aut omnis iste et maiores.', 0, 0, '1997-05-09 21:44:18', '2004-08-12 02:57:45');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (6, 6, 6, 'Eius quidem dignissimos ipsam dolorum ea optio. Quas est eveniet sed ea beatae omnis. Reiciendis sed nisi totam. Dolorum voluptatem fugiat quia a velit repudiandae consequatur.', 1, 0, '1974-09-30 11:07:34', '2004-01-01 09:18:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (7, 7, 7, 'Nihil beatae et deserunt. Repellat sunt veritatis quis omnis laborum quas. Nemo recusandae non et aut est rerum est. Ad sit est aperiam ullam quam placeat aspernatur.', 0, 0, '1996-04-14 07:30:45', '1972-10-04 09:31:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (8, 8, 8, 'Eum et ad eveniet pariatur eum ut aperiam inventore. Maiores earum quis non est. Consequatur sint hic cupiditate. Reiciendis voluptatem consequatur rem magni doloribus nihil. Repudiandae rerum tempora exercitationem repudiandae ad.', 0, 1, '1984-08-07 13:35:51', '1997-10-08 19:52:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (9, 9, 9, 'Magnam nesciunt et labore quis quo voluptatibus. Enim ipsam quis consequatur explicabo odit. Et molestias asperiores quaerat incidunt et velit tempora.', 1, 1, '1995-10-02 10:02:28', '1992-03-12 05:13:39');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_important`, `is_delivered`, `created_at`, `updated_at`) VALUES (10, 10, 10, 'Illo ex facilis possimus suscipit nemo cum quaerat dolorem. Error corporis et voluptas aut est est animi. Ut eos beatae inventore nobis aspernatur laborum sint. Illum omnis totam non sit et.', 1, 1, '1992-11-24 23:36:22', '1985-01-30 19:30:58');


-- Table #6

CREATE TABLE media (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
    filename VARCHAR(255) NOT NULL UNIQUE COMMENT "Путь к файлу",
    media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип файла",
    size INT NOT NULL COMMENT "Размер файла",
    created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиафайлы";

INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (1, 'molestiae', 1, 62783, '1980-05-22 03:47:18', '2000-02-28 00:20:33');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (2, 'nobis', 2, 0, '2016-08-22 16:17:55', '2002-06-08 23:26:09');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (3, 'veritatis', 3, 74, '2002-11-16 03:13:21', '1996-09-05 00:51:13');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (4, 'illum', 4, 8, '2015-06-01 03:54:55', '2013-03-06 03:43:41');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (5, 'itaque', 5, 9, '1972-09-28 10:01:38', '1974-06-16 22:34:24');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (6, 'at', 1, 390166587, '1974-10-05 21:20:54', '1979-05-17 15:20:29');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (7, 'consequatur', 2, 6969284, '2015-04-09 07:42:14', '1970-07-11 08:02:07');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (8, 'deserunt', 3, 69170947, '2015-10-08 13:53:11', '2017-04-09 05:25:48');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (9, 'rem', 4, 2916, '2019-02-23 10:02:27', '1974-10-10 18:05:07');
INSERT INTO `media` (`id`, `filename`, `media_type_id`, `size`, `created_at`, `updated_at`) VALUES (10, 'quod', 5, 47853957, '1983-12-04 09:37:14', '2012-09-05 12:55:47');

-- Table #7

CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы медиафайлов";

ALTER TABLE media ADD CONSTRAINT media_media_type_id FOREIGN KEY (media_type_id) REFERENCES media_types(id);

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, '/43b088eaeec01659c2be9b73e042e246.jpg', '2004-08-06 01:02:15', '2002-01-31 15:34:50');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, '/82b1f232e5d66533b9d9542c21d93111.jpg', '2014-12-07 23:27:54', '2009-08-23 01:35:53');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, '/78f3ff124a3372ec27624ef9afdf79ab.jpg', '2011-08-28 02:14:14', '1994-07-18 16:43:31');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, '/ddac05225469fd11f4fd1ab897d0ef73.jpg', '1995-07-14 12:39:04', '1998-06-22 05:26:40');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, '/617ae5ba3a21d71a5206fd40d63d0ec3.jpg', '2004-06-01 01:58:10', '2007-12-07 22:21:56');

-- Table #8

DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `apart_id` INT UNSIGNED NOT NULL COMMENT "Идентификатор апартаментов",
  `from_user` INT UNSIGNED NOT NULL COMMENT "кто прислал запрос",
  `status` ENUM('aprooved', 'not aprooved', 'no answer', 'canceled') COMMENT "статус запроса",
  `date_of_start_rental` datetime NOT NULL COMMENT 'Дата наяала аренды',
  `date_of_end_rental` datetime NOT NULL COMMENT 'дата конца аренды',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'Запрос на букинг апартаментов';
 
ALTER TABLE requests ADD CONSTRAINT requests_apart_id FOREIGN KEY (apart_id) REFERENCES apartment(id);
ALTER TABLE requests ADD CONSTRAINT requests_from_user FOREIGN KEY (from_user) REFERENCES users(id);

INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (1, 1, 1, 'aprooved', '1981-04-29 13:00:16', '2012-01-08 06:34:20', '1984-04-11 12:45:03', '2002-09-15 11:56:45');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (2, 2, 2, 'canceled', '1996-05-14 17:49:09', '2021-03-26 13:26:20', '2012-08-31 20:56:12', '2009-06-08 22:41:33');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (3, 3, 3, 'aprooved', '2008-05-22 04:07:47', '2009-06-23 23:48:15', '2011-05-25 22:46:03', '1975-02-04 00:35:14');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (4, 4, 4, 'canceled', '2003-08-31 19:15:15', '1979-06-10 06:38:26', '2001-08-26 00:41:22', '1986-08-23 23:05:23');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (5, 5, 5, 'aprooved', '1992-04-02 21:14:46', '1999-06-08 06:40:36', '1979-04-29 19:43:08', '1987-05-08 21:07:28');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (6, 6, 6, 'no answer', '2001-11-19 14:04:46', '1989-01-24 16:43:50', '2007-11-24 15:19:36', '2007-04-07 04:26:30');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (7, 7, 7, 'not aprooved', '1970-08-10 00:38:01', '1989-09-16 21:58:36', '1987-03-26 16:55:47', '2015-04-30 13:54:59');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (8, 8, 8, 'aprooved', '2016-03-03 09:01:01', '1996-06-01 13:26:13', '1987-02-17 06:25:09', '1970-02-07 06:50:03');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (9, 9, 9, 'canceled', '2009-08-08 08:51:00', '1971-06-10 19:21:24', '1982-10-07 07:57:53', '1984-11-05 10:15:38');
INSERT INTO `requests` (`id`, `apart_id`, `from_user`, `status`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (10, 10, 10, 'no answer', '1976-03-23 23:20:59', '2001-05-14 02:03:04', '1990-06-18 05:35:29', '2011-11-02 08:07:43');


-- Table #9

CREATE TABLE `reviews` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `from_user` INT UNSIGNED NOT NULL COMMENT "Идентификатор юзера от кого пришел отзыв",
  `to_apartment` INT UNSIGNED NOT NULL COMMENT "Идентификатор апартаметов на который сделан отзыв",
  `review` VARCHAR(1000) COMMENT "Сам отзыв по аппартаментам",
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'отзыв на апартаменты';
 
 ALTER TABLE reviews ADD CONSTRAINT reviews_from_user FOREIGN KEY (from_user) REFERENCES users(id);
 ALTER TABLE reviews ADD CONSTRAINT reviews_to_apartment FOREIGN KEY (to_apartment) REFERENCES apartment(id);

INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, '2020-06-17 06:51:38', '2021-07-11 13:51:58');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (2, 2, 2, NULL, '2007-11-01 08:43:53', '2015-03-13 05:22:37');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (3, 3, 3, NULL, '1984-09-07 22:45:10', '1990-06-10 16:09:19');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (4, 4, 4, NULL, '2003-07-01 19:38:34', '1984-06-07 05:13:54');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (5, 5, 5, NULL, '2017-12-06 05:02:26', '1971-03-22 10:31:10');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (6, 6, 6, NULL, '1975-02-08 05:05:40', '1990-05-26 14:16:15');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (7, 7, 7, NULL, '1988-10-15 18:39:00', '2002-09-05 23:29:36');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (8, 8, 8, NULL, '2010-11-21 12:37:57', '2019-08-17 01:04:18');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (9, 9, 9, NULL, '1978-04-12 10:36:13', '1992-11-05 15:43:15');
INSERT INTO `reviews` (`id`, `from_user`, `to_apartment`, `review`, `created_at`, `updated_at`) VALUES (10, 10, 10, NULL, '1982-06-21 19:48:51', '1997-06-27 03:55:27');


-- Table #10

SELECT * FROM apart_condition ;

DROP TABLE IF EXISTS `apart_condition`;
CREATE TABLE `apart_condition` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `id_apartment` INT UNSIGNED NOT NULL COMMENT "Идентификатор апартаметов ",
  `check-in` ENUM('from 2 p.m.', 'from 4 p.m.', 'from 12 a.m.') COMMENT "Условие Прибывание",
  `check-out` ENUM('till 2 p.m.', 'till 10 a.m.', 'from 12 a.m.') COMMENT "Условие Отбытия",
  `Price_per_day` FLOAT COMMENT "Условие Отбытия",
  `cancellation` ENUM('yes', 'no')  COMMENT "Условие отмены",
  `TV` ENUM('yes', 'no') COMMENT "Телевизор",
  `Wifi` ENUM('yes', 'no') COMMENT "Вайфай",
  `Air_conditioning` ENUM('yes', 'no') COMMENT "Кондиционер",
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'Условия какие есть в апартаментах';
 
  ALTER TABLE apart_condition ADD CONSTRAINT apart_condition_id_apartment FOREIGN KEY (id_apartment) REFERENCES apartment(id);

 SELECT * FROM apart_condition ac ;
 
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (10, 10, 'from 2 p.m.', 'till 10 a.m.', '824', 'no', 'no', 'no', 'no', '2016-06-20 09:13:45', '2018-11-14 18:33:08');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (1, 1, 'from 2 p.m.', 'till 10 a.m.', '545', 'no', 'no', 'no', 'yes', '1978-12-15 17:11:20', '1976-03-26 03:18:09');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (5, 5, 'from 2 p.m.', 'till 10 a.m.', '448', 'yes', 'no', 'no', 'no', '2003-12-21 21:08:52', '1989-11-27 18:24:55');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (4, 4, 'from 2 p.m.', 'till 10 a.m.', '922', 'no', 'yes', 'no', 'yes', '1986-11-09 18:20:40', '1973-01-24 10:12:19');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (2, 2, 'from 2 p.m.', 'till 10 a.m.', '125', 'no', 'no', 'no', 'no', '1996-12-12 11:05:19', '2013-10-12 18:21:20');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (3, 3, 'from 2 p.m.', 'till 10 a.m.', '546', 'yes', 'yes', 'yes', 'yes', '1996-09-20 11:16:16', '1987-07-05 21:53:57');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (6, 6, 'from 2 p.m.', 'till 10 a.m.', '136', 'yes', 'no', 'yes', 'no', '1970-08-01 09:27:34', '2009-03-09 05:44:14');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (9, 9, 'from 2 p.m.', 'till 10 a.m.', '693', 'yes', 'no', 'yes', 'no', '2009-09-17 22:13:52', '2013-02-01 16:27:36');
INSERT INTO `apart_condition` (`id`, `id_apartment`, `check-in`, `check-out`, `Price_per_day`, `cancellation`, `TV`, `Wifi`, `Air_conditioning`, `created_at`, `updated_at`) VALUES (8, 8, 'from 2 p.m.', 'till 10 a.m.', '812', 'no', 'no', 'no', 'no', '1991-02-19 03:21:19', '1993-08-02 17:33:20');


-- Table #11
 
CREATE TABLE `reservation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор резерва",
  `request_id` INT UNSIGNED NOT NULL COMMENT "Идентификатор запроса",
  `user_booking_id` INT UNSIGNED NOT NULL COMMENT "кто забронировал",
  `apartment_id` INT UNSIGNED NOT NULL COMMENT "какое жилье забронировали",
  `review_id` INT UNSIGNED NOT NULL COMMENT "отзыв бронирования",
  `date_of_start_rental` datetime NOT NULL COMMENT 'Дата наяала аренды',
  `date_of_end_rental` datetime NOT NULL COMMENT 'дата конца аренды',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'резервы на жилье';
  
 ALTER TABLE reservation ADD CONSTRAINT reservation_request_id FOREIGN KEY (request_id) REFERENCES requests(id);
 ALTER TABLE reservation ADD CONSTRAINT reservation_user_booking_id FOREIGN KEY (user_booking_id) REFERENCES users(id);
 ALTER TABLE reservation ADD CONSTRAINT reservation_apartment_id FOREIGN KEY (apartment_id) REFERENCES apartment(id);
 ALTER TABLE reservation ADD CONSTRAINT reservation_review_id FOREIGN KEY (review_id) REFERENCES reviews(id);


INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, 1, '2001-04-11 10:37:54', '2007-06-19 23:32:00', '1977-11-15 17:10:48', '2019-09-23 22:41:59');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (2, 2, 1, 2, 2, '2009-12-17 05:16:20', '2021-04-07 00:02:10', '1997-09-01 08:28:38', '2008-07-08 01:24:45');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (3, 3, 1, 3, 3, '1986-09-24 17:45:39', '1983-09-01 00:06:54', '1986-03-04 07:22:26', '1975-01-13 01:31:31');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (4, 4, 2, 4, 4, '2002-07-16 20:57:14', '1978-10-31 18:41:31', '1989-06-10 00:10:29', '1970-05-06 22:36:28');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (5, 5, 2, 5, 5, '1983-01-21 22:20:15', '1997-12-30 15:12:19', '2007-09-30 09:23:19', '2011-02-28 22:35:59');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (6, 6, 3, 6, 6, '1970-10-28 06:00:55', '1979-06-27 19:09:52', '1997-05-31 12:38:18', '1988-09-17 03:56:23');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (7, 7, 3, 7, 7, '1971-02-24 14:52:53', '1992-07-28 21:56:35', '1993-11-20 12:03:46', '2020-07-15 21:00:40');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (8, 8, 3, 8, 8, '1986-12-29 20:05:22', '1986-01-03 23:52:09', '2005-09-02 09:52:35', '2004-03-15 18:32:37');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (9, 9, 9, 9, 9, '1979-05-11 19:49:11', '2014-03-10 20:48:36', '2013-07-07 05:05:23', '1975-09-26 16:17:55');
INSERT INTO `reservation` (`id`, `request_id`, `user_booking_id`, `apartment_id`, `review_id`, `date_of_start_rental`, `date_of_end_rental`, `created_at`, `updated_at`) VALUES (10, 10, 10, 10, 10, '1980-02-23 02:13:41', '2013-09-01 21:20:54', '2008-03-24 02:29:34', '1978-03-08 14:25:46');

-- Table #12

CREATE TABLE `apert_owners` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор резерва",
  `owner` INT UNSIGNED NOT NULL COMMENT "Идентификатор собственика",
  `apartment_id` INT UNSIGNED NOT NULL COMMENT "какое жилье",
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'какое жилье кому пренадлежит';

ALTER TABLE apert_owners ADD CONSTRAINT apert_owners_owner FOREIGN KEY (owner) REFERENCES users(id);
ALTER TABLE apert_owners ADD CONSTRAINT apert_owners_apartment_id FOREIGN KEY (apartment_id) REFERENCES apartment(id);

DELETE FROM apert_owners ;

  INSERT INTO `apert_owners` 
 	  (`owner`, `apartment_id`) 
 	VALUES 
	  (1, 1),
	  (1, 2),
	  (5, 3),
	  (5, 4),
	  (8, 5),
	  (10, 6),
	  (5, 7),
	  (5, 8),
	  (1, 9),
	  (1, 10);

	  
SELECT * FROM apert_owners ;

-- скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные таблицы);

USE	airbnb_281021;



-- Запросы:
-- 
-- 1.  Вывести ссылки на гугл мап ТОП - 5 посещаемых апартаментов

SELECT 
    a.link_googlemap ,
	COUNT(r.id) AS apart_count
FROM
    reservation r
        LEFT JOIN
    apartment a ON r.apartment_id = a.id
GROUP BY
	r.apartment_id
ORDER BY
	apart_count;
       




-- 2. Больше всех отзывовов на жилье (Вложеный запрос)

SELECT
	first_name AS Name_of_flooder
FROM
	users u
WHERE
	id = (
	SELECT
		from_user
	FROM
		reviews r
	GROUP BY
		id
	ORDER BY
		COUNT(id)
	DESC limit 1);


-- 3. Кто больше всех из собствеников заработало денег

SELECT 
	u.first_name, SUM(ac.Price_per_day) as count_reserv
FROM 
	reservation r 
		LEFT JOIN
	apart_condition ac ON ac.id_apartment = r.apartment_id
		LEFT JOIN 
	apert_owners ao ON ao.apartment_id = r.apartment_id 
		LEFT JOIN 
	users u ON u.id = ao.owner 
GROUP BY 
	u.first_name 
ORDER BY count_reserv DESC limit 1;

	

-- Представления (минимум 2);

-- Список жилья (ссылки на гуглмеп) и собствеников
CREATE VIEW view_owners_apartmens (appartment_link, name)
AS 
SELECT a.link_googlemap , u.first_name 
FROM apert_owners ao 
LEFT JOIN apartment a  ON
ao.apartment_id = a.id
LEFT JOIN users u  ON
ao.owner = u.id ;

SELECT * FROM view_owners_apartmens 

-- Список Стран и жилья (ссылки на гуглмеп)
CREATE VIEW view_countries_apartmens (Country, appartment_link)
AS
SELECT a.country , a2.link_googlemap 
FROM adresses a 
LEFT JOIN apartment a2 ON
a2.id = a.apartment_id ;

SELECT * FROM view_countries_apartmens 


-- Триггеры
-- 
-- При записи новго отзыва в таблице reviews_logs отражается дата и имя кто написал отзыв и на какие апартаменты

CREATE TABLE reviews_logs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", -- искусственный ключ
  reviewer VARCHAR(100) NOT NULL COMMENT "название таблиц",
  date_review DATE NOT NULL COMMENT "Инфа из колонки name",
  apartments VARCHAR(100) NOT NULL COMMENT "Инфа из колонки name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "Пользователи" ENGINE=Archive;

CREATE TRIGGER review_logs AFTER INSERT ON `reviews`
FOR EACH ROW
BEGIN
INSERT INTO `reviews_logs` (`reviewer`, `date_review`, `apartments`) VALUES ( NEW.`from_user`, NEW.`created_at`, NEW.`to_apartment`);
END


 