import 'package:flutter/material.dart';
import 'package:toko_patu_app/constant/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          color: primaryTextColor,
        ),
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.done,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Image.asset(
            'assets/img_profile.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
          ),
          const SizedBox(height: 24,),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Username'),
            ),
          ),
          const SizedBox(height: 24,),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
          ),

        ],
      ),
    );
  }
}
