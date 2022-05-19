import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:recipes_flutter/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: dummyCategories
          .map(
            (item) => CategoryItem(item.title, item.color, item.id),
          )
          .toList(),
    );
  }
}
