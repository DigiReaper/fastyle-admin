// lib/controllers/product_controller.dart
import 'package:flutter/material.dart';
import 'package:faststyle_admin/api/product_api.dart';
import 'package:faststyle_admin/models/product.dart';
import 'package:faststyle_admin/models/error_model.dart';

class ProductController with ChangeNotifier {
  final ProductApi _productApi = ProductApi();
  List<Product> _products = [];
  String? _errorMessage;

  List<Product> get products => _products;
  String? get errorMessage => _errorMessage;

  Future<void> fetchVendorProducts() async {
    try {
      _products = await _productApi.fetchVendorProducts();
      _errorMessage = null;
    } on ErrorResponse catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    }
    notifyListeners();
  }

  Future<void> addProduct({
    required String title,
    required String description,
    required double price,
    required String category,
    required String brand,
    required int quantity,
    required String size,
    required String fabric,
    required String rreturn,
    required String imagePath,
  }) async {
    try {
      String imageUrl = await _productApi.uploadImage(imagePath);
      Map<String, dynamic> jsonData = {
        'title': title,
        'description': description,
        'price': price,
        'category': category,
        'brand': brand,
        'quantity': quantity,
        'size': size,
        'fabric': fabric,
        'rreturn': rreturn,
        'imageCover': imageUrl,
      };
      Product newProduct = await _productApi.addProduct(jsonData);
      _products.add(newProduct);
      _errorMessage = null;
    } on ErrorResponse catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    }
    notifyListeners();
  }
}
