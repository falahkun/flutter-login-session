import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:testing_auth/auth_provider.dart';
import 'package:testing_auth/main.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthCurrentSession) {
      String token = await AuthProvider.getCurrentSession();
      print(token);
      if (token == null) {
        yield AuthUnVerified("Unauthorized, please login!");
      } else {
        yield AuthVerified(token);
      }
    } else if (event is AuthLogin) {
      await AuthProvider.login(event.token).then((value) {
        Get.offAll(LandingPage());
      });
    } else if (event is AuthSignOut) {
      await AuthProvider.signOut().then((value) {
        Get.offAll(LandingPage());
      });
    }
  }
}
