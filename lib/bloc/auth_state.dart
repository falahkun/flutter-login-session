part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthVerified extends AuthState {
  final String token;

  AuthVerified(this.token);
}

class AuthUnVerified extends AuthState {
  final String message;

  AuthUnVerified(this.message);
}
