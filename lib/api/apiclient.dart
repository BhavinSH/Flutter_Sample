import 'dart:convert';

import 'package:flutterapp/model/user.dart';
import 'package:http/http.dart' as http;

class APIClient {
  Future<List<User>> getUserList() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      List<User> userList = createUserList(responseJson);
      return userList;
    }
  }

  List<User> createUserList(List responseJson) {
    List<User> list = new List();
    for (int i = 0; i < responseJson.length; i++) {
      String name = responseJson[i]["name"];
      String email = responseJson[i]["email"];
      User user = new User(name, email);
      list.add(user);
    }
    return list;
  }
}
