import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem(this.recipe, {Key? key}) : super(key: key);
  
  void openRecipeDetail (context) {
    Navigator.pushNamed(context, 'recipe_detail', arguments: {'id': recipe.id});
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openRecipeDetail(context),
      child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      recipe.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 220,
                      color: Colors.black54,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Text(
                        recipe.title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_alarm),
                        Text('${recipe.duration} min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        Text(recipe.complexity.name.toUpperCase()),
                      ],
                    ),

                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        Text(recipe.affordability.name.toUpperCase()),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
