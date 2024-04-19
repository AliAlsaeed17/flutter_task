import 'dart:convert';
import 'package:flutter_task/core/classes/exceptions.dart';
import 'package:flutter_task/core/network/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ProductsRemoteDataSource {
  Future<dynamic> getProducts({required int skip}) async {
    final http.Response response = await http
        .get(Uri.parse('${ApiEndpoints.products}?limit=10&skip=$skip'));
    print(response);
    try {
      var data = json.decode(response.body);
      return data;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
