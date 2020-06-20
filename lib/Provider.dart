import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_stream/SecondPage.dart';

class Provider{

  bool switcher = true;
  String button_label = 'start';

  getText(AsyncSnapshot snapshot, BuildContext context){
    print('-- getText: (${snapshot.data.toString()})');

    String setString = 'Page ${snapshot.data.toString()}';

    //int value = int.tryParse(snapshot.data.toString()) ?? 1984;
    //if (value % 2 != 0) setString = "disconnected from stream";


    return Text(setString, style: TextStyle(fontSize: 24),);
  }

  getButton(BuildContext context,String route){

    return FlatButton(
      child: Text(button_label),
      onPressed: () {
        if(switcher){
          button_label = 'navigate';
          switcher = false;
        } else {
          switcher = true;
          button_label = 'start';
          _navigate(route, context);
        }
      },
    );
  }

  _navigate(String route, BuildContext context){
    if(route == "next"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
    } else if (route == "home") {
      Navigator.pop(context);
    }
  }
}