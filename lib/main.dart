import 'package:flutter/material.dart';
import 'components/AnimatedBottomBar.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> _views = [
    new Container(child: Center(child: new Text("MENU SCREEN EXAMPLE", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)))),
    new Container(child: Center(child: new Text("SEARCH SCREEN EXAMPLE", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)))),
    new Container(child: Center(child: new Text("FAVORITE SCREEN EXAMPLE", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)))),
    new Container(child: Center(child: new Text("PROFILE SCREEN EXAMPLE", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold))))
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      bottomNavigationBar: new  Builder(builder: (context) =>
        new AnimatedBottomBar(
            defaultIconColor: Colors.black,
            activatedIconColor: Colors.redAccent,
            background: Colors.white,
            buttonsIcons: [Icons.menu, Icons.search, Icons.favorite, Icons.person],
            buttonsHiddenIcons: [Icons.camera_alt, Icons.videocam, Icons.mic, Icons.music_note],
            backgroundColorMiddleIcon: Colors.redAccent,
            onTapButton: (i){
              setState(() {
                index = i;
              });
            },
            onTapButtonHidden: (i){
              _alertExample("You touched at button of index $i");
            },
          )
        ),
      body: _views[index],
    );
  }

  Future<void> _alertExample(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert example'),
          content: new Container(child: new Text(message)),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
