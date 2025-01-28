"""Главный файл настроек."""

import os

from split_settings.tools import include

from conf.settings.base import BASE_DIR

ENV = os.environ.get("DJANGO_ENV", "development")  # Определяем окружение

# Проверяем, если мы в режиме разработки
if ENV != 'production':
    from dotenv import load_dotenv

    load_dotenv(dotenv_path=str(os.path.join(BASE_DIR.parent, '.env')))  # Загружаем .env файл только если не в проде

base_settings = [
    'apps.py',  # Установленные приложения
    'auth.py',  # Авторизация
    'base.py',  # Основные настройки
    'database.py',  # Настройки базы данных
    'drf.py',  # Настройки DRF
    'internationalization.py',  # Интернационализация
    'middlewares.py',  # Мидлвари
    'security.py',  # Безопасность
    'templates.py',  # Шаблоны
    f'{"dev-env" if ENV != "production" else "production-env"}.py',  # Настройки для прода или дева
]

include(*base_settings)
