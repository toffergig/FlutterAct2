import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_activity2/Models/user_model.dart';

class UserApiClient {

  final http.Client client;

  UserApiClient({required this.client});

  Future<List<UserModel>> fetchUsers() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      List<UserModel> userList = [];
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
