"""Настройки админки."""

from django.contrib import admin

from api.models import Country, Manufacturer, Car, Comment


@admin.register(Country)
class CountryAdmin(admin.ModelAdmin):
    """Регистрация модели админки."""

    list_display = ('id', 'name',)
    list_display_links = ('name',)
    search_fields = ('name',)


@admin.register(Manufacturer)
class ManufacturerAdmin(admin.ModelAdmin):
    """Регистрация модели производителя."""

    list_display = ('id', 'name', 'country',)
    list_display_links = ('name',)
    search_fields = ('name',)
    list_filter = ('country',)


@admin.register(Car)
class CarAdmin(admin.ModelAdmin):
    """Регистрация модели автомобиля."""

    list_display = ('id', 'name', 'manufacturer', 'start_production', 'end_production',)
    list_display_links = ('name',)
    search_fields = ('name', 'start_production', 'end_production',)
    list_filter = ('manufacturer', 'start_production', 'end_production',)


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    """Регистрация модели комментария."""

    list_display = ('id', 'email', 'car', 'created',)
    list_display_links = ('email',)
    search_fields = ('email',)
    list_filter = ('car', 'email', 'created',)
