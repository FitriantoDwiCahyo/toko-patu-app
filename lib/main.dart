import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_patu_app/bloc/auth/auth_bloc.dart';
import 'package:toko_patu_app/bloc/product/product_bloc.dart';
import 'package:toko_patu_app/constant/theme.dart';

import 'routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUserEvent()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: darkMode,
      ),
    );
  }
}
