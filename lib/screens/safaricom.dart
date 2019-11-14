import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class SafaricomPage extends StatefulWidget {
  @override
  _SafaricomPageState createState() => _SafaricomPageState();
}

class _SafaricomPageState extends State<SafaricomPage> {
  
  File imageFile;
  Future getImage(ImageSource x) async {
    var image = await ImagePicker.pickImage(source: x);
    setState(() {
      imageFile = image;
    });
  }

  Future readText() async{
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);
    
    for (TextBlock block in visionText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          print(element.text);
        }
      }
    }
    textRecognizer.close();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height*0.175
              ),

              Image.asset(
                "assets/safaricomhero.png",
                width: 300.0,
                height: 200.0
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("Safaricom Kenya, the Better Option",
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.0125
              ),

              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.center,
                children: <Widget>[
                  RawMaterialButton(
                    fillColor:  Colors.black,
                    splashColor: Colors.white,
                    elevation: 7.0,
                    constraints: BoxConstraints(
                      minHeight: 40,minWidth: 100
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Text("Camera",style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      getImage(ImageSource.camera);
                    },
                  ),
                  SizedBox(width: 15),
                  RawMaterialButton(
                    fillColor:  Colors.black,
                    splashColor: Colors.white,
                    elevation: 7.0,
                    constraints: BoxConstraints(
                      minHeight: 40,minWidth: 100
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Text("Gallery",style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      getImage(ImageSource.gallery);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}