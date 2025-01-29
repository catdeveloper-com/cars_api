"""Главный файл маршрутов."""

from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve

from conf.settings.base import STATIC_ROOT

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    re_path(r'^static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}), # Статика без DEBUG = True
]
