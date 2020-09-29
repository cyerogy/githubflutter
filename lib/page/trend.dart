import 'package:flutter/material.dart';

class TrendWidget extends StatelessWidget {
  @override
  TrendStateWidget build(BuildContext context) {
    return new TrendStateWidget();
  }
}

class TrendStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TrendState();
  }
}

class TrendState extends State<TrendStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Trend")));
  }
}
