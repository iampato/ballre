import 'dart:io';
import 'package:ballre/screens/airtel.dart';
import 'package:ballre/screens/safaricom.dart';
import 'package:ballre/screens/telkom.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      title: 'ballre',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {

  HomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  List popmenu = ['About','Feedback','Check Updates'];

  final List<Tab> tabs = <Tab>[
    new Tab(text: "Safaricom"),
    new Tab(text: "Airtel"),
    new Tab(text: "Telkom")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Ballre",style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.style),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  value: 'about',
                  child: Text("About"),
                ),
                PopupMenuItem(
                  value: 'update',
                  child: Text("Update"),
                ),
                PopupMenuItem(
                  value: 'feedback',
                  child: Text("Feedback"),
                )
              ];
            },

            onSelected: (myValue){
              switch (myValue){
                case 'about':
                  debugPrint("Goes to about page");
                  break;
                case 'update':
                  debugPrint("checks for update");
                  break;
                case 'feedback':
                  debugPrint("send me an email");
                  break;
                default:
                  debugPrint("error");
              }
            },
          )
        ],
        ),
     
      body: Stack(
        children: <Widget>[
          buildTabView(),
          buildTabBar()
        ],
      ),
    );
  }
 
  Widget buildTabBar(){
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(),
          ),
          child: TabBar(
            labelStyle: TextStyle(fontSize: 17),
            isScrollable: true,
            unselectedLabelColor: Colors.black45,
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: new BubbleTabIndicator(
              indicatorHeight: 40.0,
              indicatorColor: Colors.black,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            tabs: tabs,
            controller: _tabController,
          ),
        ),
      ),
    );
  }

  Widget buildTabView(){
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        SafaricomPage(),
        AirtelPage(),
        TelkomPage()
      ],
    );
  }


}
/*
 final File imageFile = getImageFile();
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);

String text = visionText.text;
for (TextBlock block in visionText.blocks) {
  final Rect boundingBox = block.boundingBox;
  final List<Offset> cornerPoints = block.cornerPoints;
  final String text = block.text;
  final List<RecognizedLanguage> languages = block.recognizedLanguages;

  for (TextLine line in block.lines) {
    // Same getters as TextBlock
    for (TextElement element in line.elements) {
      // Same getters as TextBlock
    }
  }
}
textRecognizer.close();
*/