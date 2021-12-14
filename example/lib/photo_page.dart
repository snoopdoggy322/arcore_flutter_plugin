import 'dart:io';

import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  final String path;

  const PhotoPage({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      child: Image.file(File(path),fit: BoxFit.cover,),
    ));
  }
}
