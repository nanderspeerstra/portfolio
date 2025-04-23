from django.urls import path
from pages import views

urlpatterns = [
    path("", views.home, name="home"),
    path("who-i-am/", views.about, name="who-i-am"),
]
