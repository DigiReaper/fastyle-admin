import 'package:flutter/material.dart';
import 'package:faststyle_admin/widgets/app_drawer.dart';

class UploadImgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Upload your image here'),
      ),
    );
  }
}