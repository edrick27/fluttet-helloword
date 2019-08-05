import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  void login() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      print(json.decode(response.body)); 
    } 
  }
}
