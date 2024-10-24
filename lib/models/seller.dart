class Seller {
  final String name;
  final String shopName;
  final String city;
  final int numberOfOutlets;
  final int totalOrders;
  final int todaysOrders;
  final int yesterdaysOrders;

  Seller({
    required this.name,
    required this.shopName,
    required this.city,
    required this.numberOfOutlets,
    required this.totalOrders,
    required this.todaysOrders,
    required this.yesterdaysOrders,
  });

  @override
  String toString() {
    return 'Seller{name: $name, shopName: $shopName, city: $city, numberOfOutlets: $numberOfOutlets, totalOrders: $totalOrders, todaysOrders: $todaysOrders, yesterdaysOrders: $yesterdaysOrders}';
  }
}

Seller dummySeller = Seller(
  name: 'John Doe',
  shopName: 'Doe Mart',
  city: 'Hyderabad',
  numberOfOutlets: 32,
  totalOrders: 5000,
  todaysOrders: 150,
  yesterdaysOrders: 140,
);
