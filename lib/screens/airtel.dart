import 'package:flutter/material.dart';

class AirtelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height*0.275
              ),

              Image.asset(
                "assets/airtelhero.png",
                width: 300.0,
                height: 200.0
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("Airtel Kenya, the smartphone network",
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.175
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
                      //TODO
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
                      //TODO
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