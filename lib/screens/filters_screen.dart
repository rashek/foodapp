import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen({this.saveFilters, this.currentFilters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _bird = false;
  bool _mammal = false;
  bool _reptile = false;
  bool _fish = false;
  bool _insect = false;
  bool _native = false;
  bool _hunter = false;

  initState() {
    _bird = widget.currentFilters['bird'];
    _mammal = widget.currentFilters['mammal'];
    _reptile = widget.currentFilters['reptile'];
    _fish = widget.currentFilters['fish'];
    _insect = widget.currentFilters['insect'];
    _native = widget.currentFilters['native'];
    _hunter = widget.currentFilters['hunter'];
    super.initState();
  }

  Widget _builderSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(
          description,
        ),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'bird': _bird,
                  'mammal': _mammal,
                  'reptile': _reptile,
                  'fish': _fish,
                  'insect': _insect,
                  'native': _native,
                  'hunter': _hunter,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal sekection',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title)),
          Expanded(
              child: ListView(
            children: [
              _builderSwitchListTile('Bird', 'Only include animals Bird', _bird,
                  (newValue) {
                setState(() {
                  _bird = newValue;
                });
              }),
              _builderSwitchListTile(
                  'Mammal', 'Only include animals Mammal', _mammal, (newValue) {
                setState(() {
                  _mammal = newValue;
                });
              }),
              _builderSwitchListTile(
                  'Reptile', 'Only include animals Reptile', _reptile,
                  (newValue) {
                setState(() {
                  _reptile = newValue;
                });
              }),
              _builderSwitchListTile(
                  'Fish', 'Only include animals without Fish', _fish,
                  (newValue) {
                setState(() {
                  _fish = newValue;
                });
              }),
              _builderSwitchListTile(
                  'Insect', 'Only include animals Insect', _insect, (newValue) {
                setState(() {
                  _insect = newValue;
                });
              }),
              _builderSwitchListTile('All Natvie animal',
                  'Only include animals that are Native', _native, (newValue) {
                setState(() {
                  _native = newValue;
                });
              }),
              _builderSwitchListTile('All Hunter animal',
                  'Only include animals that are hunter', _hunter, (newValue) {
                setState(() {
                  _hunter = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
