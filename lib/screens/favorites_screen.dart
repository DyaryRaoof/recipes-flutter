import 'package:flutter/material.dart';
import 'package:recipes_flutter/dummy_data.dart';
import 'package:recipes_flutter/models/recipe.dart';
import 'package:recipes_flutter/widgets/recipe_item.dart';
import './recipe_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> favoriteIds;

  const FavoritesScreen(this.favoriteIds, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Recipe> recipes = [];

  void openRecipeDetail(context, String recipeId) {
    Navigator.pushNamed(context, RecipeDetailScreen.routeName,
        arguments: {'id': recipeId});
  }

  @override
  void initState() {
    recipes = dummyRecipes.where((element) {
      return widget.favoriteIds.contains(element.id);
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return RecipeItem(
            recipes[index],
            () => {
                  openRecipeDetail(context, recipes[index].id),
                });
      },
      itemCount: recipes.length,
    );
  }
}
