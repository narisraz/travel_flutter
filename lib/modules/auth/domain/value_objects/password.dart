import 'package:travel_flutter/modules/auth/domain/errors/invalid_password_error.dart';

class Password {
  final String value;

  Password({required this.value}) {
    if (value.length < 8) {
      throw InvalidPasswordError();
    }
  }
}
