import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Option<String>> login({
    required String email,
    required String password,
  });
}
