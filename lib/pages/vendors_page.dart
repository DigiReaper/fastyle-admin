// lib/pages/vendors_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:faststyle_admin/controllers/users_controller.dart';
import 'package:faststyle_admin/models/user_model.dart';

class VendorsPage extends StatefulWidget {
  @override
  _VendorsPageState createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  @override
  void initState() {
    super.initState();
    _fetchVendors();
  }

  Future<void> _fetchVendors() async {
    final usersController = Provider.of<UsersController>(context, listen: false);
    await usersController.fetchUsers('vendor');
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors'),
      ),
      body: Consumer<UsersController>(
        builder: (context, usersController, child) {
          if (usersController.errorMessage != null) {
            return Center(
              child: Text('Error: ${usersController.errorMessage}'),
            );
          }

          if (usersController.users.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: usersController.users.length,
            itemBuilder: (context, index) {
              final User user = usersController.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: Text(user.id),
              );
            },
          );
        },
      ),
    );
  }
}