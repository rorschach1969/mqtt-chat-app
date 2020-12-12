import 'package:flutter/cupertino.dart';
import 'package:mqttchatapp/src/models/message_model.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({
    this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 10),
          Text(message.body, style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}
