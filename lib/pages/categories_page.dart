import 'package:flutter/material.dart';
import 'package:faststyle_admin/widgets/app_drawer.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'This is the Categories Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}