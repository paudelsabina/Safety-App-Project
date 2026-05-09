from rest_framework import serializers
from .models import EmergencyAlert

class EmergencyAlertSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmergencyAlert
        fields = '__all__' # This tells Django to include all fields from your model