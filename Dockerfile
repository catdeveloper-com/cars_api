# Используем базовый образ с Python
FROM python:3.10-slim
LABEL authors="catdevelopercom"

# Устанавливаем зависимости системы
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \

# Устанавливаем директорию проекта
WORKDIR /app

# Копируем зависимости
COPY requirements-linux.txt /app/
RUN pip install --no-cache-dir -r requirements-linux.txt

# Копируем исходный код проекта
COPY ./project /app/

# Открываем порт для Django
EXPOSE 8000