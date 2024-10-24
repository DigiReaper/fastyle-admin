// lib/api/auth_api.dart
import 'package:faststyle_admin/api/api.dart';
import 'package:faststyle_admin/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:faststyle_admin/models/brand_model.dart';
import 'package:faststyle_admin/models/error_model.dart';
import 'package:faststyle_admin/models/user_model.dart';

class AuthApi {

  Future<AuthResponse> login(LoginRequest request) async {
    print('Login request: ${request.toJson()}');
    final Response? response = await Api.post(
      'auth/login',
      request.toJson(),
    );

    if (response != null && response.statusCode == 200) {
      print('Login response: ${response.data}');
      return AuthResponse.fromJson(response.data);
    } else {
      print('Login error: ${response?.data}');
      if (response != null && response.data != null) {
        throw ErrorResponse.fromJson(response.data);
      } else {
        throw Exception('Unexpected error occurred');
      }
    }
  }

  

  Future<User> getUser() async {
    final Response? response = await Api.get(
      'users/get-me',
    );

    if (response != null && response.statusCode == 200) {
      return User.fromJson(response.data['data']['user']);
    } else {
      throw ErrorResponse.fromJson(response?.data ?? {});
    }
  }

}
