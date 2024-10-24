import 'dart:convert';
import 'package:dio/dio.dart';

class Api {
  static const String baseUrl = 'http://localhost/api/v1/';

  static final Dio dio = Dio();
  static String? token;

  static void initialize() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (token != null && !options.path.contains('auth')) {
          print('Adding token $token to request');
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
  }

  static Future<Response?> post(String endpoint, Map<String, dynamic> data) async {
    final url = '$baseUrl$endpoint';
    try {
      print('POST Request to $url with data: ${data} ');

      final response = await dio.post(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode(data),
      );
      print(response.data);
      return response;
    } catch (e) {
      if (e is DioException) {
        // Handle DioException separately if needed
        print("API Response: ${e.response?.data}");
        return e.response;
      } else {
        // Handle other types of exceptions
        print("Unexpected Error: $e");
        return null;
      }
    }
  }

  static Future<Response?> postFormData(String endpoint, FormData formData) async {
    final url = '$baseUrl$endpoint';
    print('POST FormData Request to $url with data: ${formData.fields} ');
    try {
      final response = await dio.post(
        url,
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      print(response.data);
      return response;
    } catch (e) {
      if (e is DioException) {
        // Handle DioException separately if needed
        print("API Response: ${e.response?.data}");
        return e.response;
      } else {
        // Handle other types of exceptions
        print("Unexpected Error: $e");
        return null;
      }
    }
  }

  static Future<Response?> put(String endpoint, Map<String, dynamic> data) async {
    final url = '$baseUrl$endpoint';
    try {
      final response = await dio.put(
        url,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode(data),
      );
      print(response.data);
      return response;
    } catch (e) {
      if (e is DioException) {
        // Handle DioException separately if needed
        print("API Response: ${e.response?.data}");
        return e.response;
      } else {
        // Handle other types of exceptions
        print("Unexpected Error: $e");
        return null;
      }
    }
  }

  static Future<Response?> get(String endpoint, {Map<String, dynamic>? params}) async {
    final url = '$baseUrl$endpoint';
    print('GET Request to $url');
    try {
      final response = await dio.get(
        url,
        queryParameters: params,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      return response;
    } catch (e) {
      if (e is DioException) {
        // Handle DioException separately if needed
        print("API Response: ${e.response?.data}");
        return e.response;
      } else {
        // Handle other types of exceptions
        print("Unexpected Error: $e");
        return null;
      }
    }
  }

  static Future<Response?> delete(String endpoint, {Map<String, dynamic>? params}) async {
    final url = '$baseUrl$endpoint';
    try {
      final response = await dio.delete(
        url,
        queryParameters: params,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      return response;
    } catch (e) {
      if (e is DioException) {
        // Handle DioException separately if needed
        print("API Response: ${e.response?.data}");
        return e.response;
      } else {
        // Handle other types of exceptions
        print("Unexpected Error: $e");
        return null;
      }
    }
  }
}