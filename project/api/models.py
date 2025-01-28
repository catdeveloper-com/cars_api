"""Модели для API."""

from django.db import models


class Country(models.Model):
    """Модель страны."""

    name = models.CharField(max_length=100, )

    def __str__(self) -> str:
        """Строковое представление."""
        return self.name


class Manufacturer(models.Model):
    """Модель производителя."""

    name = models.CharField(max_length=100, )
    country = models.ForeignKey(Country, on_delete=models.PROTECT, related_name='manufacturers')

    def __str__(self) -> str:
        """Строковое представление."""
        return self.name


class Car(models.Model):
    """Модель машины."""

    name = models.CharField(max_length=100, )
    manufacturer = models.ForeignKey(Manufacturer, on_delete=models.PROTECT, related_name='cars')
    start_production = models.DateField()
    end_production = models.DateField(null=True, blank=True)

    def __str__(self) -> str:
        """Строковое представление."""
        return self.name


class Comment(models.Model):
    """Модель комментария."""

    email = models.EmailField()
    car = models.ForeignKey(Car, on_delete=models.CASCADE, related_name='comments')
    created = models.DateTimeField(auto_now_add=True)
    text = models.CharField(max_length=4096)

    def __str__(self) -> str:
        """Строковое представление."""
        return self.text
