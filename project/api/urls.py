"""API маршруты."""

from django.urls import path, include
from rest_framework.routers import DefaultRouter

from api.views import CountryViewSet, ManufacturerViewSet, CarViewSet, CommentViewSet

router = DefaultRouter()
router.register('countries', CountryViewSet)
router.register('manufacturers', ManufacturerViewSet)
router.register('cars', CarViewSet)
router.register('comments', CommentViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('drf-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('auth/', include('djoser.urls.authtoken')),
]
