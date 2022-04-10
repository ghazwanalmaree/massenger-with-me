import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:massenger_me/widgets/message_stream_builder.dart';

final _fireStor = FirebaseFirestore.instance;
late User signedInUser;

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String? messageText;
  final messageTextController = TextEditingController();

  void initState() {
    super.initState();
    getCuttentUser();
  }

  void getCuttentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.yellow[900],
      //   title: Row(
      //     children: [
      //       Image.asset(
      //         'images/logo.png',
      //         height: 25,
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text('MessageMe')
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           _auth.signOut();
      //           Navigator.pop(context);
      //
      //           // getMessageStream();
      //         },
      //         icon: Icon(Icons.close))
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Colors.orange,
                  width: 2,
                )),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          hintText: 'Write your message here',
                          border: InputBorder.none),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (messageText != null) {
                        _fireStor.collection('messages').add({
                          'sender': signedInUser.email,
                          'message': messageText,
                          'time': FieldValue.serverTimestamp(),
                        });
                        messageTextController.clear();
                        messageText = null;
                      }
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
