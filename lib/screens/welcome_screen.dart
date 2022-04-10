import 'package:flutter/material.dart';
import 'package:massenger_me/screens/registeration_screen.dart';
import 'package:massenger_me/screens/sign_in_screen.dart';

import '../widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color.fromRGBO(0, 98, 156, 1),
        title: const Text('Test Massenger')
    ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(padding: EdgeInsets.symmetric(vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    height: 240,
                    child: Image.asset('images/logo.png'),
                  ),
                  const Text(
                    'MessageMe',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 98, 158, 1),)
                  )
                ],
              ),
              const SizedBox(height: 30),
              MyButton(
                  color: Colors.yellow[800]!,
                  title: 'sign in',
                  onpressed: () {
                    Navigator.pushNamed(context, SignInScreen.screenRoute);
                  }, textSize: 20,),
              MyButton(textSize: 20,
                  color: Color.fromRGBO(0, 98, 158, 1),
                  title: 'register ',
                  onpressed: () {
                    Navigator.pushNamed(context, RegisterationScreen.screenRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
