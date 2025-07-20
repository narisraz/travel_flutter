import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';

class IsAuthenticated {
  final AuthRepository authRepository;

  IsAuthenticated({required this.authRepository});

  Future<bool> call() async {
    return await authRepository.checkToken();
  }
}
