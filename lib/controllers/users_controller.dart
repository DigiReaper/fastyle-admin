// lib/controllers/users_controller.dart
import 'package:faststyle_admin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:faststyle_admin/api/users_api.dart';

class UsersController with ChangeNotifier {
  final UsersApi _usersApi = UsersApi();
  List<User> _users = [];
  String? _errorMessage;
  int _currentPage = 1;
  int _limit = 10;
  int _numberOfPages = 1;
  int? _nextPage;
  int _resultsCount = 0;

  List<User> get users => _users;
  String? get errorMessage => _errorMessage;
  int get currentPage => _currentPage;
  int get limit => _limit;
  int get numberOfPages => _numberOfPages;
  int? get nextPage => _nextPage;
  int get resultsCount => _resultsCount;

  Future<void> fetchUsers(String role, {int page = 1, int limit = 10}) async {
    try {
      final response = await _usersApi.getUsers(role, page: page, limit: limit);
      _users = (response['data']['users'] as List).map((json) => User.fromJson(json)).toList();
      _currentPage = response['pagination']['currentPage'];
      _limit = response['pagination']['limit'];
      _numberOfPages = response['pagination']['numberOfPages'];
      _nextPage = response['pagination'].containsKey('next') ? response['pagination']['next'] : null;
      _resultsCount = response['results'];
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}