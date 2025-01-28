"""API сериализаторы."""

from rest_framework import serializers

from api.models import Country, Manufacturer, Car, Comment


class CountrySerializer(serializers.ModelSerializer):
    """Сериализатор модели Country."""

    manufacturers = serializers.StringRelatedField(many=True, read_only=True)

    class Meta:
        model = Country
        fields = ('id', 'name', 'manufacturers',)


class CarSerializer(serializers.ModelSerializer):
    """Сериализатор автомобиля."""

    comments = serializers.StringRelatedField(many=True, read_only=True)
    comments_count = serializers.IntegerField(source='comments.count', read_only=True)

    class Meta:
        model = Car
        fields = ('id', 'manufacturer', 'start_production', 'end_production', 'comments', 'comments_count',)


class ManufacturerSerializer(serializers.ModelSerializer):
    """Сериализатор производителя."""
    cars = CarSerializer(source='cars', many=True, read_only=True)

    class Meta:
        model = Manufacturer
        fields = ('id', 'name', 'country', 'cars',)


class CommentSerializer(serializers.ModelSerializer):
    """Сериализатор комментария."""

    class Meta:
        model = Comment
        fields = ('id', 'email', 'car', 'created', 'text',)
