import 'package:flutter/material.dart';
import 'package:meal_dash/screens/categories_screen.dart';
import 'package:meal_dash/screens/starred_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": StarredScreen(), "title": "Starred"}
  ];
  int _selectedPageIndex = 0; // To decide what to show when a tab is selected.

  void _selectPage(
      int index /* Flutter automatically gives the index of selected tab*/) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController( // Top tab-bar
    //   length: 2 /* Number of tabs*/,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Meal Dash"),
    //       bottom: TabBar(
    //         indicatorWeight: 2.5,
    //         labelColor: Theme.of(context).accentColor,
    //         unselectedLabelColor: Colors.white,
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categories",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: "Starred",
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       // Number of tabs=Number of elemnts in tab bar view.
    //       children: [
    //         // Since the tabs screen is managing the current screen and is inside a scaffold, the categories and starred screen do not need a scaffold because they only manage the area below tabs and not the entire screen.
    //         CategoriesScreen(),
    //         StarredScreen(),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      // Bottom tab-bar
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),
        actions: <Widget>[
          Icon(
            Icons.food_bank,
            color: Theme.of(context).accentColor,
            size: 40,
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Text("Meal Dash",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 17,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 17,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Starred",
          )
        ],
      ),
    );
  }
}
