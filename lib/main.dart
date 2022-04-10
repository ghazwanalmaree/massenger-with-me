import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:massenger_me/screens/chat_screen.dart';
import 'package:massenger_me/screens/registeration_screen.dart';
import 'package:massenger_me/screens/sign_in_screen.dart';
import 'package:massenger_me/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Test Massenger',

      initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SignInScreen.screenRoute: (context) => SignInScreen(),
        RegisterationScreen.screenRoute: (context) => RegisterationScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen()
      },
    );
  }
}

// Colors.yellow[700],
// color: Color.fromRGBO(149, 101, 32, 1),
// Color c = const Color(0x00629E);
