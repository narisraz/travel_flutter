import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/email.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/password.dart';
import 'package:travel_flutter/modules/auth/infrastructure/notifiers/login_notifier.dart';
import 'package:travel_flutter/pages/auth/login/login_view_state.dart';
import 'package:fpdart/fpdart.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginViewState build() => const LoginViewState();

  void updateEmail(String email) {
    state = state.copyWith(email: email, emailError: const None());
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password, passwordError: const None());
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void clearAllErrors() {
    state = state.copyWith(
      emailError: const None(),
      passwordError: const None(),
    );
  }

  bool validateEmail() {
    try {
      Email(value: state.email.trim());
      state = state.copyWith(emailError: const None());
      return true;
    } catch (e) {
      state = state.copyWith(
        emailError: Some('Veuillez saisir un email valide'),
      );
      return false;
    }
  }

  bool validatePassword() {
    try {
      Password(value: state.password);
      state = state.copyWith(passwordError: const None());
      return true;
    } catch (e) {
      state = state.copyWith(
        passwordError: Some(
          'Le mot de passe doit contenir au moins 8 caractères',
        ),
      );
      return false;
    }
  }

  Future<void> login() async {
    clearAllErrors();

    final isEmailValid = validateEmail();
    final isPasswordValid = validatePassword();

    if (!isEmailValid || !isPasswordValid) {
      return;
    }

    final emailValue = Email(value: state.email.trim());
    final passwordValue = Password(value: state.password);

    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    await loginNotifier.login(emailValue, passwordValue);
  }

  void reset() {
    final loginNotifier = ref.read(loginNotifierProvider.notifier);
    loginNotifier.reset();
  }
}
