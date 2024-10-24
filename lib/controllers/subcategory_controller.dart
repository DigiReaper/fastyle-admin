// lib/controllers/category_controller.dart
import 'package:faststyle_admin/api/subcategory_api.dart';
import 'package:faststyle_admin/models/sub_category_model.dart';
import 'package:flutter/material.dart';

class SubCategoryController with ChangeNotifier {
  final SubCategoryApi _subcategoryApi = SubCategoryApi();
  List<SubCategory> _subcategories = [];
  String? _errorMessage;

  List<SubCategory> get subcategories => _subcategories;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCategories() async {
    try {
      _subcategories = await _subcategoryApi.fetchCategories();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}