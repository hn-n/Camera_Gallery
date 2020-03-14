import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImage(ImageSource src) async {
    var image = await ImagePicker.pickImage(source: src);

    setState(() {
      _image = image;
    });
  }

  Widget _imageChecker() {
    if (_image == null) {
      return Text("No selected image", style: TextStyle(fontSize: 20));
    } else {
      return Image.file(_image, width: 450, height: 450);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Camera/Gallery', style: TextStyle(color: Colors.blueAccent),),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                 Padding(padding: EdgeInsets.all(8.0)),
                _imageChecker(),
                RaisedButton(child: Icon(Icons.photo_camera), onPressed: () { getImage(ImageSource.camera); } ),
                RaisedButton(child: Icon(Icons.photo_library), onPressed: () { getImage(ImageSource.gallery);} )
              ],
            ),
          ),
          ),
    );
  }
}
