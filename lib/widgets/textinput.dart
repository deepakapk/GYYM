import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.isPass = false,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(
          borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder,
        enabledBorder: InputBorder,
        filled: true,
        contentPadding: EdgeInsets.all(8.0),
      ),
    );
  }
}
