import 'package:fpdart/fpdart.dart';
import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';

final validEmail = 'test@test.com';
final validPassword = 'password';
final invalidEmail = 'invalid@test.com';
final invalidPassword = 'invalid-password';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<Option<String>> login({
    required String email,
    required String password,
  }) async {
    if (email == invalidEmail || password == invalidPassword) {
      return none();
    }
    return some('token');
  }
}
