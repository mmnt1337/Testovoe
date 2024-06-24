#!/bin/bash

# Проверяем, что переданы оба аргумента
if [ $# -ne 2 ]; then
    echo "Usage example: $0 <file_name> <new_extension>"
    exit 1
fi

# Получаем имя файла и новое расширение
file_name="$1"
new_extension="$2"

# Проверяем, существует ли файл
if [ ! -e "$file_name" ]; then
    echo "File '$file_name' does not exist"
    exit 1
fi

# Получаем базовое имя файла и текущее расширение
base_name=$(basename "$file_name")
current_extension="${base_name##*.}"

# Проверяем, есть ли расширение у файла
if [ "$current_extension" = "$base_name" ]; then
    echo "The original file has no extension"
    new_file_name="${file_name}.${new_extension}"
else
    # Получаем базовое имя файла без расширения
    base_name="${base_name%.*}"
    new_file_name="${base_name}.${new_extension}"
fi

# Переименовываем файл
mv "$file_name" "$new_file_name"

echo "File renamed: '$new_file_name'"