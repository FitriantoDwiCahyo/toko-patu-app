import 'package:flutter/material.dart';

import '../constant/theme.dart';

class ItemFormWidget extends StatelessWidget {
  ItemFormWidget(
      {required this.iconUrl,
      required this.hint,
      this.controller,
      super.key});

  String iconUrl;
  String hint;
  TextEditingController? controller;

  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: bgColor2),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            height: 12,
            width: 17,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: controller,
              style: TextStyle(color: primaryTextColor),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: primaryTextColor),
              ),
              onSubmitted: (value){
                _focusNode.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
