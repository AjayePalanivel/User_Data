import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/details_screen.dart';
import 'package:test/userData_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserDataModel> userData = [];
  late TextEditingController nameController;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    getUserData();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  Future<void> getUserData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      setState(() {
        userData = dataList.map((e) => UserDataModel.fromMap(e)).toList();
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(data: userData[index])));
          },
          child: ListTile(
            title: Text(userData[index].name),
            subtitle: Text(userData[index].email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    openDialog(
                      userData: userData[index],
                      nameController: nameController,
                      emailController: emailController,
                      onSave: () {
                        setState(() {
                          userData[index].name = nameController.text;
                          userData[index].email = emailController.text;
                          Navigator.of(context).pop();
                        });
                      },
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      userData.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openDialog({
    required UserDataModel userData,
    required VoidCallback onSave,
    required TextEditingController nameController,
    required TextEditingController emailController,
  }) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Edit User'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                        controller: nameController,
                        decoration: const InputDecoration(label: Text('Name'))),
                    TextField(
                        controller: emailController,
                        decoration:
                            const InputDecoration(label: Text('Email'))),
                  ],
                ),
                actions: [
                  TextButton(onPressed: onSave, child: const Text('Save')),
                ],
              ));
}
