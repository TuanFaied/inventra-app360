import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/user.dart';

class ApiService {
  final Dio _dio;

  ApiService._(this._dio);

  static Future<ApiService> create() async {
    await dotenv.load(fileName: ".env");
    final String baseUrl = dotenv.env['BASE_URL'] ?? '';
    final String customToken = dotenv.env['CUSTOM_TOKEN'] ?? '';

    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'CustomToken': customToken,
          'Content-Type': 'application/json',
        },
      ),
    );

    return ApiService._(dio);
  }

  Future<Map<String, dynamic>> login(String userName, String password) async {
    try {
      final response = await _dio.post(
        'login',
        data: jsonEncode({
          'userName': userName,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login');
      }
    // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw Exception('Failed to login: ${e.response?.statusCode} ${e.response?.statusMessage}');
    }
  }
}
