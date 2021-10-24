// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class EditMeme extends StatefulWidget {
  final String imageName;
  const EditMeme({Key? key, required this.imageName}) : super(key: key);

  @override
  _EditMemeState createState() => _EditMemeState();
}

class _EditMemeState extends State<EditMeme> {
  String topText = "";
  String bottomText = "";
  // ignore: unnecessary_new
  GlobalKey globalKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    topText = "Top text";
    bottomText = "Bottom text";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2C1843),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text('Add Text', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Color(0xFF2C1843),
              Color(0xFFF85DC6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              // height: MediaQuery.of(context).size.height / 1.5,
              child: RepaintBoundary(
                key: globalKey,
                child: Center(
                  child: Stack(
                    children: [
                      Image.asset("assets/meme/${widget.imageName}.jpg"),
                      // Positioned(
                      //   top: 30,
                      //   left: 60,
                      //   // child: buildStrokeText(topText),
                      // ),
                      // Positioned(
                      //   top: 200,
                      //   left: 60,
                      //   // child: buildStrokeText(bottomText),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.green[400],
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: Colors.black,
                      )),
                  SizedBox(width: 10),
                  CircleAvatar(
                      backgroundColor: Colors.red[400],
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove),
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Center(
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF2C1843)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Color(0xFF2C1843))))),
                            onPressed: () {},
                            icon: Icon(Icons.text_fields_rounded),
                            label: Text("add Text")),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF2C1843)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color(0xFF2C1843))))),
                          onPressed: () {},
                          icon: Icon(Icons.color_lens_outlined),
                          label: Text("color")),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF2C1843)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          color: Color(0xFF2C1843))))),
                          onPressed: () {
                            exportMeme();
                          },

                          // style: ElevatedButton.styleFrom(primary: Color(0xFF2C1843)),
                          icon: Icon(Icons.share_rounded),
                          label: Text("share")),
                    ),
                  ),
                ],
              ),
            ),

            // ignore: avoid_unnecessary_containers

            // padding: EdgeInsets.symmetric(horizontal: 40),
            // child:

            //Column(
            //   children: [
            //     SizedBox(height: 24),
            //     TextField(
            //       onChanged: (text) {
            //         setState(() {
            //           topText = text;
            //         });
            //       },
            //       decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.white),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.white),
            //         ),
            //         filled: true,
            //         fillColor: Colors.white,
            //         hintText: "top text",
            //       ),
            //     ),
            //     SizedBox(height: 24),
            //     TextField(
            //       onChanged: (text) {
            //         setState(() {
            //           bottomText = text;
            //         });
            //       },
            //       decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.white),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.white),
            //         ),
            //         filled: true,
            //         fillColor: Colors.white,
            //         hintText: "buttom text",
            //       ),
            //     ),
            //     SizedBox(height: 24),
            //     Container(
            //       child: TextButton(
            //         child:
            //             Text("Export", style: TextStyle(color: Colors.white)),
            //         onPressed: () {
            //           print("Export");
            //           exportMeme();
            //         },
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(Colors.blue),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Stack buildStrokeText(String text) {
    return Stack(
      children: [
        Text(text,
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = Colors.black,
            )),
        Text(text,
            style: const TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ],
    );
  }

  void exportMeme() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();

      final directory = (await getApplicationDocumentsDirectory()).path;

      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png) as ByteData;
      Uint8List pngByte = byteData.buffer.asUint8List();
      File imageFile = File('$directory/meme.png');
      imageFile.writeAsBytesSync(pngByte);

      Share.shareFiles(['$directory/meme.png']);
    } catch (e) {
      print(e);
    }
  }
}
