import 'package:fpdart/fpdart.dart';
import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/email.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/password.dart';

class LoginSuccess {
  final String token;

  LoginSuccess({required this.token});
}

sealed class LoginError extends Error {}

class BadCredentialsError extends LoginError {
  final String message;

  BadCredentialsError({required this.message});
}

class Login {
  final AuthRepository authRepository;

  Login({required this.authRepository});

  Future<Either<LoginError, LoginSuccess>> login({
    required Email email,
    required Password password,
  }) async {
    final token = await authRepository.login(
      email: email.value,
      password: password.value,
    );
    return token.fold(
      () => left(BadCredentialsError(message: 'Bad credentials')),
      (token) => right(LoginSuccess(token: token)),
    );
  }
}
