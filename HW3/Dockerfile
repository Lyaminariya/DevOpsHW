# Указываем базовый образ. Здесь используется официальный образ Ubuntu.
FROM ubuntu:20.04

# Указываем информацию о мейнтейнере
MAINTAINER Сергей Лямкин <lyamkin.serezha@mail.ru>

# Устанавливаем переменные окружения для автоматического ответа на вопросы установки
ENV DEBIAN_FRONTEND=noninteractive

# Обновляем пакеты и устанавливаем нужные пакеты для Nginx и PostgreSQL
RUN apt-get update && apt-get install -y \
    nginx \
    postgresql postgresql-contrib \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Копируем конфигурационные файлы для Nginx и PostgreSQL (если они есть)
# ADD используется для копирования файлов из контекста сборки в контейнер
# ADD my_nginx.conf /etc/nginx/nginx.conf
# ADD my_postgresql.conf /etc/postgresql/postgresql.conf

# Копируем стартовые скрипты
COPY start.sh /usr/local/bin/start.sh

# Устанавливаем права на исполняемый файл стартового скрипта
RUN chmod +x /usr/local/bin/start.sh

# Создаем рабочую директорию
WORKDIR /var/www/html

# Создаем volume для хранения данных PostgreSQL
VOLUME ["/var/lib/postgresql/data"]

# Открываем порты для Nginx и PostgreSQL
EXPOSE 80 5432

# Устанавливаем пользователя для выполнения команд
USER postgres

# Запускаем стартовый скрипт
CMD ["/usr/local/bin/start.sh"]
