import 'package:flutter/material.dart';
import 'package:mqttchatapp/src/app.dart';
import 'package:mqttchatapp/src/screens/login/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(App.name,
                  style: theme.textTheme.headline1
                      .copyWith(color: theme.primaryColor)),
              SizedBox(height: 40),
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
