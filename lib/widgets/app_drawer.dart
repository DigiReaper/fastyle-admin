import 'package:flutter/material.dart';
//import 'package:faststyle_admin/pages/dashboard_page.dart';
import 'package:faststyle_admin/pages/uploadimage_page.dart';
import 'package:faststyle_admin/pages/brands_page.dart';
import 'package:faststyle_admin/pages/subcategories_page.dart';
import 'package:faststyle_admin/pages/categories_page.dart';
import 'package:faststyle_admin/pages/orders_page.dart';
import 'package:faststyle_admin/pages/users_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OrdersPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Vendors'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BrandsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.subdirectory_arrow_right),
            title: Text('Subcategories'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SubcategoriesPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Users'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UsersPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text('Upload Image'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UploadImgPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}