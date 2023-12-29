import 'package:flutter/material.dart';
import 'package:toko_patu_app/constant/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, Alex',
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
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            constraints: const BoxConstraints(maxHeight: 40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
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
                          border:
                              Border.all(color: secondaryTextColor, width: 0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                  child: Text(
                    'All Shoes',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color:
                            index == 0 ? primaryTextColor : secondaryTextColor),
                  ),
                );
              },
              itemCount: 10,
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
            constraints: BoxConstraints(maxHeight: 278),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  decoration: BoxDecoration(
                    color: primaryTextColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'assets/img_shoes.png',
                        height: 150,
                        width: 215,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hiking',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: secondaryTextColor),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Court Vision 2.0',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: bgColor1, fontSize: 18),
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
                      )
                    ],
                  ),
                );
              },
              itemCount: 3,
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
                      const SizedBox(width: 12,),
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
                            const SizedBox(height: 6,),
                            Text(
                              'Predator 20.3 FirmGround',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 6,),
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
