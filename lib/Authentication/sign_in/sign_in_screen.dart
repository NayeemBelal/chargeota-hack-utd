import 'package:flutter/material.dart';
import '../auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../sign_up/sign_up_screen.dart';

// Replace HomeScreen with the actual screen you want to navigate after successful sign-in
import 'package:chargeota/home_screen.dart'; // This should be the path to your HomeScreen

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // to prevent column occupying entire vertical height
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) =>
                  value != null && value.isEmpty ? 'Enter an email' : null,
              onChanged: (value) => setState(() => _email = value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) =>
                  value != null && value.isEmpty ? 'Enter a password' : null,
              onChanged: (value) => setState(() => _password = value),
            ),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: _submit,
            ),
            TextButton(
              child: Text("Don't have an account? Sign up"),
              onPressed: () {
                // Navigate to the sign-up screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SignUpScreen()), // Replace with your sign-up screen
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Instantiate your AuthService
        final authService = Auth();

        // Call the sign-in method with the email and password provided by the user
        await authService.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // If sign-in is successful, navigate to the HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } on FirebaseAuthException catch (e) {
        // If there is an error, show the error message in a Snackbar
        final snackBar =
            SnackBar(content: Text(e.message ?? 'An error occurred'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
