import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ValidatorFormField extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final bool isPasswordField;
  final TextEditingController controller;
  final Function(String) validator;

  ValidatorFormField({
    @required this.hintText,
    @required this.icon,
    this.isPasswordField = false,
    this.controller,
    @required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: icon,
        border: kTextFieldBorder,
        focusedBorder: kTextFieldFocusedBorder,
      ),
      obscureText: isPasswordField,
      validator: validator,
    );
  }
}
