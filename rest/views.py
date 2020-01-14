from rest_framework_simplejwt.views import TokenObtainPairView

from rest.serializers import CustomTokenSerializer


class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenSerializer
