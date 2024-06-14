#!/bin/bash

# Функция для логирования
log() {
    echo "$1"
    echo "$1" >> script.log
}

# Проверка наличия ключа -d
while getopts "d:" opt; do
    case ${opt} in
        d )
            root_dir=${OPTARG}
            ;;
        \? )
            echo "Usage: cmd [-d] <directory>"
            exit 1
            ;;
    esac
done

# Если ключ не задан, запросить путь у пользователя
if [ -z "$root_dir" ]; then
    read -p "Введите путь до корневого каталога: " root_dir
fi

# Проверка, что директория существует
if [ ! -d "$root_dir" ]; then
    log "Корневая директория не существует: $root_dir"
    exit 1
fi

# Получение списка всех пользователей
users=$(cut -d: -f1 /etc/passwd)

# Создание директорий и установка прав
for user in $users; do
    user_dir="$root_dir/$user"
    
    # Проверка, что директория уже существует
    if [ -d "$user_dir" ]; then
        log "Директория уже существует: $user_dir"
        continue
    fi

    # Создание директории
    mkdir "$user_dir"
    if [ $? -ne 0 ]; then
        log "Ошибка при создании директории: $user_dir"
        continue
    fi
    
    # Установка владельца и прав
    chown $user:$user "$user_dir"
    chmod 755 "$user_dir"
    if [ $? -eq 0 ]; then
        log "Директория создана и настроена: $user_dir"
    else
        log "Ошибка при настройке директории: $user_dir"
    fi
done
