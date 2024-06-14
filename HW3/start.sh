#!/bin/bash

# Запуск PostgreSQL
service postgresql start

# Запуск Nginx
nginx -g 'daemon off;'
