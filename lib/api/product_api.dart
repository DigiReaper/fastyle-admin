// lib/api/product_api.dart
import 'package:dio/dio.dart';
import 'package:faststyle_admin/models/product.dart';
import 'package:faststyle_admin/api/api.dart';
import 'package:faststyle_admin/models/error_model.dart';

class ProductApi {
  Future<List<Product>> fetchVendorProducts() async {
    final Response? response = await Api.get('products/vendor');
    if (response != null && response.statusCode == 200) {
      List<dynamic> data = response.data['data']['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw ErrorResponse.fromJson(response?.data ?? {});
    }
  }

  Future<Product> addProduct(Map<String, dynamic> jsonData) async {
    print('Adding product: $jsonData');
    final Response? response = await Api.post('products', jsonData);
    print('Response: ${response?.data}');
    if (response != null && response.statusCode == 201) {
      return Product.fromJson(response.data['data']);
    } else {
      throw ErrorResponse.fromJson(response?.data ?? {});
    }
  }

    Future<String> uploadImage(String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });
    final Response? response = await Api.postFormData('upload', formData);
    if (response != null && response.statusCode == 200) {
      return response.data['data']['url'];
    } else {
      throw ErrorResponse.fromJson(response?.data ?? {});
    }
  }

}