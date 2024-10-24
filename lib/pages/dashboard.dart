import 'package:faststyle_admin/pages/orders_page.dart';
import 'package:faststyle_admin/pages/users_page.dart';
import 'package:faststyle_admin/pages/vendors_page.dart';
import 'package:flutter/material.dart';
import 'package:faststyle_admin/widgets/app_drawer.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    OrdersPage(),
    VendorsPage(),
    OrdersPage(),
    OrdersPage(),
    UsersPage(),
    OrdersPage(),
  ];

  final List<String> _titles = <String>[
    'Orders',
    'Vendors',
    'Categories',
    'Sub Categories',
    'Users',
    'Upload Image',
  ];

  void _onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: AppDrawer(onPageSelected: _onPageSelected),
      body: _pages[_selectedIndex],
    );
  }
}
