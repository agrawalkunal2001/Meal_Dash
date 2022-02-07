import 'package:flutter/material.dart';
import 'package:meal_dash/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Already Craving?",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meal Categories", Icons.restaurant, () {
            Navigator.of(context).pushNamed("/");
          }),
          SizedBox(
            height: 5,
          ),
          buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "\u{00a9} 2022 Kunal Agrawal",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
