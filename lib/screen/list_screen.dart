import 'package:flutter/material.dart';
import 'package:flutter_activity2/Models/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_activity2/screen/user_details.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<UserModel> userList = [];
  late List<UserModel> filteredUsers; // Declare filteredUsers as late

  @override
  void initState() {
    super.initState();
    filteredUsers = []; // Initialize filteredUsers here
    fetchUsers();
  }

//fetch users from API
  Future<void> fetchUsers() async {
    userList.clear();
    final response =
        await http.get(Uri.parse('http://192.168.1.211:3001/usergenerator'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      setState(() {
        filteredUsers = userList;
      });
    }
  }

  void filterUsers(String query) {
    setState(() {
      filteredUsers = userList
          .where((user) =>
              user.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: filteredUsers.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final userName = filteredUsers[index].name.toString();
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(userName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserDetails(user: filteredUsers[index]),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
