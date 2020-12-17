import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreenBottom extends StatefulWidget {
  @override
  _TabScreenBottomState createState() => _TabScreenBottomState();
}

class _TabScreenBottomState extends State<TabScreenBottom> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Your favorite'}
  ];
  int _selectPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text('Favorite'),
          ),
        ],
      ),
    );
  }
}
