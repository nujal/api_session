import 'package:flutter/material.dart';
import 'package:jokes_api/home_page.dart';
import 'package:jokes_api/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteHandler.generateRoute,
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
