from django.urls import path
from . import views

urlpatterns=[
    path('recipe/',views.recipe),
    path('update/<int:id>/',views.update_recipe,name='update_recipe'),
    path('delete/<int:id>/', views.delete_recipe, name='delete_recipe'),
    





]