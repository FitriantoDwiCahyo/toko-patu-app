import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:toko_patu_app/constant/url.dart';
import 'package:toko_patu_app/models/sign_in_model.dart';
import 'package:http/http.dart' as http;
import 'package:toko_patu_app/models/sign_up_model.dart';
import 'package:toko_patu_app/models/user_model.dart';

class AuthService {
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
      user.token = 'Bearer ${data['access_token']}';
      user.password = signInModel.password;
      await storeCredentialToLocal(user);

      print(user.token);
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
      final res = await http.post(url,
          headers: headers,
          body: jsonEncode({
            'name': signUpModel.name,
            'email': signUpModel.email,
            'username': signUpModel.username,
            'password': signUpModel.password,
          }));
          
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

  Future<Map<String, dynamic>> logout(User user) async {
    try {
      final url = Uri.parse('$baseUrl/logout');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': user.token
      };

      final res = await http.post(url, headers: headers);

      String token = '';

      if (res.statusCode == 200) {
        const storage = FlutterSecureStorage();
        storage.deleteAll();

        return {'error': false, 'message': 'Success sign out'};
      } else {
        return {'error': true, 'message': 'Sign out error'};
      }
    } catch (e) {
      return {
        'error': true,
        'message': '$e',
      };
    }
  }

  Future<void> storeCredentialToLocal(User user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, dynamic> values = await storage.readAll();
      print(values);
      if (values['email'] != null || values['password'] != null) {
        final SignInModel data =
            SignInModel(email: values['email'], password: values['password']);
        print(data);
        return {
          'error': false,
          'message': 'Success get credential',
          'data': data,
        };
      } else {
        print('error');
        return {'error': true, 'message': 'credential error'};
      }
    } catch (e) {
      return {
        'error': true,
        'message': '$e',
      };
    }
  }
}
