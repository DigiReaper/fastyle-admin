// lib/models/error_response.dart
class ErrorResponse {
  final String? status;
  final String? message;
  final List<ValidationError>? errors;

  ErrorResponse({this.status, this.message, this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    List<ValidationError>? errors;
    String? message = json['message'];
    String? status = json['status'];

    if (json['errors'] != null) {
      errors = (json['errors'] as List)
          .map((e) => ValidationError.fromJson(e))
          .toList();
      if (errors.isNotEmpty) {
        message = errors.map((e) => '${e.param}: ${e.msg}').join(', ');
        status = 'Unsuccessful';
      }
    }

    return ErrorResponse(
      status: status,
      message: message,
      errors: errors,
    );
  }
}

class ValidationError {
  final String value;
  final String msg;
  final String param;
  final String location;

  ValidationError({
    required this.value,
    required this.msg,
    required this.param,
    required this.location,
  });

  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      value: json['value'],
      msg: json['msg'],
      param: json['param'],
      location: json['location'],
    );
  }
}