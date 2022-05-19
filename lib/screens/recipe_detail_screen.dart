import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = 'recipe_detail';

  List<String> favoriteRecipeIds;
  Function removeFromFavorites;
  Function addToFavorites;

  RecipeDetailScreen(
      {required this.favoriteRecipeIds,
      required this.removeFromFavorites,
      required this.addToFavorites,
      Key? key})
      : super(key: key);

  Widget headerText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        actions: [
          IconButton(
            onPressed: () {
              if(!favoriteRecipeIds.contains(recipe.id)){
                addToFavorites(recipe.id);
              }else{
                removeFromFavorites(recipe.id);
              }
            },
            icon:  Icon(
              Icons.star,
              color: favoriteRecipeIds.contains(recipe.id) ? Theme.of(context).accentColor: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(recipe.imageUrl),
          headerText('Ingredients'),
          scrollableContainer(context, recipe, true),
          headerText('Steps'),
          scrollableContainer(context, recipe, false),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => {Navigator.pop(context, recipe.id)},
      ),
    );
  }
}
