import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl = 'http://192.168.100.145:8080';

  Future<int> login(String username, String password) async {
    final credentials = base64Encode(utf8.encode('$username:$password'));
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Basic $credentials'},
    );

    return response.statusCode;
  }
}
