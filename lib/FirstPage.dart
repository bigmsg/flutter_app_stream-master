import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_stream/GlobalValues.dart';
import 'package:flutter_app_stream/SecondPage.dart';
import 'package:flutter_app_stream/TestBloc.dart';

class FirstPage extends StatefulWidget {

  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  StreamController controller;

  @override
  Widget build(BuildContext context) {

    controller = GlobalValues.of(context).controller;
    GlobalValues global = GlobalValues.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("first"),
      ),
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
            child: Text('Second Page 이동'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SecondPage()));
            },
          ),
        ],
      ),
      /*body: StreamBuilder(
        initialData: "...",
        stream: controller.stream,
        builder: (context, snapshot) {

          /*return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlobalValues.of(context).provider.getText(snapshot, context),
                GlobalValues.of(context).provider.getButton(context, "next"),
              ],
            ),
          );*/
          if(snapshot.hasData && snapshot.data.length > 0) {
            print('snapshot: ${snapshot.data}');

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                //Gooin gooin = snapshot.data[index];
                //return _buildGooinList(context, gooin, index);
                var item = snapshot.data[index];
                print('length: ${snapshot.data.length}');
                print(item);
                return Column(
                  children: <Widget>[
                    Text('index: ${index}'),
                    //Text('제목: ${gooin.wr_subject}'),
                  ],
                );

              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 0.5,
                  color: Colors.grey,
                );
              },
            );
            //return Text('good');
          } else {
            return Text('데이터가 없습니다.');
          }
        }),
      */
    );
  }
}