// lib/pages/login_page.dart
import 'package:faststyle_admin/controllers/auth_controller.dart';
import 'package:faststyle_admin/models/auth_model.dart';
import 'package:faststyle_admin/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Set the background color here
      body: Center(
        child: Container(
          width: 400,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Container color
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black26, // Shadow color
                blurRadius: 10.0, // Shadow blur radius
                offset: Offset(0, 5), // Shadow offset
              ),
            ],
            border: Border.all(
              color: Colors.grey, // Border color
              width: 1.0, // Border width
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Make the column height adaptable
            children: [
              Image.asset(
                'assets/images/fastyle_icon.png',
                height: 130,
              ), // Corrected image asset path
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'UserName',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final authController =
                      Provider.of<AuthController>(context, listen: false);
                  try {
                    await authController.login(LoginRequest(
                        email: _usernameController.text,
                        password: _passwordController.text));
                    if (authController.authResponse == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Login failed: ${authController.errorMessage}',
                          ),
                        ),
                      );
                      return;
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login failed: $e')),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
