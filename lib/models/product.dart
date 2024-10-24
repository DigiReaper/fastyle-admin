// lib/models/product.dart
class Product {
  final String id;
  final String title;
  final String brand;
  final String slug;
  final String description;
  final String? size;
  final String? fabric;
  final String? rreturn; 
  
  final int quantity;
  final int? sold;
  final double price;
  final int? discount;
  final List<String>? colors;
  final List<String>? images;
  final String imageCover;
  final String category;
  final List<String>? subcategories;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final String? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool? inStock;
  bool? isReturnable;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.slug,
    required this.description,
    required this.quantity,
    this.sold,
    required this.price,
    this.discount,
    this.colors,
    this.images,
    required this.imageCover,
    required this.category,
    this.subcategories,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.inStock,
    this.isReturnable,
    this.size,
    this.fabric,
    this.rreturn,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      brand: json['brand'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] ?? 0,
      sold: json['sold'],
      price: json['price'] is int ? (json['price'] as int).toDouble() : (json['price'] ?? 0.0),
      discount: json['discount'],
      colors: json['colors'] != null ? List<String>.from(json['colors']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      imageCover: json['imageCover'] != null ? json['imageCover'] : "http://13.233.13.1/products/1727973226557-604808376.jpeg",
      category: json['category'] is Map<String, dynamic> ? json['category']['_id'] ?? '' : '',      subcategories: json['subcategories'] != null ? List<String>.from(json['subcategories']) : null,
      ratingsAverage: json['ratingsAverage'] is int
          ? (json['ratingsAverage'] as int).toDouble()
          : (json['ratingsAverage'] ?? 0.0),
      ratingsQuantity: json['ratingsQuantity'],
      user: json['user'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      inStock: json['inStock'],
      isReturnable: json['isReturnable'],
      size: json['size'],
      fabric: json['fabric'],
      rreturn: json['return'],
    );
  }
}