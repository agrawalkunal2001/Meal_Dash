import 'package:flutter/material.dart';
import 'package:meal_dash/data.dart';
import 'package:meal_dash/screens/filters_screen.dart';
import 'package:meal_dash/screens/meal_category_screen.dart';
import 'package:meal_dash/screens/meal_detail_screen.dart';
import 'package:meal_dash/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> _availableMeals = mealData;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = mealData.where((element) {
        if (_filters["gluten"] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] == true && !element.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      Navigator.pushNamed(context, MealCategoryScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meal Dash",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        "/": (ctx) => TabsScreen(),
        MealCategoryScreen.routeName: (ctx) =>
            MealCategoryScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        // This function runs when a navigation is to occur and the route is not registered in the routes table above.
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        // This function runs when there is no available route to run.
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Dash"),
      ),
    );
  }
}
