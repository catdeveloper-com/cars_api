# Используем базовый образ с Python
FROM python:3.10-slim

# Устанавливаем директорию проекта
WORKDIR /app

# Аргументы сборки
ARG DJANGO_ENV
ARG DB_HOST
ARG DB_PORT

# Копируем зависимости
COPY requirements-linux.txt .
RUN pip install --no-cache-dir -r requirements-linux.txt

# Копируем исходный код проекта
COPY ./project .

# Собираем статику
RUN python manage.py collectstatic --noinput

# Открываем порт для Django
EXPOSE 8000