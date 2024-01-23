import 'package:flutter/material.dart';
import 'package:toko_patu_app/constant/theme.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget emptyWistlist() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ic_empty_wish.png',
              width: 74,
              height: 62,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              ' You don\'t have dream shoes?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Explore Store',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView.builder(
        padding: const EdgeInsets.all(30),
        itemBuilder: (context, index) {
          return Card(
            color: bgColor4,
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/img_shoes.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                title: Text('Terrex Urban Low',style: Theme.of(context).textTheme.labelLarge!.copyWith(),),
                subtitle: Text('\$56,90',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: priceColor),),
                trailing: Image.asset('assets/btn_choose_fav.png',height: 34,width: 34,),
              ),
            ),
          );
        },
        itemCount: 5,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites Shoes',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18,
              ),
        ),
      ),
      body: content(),
    );
  }
}
