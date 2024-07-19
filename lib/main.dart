import 'package:flutter/material.dart';
import 'package:machinetest/UIscreen.dart';

void main() {
  runApp(MyApp()); // Start the application by running the MyApp widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner in the top-right corner
      home: Uiscreen(), // Set the home screen of the app to Uiscreen
    );
  }
}
