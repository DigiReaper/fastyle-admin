// lib/api/category_api.dart
import 'package:dio/dio.dart';
import 'package:faststyle_admin/models/category_model.dart';
import 'package:faststyle_admin/api/api.dart';

class CategoryApi {

  Future<List<Category>> fetchCategories() async {
    final Response? response = await Api.get('categories');

    if (response != null && response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}