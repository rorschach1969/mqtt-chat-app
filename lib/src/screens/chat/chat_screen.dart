import 'package:flutter/material.dart';
import 'package:mqttchatapp/src/models/message_model.dart';
import 'package:mqttchatapp/src/providers/chat/chat_provider.dart';
import 'package:mqttchatapp/src/widgets/message_input/message_input_widget.dart';
import 'package:mqttchatapp/src/widgets/message_list/message_list_widget.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  void onSubmit(ChatProvider provider, String message) {
    provider.sendMessage(MessageModel(
      name: provider.name,
      body: message,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, provider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(child: MessageListWidget(messages: provider.messages)),
              MessageInputWidget(
                  onSubmit: (message) => onSubmit(provider, message)),
            ],
          ));
    });
  }
}
