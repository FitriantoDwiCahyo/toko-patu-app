import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_patu_app/constant/theme.dart';
import 'package:toko_patu_app/routes/routes.dart';

class ItemChat extends StatelessWidget {
  const ItemChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            context.goNamed(Routes.detailChat);
          },
          leading: Image.asset('assets/img_shoplogo.png'),
          title: Text(
            'Shoe Store',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 15, color: primaryTextColor),
          ),
          subtitle: Text('Good night, This item is on baggggg',overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.bodyMedium,),
          trailing: Text('now',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10),),
        ),
        const SizedBox(height: 12,),
        Divider(thickness: 1,color: Color.fromARGB(255, 196, 194, 194),)
      ],
    );
  }
}
