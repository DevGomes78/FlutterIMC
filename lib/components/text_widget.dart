import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String? labelText;
  String? hintText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  FormFieldValidator<String>? validator;

  TextWidget(
   this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,{
      this.validator,
      }
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      validator: validator,
      textAlign:  TextAlign.center,
    );
  }
}
