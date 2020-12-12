import 'package:flutter/material.dart';

class MessageInputWidget extends StatefulWidget {
  MessageInputWidget({this.onSubmit});

  final void Function(String) onSubmit;

  @override
  _MessageInputWidgetState createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends State<MessageInputWidget> {
  TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    widget.onSubmit(_inputController.text);
    _inputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 50, maxWidth: double.infinity),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          )),
          SizedBox(
            height: double.infinity,
            child: ElevatedButton(
              child: Icon(Icons.arrow_upward),
              onPressed: handleSubmit,
              style:
                  ElevatedButton.styleFrom(shape: ContinuousRectangleBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
