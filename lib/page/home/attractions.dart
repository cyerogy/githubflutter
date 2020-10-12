import 'package:flutter/material.dart';

class AttractionsWidget extends StatelessWidget {
  @override
  AttractionsStateWidget build(BuildContext context) {
    return new AttractionsStateWidget();
  }
}

class AttractionsStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AttractionsState();
  }
}

class AttractionsState extends State<AttractionsStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Attractions")));
  }
}
