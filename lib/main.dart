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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        itemBuilder: (context, index) {
          return Dices();
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
          childAspectRatio: 1,
        ),
        itemCount: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
