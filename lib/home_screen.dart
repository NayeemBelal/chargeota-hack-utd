import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Authentication/sign_in/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              // Sign out the user
              await FirebaseAuth.instance.signOut();
              // Return to the sign-in screen or any other appropriate screen
              // Replace 'SignInScreen()' with the actual sign-in screen widget
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              user != null
                  ? 'Hello, ${user.displayName ?? 'User'}!'
                  : 'Hello, Guest!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
