import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/constant/theme.dart';
import 'package:toko_patu_app/routes/routes.dart';

import '../../bloc/auth/auth_bloc.dart';

class ProfilePge extends StatelessWidget {
  const ProfilePge({super.key});

  Widget header(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: bgColor1,
      ),
      child: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                children: [
                  Image.asset(
                    'assets/img_profile.png',
                    width: 64,
                    height: 64,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hallo, ${state.user.name}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '@alex',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(SignOutEvent(state.user));
                    },
                    child: BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccessLogout) {
                          context.goNamed(Routes.login);
                        }

                        if (state is AuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        }
                      },
                      child: Image.asset(
                        'assets/btn_exit.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                    IconButton(
                        onPressed: () {
                          context.goNamed(Routes.editProfile);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryTextColor,
                          size: 12,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Your Orders',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryTextColor,
                          size: 12,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Help',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryTextColor,
                          size: 12,
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Privacy & Policy',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryTextColor,
                          size: 12,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Terms of Service',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryTextColor,
                          size: 12,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Rate App',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryTextColor,
                          size: 12,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [header(context), content(context)],
    ));
  }
}
