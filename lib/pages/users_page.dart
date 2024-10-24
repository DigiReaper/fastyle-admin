// lib/pages/users_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:faststyle_admin/controllers/users_controller.dart';
import 'package:faststyle_admin/models/user_model.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final usersController = Provider.of<UsersController>(context, listen: false);
    await usersController.fetchUsers('user');
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
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