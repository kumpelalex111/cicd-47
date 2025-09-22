# Домашнее задание к занятию «SQL. Часть 2» - Хрипун Алексей

---

## Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

* фамилия и имя сотрудника из этого магазина;
* город нахождения магазина;
* количество пользователей, закреплённых в этом магазине.

### Решение 1
```
SELECT s.first_name,  s.last_name, ci.city, number_customers 
FROM staff s RIGHT JOIN ( 
	SELECT store_id, COUNT(*) AS number_customers
	FROM customer
	GROUP BY store_id 
	HAVING  number_customers > 300) c ON s.store_id = c.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id;
```
![task1](img/task1.png)

## Задание 2
Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

### Решение 2
```
SELECT COUNT(*) AS number_of_film
FROM film f 
WHERE length > (
SELECT AVG(`length` ) AS avg_len 
FROM film);
```

![task2](img/task2.png)


## Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

### Решение 3
```
SELECT YEAR(payment_date) AS Year, MONTH(payment_date) AS Month, SUM(amount) AS amount, COUNT(rental_id ) AS rental
FROM payment p
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY amount DESC
LIMIT 1;
```
![task3](img/task3.png)

## Задание 4*
Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку «Премия». Если количество продаж превышает 8000, то значение в колонке будет «Да», иначе должно быть значение «Нет».

### Решение 4
```
SELECT r.staff_id, s.first_name, s.last_name, COUNT(rental_id) AS count,
CASE 
	WHEN COUNT(rental_id) > 8000 THEN "Да"
	ELSE "Нет"
END AS Премия
FROM rental r JOIN staff s ON r.staff_id = s.staff_id 
GROUP BY r.staff_id;
```
![task4](img/task4.png)

