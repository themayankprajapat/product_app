import 'package:flutter/material.dart';

class CommonTextButtonIcon extends StatelessWidget {
  const CommonTextButtonIcon({
    Key? key,
    required this.label,
    required this.icondata,
    required this.onPressed,
    required this.color,
  }) : super(key: key);
  final void Function()? onPressed;
  final String label;
  final Color color;
  final IconData icondata;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: color),
        onPressed: onPressed,
        icon: Icon(icondata),
        label: Text(label));
  }
}
