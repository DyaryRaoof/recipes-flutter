import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'recipe_detail';

  Widget HeaderText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget scrollableContainer(context, Recipe recipe, bool isIngredient) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 50),
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10)),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return isIngredient
              ? Container(
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  color: Theme.of(context).accentColor,
                  child: Text(recipe.ingredients[index]),
                )
              : Container(
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              child: Text('# ${index + 1}'),
                            ),
                          ),
                           SizedBox(
                            width: 200,
                              child: Text(
                            recipe.steps[index],
                            softWrap: true,
                          )),
                        ],
                      ),
                      const Divider(),
                    ],
                  ),
                );
        },
        itemCount:
            isIngredient ? recipe.ingredients.length : recipe.steps.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? recipeId = args['id'];
    final Recipe recipe =
        dummyRecipes.firstWhere((element) => element.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(recipe.imageUrl),
          HeaderText('Ingredients'),
          scrollableContainer(context, recipe, true),
          HeaderText('Steps'),
          scrollableContainer(context, recipe, false),
        ],
      ),
    );
  }
}
