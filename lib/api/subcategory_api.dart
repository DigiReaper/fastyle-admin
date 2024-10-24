// lib/api/category_api.dart
import 'package:dio/dio.dart';
import 'package:faststyle_admin/models/category_model.dart';
import 'package:faststyle_admin/api/api.dart';
import 'package:faststyle_admin/models/sub_category_model.dart';

class SubCategoryApi {

  Future<List<SubCategory>> fetchCategories() async {
    final Response? response = await Api.get('subcategories');

    if (response != null && response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      return data.map((json) => SubCategory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}