import 'package:analyzer/exception/exception.dart';

class AuthFailure implements Exception {}

class LoginFailure extends AuthFailure {
  final String message;

  LoginFailure({required this.message});
}

class InvalidUserFailure extends AuthFailure {}

class UpdateFailure extends AuthFailure {}
