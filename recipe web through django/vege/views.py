from django.shortcuts import render, redirect, get_object_or_404
from .models import *  # ✅ your model is 'recipees'

# ----------------------------
# Create / View Recipe
# ----------------------------
def recipe(request):
    if request.method == "POST":
        data = request.POST
        recipe_image = request.FILES.get('recipe_image')
        recipe_name = data.get('recipe_name')
        recipe_description = data.get('recipe_description')

        # Save to model
        recipees.objects.create(
            recipe_name=recipe_name,
            recipe_description=recipe_description,
            recipe_image=recipe_image
        )
        return redirect('/vege/recipe/')
    
    # Display all recipes
    queryset = recipees.objects.all()
    context = {'recipes': queryset}
    return render(request, 'recipes.html', context)


# ----------------------------
# Update Recipe
# ----------------------------
def update_recipe(request, id):
    recipe = get_object_or_404(recipees, id=id)  # ✅ using recipees model

    if request.method == 'POST':
        recipe.recipe_name = request.POST.get('recipe_name')
        recipe.recipe_description = request.POST.get('recipe_description')

        # If a new image is uploaded
        if request.FILES.get('recipe_image'):
            recipe.recipe_image = request.FILES.get('recipe_image')

        recipe.save()
        return redirect('/vege/recipe/')

    context = {'recipe': recipe}
    return render(request, 'update_recipe.html', context)


# ----------------------------
# Delete Recipe
# ----------------------------
def delete_recipe(request, id):
    recipe = get_object_or_404(recipees, id=id)
    recipe.delete()
    return redirect('/vege/recipe/')

