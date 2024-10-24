// lib/models/user_model.dart
class User {
  final String id;
  final String name;
  final String email;
  final bool active;
  final String role;
  final List<dynamic> favorites;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.active,
    required this.role,
    required this.favorites,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      active: json['active'],
      role: json['role'],
      favorites: json['favorites'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}