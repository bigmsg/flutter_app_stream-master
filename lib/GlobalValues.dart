import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_stream/Provider.dart';
import 'package:flutter_app_stream/TestBloc.dart';

class GlobalValues extends InheritedWidget {

  StreamController controller;
  Stream stream;
  Provider provider = new Provider();
  TestBloc testbloc = TestBloc();
  int counter = 0;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  GlobalValues({Key key, Widget child}) : super(key: key, child: child);

  static GlobalValues of(BuildContext context){
    //return context.inheritFromWidgetOfExactType(GlobalValues) as GlobalValues;
    return context.dependOnInheritedWidgetOfExactType<GlobalValues>();
  }

  initStream(){
    controller = StreamController.broadcast();
    stream = testbloc.getPeriodicStream();
    controller.addStream(stream);
    print("Stream initiliazied");
  }

  getCounter() {
    return counter;
  }

  addCounter() {
    counter++;
  }

  minCounter() {
    counter--;
  }
}