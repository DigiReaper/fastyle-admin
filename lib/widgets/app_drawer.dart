import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onPageSelected;

  AppDrawer({required this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
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
              onPageSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Vendors'),
            onTap: () {
              onPageSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () {
              onPageSelected(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.subdirectory_arrow_right),
            title: Text('Subcategories'),
            onTap: () {
              onPageSelected(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Users'),
            onTap: () {
              onPageSelected(4);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text('Upload Image'),
            onTap: () {
              onPageSelected(5);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
