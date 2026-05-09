from django.db import models
from django.contrib.auth.models import User

class EmergencyAlert(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    type = models.CharField(max_length=100) # e.g., Medical, Accident
    latitude = models.FloatField()
    longitude = models.FloatField()
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.type} alert at {self.timestamp}"