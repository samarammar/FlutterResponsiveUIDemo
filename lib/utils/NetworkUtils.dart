import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';

class NetworkUtils{

  static Future<LoginModel> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
        print(response.body);
        print(statusCode);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return LoginModel.fromJson(json.decode(response.body));
    });
  }
}