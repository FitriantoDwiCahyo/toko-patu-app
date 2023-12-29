import 'dart:convert';

import 'package:toko_patu_app/constant/url.dart';
import 'package:toko_patu_app/models/sign_in_model.dart';
import 'package:http/http.dart' as http;
import 'package:toko_patu_app/models/sign_up_model.dart';
import 'package:toko_patu_app/models/user_model.dart';

class AuthProvider {
  Future<Map<String, dynamic>> login(SignInModel signInModel) async {
    try {
      Uri url = Uri.parse('$baseUrl/login');
      var headers = {'Content-Type': 'application/json'};
      final res = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'email': signInModel.email,
          'password': signInModel.password,
        }),
      );

      print(res.statusCode);

      if (res.statusCode != 200) {
        return {'error': true, 'message': '${res.statusCode}'};
      }

      var data = jsonDecode(res.body)['data'];
      // print(data['user']);
      User user = User.fromJson(data['user']);
      print(user);
      user.token = 'Bearer ${data['access_token']}';

      return {
        'error': false,
        'message': 'Berhasil login',
        'data': user,
      };
    } catch (e) {
      if (e is http.ClientException) {
        print('ClientException: ${e.message}');
        // Tambahkan penanganan lebih lanjut sesuai kebutuhan
      } else {
        print('Error: $e');
      }
      return {'error': true, 'message': '$e'};
    }
  }

  Future<Map<String, dynamic>> register(SignUpModel signUpModel) async {
    try {
      Uri url = Uri.parse('$baseUrl/register');
      var headers = {'Content-Type': 'application/json'};
      final res = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'name': signUpModel.name,
          'email': signUpModel.email,
          'username': signUpModel.username,
          'password': signUpModel.password,
        })
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body)['data'];

        User user = User.fromJson(data['user']);
        user.token = 'Bearer ${data['access_token']}';

        return {
          'error': false,
          'message': 'Berhasil get data',
          'data': user,
        };
      } else {
        return {'error': true, 'message': '${res.statusCode}'};
      }
    } catch (e) {
      return {
        'error': true,
        'message': '$e',
      };
    }
  }
}
