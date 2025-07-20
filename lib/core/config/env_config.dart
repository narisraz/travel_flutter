import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiHost =>
      dotenv.env['API_HOST'] ?? 'http://localhost:3030';

  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
  }
}
