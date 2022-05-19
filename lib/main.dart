import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../screens/filters_screeen.dart';
import '../screens/tabs_screen.dart';
import './screens/category_recipes_screen.dart';
import './screens/recipe_detail_screen.dart';
import './models/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;

      _recipes = dummyRecipes.where((recipe) {
        if (_filters['gluten-free'] == true && !recipe.isGlutenFree) {
          return false;
        }
        if (_filters['lactose-free'] == true && !recipe.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] == true && !recipe.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] == true && !recipe.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  List<Recipe> _recipes = dummyRecipes;
  List<String> _favoriteRecipeIds = [];

  void _addToFavorite(String recipeId) {
    setState(() {
      _favoriteRecipeIds.add(recipeId);
    });
  }

  void _removeFromFavorites(String recipeId) {
    setState(() {
      _favoriteRecipeIds.removeWhere((element) => element == recipeId);
    });
  }

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
              titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) =>  TabsScreen(_favoriteRecipeIds),
        CategoryRecipesScreen.routeName: (ctx) =>
            CategoryRecipesScreen(_recipes),
        RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(
              favoriteRecipeIds: _favoriteRecipeIds,
              addToFavorites: _addToFavorite,
              removeFromFavorites: _removeFromFavorites,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
