import 'package:flutter/material.dart';
import '../Authentication/sign_in/sign_in_screen.dart';
import '/home_screen.dart'; // Update this path to where your home screen is located

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set the initial route or home page of the app
      home: SignInScreen(), // Replace with your sign-in screen widget
      // If using named routes, define them here
      routes: {
        '/signin': (context) => SignInScreen(),
        '/home': (context) => HomeScreen(),
        // Add more routes as needed
      },
    );
  }
}
