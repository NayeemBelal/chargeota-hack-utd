import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Authentication/sign_in/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyAd4npuGJ0J9ZfGXk5CDkiJY9PjbTzNnQs",
      appId: "1:145895879153:android:efd28ef5c95418bb859450",
      messagingSenderId: "145895879153",
      projectId: "chargeota",
    ),
  );
  runApp(CalendarScreen());
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInScreen(), // Your sign-in screen widget should be here
    );
  }
}
