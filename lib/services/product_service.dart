import 'dart:convert';

import 'package:toko_patu_app/constant/url.dart';
import 'package:http/http.dart' as http;
import 'package:toko_patu_app/models/product_model.dart';

class ProductService {
  Future<Map<String, dynamic>> categoryProduct() async {
    try {
      Uri url = Uri.parse('$baseUrl/categories');

      final res = await http.get(url);

      if (res.statusCode == 200) {
        List data =
            (jsonDecode(res.body) as Map<String, dynamic>)['data']['data'];

        List<Category> listData = [];

        for (var element in data) {
          listData.add(Category.fromJson(element));
        }

        return {
          'error': false,
          'message': 'Berhasil get data',
          'data': listData,
        };
      }

      return {'error': true, 'message': 'Gagal get data'};
    } catch (e) {
      return {
        'error': true,
        'message': '$e',
      };
    }
  }

  Future<Map<String, dynamic>> getProduct() async {
    try {
      Uri url = Uri.parse('$baseUrl/products');

      final res = await http.get(url);

      if (res.statusCode == 200) {
        List data =
            (jsonDecode(res.body) as Map<String, dynamic>)['data']['data'];

        List<ProductModel> listProduct = [];

        for (var element in data) {
          listProduct.add(ProductModel.fromJson(element));
        }

        return {
          'error': false,
          'message': 'Berhasil get data',
          'data': listProduct
        };
      } else {
        return {'error': true, 'message': 'Gagal get data'};
      }
    } catch (e) {
      return {
        'error': true,
        'message': '$e',
      };
    }
  }
}
