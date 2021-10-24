import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading:Text('Leading',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        )
        ),
        title: Center(
          child : Text("Title")
          ),
          actions: [
            Text("Action")
          ],
      ),
      body: PageView(
        children: [
          Container(
            color: Colors.amber,
            child: Image(image: AssetImage('assets/shiba.png'),),
          ),
            Container(
            color: Colors.blueAccent[300],
          ),
            Container(
            color: Colors.deepPurpleAccent[200],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'home',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'home',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'home',
            ),
        ],
        ),
    );
  }
}