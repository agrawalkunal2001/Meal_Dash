import 'package:flutter/material.dart';
import 'package:meal_dash/screens/categories_screen.dart';
import 'package:meal_dash/screens/starred_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2 /* Number of tabs*/,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meal Dash"),
          bottom: TabBar(
            indicatorWeight: 2.5,
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Starred",
              ),
            ],
          ),
        ),
        body: TabBarView(
          // Number of tabs=Number of elemnts in tab bar view.
          children: [
            // Since the tabs screen is managing the current screen and is inside a scaffold, the categories and starred screen do not need a scaffold because they only manage the area below tabs and not the entire screen.
            CategoriesScreen(),
            StarredScreen(),
          ],
        ),
      ),
    );
  }
}
