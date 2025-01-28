"""API контроллеры."""

from django.http import HttpRequest
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.response import Response

from api.models import Country, Manufacturer, Car, Comment
from api.permissions import CommentPermission
from api.serializers import CountrySerializer, ManufacturerSerializer, CarSerializer, CommentSerializer


class CountryViewSet(viewsets.ModelViewSet):
    """Вьюсет для работы со странами."""

    queryset = Country.objects.all()
    serializer_class = CountrySerializer

    @action(detail=True, methods=['get'])
    def manufacturers(self, request: HttpRequest, pk=None) -> Response:
        """
        Выдаёт список производителей, связанных с этой страной.

        Args:
            request: объект запроса
            pk: идентификатор страны

        Returns:
            Response: объект ответа
        """
        country = Country.objects.get(pk=pk)
        manufacturers = country.manufacturers.filter(country=country)
        serializer = ManufacturerSerializer(manufacturers, many=True)
        return Response(serializer.data)


class ManufacturerViewSet(viewsets.ModelViewSet):
    """Вьюсет для работы с производителями."""

    queryset = Manufacturer.objects.all()
    serializer_class = ManufacturerSerializer

    @action(detail=True, methods=['get'])
    def countries(self, request: HttpRequest, pk=None) -> Response:
        """
        Выдаёт страну производителя.

        Args:
            request: объект запроса
            pk: идентификатор производителя

        Returns:
            Response: объект ответа
        """
        manufacturer = Manufacturer.objects.get(pk=pk)
        country = manufacturer.country
        serializer = CountrySerializer(country)
        return Response(serializer.data)

    @action(detail=True, methods=['get'])
    def cars(self, request: HttpRequest, pk=None) -> Response:
        """
        Выдаёт список машин производителя.

        Args:
            request: объект запроса
            pk: идентификатор производителя

        Returns:
            Response: объект ответа
        """
        manufacturer = Manufacturer.objects.get(pk=pk)
        cars = manufacturer.cars.all()
        serializer = CarSerializer(cars, many=True)
        return Response(serializer.data)


class CarViewSet(viewsets.ModelViewSet):
    """Вьюсет для работы с машинами."""

    queryset = Car.objects.all()
    serializer_class = CarSerializer

    @action(detail=True, methods=['get'])
    def manufacturers(self, request: HttpRequest, pk=None) -> Response:
        """
        Выдаёт производителя автомобиля.

        Args:
            request: объект запроса
            pk: идентификатор автомобиля

        Returns:
            Response: объект ответа
        """
        car = Car.objects.get(pk=pk)
        manufacturer = car.manufacturer
        serializer = ManufacturerSerializer(manufacturer)
        return Response(serializer.data)

    @action(detail=True, methods=['get'])
    def comments(self, request: HttpRequest, pk=None) -> Response:
        """
        Выдаёт комментарии к автомобилю.

        Args:
            request: объект запроса
            pk: идентификатор автомобиля

        Returns:
            Response: объект ответа
        """
        car = Car.objects.get(pk=pk)
        comments = car.comments.all()
        serializer = CommentSerializer(comments, many=True)
        return Response(serializer.data)


class CommentViewSet(viewsets.ModelViewSet):
    """Вьюсет для работы с комментариями."""

    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = [CommentPermission]
