# Домашнее задание к занятию «SQL. Часть 1» - Хрипун Алексей

---

## Задание 1
Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.

### Решение 1
```
SELECT DISTINCT district 
FROM address WHERE district RLIKE '^K[a-z-]*e$';
```

## Задание 2
Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года включительно и стоимость которых превышает 10.00.

### Решение 2
```
SELECT amount, payment_date 
FROM payment
WHERE payment_date BETWEEN CAST('2005-06-15' AS DATE)  AND CAST('2005-06-18' AS DATE) AND amount > 10.00;
```

## Задание 3
Получите последние пять аренд фильмов.

### Решение 3
```
SELECT *
FROM rental
ORDER BY rental_date DESC LIMIT 5;
```

## Задание 4
Одним запросом получите активных покупателей, имена которых Kelly или Willie.

Сформируйте вывод в результат таким образом:

*все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
*замените буквы 'll' в именах на 'pp'.

### Решение 4
```
SELECT REPLACE(LOWER(first_name), 'll', 'pp' ), last_name 
FROM customer
WHERE first_name = 'Kelly' OR first_name = 'Willie';
```

## Задание 5*
Выведите Email каждого покупателя, разделив значение Email на две отдельных колонки: в первой колонке должно быть значение, указанное до @, во второй — значение, указанное после @.

### Решение 5
```
SELECT c.first_name , c.last_name , SUBSTRING_INDEX(email, '@', 1) AS mail_name, SUBSTRING_INDEX(c.email , '@', -1) AS domain_name
FROM customer c ;
```

