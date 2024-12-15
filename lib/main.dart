import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/screens/joke_types_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Jokes App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: JokeTypesScreen(),
    );
  }
}
