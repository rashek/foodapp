import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/animal.dart';

class TabsScreen extends StatefulWidget {
  final List<Animal> favoriteAnimals;

  TabsScreen(this.favoriteAnimals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Letters'},
      {
        'page': FavoritesScreen(widget.favoriteAnimals),
        'title': 'Your Favorite'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Theme.of(context).primaryColor.withOpacity(.3),
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.book_outlined,
            color: Theme.of(context).accentColor,
            size: 24.0,
          ),
          onPressed: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: Stack(clipBehavior: Clip.none, children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(MediaQuery.of(context).size.height / 2),
              bottomRight:
                  Radius.circular(MediaQuery.of(context).size.height / 2),
            ),
            child: MainDrawer()),
      ]),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.transparent,
        // backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.sort_by_alpha),
            title: Text('Letters'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
