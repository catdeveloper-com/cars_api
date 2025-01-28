"""API маршруты."""

from django.urls import path, include, re_path
from rest_framework.routers import SimpleRouter

from api.views import CountryViewSet, ManufacturerViewSet, CarViewSet, CommentViewSet

router = SimpleRouter()
router.register('countries', CountryViewSet)
router.register('manufacturers', ManufacturerViewSet)
router.register('cars', CarViewSet)
router.register('comments', CommentViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('drf-auth/', include('rest_framework.urls')),
    path('auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
]
