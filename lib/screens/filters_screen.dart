import 'package:flutter/material.dart';
import 'package:meal_dash/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = "/filters";
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
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
      drawer: MainDrawer(),
    );
  }
}
