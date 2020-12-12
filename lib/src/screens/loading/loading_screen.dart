import 'package:flutter/material.dart';
import 'package:mqttchatapp/src/app.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(App.name,
                style: theme.textTheme.headline1
                    .copyWith(color: theme.primaryColor)),
            SizedBox(height: 50),
            CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor))
          ],
        ),
      ),
    );
  }
}
