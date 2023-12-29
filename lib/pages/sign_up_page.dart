import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/bloc/bloc/auth_bloc.dart';
import 'package:toko_patu_app/models/sign_up_model.dart';
import 'package:toko_patu_app/routes/routes.dart';

import '../constant/theme.dart';
import '../widgets/item_form_widget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController fullNameC = TextEditingController(text: '');
  TextEditingController usernameC = TextEditingController(text: '');
  TextEditingController emailC = TextEditingController(text: '');
  TextEditingController passC = TextEditingController(text: '');

  bool validate() {
    if (fullNameC.text.isEmpty ||
        usernameC.text.isEmpty ||
        emailC.text.isEmpty ||
        passC.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Register and Happy Shoping',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  //form pass
                  ItemFormWidget(
                    iconUrl: 'assets/ic_name.png',
                    hint: 'Your Full Name',
                    controller: fullNameC,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Username',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  //form pass
                  ItemFormWidget(
                    iconUrl: 'assets/ic_username.png',
                    hint: 'Your Username',
                    controller: usernameC,
                  ),
                  const SizedBox(
                    height: 20,
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
                        context.read<AuthBloc>().add(
                              SignUpEvent(
                                SignUpModel(
                                    name: fullNameC.text,
                                    email: emailC.text,
                                    username: usernameC.text,
                                    password: passC.text),
                              ),
                            );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'name / email / username / password tidak dapat kosong'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 1),
                        ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthErrorRegister) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                duration: const Duration(seconds: 1),
                                content: Text(state.message),
                              ),
                            );
                          }

                          if (state is AuthSuccessRegister) {
                            context.goNamed(Routes.home);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 2),
                              content: Text(
                                'Success Register Welcome ${state.user.name}',
                                textAlign: TextAlign.center,
                              ),
                            ));
                          }
                        },
                        builder: (context, state) {
                          return state is AuthLoadingRegister
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: bgColor1,
                                  ),
                                )
                              : Text(
                                  'Sign Up',
                                  style: TextStyle(color: primaryTextColor),
                                );
                        },
                      ),
                    ),
                  ),
                ],
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
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.transparent),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Sign In',
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
    );
  }
}
