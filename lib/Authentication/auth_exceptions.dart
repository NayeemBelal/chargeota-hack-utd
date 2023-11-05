class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}

class UserNotFoundException extends AuthException {
  UserNotFoundException(String message) : super(message);
}

class WrongPasswordException extends AuthException {
  WrongPasswordException(String message) : super(message);
}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException(String message) : super(message);
}

class InvalidEmailException extends AuthException {
  InvalidEmailException(String message) : super(message);
}
