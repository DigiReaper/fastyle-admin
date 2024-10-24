// lib/models/auth_model.dart
class SignupRequest {
  final String name;
  final String email;
  final String password;
  final String passConfirm;
  final String role;

  SignupRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.passConfirm,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'passConfirm': passConfirm,
        'role': role,
      };
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

// lib/models/auth_model.dart
class AuthResponse {
  final String id;
  final String fullName;
  final String email;
  final String token;

  AuthResponse({
    required this.id,
    required this.fullName,
    required this.email,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      id: json['data']['id'],
      fullName: json['data']['fullName'],
      email: json['data']['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'token': token,
    };
  }
}

