-- Практическое задание по теме “Оптимизация запросов”
-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
-- идентификатор первичного ключа и содержимое поля name.
-- (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.


CREATE TABLE logs (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", -- искусственный ключ
  table_name VARCHAR(100) NOT NULL COMMENT "название таблиц",
  name_from_table VARCHAR(100) NOT NULL COMMENT "Инфа из колонки name",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки"
) COMMENT "Пользователи" ENGINE=Archive;



CREATE TRIGGER users_logs AFTER INSERT ON `users`
FOR EACH ROW
BEGIN
INSERT INTO `logs` (`table_name`, `name_from_table`) VALUES ('users', NEW.`name`);
END

CREATE TRIGGER catalogs_logs AFTER INSERT ON `catalogs`
FOR EACH ROW
BEGIN
INSERT INTO `logs` (`table_name`, `name_from_table`) VALUES ('catalog', NEW.`name`);
END

CREATE TRIGGER products_logs AFTER INSERT ON `products`
FOR EACH ROW
BEGIN
INSERT INTO `logs` (`table_name`, `name_from_table`) VALUES ('products', NEW.`name`);
END

