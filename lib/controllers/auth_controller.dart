// lib/controllers/auth_controller.dart
import 'package:faststyle_admin/api/address_api.dart';
import 'package:faststyle_admin/api/api.dart';
import 'package:faststyle_admin/models/address_model.dart';
import 'package:faststyle_admin/models/error_model.dart';
import 'package:flutter/material.dart';
import 'package:faststyle_admin/api/auth_api.dart';
import 'package:faststyle_admin/models/auth_model.dart';
import 'package:faststyle_admin/models/user_model.dart';
import 'package:faststyle_admin/models/brand_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  final AuthApi _authApi = AuthApi();
  AuthResponse? _authResponse;
  final AddressApi _addressApi = AddressApi();
  List<Address> _addresses = [];
  User? _user;
  String? _token;

  Brand? _brand;

  String? _errorMessage;

  AuthResponse? get authResponse => _authResponse;
  User? get user => _user;
  String? get token => _token;

  Brand? get brand => _brand;
  List<Address> get addresses => _addresses;

  String? get errorMessage => _errorMessage;

  Future<void> login(LoginRequest request) async {
    try {
      _authResponse = await _authApi.login(request);
      Api.token = _authResponse!.token;
      _token = _authResponse!.token;
      await _saveToken(_token!);
      await _saveUserEmail(_authResponse!.email);
      await _hydrateAuthData(_authResponse!.token);
      _errorMessage = null;
    } catch (e) {
      if (e is ErrorResponse) {
        _errorMessage = e.message ?? 'An error occurred';
      } else {
        _errorMessage = 'An unexpected error occurred';
      }
    }
    notifyListeners();
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    if (_token != null) {
      await _hydrateAuthData(_token!);
    }
  }

  Future<void> _hydrateAuthData(String token) async {
    print('Hydrating data...');
    try {
      _user = await _authApi.getUser();
      print('User data hydrated: ${_user!.name}');
      _addresses = await _addressApi.fetchAddresses();
      print('Addresses hydrated: ${_addresses.length}');
      _errorMessage = null;
    } on ErrorResponse catch (e) {
      _errorMessage = e.message;
      print('Error hydrating user data: $_errorMessage');
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
      print('Error hydrating user data: $_errorMessage');
    }
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_email');
    _user = null;
    _token = null;
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_token');
  }
}