import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required TextEditingController controller,
    required this.labelText,
    required this.keyboardType,
    this.textInputFormatter,
  })  : _controller = controller,
        super(key: key);
  final TextInputFormatter? textInputFormatter;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field can\'t be empty!';
        }
        return null;
      },
      inputFormatters: [
        textInputFormatter ?? FilteringTextInputFormatter.singleLineFormatter
      ],
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: const Color.fromARGB(255, 248, 241, 166),
        labelText: labelText,
      ),
    );
  }
}
