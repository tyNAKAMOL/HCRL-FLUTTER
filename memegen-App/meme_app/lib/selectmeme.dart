import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme_app/editmeme.dart';

import 'meme_data.dart';

class selectMeme extends StatefulWidget {
  const selectMeme({Key? key}) : super(key: key);

  @override
  _selectMemeState createState() => _selectMemeState();
}

class _selectMemeState extends State<selectMeme> {
  int maxItem = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[300],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF2C1843),
          title: const Text(
            "Select Meme",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (ctx, i) => GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return EditMeme(imageName: memeName[i]);
                },
              ));
            },
            child: Image.asset(
              'assets/meme/${memeName[i]}.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
