import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  Map<String, bool> filters;
  Function setFilters;

  FiltersScreen(this.filters, this.setFilters, {Key? key}) : super(key: key);

  static const routeName = '/filter_screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget filterItem(
      String title, String subtitle, Function changeValue, currentValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (value) {
        changeValue(value);
      },
      title: Text(
        title,
      ),
      subtitle: Text(subtitle),
    );
  }
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    Map<String, bool> filters = widget.filters;
     _glutenFree = filters['gluten-free']!;
     _lactoseFree = filters['lactose-free']!;
     _vegetarian = filters['vegetarian']!;
     _vegan = filters['vegan']!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
              onPressed: () {
                Map<String, bool> newFilters = {
                  'gluten-free': _glutenFree,
                  'lactose-free': _lactoseFree,
                  'vegan': _vegetarian,
                  'vegetarian': _vegan,
                };

                widget.setFilters(newFilters);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Adjust your meal selection.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            filterItem('Gluten-free', 'Only include gluten-free meals.',
                (value) {
              setState(() {
                _glutenFree = value;
              });
            }, _glutenFree),
            filterItem('Lactose-free', 'Only include lactose-free meals.',
                (value) {
              setState(() {
                _lactoseFree = value;
              });
            }, _lactoseFree),
            filterItem('Vegetarian', 'Only include vegetarian meals.', (value) {
              setState(() {
                _vegetarian = value;
              });
            }, _vegetarian),
            filterItem('Vegan', 'Only include vegan meals.', (value) {
              setState(() {
                _vegan = value;
              });
            }, _vegan),
          ],
        ));
  }
}
