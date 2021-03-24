import 'dart:convert';

import 'package:http/http.dart' as http;

//I know. It's so boilerplate and unefficient.

class ApiService {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        print("An error occured: Status code is ${response.statusCode}");
        return null;
      }
      responseJson = jsonDecode(response.body);
      return responseJson;
    } catch (e) {
      print("An error occured: ${e.toString()}");
    }
  }
}
