import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  MyStateWidget build(BuildContext context) {
    return new MyStateWidget();
  }
}

class MyStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyState();
  }
}

class MyState extends State<MyStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("My")));
  }
}
