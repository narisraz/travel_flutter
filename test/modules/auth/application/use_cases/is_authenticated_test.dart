import 'package:flutter_test/flutter_test.dart';
import 'package:travel_flutter/modules/auth/application/use_cases/is_authenticated.dart';

import '../../domain/repositories/fake_auth_repository.dart';

void main() {
  late IsAuthenticated isAuthenticatedUseCase;
  late FakeAuthRepository authRepository;

  setUp(() {
    authRepository = FakeAuthRepository();
    isAuthenticatedUseCase = IsAuthenticated(authRepository: authRepository);
  });

  test('given a valid token, should return true', () async {
    // Arrange
    authRepository.saveToken(validToken);

    // Act
    final result = await isAuthenticatedUseCase();

    // Assert
    expect(result, isTrue);
  });

  test('given a invalid token, should return false', () async {
    // Arrange
    authRepository.saveToken(invalidToken);

    // Act
    final result = await isAuthenticatedUseCase();

    // Assert
    expect(result, isFalse);
  });
}
