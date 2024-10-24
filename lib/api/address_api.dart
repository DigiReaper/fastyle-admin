// lib/api/address_api.dart
import 'package:dio/dio.dart';
import 'package:faststyle_admin/api/api.dart';
import 'package:faststyle_admin/models/address_model.dart';

class AddressApi {
  Future<List<Address>> fetchAddresses() async {
    final Response? response = await Api.get('users/addresses');
    if (response != null && response.statusCode == 200) {
      var data = response.data['data'];
      if (data is List) {
        return data.map((json) => Address.fromJson(json)).toList();
      } else if (data is Map<String, dynamic>) {
        return [Address.fromJson(data)];
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load addresses');
    }
  }

  Future<Address> addAddress(Map<String, dynamic> jsonData) async {
    final Response? response = await Api.post('users/addresses', jsonData);
    if (response != null && response.statusCode == 200) {
      return Address.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to add address');
    }
  }
}