"""Настройки безопасности."""

import os

ALLOWED_HOSTS = ['localhost', ]

SECRET_KEY = os.environ.get('DJ_SECRET_KEY')
