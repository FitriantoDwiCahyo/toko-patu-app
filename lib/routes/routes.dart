import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/pages/home/main_page.dart';
import 'package:toko_patu_app/pages/sign_up_page.dart';

import '../bloc/bloc/auth_bloc.dart';
import '../pages/login_page.dart';
import '../pages/splash_page.dart';

part 'route_name.dart';

final router = GoRouter(
  // redirect: (context, state) {
  //   return '/';
  // },
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splash,
      builder: (context, state) {
        return SplashPage();
      },
    ),
    GoRoute(
      path: '/login',
      name: Routes.login,
      builder: (context, state) => LoginPage(),
      routes: [
        GoRoute(
          path: 'sign-up',
          name: Routes.signUp,
          builder: (context, state) {
            return SignUpPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: Routes.home,
      builder: (context, state) {
        return MainPage();
      },
    ),
  ],
);
