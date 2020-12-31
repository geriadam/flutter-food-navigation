import 'package:flutter/material.dart';
import 'package:flutter_food_navigation/categories_page.dart';
import 'package:flutter_food_navigation/foods_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App with Navigation',
      initialRoute: '/',
      routes: {
        '/FoodsPage': (context) => FoodsPage(),
        '/CategoriesPage': (context) => CategoriesPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Itim',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 52, 52, 1)
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 52, 52, 1)
          ),
          title: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Sunshiney'
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Food\'s categories'),
        ),
        body: SafeArea(child: CategoriesPage()),
      )
    );
  }
}