from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from api.views import EmergencyAlertViewSet # Replace 'your_app_name'

router = DefaultRouter()
router.register(r'alerts', EmergencyAlertViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)), # This makes the URL: /api/alerts/
]