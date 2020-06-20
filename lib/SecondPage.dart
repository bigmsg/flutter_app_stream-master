import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_stream/FirstPage.dart';
import 'package:flutter_app_stream/GlobalValues.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  StreamController controller;

  @override
  Widget build(BuildContext context) {

    //controller = GlobalValues.of(context).controller;
    GlobalValues global = GlobalValues.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("second"),),

      body: Column(
        children: <Widget>[
          Text('counter: ${global.getCounter()}'),
          FlatButton(
            child: Text('증가'),
            onPressed: () {
              global.addCounter();
              print('counter: ${global.getCounter()}');
              setState(() {});
            },
          ),
          FlatButton(
            child: Text('감소'),
            onPressed: () {
              global.minCounter();
              print('counter: ${global.getCounter()}');
              setState(() {});
            },

          ),

          FlatButton(
            child: Text('First Page 이동'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FirstPage()));
            },
          ),
        ],
      ),
      /*body: StreamBuilder(
        initialData: "* * *",
        stream: controller.stream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlobalValues.of(context).provider.getText(snapshot, context),
                GlobalValues.of(context).provider.getButton(context, "home"),
              ],
            ),
          );
        }
      )*/
    );
  }
}
