import 'package:flutter/material.dart';
import 'package:faststyle_admin/widgets/app_drawer.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}