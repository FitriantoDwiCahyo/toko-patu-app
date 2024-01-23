import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/models/user_model.dart';
import 'package:toko_patu_app/pages/checkout_detail_page.dart';
import 'package:toko_patu_app/pages/checkout_success_page.dart';
import 'package:toko_patu_app/pages/detail_chat_page.dart';
import 'package:toko_patu_app/pages/edit_profile_page.dart';
import 'package:toko_patu_app/pages/home/main_page.dart';
import 'package:toko_patu_app/pages/product_page.dart';
import 'package:toko_patu_app/pages/sign_up_page.dart';

import '../bloc/auth/auth_bloc.dart';
import '../pages/login_page.dart';
import '../pages/splash_page.dart';

part 'route_name.dart';

final router = GoRouter(
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
        GoRoute(
            path: 'home',
            name: Routes.home,
            builder: (context, state) => MainPage(),
            routes: [
              GoRoute(
                path: 'detail-chat',
                name: Routes.detailChat,
                builder: (context, state) => DetailChatPage(),
              ),
              GoRoute(
                path: 'edit-profile',
                name: Routes.editProfile,
                builder: (context, state) => EditProfilePage(),
              ),
              GoRoute(
                path: 'product',
                name: Routes.product,
                builder: (context, state) => ProductPage(),
              ),
              GoRoute(
                  path: 'detail-checkout',
                  name: Routes.detailCheckout,
                  builder: (context, state) => CheckoutDetailPage(),
                  routes: [
                    GoRoute(
                      path: 'success-checkout',
                      name: Routes.successCheckout,
                      builder: (context, state) => CheckoutSuccessPage(),
                    ),
                  ]),
            ]),
      ],
    ),
  ],
);
