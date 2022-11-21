import 'package:flutter/material.dart';

class ButtonDropDown extends StatefulWidget {
  const ButtonDropDown({super.key, required this.myItems});
  final List myItems;
  @override
  State<ButtonDropDown> createState() => _ButtonDropDownState();
}

class _ButtonDropDownState extends State<ButtonDropDown> {
  @override
  Widget build(BuildContext context) {
    var currentItem = widget.myItems.first;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: currentItem,
        items: widget.myItems.map((items) {
          return DropdownMenuItem(value: items, child: items);
        }).toList(),
        onChanged: (value) {
          setState(() {
            currentItem = value;
          });
        },
      ),
    );
  }
}
