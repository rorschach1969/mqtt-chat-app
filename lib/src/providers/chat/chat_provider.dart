import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:uuid/uuid.dart';

import '../../models/message_model.dart';

class ChatProvider extends ChangeNotifier {
  static const _topic = "messages";
  final _messages = [];
  String _name;
  MqttServerClient _client;

  List<MessageModel> get messages => List.unmodifiable(_messages);
  String get name => _name;

  void onMessage(List<MqttReceivedMessage<MqttMessage>> event) {
    final MqttPublishMessage eventPayload = event[0].payload;
    final String eventMessage =
        MqttPublishPayload.bytesToStringAsString(eventPayload.payload.message);
    final split = eventMessage.split(":");
    final MessageModel message = MessageModel(
      name: split[0],
      body: split.skip(1).join(":"),
    );
    _messages.add(message);
    notifyListeners();
  }

  void connect(String server, VoidCallback onConnected, String name) async {
    if (_client == null) {
      _name = name;
      _client = MqttServerClient(server, Uuid().v4());
      _client.onConnected = onConnected;
      await _client.connect();
      _client.subscribe(_topic, MqttQos.atMostOnce);
      _client.updates.listen(onMessage);
    }
  }

  void sendMessage(MessageModel message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message.toString());
    _client.publishMessage(_topic, MqttQos.exactlyOnce, builder.payload);
  }

  void disconnect() {
    _client.disconnect();
    _client = null;
    _name = null;
  }
}
