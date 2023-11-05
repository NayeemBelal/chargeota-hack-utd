import 'package:flutter/material.dart';
import '../auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Enter your email and we will send you a link to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add any other email validation logic here if needed
                  return null;
                },
                onChanged: (value) => _email = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Send Reset Link'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await Auth().sendPasswordResetEmail(email: _email);
        // Inform the user that the link to reset the password was sent.
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Reset Link Sent'),
            content: Text('Check your email to reset your password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                },
              ),
            ],
          ),
        );
      } on FirebaseAuthException catch (e) {
        // Handle errors, e.g., no user found for that email
        final snackBar = SnackBar(content: Text('Error: ${e.message}'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (e) {
        // Handle any other errors that might occur
        final snackBar = SnackBar(
            content: Text('An error occurred. Please try again later.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
