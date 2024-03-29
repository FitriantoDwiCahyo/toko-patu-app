import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/bloc/product/product_bloc.dart';
import 'package:toko_patu_app/routes/routes.dart';

import '../bloc/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.goNamed(Routes.home);
            // print("Dispatching ShowCategoryEvent.");
            // context.read<ProductBloc>().add(ShowCategoryEvent());

            // print("Dispatching ShowProductEvent.");
            // context.read<ProductBloc>().add(ShowProductEvent());
          }

          if (state is AuthErrorCredential) {
            Future.delayed(Duration(seconds: 2), () {
              context.goNamed(Routes.login);
            });
          }
        },
        child: Center(
          child: Image.asset(
            'assets/img_splash.png',
            height: 150,
            width: 130,
          ),
        ),
      ),
    );
  }
}
