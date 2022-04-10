import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:massenger_me/screens/chat_screen.dart';
import 'package:massenger_me/widgets/message_line.dart';

final _fireStor = FirebaseFirestore.instance;

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStor.collection("messages").orderBy('time').snapshots(),
      builder: (context, snapshot) {
        List<MessageLine> messagesWidget = [];
        if (!snapshot.hasData ) {
          CircularProgressIndicator();
        }
        final messages = snapshot.data!.docs.reversed;//reversed for order the list decrement
        for (var message in messages) {
          final messageText = message.get("message");
          final messageSender = message.get("sender");
          final curruntUser = signedInUser.email;

          final messageWidget = MessageLine(
            message: messageText,
            sender: messageSender,
            isMe: curruntUser == messageSender,
          );
          messagesWidget.add(messageWidget);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: messagesWidget,
          ),
        );
      },
    );
  }
}
