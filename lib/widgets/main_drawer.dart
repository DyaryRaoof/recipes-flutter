import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/filters_screeen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget drawerItem(String title, IconData iconData, Function onClick) {
    return   ListTile(
      leading:  Icon(iconData, size: 26,),
      title:  Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'RobotoCondensed'),
      ),
      onTap: () => onClick(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      backgroundColor: Colors.grey[200],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 130,
            color: Theme.of(context).accentColor,
            child: SafeArea(
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          drawerItem('Recipes', Icons.restaurant, () => {Navigator.pushReplacementNamed(context, CategoriesScreen.routeName)}),
          drawerItem('Filters', Icons.settings, () => {Navigator.pushReplacementNamed(context, FiltersScreen.routeName)}),
        ],
      ),
    );
  }
}
