import 'dart:io';

import 'package:flutter/material.dart';

class PictureWidget extends StatelessWidget {
  final String imagePath;
  final Function() onPressed;

  const PictureWidget({
    Key key,
    this.imagePath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePath == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_enhance, color: Colors.black),
              onPressed: onPressed,
            ),
            Text("Agrega una imagen!")
          ],
        ),
      );
    } else {
      return Center(child: Image.file(File(imagePath)));
    }
  }
}
