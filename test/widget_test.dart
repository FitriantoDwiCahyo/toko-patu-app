// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:toko_patu_app/constant/url.dart';
import 'package:toko_patu_app/models/category_model.dart';
import 'package:toko_patu_app/models/product_model.dart';
import 'package:toko_patu_app/models/sign_in_model.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('http://sepatu-toko.test/api/products');

  final res = await http.get(url);

  List data = (jsonDecode(res.body) as Map<String, dynamic>)['data']['data'];

  List<ProductModel> listProduct = [];

  for (var element in data) {
    listProduct.add(ProductModel.fromJson(element));
  }

  for (var i = 0; i < listProduct.length; i++) {
    print(listProduct[i].galleries?[0].url);
  }
}
