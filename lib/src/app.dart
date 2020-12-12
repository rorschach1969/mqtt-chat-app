import 'package:flutter/material.dart';
import 'package:mqttchatapp/src/providers/chat/chat_provider.dart';
import 'package:mqttchatapp/src/screens/chat/chat_screen.dart';
import 'package:mqttchatapp/src/screens/loading/loading_screen.dart';
import 'package:mqttchatapp/src/screens/login/login_screen.dart';
import 'package:mqttchatapp/src/theme.dart';
import 'package:provider/provider.dart';

import 'screens/login/login_screen.dart';

class App extends StatelessWidget {
  static const name = "Chat Server App";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MaterialApp(
        title: name,
        theme: theme,
        home: LoginScreen(),
      ),
    );
  }
}
