import 'package:fpdart/fpdart.dart';

class LoginViewState {
  final String email;
  final String password;
  final Option<String> emailError;
  final Option<String> passwordError;
  final bool isPasswordVisible;

  const LoginViewState({
    this.email = '',
    this.password = '',
    this.emailError = const None(),
    this.passwordError = const None(),
    this.isPasswordVisible = false,
  });

  LoginViewState copyWith({
    String? email,
    String? password,
    Option<String>? emailError,
    Option<String>? passwordError,
    bool? isPasswordVisible,
  }) {
    return LoginViewState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LoginViewState &&
        other.email == email &&
        other.password == password &&
        other.emailError == emailError &&
        other.passwordError == passwordError &&
        other.isPasswordVisible == isPasswordVisible;
  }

  @override
  int get hashCode {
    return Object.hash(
      email,
      password,
      emailError,
      passwordError,
      isPasswordVisible,
    );
  }
}
