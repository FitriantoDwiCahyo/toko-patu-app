import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/constant/theme.dart';

import '../routes/routes.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  CarouselController buttonCarouselController = CarouselController();

  final List<String> images = [
    'assets/img_shoes1.png',
    'assets/img_shoes2.png',
    'assets/img_shoes3.png',
    'assets/img_shoes4.png',
  ];

  int _currentIndex = 0;

  bool isWishList = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width - (2 * 30),
              child: AlertDialog(
                backgroundColor: bgColor3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () => context.pop(),
                            icon:  Icon(Icons.close,color: primaryTextColor,)),
                      ),
                      Image.asset(
                        'assets/ic_success.png',
                        width: 100,
                      ),
                      const SizedBox(height: 12,),
                      Text('Hurray :)',style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 18),),
                      const SizedBox(height: 12,),
                      Text('Item added successfully',style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 12,),
                      ElevatedButton(onPressed: (){}, child: Text('View My Cart',style: Theme.of(context).textTheme.labelMedium),)

                    ],
                  ),
                ),
              ),
            );
          });
    }

    Widget header() {
      return Container(
        width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.,
        color: primaryTextColor,
        child: StatefulBuilder(builder: (context, setState) {
          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/img_shoes.png',
                      fit: BoxFit.contain,
                    ),
                  );
                },
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.35,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    // autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: blackTextColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                      color: blackTextColor,
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 40,
                right: 50,
                left: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images.map((url) {
                    int index = images.indexOf(url);
                    return Container(
                      width: _currentIndex == index ? 20 : 8,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10),
                        color:
                            _currentIndex == index ? primaryColor : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          color: bgColor1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TERREX URBAN LOW',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Hiking',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                StatefulBuilder(builder: (context, setState) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        isWishList = !isWishList;
                      });
                      if (isWishList) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: secondaryColor,
                            content: Text('Has been added to the Whitelist')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: alertColor,
                            content:
                                Text('Has been removed from the Whitelist')));
                      }
                    },
                    child: Image.asset(
                      isWishList
                          ? 'assets/btn_choose_fav.png'
                          : 'assets/btn_fav.png',
                      width: 46,
                      height: 46,
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //price text
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: bgColor2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: primaryTextColor),
                  ),
                  Text(
                    '\$56,90',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: priceColor,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //description text
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fimiliar Shoes',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.05),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/img_shoes.png',
                              width: 54,
                              height: 54,
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        padding: EdgeInsets.all(30),
        color: bgColor1,
        child: Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                context.goNamed(Routes.detailChat);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Icon(Icons.chat),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  showSuccessDialog();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Add to Cart',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryTextColor,
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        children: [
          header(),
          content(),
        ],
      ),
      bottomNavigationBar: button(),
    );
  }
}
