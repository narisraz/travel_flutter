import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/modules/auth/application/use_cases/login.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/email.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/password.dart';

// État de connexion
sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final String token;
  const LoginSuccess(this.token);
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
}

// Notifier pour gérer l'état de connexion
class LoginNotifier extends StateNotifier<LoginState> {
  final Login _loginUseCase;

  LoginNotifier(this._loginUseCase) : super(const LoginInitial());

  Future<void> login(Email email, Password password) async {
    state = const LoginLoading();

    try {
      final result = await _loginUseCase.login(
        email: email,
        password: password,
      );

      result.fold((error) {
        if (error is BadCredentialsError) {
          state = LoginError(error.message);
        } else {
          state = const LoginError('Une erreur inconnue s\'est produite');
        }
      }, (success) => state = LoginSuccess(success.token));
    } catch (e) {
      state = LoginError(e.toString());
    }
  }

  void reset() {
    state = const LoginInitial();
  }
}
