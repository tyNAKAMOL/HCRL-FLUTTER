// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meme_app/home_page.dart';
import 'package:meme_app/selectmeme.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C1843),
        title: const Text("Register/Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              // Color(0xFF2C1843),
              Color(0xFF7E4BFF),
              // Color(0xFFFFFFFF),
              Color(0xFFF85DC6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Insert your email here",
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim(); // ตัด spacebar
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Insert your password here"),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim(); // ตัด spacebar
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              height: 50.0,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () async {
                  try {
                    await auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return selectMeme();
                        },
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    print(e.message);
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7852A9), Color(0xFF7852A9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 150.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50.0,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return selectMeme();
                    }));
                  } on FirebaseAuthException catch (e) {
                    // ignore: avoid_print
                    print(e.message);
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7852A9), Color(0xFF7852A9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 150.0, minHeight: 20.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
