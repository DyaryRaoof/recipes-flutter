import 'package:flutter/material.dart';
import './screens/category_recipes_screen.dart';
import './screens/recipe_detail_screen.dart';
import 'widgets/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 500, 10),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),

              titleLarge:
                  const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        CategoriesScreen.routeName: (ctx) =>  const CategoriesScreen(),
        CategoryRecipesScreen.routeName: (ctx) => CategoryRecipesScreen(),
        RecipeDetailScreen.routeName: (ctx) => const RecipeDetailScreen(),
      },
    );
  }
}
