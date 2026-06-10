# HW3 Генератор CSV-данных
## Лобанов Никита ББИ2501

Проект генерирует CSV-данные и создаёт HTML-отчёт с помощью двух Docker-контейнеров.

## Структура проекта

```
.
├── run.sh
├── generator/
│   ├── Dockerfile
│   └── generate.py
└── reporter/
    ├── Dockerfile
    ├── report.js
    └── package.json
```

## Быстрый старт

```bash
chmod +x run.sh

# 1. Собрать и запустить генератор
./run.sh build_generator
./run.sh run_generator

# 2. Собрать и запустить репортер
./run.sh build_reporter
./run.sh run_reporter
```

## Все команды

| Команда | Описание |
|---|---|
| `./run.sh build_generator` | Собрать Docker-образ генератора |
| `./run.sh run_generator` | Запустить генератор → создаёт `data/data.csv` |
| `./run.sh create_local_data` | Создать `local_data/data.csv` локально (без Docker) |
| `./run.sh build_reporter` | Собрать Docker-образ аналитика |
| `./run.sh run_reporter` | Запустить аналитик → создаёт `data/report.html` |
| `./run.sh structure` | Вывести структуру файлов проекта |
| `./run.sh clear_data` | Удалить все `.csv` и `.html` из `data/` |
| `./run.sh inside_generator` | Показать содержимое `/data` изнутри контейнера генератора |
| `./run.sh inside_reporter` | Показать содержимое `/data` изнутри контейнера аналитика |

