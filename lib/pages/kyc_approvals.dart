import 'package:flutter/material.dart';
import 'kyc_details.dart';

class KycApprovalsPage extends StatelessWidget {
  final List<String> vendors = [
    'Vendor 1',
    'Vendor 2',
    'Vendor 3',
    'Vendor 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: vendors.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
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
              child: ListTile(
                title: Text(vendors[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          KycDetailsPage(vendorName: vendors[index]),
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
