import 'package:chatApp/chat_messages.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController = TextEditingController();

  final List<chat_messages> messages = <chat_messages>[];

  void _submitMsg(String text) {
    textEditingController.clear();
    chat_messages msg = chat_messages(text: text);

    setState(() {
      messages.insert(0, msg);
    });
  }

  Widget _textComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.green),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
                controller: textEditingController,
                onSubmitted: _submitMsg,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _submitMsg(textEditingController.text)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            itemBuilder: (_, int index) => messages[index],
            itemCount: messages.length,
            padding: EdgeInsets.all(8.0),
            reverse: true,
          ),
        ),
        Divider(
          color: Colors.white,
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposer(),
        ),
      ],
    );
  }
}
