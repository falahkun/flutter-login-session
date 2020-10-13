part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLogin extends AuthEvent {
  final String token;

  AuthLogin(this.token);
  //// disini anda bisa menginputkan email password maupun yang lain
}

class AuthSignOut extends AuthEvent {}

class AuthCurrentSession extends AuthEvent {}
