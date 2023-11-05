import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String? email;
  final String? displayName;
  final String? profilePictureURL;

  UserModel({
    required this.uid,
    this.email,
    this.displayName,
    this.profilePictureURL,
  });

  // Convert a Firebase User to a UserModel
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      profilePictureURL:
          user.photoURL, // Assuming the profile picture URL is stored here
    );
  }

  // Representing the user model as a string for debugging purposes
  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, displayName: $displayName, profilePictureURL: $profilePictureURL)';
  }
}
