import 'package:flutter/material.dart';
import 'package:login_google_firebase/sign_in.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 150),
            SizedBox(
              height: 50,
            ),
            _signInButton()
          ],
        )),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Home();
          }));
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage(
                'assets/images/google_logo.png',
              ),
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Login Com Google',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
