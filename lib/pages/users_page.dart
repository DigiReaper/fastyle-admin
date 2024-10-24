import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Users Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

