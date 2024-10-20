import 'package:flutter/material.dart';
import 'package:faststyle_admin/widgets/app_drawer.dart';

class BrandsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands Page'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Welcome to the Brands Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}