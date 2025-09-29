# Домашнее задание к занятию «Индексы» - Хрипун Алексей

---

## Задание 1
Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

### Решение 1
```
SELECT table_schema AS "Имя базы данных",
ROUND (SUM(data_length) / 1024 /1024, 2) AS "Размер данных в МБ",
ROUND (SUM(index_length) / 1024 / 1024, 2) AS "Размер индексов в МБ",
ROUND(ROUND(SUM(index_length) / 1024 /1024, 2) * 100 / ROUND(SUM(data_length) / 1024 /1024, 2), 2) AS "Процент интекса от данных"
FROM information_schema.TABLES
WHERE TABLE_SCHEMA='sakila'
GROUP BY TABLE_SCHEMA ;
```
