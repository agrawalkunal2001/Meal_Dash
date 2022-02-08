import 'package:flutter/material.dart';
import 'package:meal_dash/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = "/filters";
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

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
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Apply filters to your meals!",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                    title: Text("Gluten-Free"),
                    subtitle: Text("Only display gluten-free meals!"),
                    value: _glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Lactose-Free"),
                    subtitle: Text("Only display lactose-free meals!"),
                    value: _lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegan"),
                    subtitle: Text("Only display vegan meals!"),
                    value: _vegan,
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text("Vegetarian"),
                    subtitle: Text("Only display vegetarian meals!"),
                    value: _vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
