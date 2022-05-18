import 'package:flutter/material.dart';
import 'package:recipes_flutter/dummy_data.dart';
import 'package:recipes_flutter/widgets/recipe_item.dart';
import '../models/recipe.dart';

class CategoryRecipesScreen extends StatelessWidget {
  static const routeName = 'category_recipes';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = args['title'];
    final categoryId = args['id'];
    final List<Recipe> categoryRecipes = dummyRecipes.where((recipe) {
      return recipe.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return RecipeItem(categoryRecipes[index]) ;
          },
          itemCount: categoryRecipes.length,
        ),
      ),
    );
  }
}
