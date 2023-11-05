import 'package:flutter/material.dart';
import '../auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../calendar_screen.dart';
import 'package:chargeota/main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _displayName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) => value!.isEmpty ? 'Enter an email' : null,
              onChanged: (value) => setState(() => _email = value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value!.isEmpty ? 'Enter a password' : null,
              onChanged: (value) => setState(() => _password = value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Display Name'),
              validator: (value) =>
                  value!.isEmpty ? 'Enter a display name' : null,
              onChanged: (value) => setState(() => _displayName = value),
            ),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: _submit,
            ),
            // Add TextButton for users to navigate to the sign-in page
          ],
        ),
      ),
    );
  }

  // Other code remains unchanged...

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create user with email and password
        await Auth().createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // Update the user profile with the display name
        User? user = FirebaseAuth.instance.currentUser;
        await user?.updateProfile(displayName: _displayName);
        await user?.reload();

        // Navigate to the home screen upon successful sign-up
        // Replace 'HomeScreen()' with your actual home screen widget
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CalendarScreen()));
      } on FirebaseAuthException catch (e) {
        // Handle the Firebase auth error here
        // Implement your error handling logic here
        print(e
            .message); // Consider using a proper logging mechanism or error display
      } catch (e) {
        // Handle any other errors that might occur
        print(e); // Consider using a proper logging mechanism or error display
      }
    }
  }
}
