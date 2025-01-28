"""Настройки БД."""

import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('DJ_DB_NAME'),
        'USER': os.environ.get('DJ_DB_USER'),
        'PASSWORD': os.environ.get('DJ_DB_PASSWORD'),
        'HOST': os.environ.get('DJ_DB_HOST', '127.0.0.1'),
        'PORT': os.environ.get('DJ_DB_PORT', 5432),
        'OPTIONS': {
            # Нужно явно указать схемы, с которыми будет работать приложение.
            'options': '-c search_path=public'
        }
    }
}
