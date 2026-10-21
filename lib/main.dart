import 'package:flutter/material.dart';
import 'package:space_app/SpaceApp//first_screen.dart';
import 'package:space_app/SpaceApp//space_home_screen.dart';
import 'package:space_app/SpaceApp//planet_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space App',
      initialRoute: FirstScreen.routeName,
      routes: {
        FirstScreen.routeName: (context) =>  FirstScreen(),
        SpaceHomeScreen.routeName: (context) =>  SpaceHomeScreen(),
        PlanetDetailsScreen.routeName: (context) =>  PlanetDetailsScreen(),
      },
    );
  }
}