import 'package:flutter/material.dart';
// import 'dart:async';
import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_pic_widget.dart';

class ImageFromGalleryEx extends StatefulWidget {
  final type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 166, 166, 166),
          elevation: 0,
          title: Text(
            ' 🧑‍💻Upload Your Photo📷',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 52,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  var source = type == ImageSourceType.camera
                      ? ImageSource.camera
                      : ImageSource.gallery;
                  XFile image = await imagePicker.pickImage(
                      source: source,
                      imageQuality: 50,
                      preferredCameraDevice: CameraDevice.front);
                  setState(() {
                    _image = File(image.path);
                  });
                },
                child: Container(
                  width: 300,
                  height: 300,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 166, 166, 166)),
                  child: _image != null
                      ? Image.file(
                          _image,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.fitHeight,
                        )
                      : Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: Color.fromARGB(255, 166, 166, 166)),
                          width: 200,
                          height: 200,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 166, 166, 166)),
                margin: EdgeInsets.all(40),
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: (() {
                    Navigator.popAndPushNamed(context, '/');
                  }),
                  child: Text(
                    'Upload Image',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w800),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
