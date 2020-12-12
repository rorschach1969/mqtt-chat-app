import 'package:flutter/material.dart';
import 'package:mqttchatapp/src/providers/chat/chat_provider.dart';
import 'package:mqttchatapp/src/screens/login/login_form_button_widget.dart';
import 'package:mqttchatapp/src/screens/login/login_text_field_widget.dart';
import 'package:provider/provider.dart';

import '../chat/chat_screen.dart';
import '../loading/loading_screen.dart';
import '../loading/loading_screen.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _ipAddressController, _nameController;

  @override
  void initState() {
    super.initState();
    _ipAddressController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _ipAddressController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void onConnected() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChatScreen()));
  }

  void onSubmit(ChatProvider provider) {
    provider.connect(
      _ipAddressController.text,
      onConnected,
      _nameController.text,
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoadingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, provider, child) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginTextFieldWidget(
                  label: "Ip Address", controller: _ipAddressController),
              SizedBox(height: 20),
              LoginTextFieldWidget(label: "Name", controller: _nameController),
              SizedBox(height: 40),
              LoginFormButtonWidget(
                  text: "Login", onPressed: () => onSubmit(provider)),
            ],
          ),
        );
      },
    );
  }
}
