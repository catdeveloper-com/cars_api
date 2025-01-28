"""Файл разрешений."""

from rest_framework import permissions
from rest_framework.generics import GenericAPIView
from rest_framework.request import Request

from api.models import Comment


class CommentPermission(permissions.BasePermission):
    """Разрешение для комментирования."""

    def has_object_permission(self, request: Request, view: GenericAPIView, obj: Comment) -> bool:
        """
        Всем разрешены методы GET, POST и OPTIONS. Для изменения комментария требуется авторизация и наличие прав на
        комментарий.

        Args:
            request: объект запроса
            view: контроллер
            obj: объект комментария

        Returns:
            bool: True если доступ разрешен, иначе False
        """
        if request.method in ['GET', 'POST', 'OPTIONS',]:
            return True

        user = request.user
        if user.is_authenticated:
            return obj.email == user.email or user.is_staff
        return False
