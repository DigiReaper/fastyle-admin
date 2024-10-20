import 'package:flutter/material.dart';
import 'package:faststyle_admin/widgets/app_drawer.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Page'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('This is the Orders Page'),
      ),
    );
  }
}