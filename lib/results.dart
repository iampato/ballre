import 'dart:io';

import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final File image;

  const Results({Key key, this.image}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  File get image => widget.image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.file(image)),
    );
  }
}
