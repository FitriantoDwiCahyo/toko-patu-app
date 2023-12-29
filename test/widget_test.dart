// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:toko_patu_app/models/sign_in_model.dart';
import 'package:toko_patu_app/providers/auth_provider.dart';

void main() async {
  AuthProvider authService = AuthProvider();

  print(await authService.login(SignInModel(email: 'rian@gmail.com', password: '12345678')));
}
