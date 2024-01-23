import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/bloc/auth/auth_bloc.dart';
import 'package:toko_patu_app/constant/theme.dart';
import 'package:toko_patu_app/models/sign_in_model.dart';
import 'package:toko_patu_app/routes/routes.dart';
import 'package:toko_patu_app/widgets/item_form_widget.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  LoginPage({super.key});

  final TextEditingController emailC = TextEditingController(text: '');
  final TextEditingController passC = TextEditingController(text: '');

  bool validate() {
    if (emailC.text.isEmpty || passC.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authB = context.read<AuthBloc>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Sign In to Continue',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Text(
                        'Email Address',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //form email
                      ItemFormWidget(
                        iconUrl: 'assets/ic_email.png',
                        hint: 'Your Email Address',
                        controller: emailC,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      //form pass
                      ItemFormWidget(
                        iconUrl: 'assets/ic_pass.png',
                        hint: 'Your Password',
                        controller: passC,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (validate()) {
                            authB.add(
                              SignInEvent(
                                SignInModel(
                                    email: emailC.text, password: passC.text),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Tidak dapat kosong',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is AuthError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                  ),
                                );
                              }

                              if (state is AuthSuccess) {
                                context.goNamed(Routes.home);
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 1),
                                    content: Text(
                                      'Welcome ${state.user.name}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return state is AuthLoading
                                  ? Container(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: bgColor1,
                                      ))
                                  : Text(
                                      'Sign In',
                                      style: TextStyle(color: primaryTextColor),
                                    );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      context.goNamed(Routes.signUp);
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
