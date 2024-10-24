// lib/main.dart
import 'package:faststyle_admin/api/api.dart';
import 'package:faststyle_admin/controllers/address_controller.dart';
import 'package:faststyle_admin/controllers/auth_controller.dart';
import 'package:faststyle_admin/controllers/category_controller.dart';
import 'package:faststyle_admin/controllers/product_controller.dart';
import 'package:faststyle_admin/controllers/subcategory_controller.dart';
import 'package:faststyle_admin/controllers/users_controller.dart';
import 'package:faststyle_admin/pages/dashboard.dart';
import 'package:faststyle_admin/pages/login_page.dart';
import 'package:faststyle_admin/pages/orders_page.dart';
import 'package:faststyle_admin/pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Api.initialize();
  final bool isLoggedIn = await checkLoginStatus();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => UsersController()),
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => SubCategoryController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => AddressController()),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

Future<bool> checkLoginStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('auth_token');
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastStyle Admin',
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/dashboard' : '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/users': (context) => UsersPage(),
        '/orders': (context) => OrdersPage(),
      },
    );
  }
}