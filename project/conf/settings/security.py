"""Настройки безопасности."""

import os

ALLOWED_HOSTS = ['localhost', '127.0.0.1',]

SECRET_KEY = os.environ.get('DJ_SECRET_KEY')
