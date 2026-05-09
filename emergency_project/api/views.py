# Create your views here.
from rest_framework import viewsets
from .models import EmergencyAlert
from .serializers import EmergencyAlertSerializer

class EmergencyAlertViewSet(viewsets.ModelViewSet):
    queryset = EmergencyAlert.objects.all()
    serializer_class = EmergencyAlertSerializer