
#Практическое задание по теме “Транзакции, переменные, представления”
#В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
#Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 2;
DELETE FROM shop.users WHERE id = 2;
COMMIT;

#Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
CREATE VIEW view_products2 (name, catalog)
AS 
SELECT p.name, c.name 
FROM shop.products p
LEFT JOIN shop.catalogs c  ON
p.catalog_id = c.id ;

SELECT * FROM view_products2 vp 


#Практическое задание по теме “Хранимые процедуры и функции, триггеры"
#Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
#С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
#с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
CREATE FUNCTION second_format (seconds TIME)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
  IF(seconds > 6 and seconds <= 12) THEN
	RETURN 'Доброе утро';
  ELSEIF(seconds > 12 and seconds <= 18) THEN
	RETURN 'Добрый день';
ELSEIF(seconds > 18 and seconds <= 24) THEN
	RETURN 'Добрый вечер';
  ELSE
	RETURN 'Доброй ночи';
  END IF;
END

#В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
#Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
#Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
#Не очень понял как можно создать триггер для блокировки ввода Null значения...
