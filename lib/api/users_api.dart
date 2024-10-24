// lib/api/users_api.dart
import 'package:faststyle_admin/api/api.dart';
import 'package:faststyle_admin/models/user_model.dart';
import 'package:dio/dio.dart';

class UsersApi {
  Future<Map<String, dynamic>> getUsers(String role, {int page = 1, int limit = 10}) async {
    final Response? response = await Api.get('users?role=$role&page=$page&limit=$limit');
    if (response != null && response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load users');
    }
  }
}