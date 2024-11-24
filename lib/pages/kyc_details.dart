import 'package:flutter/material.dart';

class KycDetailsPage extends StatelessWidget {
  final String vendorName;

  KycDetailsPage({required this.vendorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KYC Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 400,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $vendorName', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Phone: +1234567890', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Email: vendor@example.com', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Brand Name: Vendor Brand', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Address: 123 Vendor Street, Vendor City', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('KYC Field 1: Some KYC Field Data', style: TextStyle(fontSize: 18)),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('KYC Doc 1', style: TextStyle(fontSize: 18)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {
                      // Handle download action for KYC Doc 1
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('KYC Doc 2', style: TextStyle(fontSize: 18)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {
                      // Handle download action for KYC Doc 2
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle accept action
                    },
                    child: Text('Accept', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showRejectDialog(context);
                    },
                    child: Text('Reject', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    TextEditingController remarksController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remarks', style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold)),
          content: TextField(
            controller: remarksController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your remarks',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle the remarks submission
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}