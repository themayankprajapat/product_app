import 'package:flutter/material.dart';

class ButtonDropDown extends StatelessWidget {
  const ButtonDropDown({super.key, required this.myItems});
  final List myItems;
  @override
  Widget build(BuildContext context) {
    var currentItem = myItems.first;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: currentItem,
        items: myItems.map((items) {
          return DropdownMenuItem(
            value: items,
            child: items,
          );
        }).toList(),
        onChanged: (value) {
          currentItem = value;
        },
      ),
    );
  }
}
