import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall {
  Future<http.Response?> getData(String link) async {
    http.Response response = await http.get(Uri.parse(link));
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      return response;
    }
    return null;
  }

  Map<String, dynamic>? decodeJson(http.Response response) {
    try {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
