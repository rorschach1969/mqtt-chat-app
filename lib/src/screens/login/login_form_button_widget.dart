import 'package:flutter/material.dart';

class LoginFormButtonWidget extends StatelessWidget {
  LoginFormButtonWidget({
    this.onPressed,
    this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        height: 50,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))));
  }
}
