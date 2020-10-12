import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  @override
  HistoryStateWidget build(BuildContext context) {
    return new HistoryStateWidget();
  }
}

class HistoryStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HistoryState();
  }
}

class HistoryState extends State<HistoryStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("test"),
    );
  }
}
