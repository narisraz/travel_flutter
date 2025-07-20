import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_flutter/modules/auth/application/use_cases/login.dart';
import 'package:travel_flutter/modules/auth/domain/repositories/auth_repository.dart';
import 'package:travel_flutter/modules/auth/infrastructure/repositories/api_auth_repository.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => ApiAuthRepository();

@riverpod
Login loginUseCase(Ref ref) =>
    Login(authRepository: ref.read(authRepositoryProvider));
