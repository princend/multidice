import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multidice/dice.dart';
import 'package:zflutter/zflutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: ZIllustration(children: <Widget>[
      //   ZCone(
      //       diameter: 30,
      //       length: 40,
      //       color: Color(0xffCC2255),
      //       backfaceColor: Color(0xffEEAA00))
      // ])
    );
  }
}

class Example {
  final String title;
  final String route;
  final Color backgroundColor;
  final WidgetBuilder builder;
  // final FlutterLogoColor logoStyle;

  Example({
    // this.logoStyle,
    @required this.title,
    @required this.route,
    this.backgroundColor,
    @required this.builder,
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int diceAmount = 1;

  void _incrementCounter(value) {
    setState(() {
      if (value == 0 && diceAmount > 1) {
        diceAmount -= 1;
      } else if (value == 1 && diceAmount < 4) {
        diceAmount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 50.0),
          child: GridView.builder(
            itemBuilder: (context, index) {
              return Dices(
                amount: this.diceAmount,
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
              childAspectRatio: 1,
            ),
            itemCount: 1,
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.exposure_minus_1), label: '減一顆'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.exposure_plus_1), label: '加一顆')
        ],
        onTap: (value) {
          _incrementCounter(value);
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
