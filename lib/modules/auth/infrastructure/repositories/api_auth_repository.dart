import 'package:fpdart/fpdart.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';
import '../../../../modules/core/services/http_service.dart';

class ApiAuthRepository implements AuthRepository {
  final HttpService _httpService = HttpService();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static const String _tokenKey = 'token';

  @override
  Future<Option<String>> login({
    required String email,
    required String password,
  }) async {
    final result = await _httpService.post(
      '/api/auth/login',
      body: {'email': email, 'password': password},
    );

    return result.fold((error) => const None(), (data) {
      final token = data['data']['token'] as String?;
      return token != null ? Some(token) : const None();
    });
  }

  @override
  Future<Option<String>> getToken() async {
    final token = await _secureStorage.read(key: _tokenKey);
    return token != null ? Some(token) : const None();
  }

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<bool> checkToken() async {
    final token = await getToken();
    return token.fold(() => false, (data) async {
      final result = await _httpService.get(
        '/api/auth/check-token',
        headers: {'Authorization': 'Bearer $data'},
      );
      return result.fold((error) => false, (res) => res['success'] as bool);
    });
  }
}
