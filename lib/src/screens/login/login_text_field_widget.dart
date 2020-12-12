import 'package:flutter/material.dart';

class LoginTextFieldWidget extends StatelessWidget {
  LoginTextFieldWidget({
    this.controller,
    this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ));
  }
}
