import 'dart:io';

import 'package:ballre/service/asset_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../results.dart';

class SafaricomPage extends StatefulWidget {
  @override
  _SafaricomPageState createState() => _SafaricomPageState();
}

class _SafaricomPageState extends State<SafaricomPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: Image.asset("assets/safaricomhero.png",
                    width: 300.0, height: 200.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.5),
                child: Text("Recharge histroy",
                    style: Theme.of(context).textTheme.headline6),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text("1234 5678 1234 9876"),
                      subtitle: Text("12th Nov 2019"),
                      trailing: Icon(Icons.check_box_outline_blank),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RawMaterialButton(
                    fillColor: Colors.black,
                    splashColor: Colors.white,
                    elevation: 7.0,
                    constraints: BoxConstraints(
                        minHeight: 40, minWidth: double.infinity),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Scan",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showAlertDialog(context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose one: "),
            actions: <Widget>[
              FlatButton(
                child: Text("Camera"),
                onPressed: () async {
                  AssetsPickerImpl assetsPickerImpl = AssetsPickerImpl();
                  File imageFile = await assetsPickerImpl.cameraImage(
                    context,
                  );
                  print("#######################################");
                  print("${imageFile.path}");
                  print("#######################################");
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (BuildContext context) {
                      return Results(image: imageFile);
                    }),
                  );
                },
              ),
              FlatButton(
                child: Text("Gallery"),
                onPressed: () {},
              )
            ],
          );
        });
  }
}
