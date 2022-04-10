import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/buttons.dart';
import 'chat_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'sign_in_screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  late String emailValue;
  late String passwordValue;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 230,
                      child: Image.asset('images/logo.png'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      // controller: emailControllar,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        emailValue = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your Email ',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      // controller: passwordControllar,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        passwordValue = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your Password ',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                        // enabledBorder اذا  ماكنا محددين على الحقل
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        //focusedBorder اذا كنا محددين الحقل
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyButton(textSize: 25,
                      color: Colors.yellow[800]!,
                      title: 'sign in',
                      onpressed: () async {
                        try {
                          setState(() {
                            showSpinner = true;
                          });
                          var result = await _auth.signInWithEmailAndPassword(
                              email: emailValue, password: passwordValue);
                          Navigator.pushNamed(context, ChatScreen.screenRoute);
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
