import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meme_app/home_page.dart';

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
        backgroundColor: Colors.blueAccent[500],
        title: Text("Register/Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email",
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
              decoration: InputDecoration(
                  labelText: "Password", hintText: "Insert your password here"),
              onChanged: (value) {
                setState(() {
                  _password = value.trim(); // ตัด spacebar
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
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
                        return HomePage();
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
                    gradient: LinearGradient(
                      colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 150.0, minHeight: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          // ElevatedButton.icon(
          //     onPressed: () async {
          //       try {
          //         await auth.createUserWithEmailAndPassword(
          //             email: _email, password: _password);
          //         Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(
          //             builder: (context) {
          //               return HomePage();
          //             },
          //           ),
          //         );
          //       } on FirebaseAuthException catch (e) {
          //         print(e.message);
          //       }
          //     },
          //     // style: ButtonStyle(
          //     //   backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          //     // ),
          //     icon: Icon(Icons.add),
          //     label: Text(
          //       "Register",
          //       style: TextStyle(fontSize: 20),
          //     )),
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
                    return HomePage();
                  }));
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 150.0, minHeight: 20.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          // ElevatedButton.icon(
          //     onPressed: () async {
          //       try {
          //         await auth.signInWithEmailAndPassword(
          //             email: _email, password: _password);
          //         Navigator.of(context)
          //             .pushReplacement(MaterialPageRoute(builder: (context) {
          //           return HomePage();
          //         }));
          //       } on FirebaseAuthException catch (e) {
          //         print(e.message);
          //       }
          //     },
          //     icon: Icon(Icons.login),
          //     label: Text(
          //       "Login",
          //       style: TextStyle(fontSize: 20),
          //     ))
        ],
      ),
      backgroundColor: Colors.blue[100],
    );
  }
}
