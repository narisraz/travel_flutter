import 'package:fpdart/fpdart.dart';
import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';

final validEmail = 'test@test.com';
final validPassword = 'password';
final invalidEmail = 'invalid@test.com';
final invalidPassword = 'invalid-password';
final validToken = 'token';
final invalidToken = 'invalid-token';

class FakeAuthRepository implements AuthRepository {
  String _token = validToken;

  FakeAuthRepository() {
    saveToken(_token);
  }

  @override
  Future<Option<String>> login({
    required String email,
    required String password,
  }) async {
    if (email == invalidEmail || password == invalidPassword) {
      return none();
    }
    return some(_token);
  }

  @override
  Future<Option<String>> getToken() async {
    return some(_token);
  }

  @override
  Future<void> saveToken(String token) async {
    _token = token;
  }

  @override
  Future<bool> checkToken() async {
    return _token != invalidToken;
  }
}
