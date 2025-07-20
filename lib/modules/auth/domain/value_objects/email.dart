import 'package:travel_flutter/modules/auth/domain/errors/invalid_email_error.dart';

class Email {
  final String value;

  Email({required this.value}) {
    if (!value.contains('@')) {
      throw InvalidEmailError();
    }
  }
}
