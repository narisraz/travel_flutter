import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:travel_flutter/modules/auth/application/use_cases/login.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/email.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/password.dart';

import '../../domain/repositories/fake_auth_repository.dart';

void main() {
  late Login loginUseCase;
  late FakeAuthRepository authRepository;

  setUp(() {
    authRepository = FakeAuthRepository();
    loginUseCase = Login(authRepository: authRepository);
  });

  test(
    'given a valid email and password, when the user logs in, then the user is logged in',
    () async {
      // Arrange
      final email = Email(value: validEmail);
      final password = Password(value: validPassword);

      // Act
      final result = await loginUseCase.login(email: email, password: password);

      // Assert
      expect(result, isA<Right<LoginError, LoginSuccess>>());
    },
  );

  test(
    'given a valid email and password, when the user logs in, should return a token',
    () async {
      // Arrange
      final email = Email(value: validEmail);
      final password = Password(value: validPassword);

      // Act
      final result = await loginUseCase.login(email: email, password: password);

      // Assert
      expect(result.isRight(), isTrue);
      expect(result.fold((l) => l, (r) => r.token), 'token');
    },
  );

  test(
    'given an invalid email and password, when the user logs in, should return an error',
    () async {
      // Arrange
      final email = Email(value: invalidEmail);
      final password = Password(value: invalidPassword);

      // Act
      final result = await loginUseCase.login(email: email, password: password);

      // Assert
      expect(result.isLeft(), isTrue);
      expect(result.fold((l) => l, (r) => r), isA<BadCredentialsError>());
    },
  );

  test(
    'given a valid email and password, when the user logs in, should save the token',
    () async {
      // Arrange
      final email = Email(value: validEmail);
      final password = Password(value: validPassword);

      // Act
      await loginUseCase.login(email: email, password: password);
      final token = await authRepository.getToken();

      // Assert
      expect(token, Some('token'));
    },
  );
}
