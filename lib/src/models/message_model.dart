class MessageModel {
  MessageModel({
    this.name,
    this.body,
  });

  final String name;
  final String body;

  String toString() {
    return "$name:$body";
  }
}
