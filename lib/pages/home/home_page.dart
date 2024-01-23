import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/constant/theme.dart';
import 'package:toko_patu_app/models/product_model.dart';
import 'package:toko_patu_app/routes/routes.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/product/product_bloc.dart';
import '../../models/user_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/img_profile.png'))
                ],
              );
            }

            return Container();
          }),
          const SizedBox(
            height: 30,
          ),
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.05),
            child: BlocBuilder<ProductBloc, ProductState>(
              bloc: ProductBloc()..add(ShowCategoryEvent()),
              builder: (context, state) {
                if (state is ProductError) {
                  return Text(state.message);
                }

                if (state is ProductCategorySuccess) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // reverse: true,
                    itemBuilder: (context, index) {
                      final reversed = state.data.reversed.toList();
                      Category product = reversed[index];
                      return Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: index == 0
                            ? BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              )
                            : BoxDecoration(
                                border: Border.all(
                                    color: secondaryTextColor, width: 0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                        child: Center(
                          child: Text(
                            '${product.name}',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: index == 0
                                        ? primaryTextColor
                                        : secondaryTextColor),
                          ),
                        ),
                      );
                    },
                    itemCount: state.data.length,
                  );
                }

                return Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Popular Products',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.32),
            child: BlocBuilder<ProductBloc, ProductState>(
              bloc: ProductBloc()..add(ShowProductEvent()),
              builder: (context, state) {
                if (state is ProductError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is ProductSuccess) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      ProductModel product = state.product[index];
                      // print(product.galleries![0].url);
                      return InkWell(
                        onTap: () {
                          context.goNamed(Routes.product);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            color: primaryTextColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                // if (product.galleries![0].url != null)
                                //   Image.network(
                                //     '${product.galleries![0].url}',
                                //     height: 150,
                                //     width: 215,
                                //     fit: BoxFit.cover,
                                //   ),
                                Image.asset(
                                  'assets/img_shoes.png',
                                  height: 150,
                                  width: 215,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${product.category!.name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                                color: secondaryTextColor),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '${product.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color: bgColor1, fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '\$,67',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: priceColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: state.product.length,
                  );
                }

                return Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'New Arrivals',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/img_shoes.png',
                          fit: BoxFit.fill,
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Football',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: secondaryTextColor),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Predator 20.3 FirmGround',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              '\$58,67',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: priceColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    ));
  }
}
