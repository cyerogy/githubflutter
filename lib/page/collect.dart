import 'package:flutter/material.dart';

class CollectWidget extends StatelessWidget {
  @override
  CollectStateWidget build(BuildContext context) {
    return new CollectStateWidget();
  }
}

class CollectStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CollectState();
  }
}

class CollectState extends State<CollectStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Collect")));
  }
}
