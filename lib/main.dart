import 'dart:convert';
import 'package:flutter/material.dart';
import 'firstScreen.dart';
import 'secondScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/first': (context) => FirstScreen(),
          '/second': (context) => SecondScreen(),
        },
        title: 'Navigations',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('asset/data.json'),
        builder: (context, snapshot) {
          var myData = json.decode(snapshot.data.toString());
          return Center(
            child: Text(myData['salary'], style: TextStyle(fontSize: 40.0)),
          );
        },
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Navigations"),
    //   ),
    //   body: Container(
    //     alignment: Alignment.center,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text("Home Page",
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontSize: 40.0,
    //               fontFamily: "Time New Roman",
    //               fontWeight: FontWeight.w600,
    //             )),
    //         Padding(
    //           padding: EdgeInsets.all(10.0),
    //           child: FlatButton(
    //             onPressed: () {
    //               Navigator.pushNamed(context, '/first');
    //               // Navigator.push(
    //               //   context,
    //               //   MaterialPageRoute(
    //               //     builder: (context) => FirstScreen(),
    //               //   ),
    //               // );
    //             },
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 25.0,
    //               vertical: 10.0,
    //             ),
    //             color: Colors.red,
    //             textColor: Colors.white,
    //             child: Text(
    //               "First Screen",
    //               style: TextStyle(
    //                 fontSize: 20.0,
    //               ),
    //             ),
    //           ),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.all(10.0),
    //           child: FlatButton(
    //             onPressed: () {
    //               Navigator.pushNamed(context, '/second');
    //               // Navigator.push(
    //               //   context,
    //               //   MaterialPageRoute(
    //               //     builder: (context) => FirstScreen(),
    //               //   ),
    //               // );
    //             },
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 25.0,
    //               vertical: 10.0,
    //             ),
    //             color: Colors.red,
    //             textColor: Colors.white,
    //             child: Text(
    //               "Second Screen",
    //               style: TextStyle(
    //                 fontSize: 20.0,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
