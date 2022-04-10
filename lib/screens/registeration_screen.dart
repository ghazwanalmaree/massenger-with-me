import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:massenger_me/screens/chat_screen.dart';
import 'package:massenger_me/widgets/buttons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterationScreen extends StatefulWidget {
  static const String screenRoute = 'registeration_screen';

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner=false;

  TextEditingController _NewEmailControler = TextEditingController();
  TextEditingController _NewPasswordControler = TextEditingController();

  @override
  void dispose() {
    _NewEmailControler.dispose();
    _NewPasswordControler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

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
                    height: 260,
                    child: Image.asset('images/logo.png'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //this is for Email
                  TextField(
                    controller: _NewEmailControler,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
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
                          borderSide: BorderSide(color: Colors.orange, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //this is for Password
                  TextField(controller: _NewPasswordControler,
                    obscureText: true, // لاخفاء محتوى النص
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
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
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(textSize: 25,
                    color: Color.fromRGBO(0, 98, 158, 1),
                    title: 'register',
                    onpressed: () async {

                      setState(() {
                        showSpinner=true;
                      });
                      try{
                        final newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password:password);
                          // Navigator.pushNamed(context, ChatScreen.screenRoute);
                        Navigator.pushNamed(context, ChatScreen.screenRoute);

                        setState(() {
                            showSpinner=false;
                          });
                      }catch(e){
                        print(e);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
