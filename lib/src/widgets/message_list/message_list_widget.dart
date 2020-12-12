import 'package:flutter/material.dart';
import 'package:mqttchatapp/src/models/message_model.dart';
import 'package:mqttchatapp/src/widgets/message/message_widget.dart';

class MessageListWidget extends StatelessWidget {
  MessageListWidget({this.messages});

  final List<MessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: messages.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return MessageWidget(message: messages[index]);
      },
    );
  }
}
