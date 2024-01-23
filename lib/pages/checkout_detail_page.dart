import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/constant/theme.dart';
import 'package:toko_patu_app/routes/routes.dart';

class CheckoutDetailPage extends StatelessWidget {
  const CheckoutDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Detail',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18)),
        iconTheme: IconThemeData(color: primaryTextColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Text(
            'List Items',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: bgColor4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/img_shoes.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Terrex Urban Low',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              '\$143,98',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: priceColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    '2 Items',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/ic_store_loc.png',
                          width: 40,
                          height: 40,
                        ),
                        Image.asset(
                          'assets/ic_lane.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/ic_your_loc.png',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Store Location',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              'Adidas Core',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: primaryTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Column(
                          children: [
                            Text(
                              'Your Address',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              'Marsemoon',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: primaryTextColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '2 Items',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),

                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '\$56.98',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),

                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Free',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    
                  ],
                ),
                const SizedBox(height: 12,),
                Divider(thickness: 1,color: Colors.grey,),
                 const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: priceColor),
                    ),
                    Text(
                      'Free',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: priceColor),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          onPressed: () {
            context.goNamed(Routes.successCheckout);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Text(
              'Checkout Now',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
