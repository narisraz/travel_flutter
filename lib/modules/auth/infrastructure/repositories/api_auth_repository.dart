import 'package:fpdart/fpdart.dart';
import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';
import '../../../../modules/core/services/http_service.dart';

class ApiAuthRepository implements AuthRepository {
  final HttpService _httpService = HttpService();

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
}
