import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';
import 'config.dart';

class Api {
  static var client = http.Client();
  static Future<List<Model>?> getproducts() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(config.URL, config.Product_URl);

    var response = await client.get(url, headers: requestHeaders);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return productsFromJson(data);
    }
  }
}
