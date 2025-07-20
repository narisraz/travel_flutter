import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fpdart/fpdart.dart';
import '../config/env_config.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  Uri get _baseUri => Uri.parse(EnvConfig.apiHost);

  Uri buildUri(String endpoint) {
    return _baseUri.resolve(endpoint);
  }

  Future<Either<String, Map<String, dynamic>>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = buildUri(endpoint);
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json', ...?headers},
        body: body != null ? jsonEncode(body) : null,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Right(data);
      } else {
        return Left('Erreur HTTP: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Erreur de connexion: $e');
    }
  }
}
