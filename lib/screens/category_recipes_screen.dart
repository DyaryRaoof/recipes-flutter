import 'package:flutter/material.dart';
import 'package:recipes_flutter/dummy_data.dart';
import 'package:recipes_flutter/screens/recipe_detail_screen.dart';
import 'package:recipes_flutter/widgets/recipe_item.dart';
import '../models/recipe.dart';

class CategoryRecipesScreen extends StatefulWidget {
  static const routeName = 'category_recipes';
  final List<Recipe> recipes;
  const CategoryRecipesScreen(this.recipes, {Key? key}): super(key: key);

  @override
  State<CategoryRecipesScreen> createState() => _CategoryRecipesScreenState();
}

class _CategoryRecipesScreenState extends State<CategoryRecipesScreen> {


  List<Recipe> categoryRecipes = [];
  String?  categoryTitle = '';

  void openRecipeDetail(context, String recipeId) {
    Navigator.pushNamed(context, RecipeDetailScreen.routeName, arguments: {'id': recipeId})
        .then((id) {
      if(id != null){
        setState((){
          categoryRecipes.removeWhere((element) => element.id == id);
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = args['title'];
    final categoryId = args['id'];
    categoryRecipes = widget.recipes.where((recipe) {
      return recipe.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return RecipeItem(categoryRecipes[index], ()  {
              openRecipeDetail(context, categoryRecipes[index].id);}) ;
          },
          itemCount: categoryRecipes.length,
        ),
      ),
    );
  }
}
