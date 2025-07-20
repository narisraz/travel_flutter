import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/modules/auth/application/use_cases/login.dart';
import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';
import 'package:travel_flutter/modules/auth/infrastructure/repositories/api_auth_repository.dart';
import 'package:travel_flutter/modules/auth/presentation/notifiers/login_notifier.dart';

// Provider pour le repository d'authentification
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return ApiAuthRepository();
});

// Provider pour le cas d'usage de connexion
final loginUseCaseProvider = Provider<Login>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return Login(authRepository: authRepository);
});

// Provider pour gérer l'état de connexion
final loginStateProvider = StateNotifierProvider<LoginNotifier, LoginState>((
  ref,
) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  return LoginNotifier(loginUseCase);
});
