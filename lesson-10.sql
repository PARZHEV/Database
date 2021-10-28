-- Прислать предварительную версию курсового проекта:
-- 
-- 1. DDL-команды;

-- https://www.airbnb.ru/
-- Описание сервиса:
-- Сревис по бронированию жилья для туризма. Сервис охватывает почти все страны и тысячи собственников с разных стран предлагают свои апартаменты. 

-- Описание базы:
-- Существует собственик арендодатель, есть арендатор есть, система оплаты, есть чат, есть профиль недвижемости который сдается, 
-- , есть карта интерактивная карта для поимка, есть поисковая система через которую задаешь дату место и кучу других параметров,

Список таблиц
users
apartments
adreses
profiles с статусом кто турист или собственик
messages
mediaяё
media_types
requests
reviews
apart_condition


CREATE DATABASE airbnb_281021;

USE airbnb_281021;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", -- искусственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone CHAR(11) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";

 

CREATE TABLE `apartment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `coordinates` point NOT NULL COMMENT 'Имя пользователя',
   id_owner INT UNSIGNED NOT NULL COMMENT "владелец апартаментов",
  `photo_id` int unsigned DEFAULT NULL COMMENT 'Ссылка на основную фотографию апартаментов',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
 )COMMENT 'апартаменты';

ALTER TABLE apartment ADD CONSTRAINT apartment_photo_id FOREIGN KEY (photo_id) REFERENCES media(id);
ALTER TABLE apartment MODIFY coordinates VARCHAR(130);

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE `adresses` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  apartment_id INT UNSIGNED NOT NULL COMMENT "Ссылка на апартаменты",
  country VARCHAR(130) COMMENT "Страна",
  city VARCHAR(130) COMMENT "Город",
  street VARCHAR(130) COMMENT "улица",
  home VARCHAR(130) COMMENT "улица",
  appartment_number VARCHAR(130) COMMENT "улица",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Адреса апартаментов"; 

ALTER TABLE adresses ADD CONSTRAINT adresses_apartment_id FOREIGN KEY (apartment_id) REFERENCES apartment(id);


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


CREATE TABLE media (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
    filename VARCHAR(255) NOT NULL UNIQUE COMMENT "Путь к файлу",
    media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип файла",
    size INT NOT NULL COMMENT "Размер файла",
    created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиафайлы";

CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы медиафайлов";

ALTER TABLE media ADD CONSTRAINT media_media_type_id FOREIGN KEY (media_type_id) REFERENCES media_types(id);

DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `apart_id` INT UNSIGNED NOT NULL COMMENT "Идентификатор апартаментов",
  `from_user` INT UNSIGNED NOT NULL COMMENT "кто прислал хапрос",
  `date_of_start_rental` datetime NOT NULL COMMENT 'Дата наяала аренды',
  `date_of_end_rental` datetime NOT NULL COMMENT 'дата конца аренды',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'Запрос на букинг апартаментов';
 
ALTER TABLE requests ADD CONSTRAINT requests_apart_id FOREIGN KEY (apart_id) REFERENCES apartment(id);
ALTER TABLE requests ADD CONSTRAINT requests_from_user FOREIGN KEY (from_user) REFERENCES users(id);

CREATE TABLE `reviews` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `from_user` INT UNSIGNED NOT NULL COMMENT "Идентификатор юзера от кого пришел отзыв",
  `to_apartment` INT UNSIGNED NOT NULL COMMENT "Идентификатор апартаметов на которефе сделан отзыв",
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'отзыв на апартаменты';
 
 ALTER TABLE reviews ADD CONSTRAINT reviews_from_user FOREIGN KEY (from_user) REFERENCES users(id);
 ALTER TABLE reviews ADD CONSTRAINT reviews_to_apartment FOREIGN KEY (to_apartment) REFERENCES apartment(id);



CREATE TABLE `trips` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `id_user` INT UNSIGNED NOT NULL COMMENT "Идентификатор юзера",
  `id_apartment` INT UNSIGNED NOT NULL COMMENT "Идентификатор апартаметов ",
  `id_request` INT UNSIGNED NOT NULL COMMENT "Идентификатор  запроса на трип",
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'История всех трипов';
 
 ALTER TABLE trips ADD CONSTRAINT trips_id_user FOREIGN KEY (id_user) REFERENCES users(id);
 ALTER TABLE trips ADD CONSTRAINT trips_id_apartment FOREIGN KEY (id_apartment) REFERENCES apartment(id);
 ALTER TABLE trips ADD CONSTRAINT trips_id_request FOREIGN KEY (id_request) REFERENCES requests(id);

DROP TABLE IF EXISTS `apart_condition`;
CREATE TABLE `apart_condition` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  `id_apartment` INT UNSIGNED NOT NULL COMMENT "Идентификатор апартаметов ",
  `check-in` VARCHAR(130) COMMENT "Условие Прибывание",
  `check-out` VARCHAR(130) COMMENT "Условие Отбытия",
  `cancellation` VARCHAR(130) COMMENT "Условие отмены",
  `TV` VARCHAR(130) COMMENT "Телевизор",
  `Wifi` VARCHAR(130) COMMENT "Вайфай",
  `Air_conditioning` VARCHAR(130) COMMENT "Кондиционер",
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки'
  )COMMENT 'Условия какие есть в апартаментах';

  ALTER TABLE apart_condition ADD CONSTRAINT apart_condition_id_apartment FOREIGN KEY (id_apartment) REFERENCES apartment(id);

-- 2. Дамп БД (наполнение таблиц данными), не больше 10 строк в каждой таблице (можно пользоваться генераторами данных).

