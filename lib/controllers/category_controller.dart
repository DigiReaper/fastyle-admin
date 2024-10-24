// lib/controllers/category_controller.dart
import 'package:flutter/material.dart';
import 'package:faststyle_admin/api/category_api.dart';
import 'package:faststyle_admin/models/category_model.dart';

class CategoryController with ChangeNotifier {
  final CategoryApi _categoryApi = CategoryApi();
  List<Category> _categories = [];
  String? _errorMessage;

  List<Category> get categories => _categories;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCategories() async {
    try {
      _categories = await _categoryApi.fetchCategories();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}