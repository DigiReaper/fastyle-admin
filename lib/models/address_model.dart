// lib/models/address_model.dart
class Address {
  final String details;
  final String alias;
  final String city;
  final int phone;
  final int postalCode;

  Address({
    required this.details,
    required this.alias,
    required this.city,
    required this.phone,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      details: json['details'],
      alias: json['alias'],
      city: json['city'],
      phone: json['phone'],
      postalCode: json['postalCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details,
      'alias': alias,
      'city': city,
      'phone': phone,
      'postalCode': postalCode,
    };
  }
}