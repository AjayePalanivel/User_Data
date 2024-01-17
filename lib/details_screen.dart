import 'package:flutter/material.dart';
import 'package:test/userData_model.dart';

class DetailsPage extends StatelessWidget {
  final UserDataModel data;
  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name : ${data.name}"),
            const SizedBox(height: 10),
            Text("Email : ${data.email}"),
            const SizedBox(height: 10),
            Text("Mobile No : ${data.phone}"),
            const SizedBox(height: 10),
            Text("Website : ${data.website}"),
            const SizedBox(height: 10),
            const Text("Address :"),
            Text("Street : ${data.address.street}"),
            Text("Suite : ${data.address.suite}"),
            Text("City : ${data.address.city}"),
            Text("Zipcode : ${data.address.zipcode}"),
          ],
        ),
      ),
    );
  }
}
