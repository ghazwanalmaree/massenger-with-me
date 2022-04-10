import 'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  const MessageLine({this.sender, this.message, required this.isMe, Key? key})
      : super(key: key);
  final String? sender;
  final String? message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(
                color: isMe ? Colors.yellow[800] : Colors.purpleAccent[800]),
          ),
          Material(
            elevation: 20,
            borderRadius: isMe
                ? const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )
                : const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: isMe ?   Color.fromRGBO(0, 98, 158, 1): Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                ' $message',
                style: TextStyle(
                    fontSize: 20, color: isMe ? Colors.white : Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
