from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

class CustomTokenSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['username'] = user.username
        l = user.groups.values_list('name', flat=True)  # QuerySet Object
        l_set = list(l)  # QuerySet to `set`
        token['roles'] = l_set

        return token
